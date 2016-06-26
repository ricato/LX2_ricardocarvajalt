#!/bin/bash
rm plot.dat

#___TAREA_3_Monitoreo CPU___

#Acá basicamente tomo el consumo actual de CPU con uso del comando TOP,
#claro esta sentencia me la encontré en internet, y me muestra un valor 
#mas preciso del consumo de CPU. Luego meto este valor en un archivo plot.dat,
#y esto dentro de un ciclo infinito para estar escribiendo constantemente
#y que lo este gráficando también. Al final llama a un archivo .gnu que
#se encarga de graficarlo.

writedata() {
	for (( ; ; )) 
	do
        	echo `top -bn 1 | awk '{print $9}' | tail -n +8 | awk '{s+=$1} END {print s}'` >> plot.dat
        	sleep 1
        	#echo "done"
    	done
}

writedata &
sleep 1
gnuplot liveplot.gnu
