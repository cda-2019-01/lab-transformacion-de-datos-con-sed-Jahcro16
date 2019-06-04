#!/bin/bash
sed  -e 's/[\r\n]//g'  data.csv > out.0 #Elimina Retorno
sed -r 's|([0-9]{2})/([0-9]{2})/([0-9]{2})|20\3-\2-\1|g' out.0 > out.1 #Organiza Formato Fecha
sed -r 's|([0-9]{1})/([0-9]{1})/([0-9]{4})|\3-0\2-0\1|g' out.1 > out.2 #Organiza Formato Fecha
tr '[:lower:]' '[:upper:]' < out.2 > out.3  #Mayusculas
sed -r 's%,%.%g' out.3 > out.4 #Separador decimal por.
sed -r 's%;N%;\\N%g' out.4 > out.5 #Cambia Campos Nulos por \N
sed -r 's%;;%;\\N;%g' out.5 > out.6  #Cambia Campos Vacios por \N
sed -r 's%;$%;\\N%g' out.6 > out.7  #Cambia los finales vacios por \N
sed -r 's%;%,%g' out.7 > out.8   #Cambia ; por ,
sed -e 's/2013-08-02/2014-08-02/g' out.8 > out.9 #Pone retorno
sed 's/,200.0/,200,0/g' out.9 > resultado.csv     #Separador decimal por.
#sed 's/./,/3' out.8 > out.9     #Separador decimal por.
#grep -v \\N  out.8 > resultado.csv  #Elimina Nulos
rm out.*     #elimina intermedio Escriba su código aquí
cat resultado.csv