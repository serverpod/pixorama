import 'package:flutter/material.dart';
import 'package:pixels/pixels.dart';
import 'package:pixorama_client/pixorama_client.dart';
import 'package:pixorama_flutter/main.dart';
import 'package:pixorama_flutter/src/connection_display.dart';

const _palette = PixelPalette.rPlace();

class Pixorama extends StatefulWidget {
  const Pixorama({
    super.key,
  });

  @override
  PixoramaState createState() => PixoramaState();
}

class PixoramaState extends State<Pixorama> {
  late final StreamingConnectionHandler connectionHandler;
  PixelImageController? imageController;

  @override
  void initState() {
    super.initState();

    _listenToUpdates();

    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (connectionState) {
        setState(() {});
      },
    );
    connectionHandler.connect();
  }

  Future<void> _listenToUpdates() async {
    await for (var update in client.pixorama.stream) {
      if (update is ImageData) {
        if (imageController == null) {
          setState(() {
            imageController = PixelImageController(
              pixels: update.pixels,
              palette: _palette,
              width: update.width,
              height: update.height,
            );
          });
        } else {
          imageController!.pixels = update.pixels;
        }
      } else if (update is ImageUpdate) {
        imageController?.setPixelIndex(
          pixelIndex: update.pixelIndex,
          colorIndex: update.colorIndex,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build the main part of the app. If we have received a first full image,
    // the imageController is set and we can display the image editor. If not,
    // we display a circular progress indicator.
    // We are also wrapping the PixelEditor in a ConnectionDisplay, which will
    // show the current connection status at the bottom of the screen. In a
    // real world app, we may only want to show the connection status when
    // we lost connection to the server or not at all.
    return ConnectionDisplay(
      connectionState: connectionHandler.status,
      child: Center(
        child: imageController == null
            ? const CircularProgressIndicator()
            : PixelEditor(
                controller: imageController!,
                onSetPixel: (details) {
                  client.pixorama.sendStreamMessage(
                    ImageUpdate(
                      pixelIndex: details.tapDetails.index,
                      colorIndex: details.colorIndex,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
