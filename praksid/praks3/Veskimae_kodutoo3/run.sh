#!/bin/bash

printf "source veskimae3.xfscript\n\
        define fst\n\
        read regex @\"veskimae_fono2.hfst\" .o. fst\n\
        save veskimae3_parandused.hfst\n\
        quit\n" | hfst-xfst

printf "source suureks1.xfscript\n\
	define fst\n\
	read regex @\"veskimae_fono2.hfst\" .o. fst\n\
	save veskimae3_suureks.hfst\n\
	quit\n" | hfst-xfst
