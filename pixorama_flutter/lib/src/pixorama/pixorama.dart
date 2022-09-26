import 'package:flutter/material.dart';
import 'package:pixels/pixels.dart';
import 'package:pixorama_client/pixorama_client.dart';
import 'package:pixorama_flutter/main.dart';
import 'package:pixorama_flutter/src/pixorama/connection_display.dart';

// Use the r/place palette, but we can use any 16 color palette here.
const _palette = PixelPalette.rPlace();

class Pixorama extends StatefulWidget {
  const Pixorama({
    super.key,
  });

  @override
  _PixoramaState createState() => _PixoramaState();
}

class _PixoramaState extends State<Pixorama> {
  // The StreamingConnectionHandler helps us keep a persistant connection and
  // automatically reconnects if we lose the connection to the server.
  late final StreamingConnectionHandler connectionHandler;

  // The PixelImageController allows us to update the pixel image when we
  // receive updates from the server. It is null until we got a first full
  // image from the server.
  PixelImageController? imageController;

  @override
  void initState() {
    super.initState();

    // Start listening to updates from the Pixorama endpoint.
    _listenToUpdates();

    // Setup our connection handler and open a streaming connection to the
    // server. The [StreamingConnectionHandler] will attempt to reconnect until
    // the `close` method is called.
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (connectionState) {
        setState(() {});
      },
    );
    connectionHandler.connect();
  }

  Future<void> _listenToUpdates() async {
    // Handle each update from the server as it arrives. It can be either a full
    // image when we first connect, or sequential updates once we are connected
    // and other users adds pixels to the image.
    await for (var update in client.pixorama.stream) {
      if (update is ImageData) {
        // We got a full new image.
        if (imageController == null) {
          // This is the first image we are receiving, create a new image
          // controller.
          setState(() {
            imageController = PixelImageController(
              pixels: update.pixels,
              palette: _palette,
              width: update.width,
              height: update.height,
            );
          });
        } else {
          // We have already received a full image before, so we just replace
          // the pixels in the controller that we have. This can happen if
          // we lost connection to the server and connect again.
          imageController!.pixels = update.pixels;
        }
      } else if (update is ImageUpdate) {
        // Got an incremental update of the image. Just set the single pixel.
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
