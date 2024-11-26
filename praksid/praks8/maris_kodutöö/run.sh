#!/bin/bash

hfst-lexc maris8.lexc > maris8.hfst
hfst-twolc maris8.twolc > maris8.compose.hfst
hfst-compose-intersect maris8.hfst maris8.compose.hfst > maris8_fono.hfst
hfst-invert < maris8_fono.hfst > maris8.ifst
cat maris8.test | hfst-lookup -b 196 maris8.ifst