!/bin/sh

hfst-lexc sofia7.lexc > sofia7.hfst
hfst-twolc sofia7.twolc > sofia_fono.compose.hfst
hfst-compose-intersect sofia7.hfst sofia_fono.compose.hfst > sofia7_final.hfst
cat sofia.test | hfst-lookup sofia7_final.hfst > out.txt

