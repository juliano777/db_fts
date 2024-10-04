/* Dictionaries =========================================================== */
\dFd

SELECT * FROM pg_ts_dict;

/* Simple Dictionary ------------------------------------------------------ */

CREATE TEXT SEARCH DICTIONARY dic_simples (
    TEMPLATE = pg_catalog.simple,
    STOPWORDS = portuguese
);

SELECT ts_lexize('public.dic_simples', 'foi');

SELECT ts_lexize('public.dic_simples', 'SiM');

/* Synonym dictionary ----------------------------------------------------- */

SELECT * FROM ts_debug('portuguese', 'Paris');

CREATE TEXT SEARCH DICTIONARY dic_sinonimos (
    TEMPLATE = synonym,
    SYNONYMS = sinonimos
);

ALTER TEXT SEARCH CONFIGURATION portuguese
    ALTER MAPPING FOR asciiword
    WITH dic_sinonimos, portuguese_stem;
    
SELECT * FROM ts_debug('portuguese', 'Paris');
