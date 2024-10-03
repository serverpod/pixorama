// lib/src/endpoints/pixorama_endpoint.dart

import 'dart:typed_data';

import 'package:pixorama_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PixoramaEndpoint extends Endpoint {
  static const _imageWidth = 64;
  static const _imageHeight = 64;
  static const _numPixels = _imageWidth * _imageHeight;

  static const _numColorsInPalette = 16;
  static const _defaultPixelColor = 2;

  final _pixelData = Uint8List(_numPixels)
    ..fillRange(
      0,
      _numPixels,
      _defaultPixelColor,
    );

  static const _channelPixelAdded = 'pixel-added';

  /// Sets a single pixel and notifies all connected clients about the change.
  Future<void> setPixel(
    Session session, {
    required int colorIndex,
    required int pixelIndex,
  }) async {
    // Check that the input parameters are valid. If not, throw a
    // `FormatException`, which will be logged and thrown as
    // `ServerpodClientException` in the app.
    if (colorIndex < 0 || colorIndex >= _numColorsInPalette) {
      throw FormatException('colorIndex is out of range: $colorIndex');
    }
    if (pixelIndex < 0 || pixelIndex >= _numPixels) {
      throw FormatException('pixelIndex is out of range: $pixelIndex');
    }

    // Update our global image.
    _pixelData[pixelIndex] = colorIndex;

    // Notify all connected clients that we set a pixel, by posting a message
    // to the _channelPixelAdded channel.
    session.messages.postMessage(
      _channelPixelAdded,
      ImageUpdate(
        pixelIndex: pixelIndex,
        colorIndex: colorIndex,
      ),
    );
  }

  /// Returns a stream of image updates. The first message will always be a
  /// `ImageData` object, which contains the full image. Sequential updates
  /// will be `ImageUpdate` objects, which contains a single updated pixel.
  Stream imageUpdates(Session session) async* {
    // Request a stream of updates from the pixel-added channel in
    // MessageCentral.
    var updateStream =
        session.messages.createStream<ImageUpdate>(_channelPixelAdded);

    // Yield a first full image to the client.
    yield ImageData(
      pixels: _pixelData.buffer.asByteData(),
      width: _imageWidth,
      height: _imageHeight,
    );

    // Relay all individual pixel updates from the pixel-added channel to
    // the client.
    await for (var imageUpdate in updateStream) {
      yield imageUpdate;
    }
  }
}
