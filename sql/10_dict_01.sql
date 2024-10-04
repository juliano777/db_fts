/* Dictionaries =========================================================== */

/* Thesaurus dictionary --------------------------------------------------- */

CREATE TEXT SEARCH DICTIONARY dic_pt_br_tz (
    /* template */
    TEMPLATE = thesaurus,
    
    /* arquivo de configuração (.ths). */
    DictFile = pt_br_tz,
    
    /* subdicionário (português Snowball stemmer) */
     Dictionary = pg_catalog.portuguese_stem 
);

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
        'A cidade luz é a capital da França');
        
SELECT to_tsvector('portuguese','sp');

ALTER TEXT SEARCH DICTIONARY dic_pt_br_tz (DictFile = pt_br_tz);

SELECT to_tsvector('portuguese','sp');
