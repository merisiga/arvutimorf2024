#!/usr/bin/env python3

# Programm selgitab morfoloogiat mittetundvale inimesele lihtsate sõnadega lahti, 
# millised võimalikud analüüsid on etteantud sõnal. Kuna mõne sõna puhul on võimalikke
# analüüse väga palju, siis piiratakse väljundit viie kõige tõenäolisema analüüsiga.



import sys
import hfst

# set up an input stream & read the transducer
tr =  hfst.HfstInputStream('./maris8.ifst').read()

def moonuta(algne):
    tulem = tr.lookup(algne)
    counter = 0
    for (s, prob) in tulem:
        counter += 1
        print(f"{counter}. variant")
        r = s.replace('@_EPSILON_SYMBOL_@', '')
        explain(r)
        # print(r, prob)
        if counter >= 5:
            if len(tulem) >= 5:
                print("...")
            break

sonaliik = { 'N': 'nimisõna', 'A': 'omadussõna' }
arv = { 'Sg': 'ainsus', 'Pl': 'mitmus' }
kääne = { 'Nom': 'nimetav', 'Gen': 'omastav', 'Part': 'osastav', 
         'Ill': 'sisseütlev', 'In': 'seesütlev', 'El': 'seestütlev', 
         'All': 'alaleütlev', 'Ad': 'alalütlev', 'Abl': 'alaltütlev', 
         'Tr': 'saav', 'Term': 'rajav', 'Es': 'olev',
         'Kom': 'kaasaütlev',  'Abes': 'ilmaütlev' }


def explain(s):
    parts = s.split('#')
    if len(parts) == 1:
        print("  See on lihtsõna", end = " ")
        bullet = ""
    else:
        print("  See on liitsõna, mis koosneb sõnadest:")
        bullet = "  * "
    for part in parts:
        info = part.split('+')
        root = info[0]
        if info[1].startswith('oleta'):
            allikas = "oletatud"
            info.pop(1)
        else:
            allikas = "sõnastiku"
        pos = sonaliik[info[1]]
        number = arv[info[2]]
        case = kääne[info[3]]
        print(f"{bullet}{root}, mis on {allikas} {pos} {number}e {case}as käändes.")

if __name__ == '__main__':
    for algne in sys.argv[1:]:
        moonuta(algne)
        
#Help on function lookup in module libhfst:
#
#lookup(self, input, **kwargs)
#    Lookup string *input*.
#    
#    Parameters
#    ----------
#    * `input` :
#        The input. A string or a pre-tokenized tuple of symbols (i.e. a tuple of strings).
#    * `kwargs` :
#        Possible parameters and their default values are: obey_flags=True,
#        max_number=-1, time_cutoff=0.0, output='tuple'
#    * `obey_flags` :
#        Whether flag diacritics are obeyed. Always True for HFST_OL(W)_TYPE transducers.
#    * `max_number` :
#        Maximum number of results returned, defaults to -1, i.e. infinity.
#    * `time_cutoff` :
#        How long the function can search for results before returning, expressed in
#        seconds. Defaults to 0.0, i.e. infinitely. Always 0.0 for transducers that are
#        not of HFST_OL(W)_TYPE.
#    * `output` :
#        Possible values are 'tuple', 'text' and 'raw', 'tuple' being the default.
#    
#    Note: This function has an efficient implementation only for optimized lookup format
#    (hfst.ImplementationType.HFST_OL_TYPE or hfst.ImplementationType.HFST_OLW_TYPE). Other formats perform the
#    lookup via composition. Consider converting the transducer to optimized lookup format
#    or to a HfstBasicTransducer. Conversion to HFST_OL(W)_TYPE might take a while but the
#    lookup is fast. Conversion to HfstBasicTransducer is quick but lookup is slower.

