#!/usr/bin/env python3

import sys
import hfst

def pohjendus(sona):
    if '#' in sona:
        print('See on liitsõna, mis koosneb sõnadest: ')
    else:
        print('See on lihtsõna')
    
    osad = sona.split('#')
    for osa in osad:
        morph = osa.split('+')
        root = morph [0]
        if morph[1].startswith('oleta'):
            allikas = "oletatud"
            pos = sonaliik[morph[2]]
            number = arv[morph[3]]
            case = kääne[morph[4]]
        else:
            allikas = "sõnastiku"
            pos = sonaliik[morph[1]]
            number = arv[morph[2]]
            case = kääne[morph[3]]
            
        print(f"{root}, mis on {allikas} {pos} {number}e {case}as käändes.")
        
def moonuta(algne):
    tulem = tr.lookup(algne)
    c = 0
    for (s, prob) in tulem:
        c += 1
        print(str(c) + '. variant:')
        r = s.replace('@_EPSILON_SYMBOL_@', '')
        pohjendus(r)
        print(r, prob)
        if c >= 5:
            if len(tulem) >= 5:
                print("...")
            break

sonaliik = { 'S': 'nimisõna', 'A': 'omadussõna', 'V': 'tegusõna',
             'P': 'asesõna', 'N': 'arvsõna', 'Adv': 'määrsõna',
             'I': 'hüüdsõna', 'C': 'sidesõna', 'Adp': 'kaassõna' }

arv = { 'Sg': 'ainsus', 'Pl': 'mitmus' }

kääne = { 'Nom': 'nimetav', 'Gen': 'omastav', 'Part': 'osastav', 
         'Ill': 'sisseütlev', 'Ine': 'seesütlev', 'Ela': 'seestütlev', 
         'All': 'alaleütlev', 'Ade': 'alalütlev', 'Abl': 'alaltütlev', 
         'Trl': 'saav', 'Ter': 'rajav', 'Ess': 'olev',
         'Com': 'kaasaütlev',  'Abe': 'ilmaütlev' }

# set up an input stream & read the transducer
tr =  hfst.HfstInputStream('sofia8.ifst').read()

if __name__ == '__main__':
    for algne in sys.argv[1:]:
        moonuta(algne)