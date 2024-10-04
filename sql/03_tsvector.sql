/* ts_vector type ======================================================== */

SELECT
    'O carro correu, correu e venceu a corrida facilmente, '
    ||'ultrapassando o último carro a 15 min do final'::tsvector;
    
SELECT
    'o:1 carro:2 verde:3 correu:4 mais:5 do:6 que:7 o:8 carro:9'
    ||'vermelho:10'::tsvector;
    
/* to_tsvector function -------------------------------------------------- */

SELECT
    to_tsvector(
        'pg_catalog.portuguese',
        'O carro correu, correu e venceu a corrida facilmente, '
        ||'ultrapassando o último carro a 15 min do final');
        
SELECT 'rato gato pato'::tsvector;

SELECT to_tsvector('Portuguese', 'rato gato pato');

/* ts_query type ---------------------------------------------------------- */
SELECT 'gato & rato'::tsquery;

SELECT 'pato & (gato|rato)'::tsquery;

SELECT '! 1'::tsquery;

/* to_tsquery function --------------------------------------------------- */
SELECT to_tsquery('pg_catalog.portuguese', '!(correr & vencer)');

SELECT to_tsquery('pg_catalog.english', '!(running & winning)');

/* to_tsquery function --------------------------------------------------- */

SELECT
    plainto_tsquery(
        'english',
        'The Fat Rats are sleeping with the cats');
