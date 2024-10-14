#!/bin/sh
printf "source ../suureks1.xfscript\n\
        define fst\n\
        read regex @\"maris2_fono.hfst\" .o. fst\n\
        save naide_fono2_suureks1.hfst\n\
        quit\n" > file.txt

echo "rida+N+Sg+Gen+Rohk" | hfst-lookup naide_fono2_suureks1.hfst
