import 'dart:async';
import 'dart:typed_data';

import 'package:pixorama_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

// The dimensions of the image, number of colors and default background color.
const _imageWidth = 64;
const _imageHeight = 64;
const _numPixels = _imageWidth * _imageHeight;

const _numColorsInPalette = 16;
const _defaultPixelColor = 2;

// The name of the message channel we are using to communicate updated pixels.
const _channelPixelAdded = 'pixel-added';

// The pixel data. The data will be created when the server starts and is not
// persited in the database. In a real application, we would probably want to
// save this data in regular intervals. The data is saved in an array of
// unsigned bytes.
var _pixelData = Uint8List(_numPixels)
  ..fillRange(
    0,
    _numPixels,
    _defaultPixelColor,
  );

/// The Pixorama endpoint handles all communication related to keeping clients
/// up-to-date with the latest version of the pixel image. When a client first
/// connects, it is sent a full version of the image with the ImageData message.
/// Whenever a pixel is being edited by a client, we store the edit in the
/// _pixelData array and pass on the changes to all connected clients.
class PixoramaEndpoint extends Endpoint {
  // The database timer is only set when a timer is running. It is used to batch
  // together updates to the database, so it isn't updated every time we add a
  // pixel. If thousands of people add pixels simultaneously that would add very
  // many writes to the database.
  static Timer? _databaseTimer;

  // Updates a pixel in our pixel data.
  static void _setPixel(int colorIndex, int pixelIndex) {
    _pixelData[pixelIndex] = colorIndex;

    // Instead of immediately updating the database, we trigger the write in
    // 10 seconds. Any changed pixels within the 10 second period will be
    // grouped together into a single write.
    _databaseTimer ??= Timer(
      const Duration(seconds: 10),
      _writeImageToDatabase,
    );
  }

  // Writes the pixel image to the database.
  static Future<void> _writeImageToDatabase() async {
    // Reset the timer so we trigger new writes.
    _databaseTimer = null;

    // For most cases we will be provided a session object automatically. E.g.
    // in method calls, when we receive a streamed message or in a future call.
    // If you run asyncronous code outside of a context, you will need to
    // manually create a new session. If you create a session, you are also
    // responsible to close it when you are done, or it could lead to memory
    // leaks within your server.
    var session = await Serverpod.instance.createSession(enableLogging: true);
    try {
      // Fetch the image data that we want to update. If there is no data in the
      // database already, we create a new row for the image data.
      var imageData = await ImageData.db.findFirstRow(session);
      if (imageData == null) {
        // Create a new ImageData row in the database.
        imageData = ImageData(
          pixels: _pixelData.buffer.asByteData(),
          width: _imageWidth,
          height: _imageHeight,
        );
        await ImageData.db.insertRow(session, imageData);
      } else {
        // Update the existing entry.
        imageData.pixels = _pixelData.buffer.asByteData();
        await ImageData.db.updateRow(session, imageData);
      }
    } catch (e, stackTrace) {
      // If we finish with an error, we should close the session with the error
      // so that it gets logged.
      await session.close(error: e, stackTrace: stackTrace);
      return;
    }
    // Always close sessions you create.
    await session.close();
  }

  /// Loads the pixel image from the database.
  static Future<void> loadImageFromDatabase() async {
    var session = await Serverpod.instance.createSession(enableLogging: true);
    try {
      // Load the image data, if it exists.
      var imageData = await ImageData.db.findFirstRow(session);
      if (imageData != null) {
        _pixelData = imageData.pixels.buffer.asUint8List();
      }
    } catch (e, stackTrace) {
      await session.close(error: e, stackTrace: stackTrace);
      return;
    }
    await session.close();
  }

  // `streamOpened` is called every time a client opens a streaming connection
  // to this endpoint. Overriding this method allows us to do setup work for
  // the client and send it a full update of the current state.
  // In a more advance application, it is often useful to set a user object
  // when a stream is opened using the `setUserObject` method. This allows us
  // to associate data with a specific streaming session.
  @override
  Future<void> streamOpened(StreamingSession session) async {
    // Send the client a full version of the pixel image.
    sendStreamMessage(
      session,
      ImageData(
        pixels: _pixelData.buffer.asByteData(),
        width: _imageWidth,
        height: _imageHeight,
      ),
    );

    // Add a listener to the _channelPixelAdded channel. The listener will be
    // called whenever we post a message to the channel. In this case, we will
    // just pass the message on to the client. The listeners are connected to
    // the session and will be automatically disposed when the session is
    // closed. If you need to do any additional cleanup work, this can be done
    // by overriding the streamClosed method.
    session.messages.addListener(_channelPixelAdded, (update) {
      sendStreamMessage(session, update);
    });
  }

  // handleStreamMessage is called when we get a message from a client. The
  // Session object identifies which client we are receiving the message from.
  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableEntity message,
  ) async {
    if (message is ImageUpdate) {
      // Check that the message data is valid. If the assert fails, the message
      // will be ignored and an error will be logged. Another approach to handle
      // invalid data can be to close the streaming session and disconnect the
      // client.
      if (!(message.colorIndex >= 0 && message.colorIndex < _numColorsInPalette)) {
        throw FormatException('The received color index is not in a valid range.');
      }
      if (!(message.pixelIndex >= 0 && message.pixelIndex < _pixelData.length)) {
        throw FormatException('The received pixel index is not in a valid range.');
      }

      // Update our global image.
      _setPixel(message.colorIndex, message.pixelIndex);

      // Notify all connected clients that we set a pixel, by posting a message
      // to the _channelPixelAdded channel.
      session.messages.postMessage(_channelPixelAdded, message, global: false);
    }
  }
}
