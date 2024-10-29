#!/bin/sh

# paarissõnade muunduri tegemine

# nii esimene kui tagumine sõna on siin nii, et neil on nii sümbolite deklaratsioon kui kõik jätkuleksikonid eraldi failis

cat sofia_multichar.lexc sofia_esi.lexc sofia_jätkud.lexc > sofia_esi.tmp
cat sofia_multichar.lexc sofia_tagu.lexc sofia_jätkud.lexc > sofia_tagu.tmp

hfst-lexc sofia_esi.tmp > sofia_esi.hfst
hfst-lexc sofia_tagu.tmp > sofia_tagu.hfst

hfst-twolc sofia.twolc > sofia_fono.compose.hfst

hfst-compose-intersect sofia_esi.hfst sofia_fono.compose.hfst > sofia_esi_fono.hfst
hfst-compose-intersect sofia_tagu.hfst sofia_fono.compose.hfst > sofia_tagu_fono.hfst

printf "source sofia_numeral.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"sofia_esi_fono.hfst\" \"-\" @\"sofia_tagu_fono.hfst\"]\n\
        save sofia_paarissõnad.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings sofia_paarissõnad.hfst > out_num.txt

printf "source sofia_paari_filter.xfscript\n\
        define fst\n\
        read regex fst .o. [@\"sofia_esi_fono.hfst\" \"-\" @\"sofia_tagu_fono.hfst\"]\n\
        save sofia_paarissõnad_mitte_num.hfst\n\
        quit\n" | hfst-xfst


hfst-fst2strings sofia_paarissõnad_mitte_num.hfst > out_mitte_num.txt

