#!/bin/sh

hfst-lexc maris4.lexc > maris4.hfst
hfst-twolc maris2.twolc > fono2.compose.hfst

hfst-compose-intersect maris4.hfst fono2.compose.hfst > maris4_fono2.hfst

printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"maris4_fono2.hfst\"\n\
        save maris4_fono2_skript4.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings maris4_fono2_skript4.hfst > maris4_fono2_skript4.strings


 

