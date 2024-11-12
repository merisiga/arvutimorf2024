#!/bin/sh

hfst-lexc veskimae6.lexc > veskimae6.hfst
hfst-twolc veskimae6.twolc > fono6.compose.hfst
hfst-compose-intersect veskimae6.hfst fono6.compose.hfst > veskimae6.fono.hfst
