#!/bin/sh

hfst-lexc maris6.lexc > maris6.hfst
hfst-twolc maris6.twolc > fono2.compose.hfst
hfst-compose-intersect maris6.hfst fono2.compose.hfst > maris6fono.hfst

printf "define lihtsonamuundur @\"maris6fono.hfst\" \n\
        define koiksonad [lihtsonamuundur lihtsonamuundur] \n\
        source blokeeri_tuletus.xfscript\n\
        define fst\n\
        read regex fst .o. koiksonad \n\
        save koik.hfst \n\
        quit\n" | hfst-xfst

hfst-fst2strings koik.hfst > koik.strings


 

