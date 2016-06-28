#!/bin/bash

#PROYECTO_PROGRAMA_PROBLEMA3

DATA=/home/ricardo/LX2_ricardocarvajalt/problema3
GRAF_DATA=$DATA/datos_graf

mkdir $GRAF_DATA

#Empezamos dando forma al archivo separando únicamente los datos
#en un archivo aparte.

tail -n +5 $DATA/Datos > Datos2

#Le damos formato, agarramos las columnas que nos interesan y quitamos
#las comas.

echo "Dando formato de datos para graficar el archivo $DATA/Datos2"
cat $DATA/Datos2 | awk -F "," '{print $6 " " $7}' | sed '1,$ s/"//g' > $GRAF_DATA/graf.dat

#Procedemos a graficar nuestros datos ya procesados.

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

