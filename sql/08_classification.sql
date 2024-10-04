/* Results classification ================================================= */

CREATE OR REPLACE FUNCTION fc_setweight_tb_post(
    titulo text,
    texto text,
    tags text
)
RETURNS tsvector
IMMUTABLE AS
$body$

BEGIN

RETURN
    setweight(to_tsvector('portuguese', coalesce(titulo,'')),'A') ||
    setweight(to_tsvector('portuguese', coalesce(tags,'')),'B') ||
    setweight(to_tsvector('portuguese', coalesce(texto,'')),'C');

END;

$body$
LANGUAGE PLPGSQL;

-- Removendo a coluna
ALTER TABLE tb_post DROP COLUMN texto_vetor;
       
-- Recriando a coluna como auto gerada utilizando a função criada
ALTER TABLE tb_post
    ADD COLUMN texto_vetor tsvector 
    GENERATED ALWAYS AS (
        fc_setweight_tb_post(titulo, texto, tags))
        STORED;
        
INSERT INTO tb_post (titulo, texto, tags) VALUES (
    'Cidade de São Paulo',
    'A cidade de São Paulo é a capital do Estado de mesmo nome e também a'
    ||'mais populosa do Brasil.',
    'metrópole SP caos trânsito violência');
    
SELECT
    texto_vetor
FROM tb_post 
WHERE texto_vetor @@ to_tsquery('portuguese', 'sp');
