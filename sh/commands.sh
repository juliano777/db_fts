pg_config --sharedir

SHAREDIR=`pg_config --sharedir`

cat << EOF > `pg_config --sharedir`/tsearch_data/pg_dict.syn
postgres    pg
pgsql       pg
postgresql  pg
EOF

SHAREDIR=`pg_config --sharedir`

aptitude install myspell-pt-br hunspell-pt-br

cp /usr/share/hunspell/pt_BR.dic $SHAREDIR/tsearch_data/pt_br.dict

sed 's/FLAG UTF-8/FLAG default/g' \
    /usr/share/hunspell/pt_BR.aff > $SHAREDIR/tsearch_data/pt_br.affix

dpkg -S pt_BR.aff pt_BR.dic

cd $SHAREDIR/tsearch_data

grep -E 'foi|sim' portuguese.stop

echo 'Paris paris' > $SHAREDIR/tsearch_data/sinonimos.syn

cp thesaurus_sample.ths pt_br_tz.ths

echo 'sp : *São *Paulo' >> $SHAREDIR/tsearch_data/pt_br_tz.ths
