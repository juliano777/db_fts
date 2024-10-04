/* Dictionaries =========================================================== */

/* Ispell dictionary ------------------------------------------------------ */

CREATE TEXT SEARCH DICTIONARY dic_pt_br_ispell (
    TEMPLATE = ispell,
    DictFile = pt_br,
    AffFile = pt_br,
    StopWords = portuguese
);

CREATE TEXT SEARCH CONFIGURATION tsc_pt_br 
    (COPY = pg_catalog.portuguese );
    
ALTER TEXT SEARCH CONFIGURATION tsc_pt_br
    ALTER MAPPING FOR
        asciiword,
        asciihword, 
        hword_asciipart,
        word,
        hword,
        hword_part
WITH dic_pt_br_ispell, portuguese_stem, simple;

SELECT
    to_tsvector('tsc_pt_br', 'caberia') @@ 
    to_tsquery('tsc_pt_br', 'caibo');
    
SELECT to_tsvector('tsc_pt_br', 'eu trouxe!!!');


/* Snowball dictionary ---------------------------------------------------- */

CREATE TEXT SEARCH DICTIONARY portuguese_stem (
    TEMPLATE = snowball,
    Language = portuguese,
    StopWords = portuguese
);
