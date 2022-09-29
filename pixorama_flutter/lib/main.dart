import 'package:made_with_serverpod/made_with_serverpod.dart';
import 'package:pixorama_client/pixorama_client.dart';
import 'package:flutter/material.dart';
import 'package:pixorama_flutter/src/pixorama/pixorama.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

// Change this to use the live server or to connect to a local server.
var client = Client('https://api.pixorama.live/');
// var client = Client('http://localhost:8080/');

void main() {
  client.connectivityMonitor = FlutterConnectivityMonitor();

  // Hide that pesky /#/ in the URL for web app.
  setPathUrlStrategy();
  runApp(const PixoramaApp());
}

class PixoramaApp extends StatelessWidget {
  const PixoramaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixorama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MadeWithServerpod(
          url: Uri.parse('https://github.com/serverpod/pixorama'),
          child: const Pixorama(),
        ),
      ),
    );
  }
}
