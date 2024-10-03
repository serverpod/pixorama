# Pixorama
Pixorama is a multi-user pixel editor inspired by r/place. The app demonstrates
the real-time capabilities of Serverpod. It is a complete example and you can
try it out at [https://pixorama.live](https://pixorama.live).

For the full tutorial visit
[https://docs.serverpod.dev](https://docs.serverpod.dev/tutorials/real-time-communication).

## Server code
On the server side there are three main files that makes Pixorama tick. Two
serializable models, found in the [models](pixorama_server/lib/src/models)
directory and the
[PixoramaEndpoint](pixorama_server/lib/src/endpoints/pixorama_endpoint.dart)
class. Those files are great starting points for understanding how Pixorama
works.

## Client code
The main Pixorama client/Flutter code can be found in
[Pixorama widget](pixorama_flutter/lib/src/pixorama/pixorama.dart).

## Running the server
To run the server locally:

```bash
cd pixorama_server
dart bin/main.dart
```

## Running the app
To start the app:

```bash
cd pixorama_flutter
flutter run
```