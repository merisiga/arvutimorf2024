#!/bin/bash

hfst-lexc veskimae2.lexc > veskimae4.hfst
hfst-twolc veskimae2.twolc > fono2.compose.hfst

hfst-compose-intersect veskimae4.hfst fono2.compose.hfst > veskimae4_fono2.hfst

printf "source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. @\"veskimae4_fono2.hfst\"\n\
        save veskimae4_fono2_skript4.hfst\n\
        quit\n" | hfst-xfst


