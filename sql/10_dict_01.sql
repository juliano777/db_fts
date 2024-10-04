/* Dictionaries =========================================================== */

/* Thesaurus dictionary --------------------------------------------------- */

CREATE TEXT SEARCH DICTIONARY dic_pt_br_tz (
    /* template */
    TEMPLATE = thesaurus,
    
    /* configuration file (.ths). */
    DictFile = pt_br_tz,
    
    /* subdictionary (Portuguese Snowball stemmer) */
     Dictionary = pg_catalog.portuguese_stem);

ALTER TEXT SEARCH CONFIGURATION portuguese
    ALTER MAPPING FOR 
        asciiword,
        asciihword,
        hword_asciipart
    WITH dic_pt_br_tz, portuguese_stem;
    
SELECT to_tsvector('portuguese', 'cidade luz');

SELECT to_tsvector('portuguese', 'jogar bola');

SELECT to_tsvector('portuguese', 'pasta de dente');

SELECT 
    to_tsvector(
        'portuguese',
        'Após usar a pasta de dente vou jogar bola na cidade luz');

       
SELECT to_tsvector('portuguese','sp');

ALTER TEXT SEARCH DICTIONARY dic_pt_br_tz (RELOAD);

SELECT to_tsvector('portuguese','sp');
