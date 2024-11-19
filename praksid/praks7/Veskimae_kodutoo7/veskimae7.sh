#!/bin/sh

hfst-lexc veskimae6.lexc > veskimae7.hfst
hfst-twolc veskimae6.twolc > veskimae7.compose.hfst
hfst-compose-intersect veskimae7.hfst veskimae7.compose.hfst > veskimae7.fono.hfst
#hfst-fst2strings veskimae7.fono.hfst -L 200 > veskimae7.txt

cat veskimae_test.txt | hfst-lookup veskimae7.fono.hfst > test.txt
