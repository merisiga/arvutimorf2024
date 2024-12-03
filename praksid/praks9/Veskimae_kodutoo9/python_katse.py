#!/usr/bin/python3

import sys
import hfst

# set up an input stream & read the transducer
tr =  hfst.HfstInputStream('./veskimae8.fono.ihfst').read()

def moonuta(algne):
    tulem = tr.lookup(algne)
    for r in tulem:
        print(r)

if __name__ == '__main__':
    for algne in sys.argv[1:]:
        moonuta(algne)
