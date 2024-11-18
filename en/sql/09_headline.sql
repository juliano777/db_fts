/* Results highlight ====================================================== */

SELECT
    ts_headline(
        'portuguese',
        text_,
        to_tsquery('portuguese', 'fruta'),
        'StartSel = <b>, StopSel =</b>')
FROM tb_post
WHERE text_vector @@ to_tsquery('portuguese', 'laranja');
