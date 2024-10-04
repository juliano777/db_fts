/* Full text search queries =============================================== */

SELECT
    titulo
FROM tb_post
WHERE to_tsvector(
        'portuguese',
        titulo||' '||texto||' '||tags)
    @@ to_tsquery(
        'portuguese',
        'fruta');
        
SELECT
    titulo
FROM tb_post
WHERE to_tsvector(
        'portuguese',
        titulo||' '||texto||' '||tags)
    @@ to_tsquery(
        'portuguese',
        'presença humana');
        
SELECT
    titulo
FROM tb_post
WHERE to_tsvector(
        'portuguese',
        titulo||' '||texto||' '||tags)
    @@ to_tsquery(
        'portuguese',
        'presença & humana');
        
SELECT plainto_tsquery('portuguese', 'presença humana');
