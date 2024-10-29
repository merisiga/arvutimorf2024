#!/bin/sh

# paarissõnade muunduri tegemine

# nii esimene kui tagumine sõna on siin nii, et neil on nii sümbolite deklaratsioon kui kõik jätkuleksikonid eraldi failis

cat veskimae_multichar.lexc veskimae_esi.lexc veskimae_jätkud.lexc > veskimae_esi.tmp
cat veskimae_multichar.lexc veskimae_tagu.lexc veskimae_jätkud.lexc > veskimae_tagu.tmp

hfst-lexc veskimae_esi.tmp > veskimae_esi.hfst
hfst-lexc veskimae_tagu.tmp > veskimae_tagu.hfst

hfst-twolc veskimae2.twolc > veskimae2.compose.hfst

hfst-compose-intersect veskimae_esi.hfst veskimae2.compose.hfst > veskimae_esi_fono2.hfst
hfst-compose-intersect veskimae_tagu.hfst veskimae2.compose.hfst > veskimae_tagu_fono2.hfst

printf "source numeral-filter.est.xfscript\n\
        define fst\n\
	read regex fst .o. [@\"veskimae_esi_fono2.hfst\" \"-\" @\"veskimae_tagu_fono2.hfst\"]\n\
        save veskimae_paarissonad.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings veskimae_paarissonad.hfst > veskimae_paarissonad.txt
