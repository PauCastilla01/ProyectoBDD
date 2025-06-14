--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@Descripción: Definición de vistas con columnas BLOB para jabbd_s1

--DOCUMENTAL
Prompt creando vista DOCUMENTAL
create or replace view DOCUMENTAL as
select programa_id,tematica,duracion,
get_remote_trailer_f1_by_id(programa_id) as trailer,pais_id
from documental_f1
union all
select programa_id,tematica,duracion,
get_remote_trailer_f2_by_id(programa_id)as trailer,pais_id
from documental_f2
union all
select programa_id,tematica,duracion,trailer,pais_id
from documental_f3;
--ARCHIVO_PROGRAMA
Prompt creando vista ARCHIVO_PROGRAMA
create or replace view ARCHIVO_PROGRAMA as
select num_archivo,programa_id,archivo,tamanio 
from archivo_programa_f1
union all
select num_archivo,programa_id,
get_remote_archivo_f2_by_id(num_archivo,programa_id) as archivo ,
tamanio from archivo_programa_f2;