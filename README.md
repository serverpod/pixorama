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
docker compose up --build --detach
docker compose exec -T postgres env PGPASSWORD="PASSWORD" psql -h postgres -U postgres -d pixorama < generated/tables-serverpod.pgsql
docker compose exec -T postgres env PGPASSWORD="PASSWORD" psql -h postgres -U postgres -d pixorama < generated/tables.pgsql
```
The first docker compose exec commands should return verifications like:
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

The second docker compose exec commands should return on create and one alter verifications like:
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

Next, you need to fetch packages for serverpod.

```bash
dart pub get
```

Finally you should be able to start the server by running:

```bash
dart bin/main.dart
```

In the Flutter app you will need to modify the `main.dart` file to connect to
the local server instead of the live app server.

## Hosting the Flutter app with Serverpod
This project demonstrates how to use Serverpod to host a Flutter app. The [deployment-aws.yml](.github/workflows/deployment-aws.yml) file in Github workflows contains the code that will build the web app in CI/CD. You will also need the [build_web](scripts/build_web) script and use the modifications in the server's [server.dart](pixorama_server/lib/server.dart) file.
