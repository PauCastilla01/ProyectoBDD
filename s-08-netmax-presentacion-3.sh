#!/bin/bash
#@Autor: Jorge A. Rodríguez C
#@Fecha creación: dd/mm/yyyy
#@Descripción: Copia archivos binarios
#Si ocurre un error, el programa termina.
set -e
set -o pipefail

# En caso de no encontrar el directorio, extrae el contenido del archivo zip
if [ ! -d "/tmp/bdd/proyecto-final/pdfs" ]; then
    echo "Copiando archivos pdf de muestra "
    mkdir -p /tmp/bdd/proyecto-final/pdfs
    unzip -j carga-inicial/pdfs.zip -d /tmp/bdd/proyecto-final/pdfs
    ls /tmp/bdd/proyecto-final/pdfs
else
    echo "=> Los archivos PDF de muestra ya fueron copiados"
    ls /tmp/bdd/proyecto-final/pdfs
fi

if [ ! -d "/tmp/bdd/proyecto-final/trailers" ]; then
    echo "Copiando archivos de video de muestra"
    mkdir -p /tmp/bdd/proyecto-final/trailers
    unzip -j carga-inicial/trailers.zip -d /tmp/bdd/proyecto-final/trailers
    ls /tmp/bdd/proyecto-final/trailers
else
    echo "=> Los archivos de video de muestra ya fuero copiados."
    ls /tmp/bdd/proyecto-final/trailers
fi

# actualiza permisos
chmod -R 755 /tmp/bdd/proyecto-final
chmod -R 755 /tmp/bdd/proyecto-final/pdfs
chmod -R 755 /tmp/bdd/proyecto-final/trailers