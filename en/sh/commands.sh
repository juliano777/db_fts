pg_config --sharedir

SHAREDIR=`pg_config --sharedir`

cat << EOF > `pg_config --sharedir`/tsearch_data/pg_dict.syn
postgres    pg
pgsql       pg
postgresql  pg
EOF

apt install -y myspell-pt-br hunspell-pt-br

dpkg -S pt_BR.aff pt_BR.dic

cp /usr/share/hunspell/pt_BR.dic $SHAREDIR/tsearch_data/pt_br.dict

sed 's/FLAG UTF-8/FLAG default/g' \
    /usr/share/hunspell/pt_BR.aff > $SHAREDIR/tsearch_data/pt_br.affix

cd $SHAREDIR/tsearch_data

grep -E 'foi|sim' portuguese.stop

echo 'Paris paris' > $SHAREDIR/tsearch_data/syn.syn

cp $SHAREDIR/tsearch_data/thesaurus_sample.ths \
    $SHAREDIR/tsearch_data/pt_br_tz.ths

cat << EOF >> $SHAREDIR/tsearch_data/pt_br_tz.ths
cidade luz : *Paris cidade luz  
jogar bola : futebol
pasta ? dente : *dentifrício
EOF

echo 'sp : *São *Paulo' >> $SHAREDIR/tsearch_data/pt_br_tz.ths
