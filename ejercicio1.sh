#!/bin/bash

### Ejercicio usando funciones
### by @hbautista 
### v.0.1 25.05.2020
### v.0.2 25.05.2020


function archivos {
	## Nos movemos a una ruta en especifico
	#cd ~/Lab/Documents
	## Creamos un directorio dentro del escritorio
	mkdir -p ~/Desktop/Lab
	## Nos situamos a dicho directorio
	cd ~/Desktop/Lab
	## Listamos primero, para ver que no hay ningun archivo
	##ls -lrt
	echo "Creando 40 archivos..."
	sleep 3
	## Creacion de archivos usando touch y listamos los archivos creados
	touch archivo{01..40}.txt
	ls -1
	sleep 5
	echo -e "\n"
}

function comprimir {
	echo "Comprimiendo archivos 23 y 29..."
	sleep 5
	## Comprimimos usando gzip, generando un archivo nuevo
	gzip -c archivo{23,29}.txt > archivos23-29.gz
	#echo "Completado..."
	## Listamos el archivo comprimido
	ls -1 *.gz
	sleep 5
	echo -e "\n"
}

function cambiar {
	## Mostramos los archivos que vamos a renombrar
	#ls -lrt | grep 3 ; sleep 3
	echo "Renombrando a .md a los archivos que tengan un 3 en el nombre..."
	## En un ciclo for sacamos el nombre del archivo, sin la extensión, y a renombrar
	#for file in $(ls -l *.txt | grep 3 | awk -F"." '{print $1}' | awk '{print $9}') ; do mv $file.txt $file.md ; done
	## Renombramos usando find, luego listamos los archivos .md
	find . -type f -name "*3*.txt" -exec rename txt md {} \;
	ls -1 *.md
	sleep 5
	echo -e "\n"
}


## Inicio
echo "Comenzando..."
## Llamamos a la función que crea los archivos
archivos
## Ahora se comprimen los archivos
comprimir
## Finalmente renombramos a .md
cambiar
## Fin
echo "Hemos terminado..."

