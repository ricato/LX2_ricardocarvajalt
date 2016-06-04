#!/bin/bash
for a in casa caja carro
do
	echo "El valor de la variable \"a\" es: $a"
	echo "Validando el elemento..."
	#Validará el valor de cada elemento
	if [$a = carro]
	then
		echo "En los elemntos exite la palabra carro..."
	else
		echo "En los elementos NO existe la palabra carro..."
	fi
done

