#!/bin/bash
if test -e $1 #El comando "test -e" verifica que el archivo exista
then 
	cp $1 $1.bck 
	echo "El archivo $1 fue correctamente respaldado"
elif test -e $2
	cp $2 $2.bck
	echo "El archivo $2 fue correctamente respaldado"
elif test -e $3
	cp $3 $3.bck
	echo "El archivo $3 fue correctamente respaldado"
else
	echo "No se pudo respaldar ninguno de los archivos: $@"
fi

