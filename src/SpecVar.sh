#!/bin/bash


ARGS=3

if [$# -ne "$ARGS"]
then
 	echo "Uso: ´basename $0´ <op1> <op2> <op3>"
	exit 1
fi
#------------------------------------------------------------

VAR1=1

echo "Los parametros del script fueron:"

##Diferencia entre S@ (arreglo) y $* es un string separado por el IFS

for param, in "$@"; do
	echo "El parámetro $VAR1 es $param"
	let "VAR1= $VAR1+1"
done

for param in "$*"; do
	echo "Lista de prarmetros completa $param"
done


#$0 me trae el nombre del acript
if cp $0 $0.bkup 2> $0.error
then
	echo Respaldo exitoso
else
	echo Respaldo Fallido
	exit 1


if cp file1 file1.bkup  2> file1.error
then
        echo Respaldo exitoso
else
        echo Respaldo Fallido
        exit 1


exit 0
