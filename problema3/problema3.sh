#!/bin/bash

DATA=/home/ricardo/LX2_ricardocarvajalt/problema3
GRAF_DATA=$DATA/datos_graf

mkdir $GRAF_DATA
#head -n 5 Datos > Datos2

#iconv -f iso-8859-1 -t utf-8 Datos > datos.utf-8.out

#echo "Dando formato de datos para graficar el archivo $DATA/Datos"
#	cat $DATA/datos.utf-8.out | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5 "" $6 " " $7 "" $8 "" $9 "" $10 "" $11 "" $12 "" $13 "" $14 "" $15 "" $16 "" $17 "" $18 "" $19 "" $20 "" $21 "" $22 "" $23 "" $24 "" $25 "" $26 "" $27 "" $28}' | sed '1,$ s/"//g' |sed '1 s/date/#date/g' > $GRAF_DATA/graf.dat


tail -n +5 $DATA/Datos > Datos2

echo "Dando formato de datos para graficar el archivo $DATA/Datos2"
cat $DATA/Datos2 | awk -F "," '{print $6 " " $7}' | sed '1,$ s/"//g' > $GRAF_DATA/graf.dat

DATA_GRAF=$GRAF_DATA/graf.dat



graficar()
{
gnuplot << EOF 2> error.log
set title "Índice de Radiación Solar KW/m máximo y mínimo"
set grid
set terminal png
set output 'fig1.png'
plot "$DATA_GRAF" using 1 with impulses linecolor rgb 'cyan' title "MAX","$DATA_GRAF" using 2 with linespoints ls 7 linecolor rgb 'blue' title "MIN"
EOF

}

graficar

