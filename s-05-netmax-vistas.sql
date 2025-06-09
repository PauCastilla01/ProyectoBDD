--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@descripcion: Creación de vistas comunes a todos los nodos
-- Se excluyen las vistas que contienen columnas BLOB

--PLAYLIST
Prompt creando vista PLAYLIST
create or replace view PLAYLIST as
select playlist_id,calificacion,indice,num_reproducciones,programa_id,
usuario_id
from playlist_f1
union all
select playlist_id,calificacion,indice,num_reproducciones,programa_id,
usuario_id
from playlist_f2
union all
select playlist_id,calificacion,indice,num_reproducciones,programa_id,
usuario_id
from playlist_f3;

--SERIE
Prompt creando vista SERIE
create or replace view SERIE as
select programa_id,num_capitulos,duracion_capitulo,tipo_serie_id
from serie_f1
union all
select programa_id,num_capitulos,duracion_capitulo,tipo_serie_id
from serie_f2
union all
select programa_id,num_capitulos,duracion_capitulo,tipo_serie_id
from serie_f3;
--PELICULA
Prompt creando vista PELICULA
create or replace view PELICULA as
select programa_id,duracion,sinopsis,clasificacion,PELICULA_ANTECEDENTE_ID
from pelicula_f1
union all
select programa_id,duracion,sinopsis,clasificacion,PELICULA_ANTECEDENTE_ID
from pelicula_f2
union all
select programa_id,duracion,sinopsis,clasificacion,PELICULA_ANTECEDENTE_ID
from pelicula_f3;

--PROGRAMA
Prompt creando vista PROGRAMA
create or replace view PROGRAMA as
select programa_id,folio,nombre,descripcion,fecha_status,tipo,status_programa_id
from programa_f1
union all
select programa_id,folio,nombre,descripcion,fecha_status,tipo,status_programa_id
from programa_f2
union all
select programa_id,folio,nombre,descripcion,fecha_status,tipo,status_programa_id
from programa_f3;

--USUARIO
Prompt creando vista USUARIO
create or replace view USUARIO as
select u1.usuario_id,u1.password,u1.num_tarjeta,up.email,up.nombre,up.ap_paterno,up.ap_materno,up.fecha_ingreso,
       up.fecha_cuenta_fin,up.vigente,up.tipo_cuenta_id
from usuario_f1 u1
join (select usuario_id,email,nombre,ap_paterno,ap_materno,fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id
      from usuario_f2
      union all
      select usuario_id,email,nombre,ap_paterno,ap_materno,fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id
      from usuario_f3
      union all
      select usuario_id,email,nombre,ap_paterno,ap_materno,fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id
      from usuario_f4
      union all
      select usuario_id,email,nombre,ap_paterno,ap_materno,fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id
      from usuario_f5) up
on u1.usuario_id = up.usuario_id;

--TIPO_SERIE
Prompt creando vista TIPO_SERIE
create or replace view TIPO_SERIE as
select tipo_serie_id,clave,descripcion 
from tipo_serie_r1;

--TIPO_CUENTA
Prompt creando vista TIPO_CUENTA
create or replace view TIPO_CUENTA as
select tipo_cuenta_id,clave,descripcion,costo_mensual
from tipo_cuenta_r1;

--PAIS
Prompt creando vista PAIS
create or replace view PAIS as
select pais_id,clave,nombre,continente
from pais_r1;

--Historico_Status_Programa
Prompt creando vista HISTORICO_STATUS_PROGRAMA
create or replace view HISTORICO_STATUS_PROGRAMA as
select hsp.programa_id,hsp.HISTORICO_STATUS_PROG_ID,hsp.fecha_status,hsp.status_programa_id
from historico_status_programa_f1 hsp;