import 'package:made_with_serverpod/made_with_serverpod.dart';
import 'package:pixorama_client/pixorama_client.dart';
import 'package:flutter/material.dart';
import 'package:pixorama_flutter/src/pixorama.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

// ignore: constant_identifier_names
const USE_LIVE_SERVER = true;
var client = Client(USE_LIVE_SERVER ? 'https://api.pixorama.live/' : 'http://$localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
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
