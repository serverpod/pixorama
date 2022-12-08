--
-- Class ImageData as table image_data
--

CREATE TABLE "image_data" (
  "id" serial,
  "pixels" bytea NOT NULL,
  "width" integer NOT NULL,
  "height" integer NOT NULL
);

ALTER TABLE ONLY "image_data"
  ADD CONSTRAINT image_data_pkey PRIMARY KEY (id);


