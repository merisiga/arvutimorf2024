#!/bin/sh

hfst-lexc kriuchkova2.lexc > kriuchkova2.hfst
hfst-twolc kriuchkova2.twolc > kriuchkova22.compose.hfst

hfst-compose-intersect kriuchkova2.hfst kriuchkova2.compose.hfst > kriuchkova4_fono.hfst

printf "source blokeering.xfscript\n\
        define fst\n\
        read regex fst .o. @\"kriuchkova4_fono.hfst\"\n\
        save kriuchkova_blokeering.hfst\n\
        quit\n" | hfst-xfst

hfst-fst2strings kriuchkova_blokeering.hfst > out_kodutöö4.txt