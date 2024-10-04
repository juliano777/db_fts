/* Operators ============================================================== */

/* Match ------------------------------------------------------------------ */

SELECT
    to_tsquery('portuguese', '!(gato & rato)') @@
    to_tsvector('portuguese', 'O gato correu atrás do rato');
    
SELECT
	to_tsquery('portuguese', '(gato & rato)')
	@@ to_tsvector('portuguese', 'O gato correu atrás do rato');
	
SELECT
    to_tsquery('portuguese', '(gato & navio)') @@
    to_tsvector('portuguese', 'O gato correu atrás do rato');

SELECT
    to_tsquery('portuguese', '(gato | navio)') @@
    to_tsvector('portuguese', 'O gato correu atrás do rato');
    
SELECT
    to_tsquery('portuguese', 'gato | rato') @@
    to_tsvector('portuguese', 'rata');
    
/* Not -------------------------------------------------------------------- */

SELECT
    !! to_tsquery('portuguese', 'gato | rato')
    @@ to_tsvector('portuguese', 'gatas');
    
SELECT
    !! to_tsquery('portuguese', 'gato | rato')
    @@ to_tsvector('portuguese', 'cão');
    
/* Contain ---------------------------------------------------------------- */

SELECT
    to_tsquery('portuguese', 'gato | rato | cão')
    @> to_tsquery('portuguese', 'cão & rata');
    
SELECT
    to_tsquery('portuguese', 'gato | roda')
    @> to_tsquery('portuguese', 'navio & macaco');
