import 'package:flutter/material.dart';
import 'package:pixels/pixels.dart';
import 'package:pixorama_client/pixorama_client.dart';

import '../../main.dart';

class Pixorama extends StatefulWidget {
  const Pixorama({super.key});

  @override
  State<Pixorama> createState() => _PixoramaState();
}

class _PixoramaState extends State<Pixorama> {
  // The pixel image controller contains our image data and handles updates.
  // If it is null, the image has not yet been loaded from the server.
  PixelImageController? _imageController;

  @override
  void initState() {
    super.initState();

    // Connect to the server and start listening to updates.
    _listenToUpdates();
  }

  Future<void> _listenToUpdates() async {
    // Indefinitely try to connect and listen to updates from the server.
    while (true) {
      try {
        // Get the stream of updates from the server.
        final imageUpdates = client.pixorama.imageUpdates();

        // Listen for updates from the stream. The await for construct will
        // wait for a message to arrive from the server, then run through the
        // body of the loop.
        await for (final update in imageUpdates) {
          // Check which type of update we have received.
          if (update is ImageData) {
            // This is a complete image update, containing all pixels in the
            // image. Create a new PixelImageController with the pixel data.
            setState(() {
              _imageController = PixelImageController(
                pixels: update.pixels,
                palette: PixelPalette.rPlace(),
                width: update.width,
                height: update.height,
              );
            });
          } else if (update is ImageUpdate) {
            // Got an incremental update of the image. Just set the single
            // pixel.
            _imageController?.setPixelIndex(
              pixelIndex: update.pixelIndex,
              colorIndex: update.colorIndex,
            );
          }
        }
      } on MethodStreamException catch (_) {
        // We lost the connection to the server, or failed to connect.
        setState(() {
          _imageController = null;
        });
      }

      // Wait 5 seconds until we try to connect again.
      await Future.delayed(Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _imageController == null
          ? const CircularProgressIndicator()
          : PixelEditor(
              controller: _imageController!,
              onSetPixel: (details) {
                // When a user clicks a pixel we will get a callback from the
                // PixelImageController, with information about the changed
                // pixel. When that happens we call the setPixels method on
                // the server.
                client.pixorama.setPixel(
                  pixelIndex: details.tapDetails.index,
                  colorIndex: details.colorIndex,
                );
              },
            ),
    );
  }
}
