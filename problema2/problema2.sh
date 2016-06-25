#!/bin/bash

DATA=/home/ricardo/LX2_ricardocarvajalt/problema2/Datos
#DATA=/home/ricato/LX2_ricardocarvajalt/problema2/Datos
OUT_DATA=$DATA/archivos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $DATA/archivos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

m=1

#Algo importante a recalcar, es que se utiliza la sentencia sort, 
#para que los archivos sean procesados ordenadamente y asegurarnos 
#que por ejemplo el 1 corresponda a Enero, 2 a Febrero, etc. Esto se
# hace en cada for para mantener el orden en los archivos

for i in  `find $DATA -name '*.xls' |sort `
do
	
        echo "Procesando archivo xml... $i"

	#En este caso uso un archivo temporal, con el fin de transformar el 
	#archivo xml en cvs y de ahi extraer únicamente las primeras 9 líneas,
	# para lo cual uso head en otro archivo cvs con solo los datos que me interesan y se elimina el archivo csv temporal.

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


#A continuación uso el condicional del problema 1 para evitar que se sigan
# insertando datos en los archivos full, uso dos full en donde se guardan 
#los datos de luz y agua, para graficarlos luego.

if [ -a $FULL_DATA/full.dat ]
then
        rm $FULL_DATA/full.dat
        echo "Archivo full.dat borrado"
fi 2> errorIf.log


if [ -a $FULL_DATA/full2.dat ]
then
        rm $FULL_DATA/full2.dat
        echo "Archivo full2.dat borrado"
fi 2> errorIf2.log


#A continuación se envia la data a los archivos full. Aqui para el primer caso
# que se requiere solo los 3 primeros meses, utilicé un if y una variable a modo
# de contador. Los archivos ya vienen ordenados por lo que nos aseguramos que los 
#datos se presenten correctamente. Con 3!d guardo solo la línea que me interesa en el archivo.
a=0
for k in `find $GRAF_DATA -name "*.dat" | sort `
do
	if (("$a" < 3))
	then
        	sed '3!d' $k >> $FULL_DATA/full.dat
        	echo "Procesando archivo full.dat $k"
		let a=a+1
	fi 2> errorIf3.log
done 2> error3.log


for p in `find $GRAF_DATA -name "*.dat" | sort `
do
        sed '2!d' $p >> $FULL_DATA/full2.dat
        echo "Procesando archivo full2.dat $p"
done 2> error4.log



#Grafica

#FMT_BEGIN=30000
#FMT_END=60000
#FMT_X_SHOW=%m
DATA_GRAF1=$FULL_DATA/full.dat
DATA_GRAF2=$FULL_DATA/full2.dat



graficar()
{
gnuplot << EOF 2> error.log
set title "Consumo Eléctrico y de Agua del Chante 2012 "
set grid
#set xtics "01", "02", "03","04","05","06"
set xtics ("Enero" 0, "Febrero" 1, "Marzo" 2, "Abril" 3, "Mayo" 4, "Junio" 5)
set terminal png
set output 'fig1.png'
plot "$DATA_GRAF1" using 2 with linespoints ls 5 title "Consumo Elec. 3 meses","$DATA_GRAF2" using 2 with linespoints ls 7 title "Consumo Agua 6 meses"
EOF

}

graficar

