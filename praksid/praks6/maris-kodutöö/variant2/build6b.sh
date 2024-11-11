#!/bin/sh

hfst-lexc maris6b.lexc > maris6b.hfst
hfst-twolc maris6b.twolc > fono6b.compose.hfst
hfst-compose-intersect maris6b.hfst fono6b.compose.hfst > maris6b.fono.hfst
hfst-fst2strings maris6b.fono.hfst -L 200 > maris6b.strings
 

