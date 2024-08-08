CREATE SCHEMA IF NOT EXISTS text_2024;

ALTER DATABASE postgres SET search_path TO text_2024, public;

CREATE TABLE IF NOT EXISTS text_2024.authors (
    author_id INTEGER NOT NULL,
    author_name character varying(32) NOT NULL,
    CONSTRAINT pk_authors PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS text_2024.literature (
    literature_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    literature_name character varying(32) NOT NULL,
    literature_text TEXT NOT NULL,
    CONSTRAINT pk_literature PRIMARY KEY (literature_id),
    CONSTRAINT fk_literature_authors FOREIGN KEY (author_id)
        REFERENCES text_2024.authors(author_id)
);
