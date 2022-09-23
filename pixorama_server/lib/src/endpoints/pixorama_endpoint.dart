import 'dart:typed_data';

import 'package:pixorama_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';

const _imageWidth = 64;
const _imageHeight = 64;
const _numPixels = _imageWidth * _imageHeight;

const _numColorsInPalette = 16;
const _defaultPixelColor = 2;

const _channelPixelAdded = 'pixel-added';

final _pixelData = Uint8List(_numPixels)
  ..fillRange(
    0,
    _numPixels,
    _defaultPixelColor,
  );

class PixoramaEndpoint extends Endpoint {
  static void _setPixel(int colorIndex, int pixelIndex) {
    print('Setting pixel color: $colorIndex pixel: $pixelIndex');
    _pixelData[pixelIndex] = colorIndex;
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    sendStreamMessage(
      session,
      ImageData(
        pixels: _pixelData.buffer.asByteData(),
        width: _imageWidth,
        height: _imageHeight,
      ),
    );

    session.messages.addListener(_channelPixelAdded, (update) {
      print('Listened to message. :D');
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableEntity message,
  ) async {
    if (message is ImageUpdate) {
      print('Got image update');
      // Check that the message data is valid.
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

      // Notify all connected clients that we set a pixel.
      session.messages.postMessage(_channelPixelAdded, message, local: true);
    }
  }
}
