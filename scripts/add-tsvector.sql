ALTER TABLE text_2024.classical_literature ADD column ts_text tsvector;

UPDATE text_2024.classical_literature SET ts_text = to_tsvector('russian', text_2024.classical_literature.text);
