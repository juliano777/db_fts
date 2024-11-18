/* Operators ============================================================== */

/* Contained -------------------------------------------------------------- */

SELECT
    to_tsquery('portuguese', 'moto & carro')
    <@ to_tsquery('portuguese', 'moto | carro | ônibus');    
    
SELECT
    to_tsquery('portuguese', 'moto | carro | ônibus')
    <@ to_tsquery('portuguese', 'moto & carro');
