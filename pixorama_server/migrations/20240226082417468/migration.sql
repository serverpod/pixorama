BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "image_data" (
    "id" serial PRIMARY KEY,
    "pixels" bytea NOT NULL,
    "width" integer NOT NULL,
    "height" integer NOT NULL
);


--
-- MIGRATION VERSION FOR pixorama
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pixorama', '20240226082417468', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240226082417468', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
