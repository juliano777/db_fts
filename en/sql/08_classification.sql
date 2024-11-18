/* Results classification ================================================= */

CREATE OR REPLACE FUNCTION fc_setweight_tb_post(
    title text,
    text_ text,
    tags text
)
RETURNS tsvector
IMMUTABLE AS
$body$
BEGIN

RETURN
    setweight(to_tsvector('portuguese', coalesce(title,'')), 'A') ||
    setweight(to_tsvector('portuguese', coalesce(tags,'')), 'B') ||
    setweight(to_tsvector('portuguese', coalesce(text_,'')), 'C');

END;
$body$
LANGUAGE PLPGSQL;

-- Dropping the column
ALTER TABLE tb_post DROP COLUMN text_vector;
       
-- Recreating the column as auto generated
ALTER TABLE tb_post
    ADD COLUMN text_vector tsvector 
    GENERATED ALWAYS AS (
        fc_setweight_tb_post(title, text_, tags))
        STORED;
        
INSERT INTO tb_post (title, text_, tags) VALUES (
    'Cidade de São Paulo',
    'A cidade de São Paulo é a capital do Estado de mesmo nome e também a'
    ||'mais populosa do Brasil.',
    'metrópole SP caos trânsito violência');
    
SELECT
    text_vector
FROM tb_post 
WHERE text_vector @@ to_tsquery('portuguese', 'sp');
