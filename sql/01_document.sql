/* Document =============================================================== */

SELECT
    titulo,
    substring(text_, 1, 70) AS text_
FROM tb_post                 
WHERE id = 1;

/* Token ------------------------------------------------------------------- */
SELECT
    'O rato foi pego pela gata preta, pelo gato branco e pelo '
    ||'cachorro de pêlos lisos'::tsvector;
    
/* Lexeme ----------------------------------------------------------------- */
SELECT to_tsvector('Portuguese', 'gatas');

SELECT to_tsvector('pg_catalog.portuguese', 'gato');

/* Pre-processing --------------------------------------------------------- */
SELECT
    'O rato foi pego pela gata preta, pelo gato branco e pelo '
    ||'cachorro de pêlos lisos'::tsvector;
    
SELECT
    to_tsvector(
        'Portuguese',
        'O rato foi pego pela gata preta, pelo gato branco e '
        ||'pelo cachorro de pêlos liso'); 
