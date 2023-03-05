# Pixorama
Pixorama is a multi-user pixel editor inspired by r/place. The app demonstrates
the real-time capabilities of Serverpod. It is a complete example and you can
try it out at [https://pixorama.live](https://pixorama.live).

For full Serverpod documentation, please visit
[https://docs.serverpod.dev](https://docs.serverpod.dev).

## Server code
On the server side there are three main files that makes Pixorama tick. Two
serializable objects, found in the [protocol](pixorama_server/lib/src/protocol)
directory and the
[PixoramaEndpoint](pixorama_server/lib/src/endpoints/pixorama_endpoint.dart)
class. Those files are great starting points for understanding how Pixorama
works.

## Client code
The main Pixorama client/Flutter code can be found in
[Pixorama widget](pixorama_flutter/lib/src/pixorama/pixorama.dart).

## Running the server
To run the server locally, you need to first install Serverpod. Check the
[docs on getting started](https://docs.serverpod.dev).

Next, you need to setup the Docker container and Serverpod & Pixorama database tables:

```bash
cd pixorama_server
serverpod generate
docker compose up --build --detach
docker compose exec -T postgres env PGPASSWORD="PASSWORD" psql -h postgres -U postgres -d pixorama < generated/tables-serverpod.pgsql
docker compose exec -T postgres env PGPASSWORD="PASSWORD" psql -h postgres -U postgres -d pixorama < generated/tables.pgsql
```
The first docker compose exec commands should return numerous sql verifications like:
```bash
CREATE TABLE
ALTER TABLE
CREATE INDEX
CREATE TABLE
ALTER TABLE
CREATE INDEX
CREATE INDEX
...
.
.
CREATE INDEX
ALTER TABLE
```

The second docker compose exec commands should return two sql verifications like:
```bash
CREATE TABLE
ALTER TABLE
```

This version of Pixorama runs the serverpod locally from the vendor directory, and postgres and redis are run within Docker containers. 

```bash
cd vendor
git clone https://github.com/serverpod/serverpod.git
cd ..
```

Next, fetch packages for serverpod.

```bash
dart pub get
```

Finally, start the server by typing:

```bash
dart bin/main.dart
```

In another window, go to pixorama_flutter and modify the `lib/main.dart` file to use the local server url instead of the live app server. Then type:

```bash
flutter run
```
The debugger will open chrome and the server will return the following screen. 

<img width="1312" alt="image" src="https://user-images.githubusercontent.com/611808/222937342-e9d01f59-f73a-49d3-992b-c8d7560b08a1.png">

You can select a color from the pallete on the right and click on a location in the square to the left. The pixel color should change. You can open several chrome tabs all pointing to the same url as that opened by the flutter debugger and see that changing a pixel in one window updates all the other screens, as shown below.

<img width="1629" alt="image" src="https://user-images.githubusercontent.com/611808/222937680-00118904-5d11-42f9-b6d6-58d32f4e2c2a.png">


## Hosting the Flutter app with Serverpod
This project demonstrates how to use Serverpod to host a Flutter app. The [deployment-aws.yml](.github/workflows/deployment-aws.yml) file in Github workflows contains the code that will build the web app in CI/CD. You will also need the [build_web](scripts/build_web) script and use the modifications in the server's [server.dart](pixorama_server/lib/server.dart) file.
