#Practica 1
#Ivan Enrique Casas Martinez

#!/bin/bash

wget http://antares.dci.uia.mx/eortiz/SEGPR20/index.php

grep href /home/ic16ecm/Documents/index.php > links.txt
grep @ /home/ic16ecm/Documents/index.php > correos.txt

sed 's/"/;/g' "links.txt" | cut -d ";" -f2 > links2.txt

grep '[A-Za-z0-9]@[A-Za-z0-9].[A-Za-z0-9]' correos.txt | sed 's/"/;/g' | cut -d ";" -f4 > correos.txt

for linea in $(cat links2.txt)
do
echo "$linea"
wget $linea -o pagina.txt
grep '[A-Za-z0-9]@[A-Za-z0-9].[A-Za-z0-9]' pagina.txt > correos2.txt
for linea2 in $(cat correos2.txt)
do
sed 's/"/;/g' $linea2 | cut -d ";" -f2 >> correos.txt
done
done
