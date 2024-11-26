hfst-lexc sofia8.lexc > sofia8.hfst
hfst-twolc sofia.twolc > sofia.compose.hfst
hfst-compose-intersect sofia8.hfst sofia.compose.hfst > sofia8_fono.hfst
hfst-invert < sofia8_fono.hfst > sofia8.ifst
cat sofia8.test | hfst-lookup -b 196 sofia8.ifst
