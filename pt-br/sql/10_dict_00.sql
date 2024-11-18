/* Dictionaries =========================================================== */
\dFd

SELECT * FROM pg_ts_dict;

/* Simple Dictionary ------------------------------------------------------ */

CREATE TEXT SEARCH DICTIONARY dic_simple(
    TEMPLATE = pg_catalog.simple,
    STOPWORDS = portuguese
);

SELECT ts_lexize('public.dic_simple', 'foi');

SELECT ts_lexize('public.dic_simple', 'SiM');

/* Synonym dictionary ----------------------------------------------------- */

SELECT * FROM ts_debug('portuguese', 'Paris');

CREATE TEXT SEARCH DICTIONARY dic_syn(
    TEMPLATE = synonym,
    SYNONYMS = syn
);

ALTER TEXT SEARCH CONFIGURATION portuguese
    ALTER MAPPING FOR asciiword
    WITH dic_syn, portuguese_stem;
    
SELECT * FROM ts_debug('portuguese', 'Paris');
