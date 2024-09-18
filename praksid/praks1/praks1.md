# kava

1. Sättida paika muundurite tegemise ja kasutamise tarkvara
2. git
3. Näidisfailid
4. Kodutöö

## 1

### Mac OS/X

Järgin pimesi Francis Tyersi juhiseid https://cl.indiana.edu/~ftyers/courses/2022/Autumn/L-545/practicals/setup.html

Installida Homebrew (https://brew.sh/)

Seejärel terminaliaknas:

```bash
brew install gnu-sed

brew install git

brew install wget

brew install python3
```
(Igaks juhuks: programmide otsingurada on keskkonnamuutuja PATH failis ~/.bash\_profile või Mac OS 10.12 (Catalina) puhul failis  ~/.zprofile)

\-----------

### Windows 10 või 11

1. Linux

kui on Windows 10 või 11, siis lehel https://ubuntu.com/wsl valida sobiv link, teha kõik sammud selles oleva õpetuse järgi (eestikeelse windowsi puhul arvestades, et "windows features" on eesti keeles "windowsi funktsioonid")

tulemusena on arvutis Ubuntu käsurea aken

kui on madalama numbriga Windows ja seda ei saa Windows 10-ks uuendada (või mälu on alla 16 GB), siis tuleb installida X2GO ja teha praktikumiülesandeid aling-pr serveris; vt. https://gitlab.com/tilluteenused/kursus\_arvutimorf/-/tree/main/x2go

(ise sinna midagi installida ei saa)

2. hfst installimine Ubuntu aknas

```bash
sudo apt-get update

sudo apt install hfst
```
3. redaktoriks gedit

```bash
sudo apt install gedit 
```
4. dot graafide joonistamiseks

```bash
sudo apt install graphviz
```


\-----------------------

## git

Ma teeksin teid merisiga/arvutimorf2024 kaastöötajateks. 

1. Selleks peab kaastöötajal olema githubi konto. Kui seda pole, siis peab ta selle endale tegema.

2. Et saaks mugavalt githubi repoga askeldada, peaks masinas olema ssh võtmepaar (nii privaatne kui avalik). Nende olemasolu kontrollimiseks teha 

```bash
ls -l ~/.ssh/
```
Kui seal on midagi nagu `id_ed25519.pub`, siis ongi olemas. Kui pole, siis võtmepaari tekitamiseks teha

```bash
ssh-keygen -t ed25519 -C "githubi_kasutamiseks"
```
Parooli küsimise peale oleks hea mitte `<return>` vajutada, vaid midagi muud (ja see endale kollase märkmepaberi peale üles kirjutada).

3. Nüüd minna GitHubi, logida oma kontole sisse, võtta (paremast ülemisest nurgast pilt) My profile → Settings → SSH and GPG keys → New SSH key.  Anda võtmele mingi nimi (**Title**), kopeerida oma faili `id_ed25519.pub` sisu **Key** aknasse (**Key type** olgu Authentication Key)

4. Nüüd peakski kõik olema tehtud ja mina saan kaastöötaja lisada repole merisiga/arvutimorf2024.

5. Giti kasutamine

Repo kloonimiseks (omale sobivalt valitud kataloogi)
```bash
git clone git@github.com:merisiga/arvutimorf2024.git sobiv_kataloog
```
Kui git palub ennast identifitseerida, siis teha
```bash
git config --global user.email "õige@meili.aadress"
git config --global user.name "õige nimi"
```
(lihtsalt et me teised ka teaksime, kes on reposse muutusi teinud).

Tavaline tööprotsess (oma kataloogis) on järgmine:

Enne millegi tegemist 
```bash
git pull
```
Siis teha muutused failidesse, uued failid, kataloogid vms.
Et näha, mis on lõpuks tehtud:
```bash
git status
```
Et panna oma tehtu reposse:
```bash
git add muutunud_fail
git commit -m "märkus selle kohta, mis on tehtud"
git push
```
Kuidas oma faile nimetada? Vaata soovitusi jaotises **Koduülesanne**

## Näidisfailid

kalajt.lexc

naide1.lexc

... on lexc-tüüpi; lexc on mõeldud leksikonide kirjeldamiseks, s.t. vastab sõnastikutegija intuitsioonile; on mugav aglutinatiivse morfotaktika kirjeldamiseks, kusjuures muutetunnused on sõna lõpus


faili struktuur:

```bash
Multichar\_Symbols   <-- pole kohustuslik jaotis, aga tegelikult ilma selleta ei saa (sest mitmetähelisi sümboleid/märke on praktiliselt vaja)

LEXICON Root       ! <-- kohustuslik; see on muunduri algus

lexikaalne:pindesitus edasi1 ;

LEXICON edasi1  ! <-- jätkuklass, s.t. leksikon, millele viidatakse Root seest

lexikaalne:pindesitus edasi2 ;

lexikaalne:pindesitus # ;

LEXICON edasi2

lexikaalne:pindesitus # ;
```
\--------

erimärgid

!   kommentaari algus; kommentaar kestab rea lõpuni

;   kirje lõpp

\#   sõnavormi lõpp, s.t. ei jätku mingi jätkuleksikoniga

:   muunduri ülemise ja alumise poole eristaja


\----------

muunduri tegemiseks:

```bash
hfst-lexc naide1.lexc > naide1.fst
```

vaatamiseks:

```bash
cat naide1.fst | hfst-fst2strings
```
fst tabelina:

```bash
cat naide1.fst | hfst-fst2txt
```
graafi joonistamiseks on vaja tabel teisendada dot-i jaoks sobivale kujule; 

fst graafina:

```bash
cat naide1.fst | hfst-fst2txt  | python3 att2dot.py | sed 's/@0@/ε/' | dot -Tpng -o naide1.png
```

muunduri ülemise ja alumise poole ära vahetamiseks

```bash
hfst-invert < naide1.fst > naide1.ifst

echo 'torssis+A' | hfst-lookup naide1.fst

echo 'torssis' | hfst-lookup naide1.ifst

echo 'torssis' | hfst-flookup naide1.fst
```


## 4. Koduülesanne

igaüks teeb lexc faili, milles on vähemalt neli sõna: eesnimi perenimi linn tänav; need võivad olla teie oma nimed ja elukohad/lemmikkohad, aga ei pruugi

igale sõnale täisparadigma, s.t. nii ainsus kui mitmus, mõlemas 14 käänet


mida tähele panna:

- jätkuklasse saab määratleda mitmel eri moel
- mõne sõna käänamine on tülikalt kirjeldatav; sel juhul võib jätta käänamise osaliselt valeks ja kirjeldada, milles probleem ning miks on osaliselt vale

\----------------------------

järgmises praksis kommenteerin tehtud kodutöid

\----------------------------

oma lexc fail nimetada järgmiselt: **mingiomanimi.lexc**

kompileeritud fail olgu **mingiomanimi.hfst**

testfail olgu **mingiomanimi.test**

testimiseks käsk:

```bash
cat mingiomanimi.test | hfst-lookup mingiomanimi.hfst
```

oma failid panna repos kataloogi praks1

