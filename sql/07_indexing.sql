CREATE INDEX idx_texto_vetor ON tb_post USING GIN (texto_vetor);

EXPLAIN ANALYZE 
SELECT
    titulo
FROM tb_post 
WHERE texto_vetor @@ plainto_tsquery('presença humana');
