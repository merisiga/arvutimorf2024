#!/bin/sh

hfst-lexc veskimae2.lexc > veskimae6.hfst
hfst-twolc veskimae2.twolc > fono2.compose.hfst
hfst-compose-intersect veskimae6.hfst fono2.compose.hfst > veskimae6fono.hfst

printf "define lihtsonamuundur @\"veskimae6fono.hfst\" \n\
        define koiksonad [lihtsonamuundur lihtsonamuundur] \n\
        source veskimae_skript.xfscript\n\
        define fst\n\
        read regex fst .o. koiksonad \n\
        save veskimae.hfst \n\
        quit\n" | hfst-xfst 

