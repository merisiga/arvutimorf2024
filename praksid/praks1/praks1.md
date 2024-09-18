# kava

1. Sättida paika muundurite tegemise ja kasutamise tarkvara
2. git
3. Teha üks näidisfail
4. Kodutöö

## 1

### Mac OS/X

Järgin pimesi Francis Tyersi juhiseid https://cl.indiana.edu/~ftyers/courses/2022/Autumn/L-545/practicals/setup.html

Installida Homebrew (https://brew.sh/)

Seejärel terminaliaknas:

brew install gnu-sed

brew install git

brew install wget

brew install python3

(Igaks juhuks: programmide otsingurada on keskkonnamuutuja PATH failis ~/.bash\_profile või Mac OS 10.12 (Catalina) puhul failis  ~/.zprofile)

\-----------

### Windows 10 või 11

1. Linux

kui on Windows 10 või 11, siis lehel https://ubuntu.com/wsl valida sobiv link, teha kõik sammud selles oleva õpetuse järgi (eestikeelse windowsi puhul arvestades, et "windows features" on eesti keeles "windowsi funktsioonid")

tulemusena on arvutis Ubuntu käsurea aken

kui on madalama numbriga Windows ja seda ei saa Windows 10-ks uuendada (või mälu on alla 16 GB), siis tuleb installida X2GO ja teha praktikumiülesandeid aling-pr serveris; vt. https://gitlab.com/tilluteenused/kursus\_arvutimorf/-/tree/main/x2go

(ise sinna midagi installida ei saa)

2. hfst installimine Ubuntu aknas

sudo apt-get update

sudo apt install hfst

3. redaktoriks gedit

sudo apt install gedit 

4. dot graafide joonistamiseks

sudo apt install graphviz

tõmmata att2dot.py (kopeeritud F. Tyersi loengust https://cl.indiana.edu/~ftyers/courses/2020/Spring/L-545/practicals/02.html)

wget https://kodu.ut.ee/~hkaalep/arvutimorf\_22/att2dot.py

(või kopeerida brauseri abil)

\-----------------------

## git

Ma teeksin teid merisiga/arvutimorf2024 kaastöötajateks. 



git clone https://github.com/merisiga/arvutimorf2024.git


## Näidisfailid

kalajt.lexc

naide1.lexc

... on lexc-tüüpi; lexc on mõeldud leksikonide kirjeldamiseks, s.t. vastab sõnastikutegija intuitsioonile; on mugav aglutinatiivse morfotaktika kirjeldamiseks, kusjuures muutetunnused on sõna lõpus


faili struktuur:

Multichar\_Symbols   <-- pole kohustuslik jaotis, aga tegelikult ilma selleta ei saa (sest mitmetähelisi sümboleid/märke on praktiliselt vaja)

LEXICON Root       ! <-- kohustuslik; see on muunduri algus

lexikaalne:pindesitus edasi1 ;

LEXICON edasi1  ! <-- jätkuklass, s.t. leksikon, millele viidatakse Root seest

lexikaalne:pindesitus edasi2 ;

lexikaalne:pindesitus # ;

LEXICON edasi2

lexikaalne:pindesitus # ;

\--------

erimärgid

!   kommentaari algus; kommentaar kestab rea lõpuni

;   kirje lõpp

\#   sõnavormi lõpp, s.t. ei jätku mingi jätkuleksikoniga

:   muunduri ülemise ja alumise poole eristaja


\----------

muunduri tegemiseks:

hfst-lexc naide1.lexc > naide1.fst

vaatamiseks:

cat naide1.fst | hfst-fst2strings

fst tabelina:

cat naide1.fst | hfst-fst2txt

graafi joonistamiseks on vaja tabel teisendada dot-i jaoks sobivale kujule; 

fst graafina:

cat naide1.fst | hfst-fst2txt  | python3 att2dot.py | sed 's/@0@/ε/' | dot -Tpng -o naide1.png

muunduri ülemise ja alumise poole ära vahetamiseks

hfst-invert < naide1.fst > naide1.ifst

echo 'torssis+A' | hfst-lookup naide1.fst

echo 'torssis' | hfst-lookup naide1.ifst

echo 'torssis' | hfst-flookup naide1.fst

\----------------------------

Näide 2

\-----------------------

Multichar\_Symbols

+N                ! Nimisõna

+A                ! Omadussõna

+Sg

+Pl

+Nom

+Gen

+All              ! alaeütlev

LEXICON Root

koli+N:koli tüüp\_ema ;    ! leksikaalne pool : pindesitus

kena+A:kena tüüp\_ema ;

torssis+A:torssis # ;

LEXICON tüüp\_ema

+Sg: käänded\_sg ;

+Pl: käänded\_pl ;

LEXICON käänded\_sg

+Nom: # ;

+Gen: # ;

+All:le # ;

LEXICON käänded\_pl

+Nom:d # ;

+Gen:de # ;

+All:dele # ;

\----------------------------

## 4. Koduülesanne

vähemalt 10 sõna, mis esindavad kokku vähemalt 3 eri muuttüüpi

igale sõnale täisparadigma

mida tähele panna:

- jätkuklasse saab määratleda mitmel eri moel
- mõne sõna käänamine on tülikalt kirjeldatav; sel juhul võib jätta käänamise osaliselt valeks ja kirjeldada, milles probleem ning miks on osaliselt vale

\----------------------------

järgmises praksis kommenteerin tehtud kodutöid

\----------------------------

oma lexc fail nimetada järgmiselt: mingiomanimi.lexc

kompileeritud fail olgu mingiomanimi.hfst

testfail olgu mingiomanimi.test

testimiseks käsk:

cat mingiomanimi.test | hfst-lookup mingiomanimi.hfst

fail panna 

