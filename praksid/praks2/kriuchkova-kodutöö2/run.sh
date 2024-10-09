#!/bin/bash
hfst-lexc kriuchkova2.lexc > kriuchkova2.hfst
hfst-twolc kriuchkova2.twolc > kriuchkova2.compose.hfst
hfst-compose-intersect kriuchkova2.hfst kriuchkova2.compose.hfst > kriuchkova2_fono.hfst
#hfst-fst2strings kriuchkova2_fono.hfst > out.txt
cat kriuchkova2.test | hfst-lookup kriuchkova2_fono.hfst
