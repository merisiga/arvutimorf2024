#!/bin/sh

hfst-lexc sofia6.lexc > sofia6.hfst
hfst-twolc sofia6.twolc > sofia_fono.compose.hfst
hfst-compose-intersect sofia6.hfst sofia_fono.compose.hfst > sofia6_fono.hfst

hfst-fst2strings sofia6_fono.hfst > out_esimene.txt

hfst-lexc sofia6_2.lexc > sofia6_2.hfst
hfst-compose-intersect sofia6_2.hfst sofia_fono.compose.hfst > sofia6_fono_2.hfst

printf "define lihtsonamuundur @\"sofia6_fono_2.hfst\" \n\
        define koiksonad [lihtsonamuundur lihtsonamuundur] \n\
        source sofia_filter.xfscript\n\
        define fst\n\
        read regex fst .o. koiksonad \n\
        save koik.hfst \n\
        quit\n" | hfst-xfst

hfst-fst2strings koik.hfst > out_2.txt
