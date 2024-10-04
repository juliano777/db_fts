/* unaccent module */

CREATE EXTENSION unaccent;

SELECT ts_lexize('unaccent', 'Armação');

CREATE TEXT SEARCH CONFIGURATION tsc_pt_unaccent COPY = portuguese);

ALTER TEXT SEARCH CONFIGURATION tsc_pt_unaccent
    ALTER MAPPING FOR asciiword,
						Asciihword,
						hword_asciipart,
                  	word, 
						hword, 
						hword_part
	WITH 
		dic_pt_br_ispell, 
		unaccent, 
		portuguese_stem, 
		simple;

SELECT
    to_tsvector('tsc_pt_unaccent', 'Hotéis do Mar');
    
SELECT
    to_tsvector('tsc_pt_unaccent', 'Hotéis do Mar')
    @@ to_tsquery('tsc_pt_unaccent','Hotel');
    
SELECT
    ts_headline(
        'tsc_pt_unaccent',
        'Hotéis do Mar',
        to_tsquery(
            'tsc_pt_unaccent',
            'Hotel'));
            
SELECT unaccent('unaccent', 'Hotéis');
