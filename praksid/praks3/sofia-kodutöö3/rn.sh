printf "source kriuchkova_vaikseks.xfscript\n\
        define fst\n\
        read regex fst .o. @\"kriuchkova2_fono.hfst\"\n\
        save kriuchkova_vaikseks.hfst\n\ 
        quit\n" | hfst-xfst
echo 'Tuba+S+Sg+Nom' |hfst-lookup kriuchkova_vaikseks.hfst 
##see töötas

printf "source kriuchkova_parandamine.xfscript\n\
        define fst\n\
        read regex fst .o. @\"kriuchkova2_fono.hfst\"\n\
        save kriuchkova_parandamine.hfst\n\ 
        quit\n" | hfst-xfst
echo 'sgia+S+Sg+Nom' | hfst-lookup kriuchkova_parandamine.hfst 
##aga see mitte