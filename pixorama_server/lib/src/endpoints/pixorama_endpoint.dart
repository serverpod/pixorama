import 'dart:typed_data';

import 'package:pixorama_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';

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
final _pixelData = Uint8List(_numPixels)
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
  // Updates a pixel in our pixel data.
  static void _setPixel(int colorIndex, int pixelIndex) {
    _pixelData[pixelIndex] = colorIndex;
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
      assert(
        message.colorIndex >= 0 && message.colorIndex < _numColorsInPalette,
        'The received color index is not in a valid range.',
      );
      assert(
        message.pixelIndex >= 0 && message.pixelIndex < _pixelData.length,
        'The received pixel index is not in a valid range.',
      );

      // Update our global image.
      _setPixel(message.colorIndex, message.pixelIndex);

      // Notify all connected clients that we set a pixel, by posting a message
      // to the _channelPixelAdded channel.
      session.messages.postMessage(_channelPixelAdded, message, local: true);
    }
  }
}
