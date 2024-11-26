!/bin/sh

hfst-lexc veskimae6.lexc > veskimae8.hfst
hfst-twolc veskimae6.twolc > veskimae8_fono.compose.hfst
hfst-compose-intersect veskimae8.hfst veskimae8_fono.compose.hfst > veskimae8.fono.hfst
hfst-invert < veskimae8.fono.hfst > veskimae8.fono.ihfst

echo 'suurkenale' | hfst-lookup veskimae8.fono.ihfst
echo 'ristideta' | hfst-lookup veskimae8.fono.ihfst
echo 'kraest' | hfst-lookup veskimae8.fono.ihfst
echo 'suurusest' | hfst-lookup veskimae8.fono.ihfst
