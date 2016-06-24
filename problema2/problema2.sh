#!/bin/bash

#DATA=/home/ricardo/LX2_ricato/problema2/Datos
DATA=/home/ricato/LX2_ricardocarvajalt/problema2/Datos
OUT_DATA=$DATA/archivos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $DATA/archivos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

m=1

for i in  `find $DATA -name '*.xls' |sort `
do
	
        echo "Procesando archivo $i"

        xls2csv $i > $OUT_DATA/dataTmp-$m.csv
	head -n 9 $OUT_DATA/dataTmp-$m.csv > $OUT_DATA/data-$m.csv
	rm $OUT_DATA/dataTmp-$m.csv
        let m=m+1
done 2> error1.log

m=1

for e in `find $OUT_DATA -name "*.csv" | sort`
do
        echo "Dando formato de datos para graficar el archivo $e"
        cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3}' | sed '1,$ s/"//g'| sed '1,$ s/,//g'| sed '1d' > $GRAF_DATA/graf-$m.dat
        let m=m+1
done 2> error2.log


### Condicional

if [ -a $FULL_DATA/full.dat ]
then
        rm $FULL_DATA/full.dat
        echo "Archivo full.dat borrado"
fi 2> errorIf.log

#a=1
#for k in `find $GRAF_DATA -name "*.dat" | sort `
#do
#	if [$a < 3]
#	then
#        	sed '3!d' $k >> $FULL_DATA/full.dat
#        	echo "Procesando archivo $k"
#		let a=a+1
#	fi 2> errorIf2.log
#done 2> error3.log


for k in `find $GRAF_DATA -name "*.dat" | sort `
do
        sed '3!d' $k >> $FULL_DATA/full.dat
        echo "Procesando archivo $k"
done 2> error3.log



#Grafica

FMT_BEGIN=30000
FMT_END=60000
FMT_X_SHOW=%H:%M
DATA_DONE=$FULL_DATA/full.dat



graficar()
{
gnuplot << EOF 2> error.log
set title "Consumo Electrico primeros 3 meses 2012 "
#set timefmt "%Y%m%d %H%M"
#set xrange ["$FMT_BEGIN":"$FMT_END"]
#set format x "$FMT_X_SHOW"
set terminal png
set output 'fig1.png'
plot "$DATA_DONE" using 2 with lines title "Elec"
EOF

}

graficar

