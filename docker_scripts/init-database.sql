CREATE SCHEMA IF NOT EXISTS text_2024;

ALTER DATABASE postgres SET search_path TO text_2024, public;

CREATE TABLE IF NOT EXISTS text_2024.classical_literature(
    id SERIAL,
    author character varying(32) NOT NULL,
    literature TEXT NOT NULL
);
