/* Full text search queries =============================================== */

SELECT
    title
FROM tb_post
WHERE to_tsvector(
        'portuguese',
        title||' '||text_||' '||tags)
    @@ to_tsquery(
        'portuguese',
        'fruta');
        
SELECT
    title
FROM tb_post
WHERE to_tsvector(
        'portuguese',
        title||' '||text_||' '||tags)
    @@ to_tsquery(
        'portuguese',
        'presença humana');
        
SELECT
    title
FROM tb_post
WHERE to_tsvector(
        'portuguese',
        title||' '||text_||' '||tags)
    @@ to_tsquery(
        'portuguese',
        'presença & humana');
        
SELECT plainto_tsquery('portuguese', 'presença humana');
