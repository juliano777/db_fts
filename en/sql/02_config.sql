/* Full text search configuration ========================================= */
\dF

SELECT cfgname FROM pg_ts_config;

SHOW default_text_search_config;

SET default_text_search_config = 'pg_catalog.portuguese';

SET default_text_search_config = 'Portuguese';

CREATE TEXT SEARCH CONFIGURATION public.tsc_pg
    (COPY = pg_catalog.portuguese);
    
CREATE TEXT SEARCH DICTIONARY dic_pg (
    TEMPLATE = synonym,
    SYNONYMS = pg_dict
);

CREATE TEXT SEARCH DICTIONARY dic_portuguese_ispell (
    TEMPLATE = ispell,
    DictFile = pt_br,
    AffFile = pt_br,
    StopWords = portuguese
);

ALTER TEXT SEARCH CONFIGURATION tsc_pg
    ALTER MAPPING FOR asciiword,
						asciihword,
						hword_asciipart,
						word, 
						hword, 
						hword_part
    WITH dic_pg,
		dic_portuguese_ispell, 
		portuguese_stem;
		
SELECT ts_debug ('public.tsc_pg','postgresql');

SELECT ts_debug ('public.tsc_pg','pgsql');

SELECT ts_debug ('public.tsc_pg','postgres');

SET default_text_search_config = 'public.tsc_pg';

SHOW default_text_search_config;
