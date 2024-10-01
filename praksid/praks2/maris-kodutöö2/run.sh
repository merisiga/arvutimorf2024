#!/bin/bash
hfst-lexc maris2.lexc > maris2.hfst
hfst-twolc maris2.twolc > maris2.compose.hfst
hfst-compose-intersect maris2.hfst maris2.compose.hfst > maris2_fono.hfst
#hfst-fst2strings maris2_fono.hfst > out.txt
cat maris2.test | hfst-lookup maris2_fono.hfst
