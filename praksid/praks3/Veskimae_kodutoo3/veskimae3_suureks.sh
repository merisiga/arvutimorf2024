#!/bin/bash

printf "source suureks1.xfscript\n\
	define fst\n\
	read regex @\"veskimae_fono2.hfst\" .o. fst\n\
	save veskimae_fono2_suureks1.hfst\n\
	quit\n" | hfst-xfst
