import 'package:pixorama_server/src/endpoints/pixorama_endpoint.dart';
import 'package:serverpod/serverpod.dart';

import 'package:pixorama_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'app', basePath: '/'),
    '/*',
  );

  // Load the image from the database before we boot up the server. This is a
  // point where we can do this and other additional setup work before the
  // server starts.
  await PixoramaEndpoint.loadImageFromDatabase();

  // Start the server.
  await pod.start();
}
