ALTER TABLE text_2024.classical_literature
    ADD COLUMN ts_text tsvector
               GENERATED ALWAYS AS (to_tsvector('russian', text_2024.classical_literature.text)) STORED;
