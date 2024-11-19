#!/bin/bash

hfst-lexc maris7.lexc > maris7.hfst
hfst-twolc maris7.twolc > maris7.compose.hfst
hfst-compose-intersect maris7.hfst maris7.compose.hfst > maris7_fono.hfst
hfst-invert < maris7_fono.hfst > maris7.ifst
cat maris7.test | hfst-lookup maris7.ifst
