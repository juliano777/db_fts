/* Results highlight ====================================================== */

SELECT
    ts_headline(
        'portuguese',
        texto,
        to_tsquery('portuguese', 'fruta'),
        'StartSel = <b>, StopSel =</b>')
FROM tb_post
WHERE texto_vetor @@ to_tsquery('portuguese', 'laranja');
