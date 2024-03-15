import 'package:made_with_serverpod/made_with_serverpod.dart';
import 'package:pixorama_client/pixorama_client.dart';
import 'package:flutter/material.dart';
import 'package:pixorama_flutter/src/pixorama/pixorama.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/');

void main() {
  client.connectivityMonitor = FlutterConnectivityMonitor();
  // Hide that pesky /#/ in the URL for web app.
  setPathUrlStrategy();
  runApp(const PixoramaApp());
}

class PixoramaApp extends StatelessWidget {
  const PixoramaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixorama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
            child: MadeWithServerpod(
          url: Uri.parse('https://github.com/serverpod/pixorama'),
          child: const Pixorama(),
        )),
      ),
    );
  }
}
