DROP TABLE IF EXISTS text_2024.classical_literature;

CREATE TABLE IF NOT EXISTS text_2024.classical_literature(
    id SERIAL,
    author character varying(32) NOT NULL,
    title character varying(32) NOT NULL,
    text TEXT NOT NULL
);

ALTER TABLE text_2024.classical_literature
    ADD CONSTRAINT pk_classical_literature PRIMARY KEY (id);

ALTER TABLE IF EXISTS text_2024.classical_literature
    OWNER to text_2024;

GRANT ALL PRIVILEGES ON TABLE text_2024.classical_literature TO text_2024;

GRANT USAGE, SELECT ON SEQUENCE text_2024.classical_literature_id_seq TO text_2024;
