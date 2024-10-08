CREATE SCHEMA IF NOT EXISTS text_2024;

CREATE TABLE IF NOT EXISTS text_2024.classical_literature(
    id SERIAL,
    author character varying(32) NOT NULL,
    title character varying(32) NOT NULL,
    text TEXT NOT NULL
);

ALTER TABLE text_2024.classical_literature
    ADD CONSTRAINT pk_classical_literature PRIMARY KEY (id);
