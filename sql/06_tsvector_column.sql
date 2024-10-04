/* tsvector column ======================================================== */

EXPLAIN ANALYZE
SELECT
    titulo
FROM tb_post
WHERE to_tsvector(
    'portuguese',
    titulo||' '||texto||' '||tags)
        @@ plainto_tsquery(
            'portuguese',
            'presença humana'); 
        
ALTER TABLE tb_post
    ADD COLUMN texto_vetor tsvector
    GENERATED ALWAYS AS (
        to_tsvector(
            'portuguese',
             titulo||' '||texto||' '||tags))
        STORED;
        
EXPLAIN ANALYZE 
SELECT
    titulo
FROM tb_post 
WHERE texto_vetor
    @@ plainto_tsquery(
        'portuguese',
        'presença humana');        
