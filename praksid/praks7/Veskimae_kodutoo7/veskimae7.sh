!/bin/sh

hfst-lexc veskimae6.lexc > veskimae7.hfst
hfst-twolc veskimae6.twolc > veskimae7_fono.compose.hfst
hfst-compose-intersect veskimae7.hfst veskimae7_fono.compose.hfst > veskimae7.fono.hfst
cat veskimae_test.txt | hfst-lookup veskimae7.fono.hfst > test.txt
