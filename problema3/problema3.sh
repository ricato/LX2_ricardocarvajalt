#!/bin/bash

DATA=/home/ricardo/LX2_ricardocarvajalt/problema3
GRAF_DATA=$DATA/datos_graf

mkdir $GRAF_DATA
#head -n 5 Datos > Datos2

iconv -f iso-8859-1 -t utf-8 Datos > datos.utf-8.out

echo "Dando formato de datos para graficar el archivo $DATA/Datos"
	cat $DATA/datos.utf-8.out | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5 "" $6 " " $7 "" $8 "" $9 "" $10 "" $11 "" $12 "" $13 "" $14 "" $15 "" $16 "" $17 "" $18 "" $19 "" $20 "" $21 "" $22 "" $23 "" $24 "" $25 "" $26 "" $27 "" $28}' | sed '1,$ s/"//g' |sed '1 s/date/#date/g' > $GRAF_DATA/graf.dat
