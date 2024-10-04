/* tsvector column ======================================================== */

EXPLAIN ANALYZE
SELECT
    title
FROM tb_post
WHERE to_tsvector(
    'portuguese',
    title||' '||text_||' '||tags)
        @@ plainto_tsquery('portuguese', 'presença humana'); 
        
ALTER TABLE tb_post
    ADD COLUMN text_vector tsvector
    GENERATED ALWAYS AS (
        to_tsvector(
            'portuguese',
             title||' '||text_||' '||tags))
        STORED;
        
EXPLAIN ANALYZE
SELECT
    title
FROM tb_post
WHERE text_vector
    @@ plainto_tsquery(
        'portuguese',
        'presença humana');       
