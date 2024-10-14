#!/bin/bash

## Proovisin kõigepealt kohe ümber pöörata, sest see tundus loogilisem, aga see ei töötanud.
## Ta asendas ainult siis, kui sõna on juba leitud, aga kui sõna ei ole leitud, siis ta ei tee midagi.
#hfst-invert < maris2_fono.hfst > maris4_invert.ifst
#cat maris4.test | hfst-lookup maris4_invert.ifst

## Asendan seega teistpidi, et õige vorm läheb justkui vigaseks ja siis pööran selle ümber.
cat maris4.xfscript | hfst-xfst
hfst-invert < maris4_paranda.hfst > maris4_paranda.ifst
cat maris4.test | hfst-lookup maris4_paranda.ifst

