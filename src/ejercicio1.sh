#!/bin/bash

errorlog="$0.err"

#La salida estandar de error estará redirreccionada al archivo if-the.sh.err
if cp archivo1.txt archivo1.txt.bck 2> $errorlog
then 
	echo "El archivo1.txt fue correctamente respaldado..."
else
	echo "El archivo1.txt no pudo ser respaldado..."
fi

