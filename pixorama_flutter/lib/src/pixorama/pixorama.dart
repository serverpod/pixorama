import 'package:flutter/material.dart';
import 'package:pixels/pixels.dart';
import 'package:pixorama_client/pixorama_client.dart';
import 'package:pixorama_flutter/main.dart';
import 'package:pixorama_flutter/src/pixorama/connection_display.dart';

const _palette = PixelPalette.rPlace();

class Pixorama extends StatefulWidget {
  const Pixorama({
    super.key,
  });

  @override
  _PixoramaState createState() => _PixoramaState();
}

class _PixoramaState extends State<Pixorama> {
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
        print('Got full update');
        // Got a full new image.
        if (imageController == null) {
          imageController = PixelImageController(
            pixels: update.pixels,
            palette: _palette,
            width: update.width,
            height: update.height,
          );
        } else {
          imageController!.pixels = update.pixels;
        }
      } else if (update is ImageUpdate) {
        print('Setting pixel at ${update.pixelIndex}');
        // Got an incremental update of the image.
        imageController?.setPixelIndex(
          pixelIndex: update.pixelIndex,
          colorIndex: update.colorIndex,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectionDisplay(
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
      ),
    );
  }
}
