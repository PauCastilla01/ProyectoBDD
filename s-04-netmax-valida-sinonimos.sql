--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script de validación de sinónimos

prompt validando sinónimos para usuario
select
(select count(*) from usuario_f1) as usuario_f1,
(select count(*) from usuario_f2) as usuario_f2,
(select count(*) from usuario_f3) as usuario_f3,
(select count(*) from usuario_f4) as usuario_f4,
(select count(*) from usuario_f5) as usuario_f5
from dual;

prompt validando sinónimos para playlist
select
(select count(*) from playlist_f1) as playlist_f1,
(select count(*) from playlist_f2) as playlist_f2,
(select count(*) from playlist_f3) as playlist_f3
from dual;

prompt validando sinónimos para serie
select
(select count(*) from serie_f1) as serie_f1,
(select count(*) from serie_f2) as serie_f2,
(select count(*) from serie_f3) as serie_f3
from dual;

prompt validando sinónimos para pelicula
select
(select count(*) from pelicula_f1) as pelicula_f1,
(select count(*) from pelicula_f2) as pelicula_f2,
(select count(*) from pelicula_f3) as pelicula_f3
from dual;

prompt validando sinónimos para documental
select
(select count(*) from documental_f1) as documental_f1,
(select count(*) from documental_f2) as documental_f2,
(select count(*) from documental_f3) as documental_f3
from dual;

prompt validando sinónimos para programa
select
(select count(*) from programa_f1) as programa_f1,
(select count(*) from programa_f2) as programa_f2,
(select count(*) from programa_f3) as programa_f3
from dual;

prompt validando sinónimos para tipo_cuenta
select
(select count(*) from tipo_cuenta_r1) as tipo_cuenta_r1,
(select count(*) from tipo_cuenta_r2) as tipo_cuenta_r2,
(select count(*) from tipo_cuenta_r3) as tipo_cuenta_r3,
(select count(*) from tipo_cuenta_r4) as tipo_cuenta_r4
from dual;

prompt validando sinónimos para tipo_serie
select
(select count(*) from tipo_serie_r1) as tipo_serie_r1,
(select count(*) from tipo_serie_r2) as tipo_serie_r2,
(select count(*) from tipo_serie_r3) as tipo_serie_r3,
(select count(*) from tipo_serie_r4) as tipo_serie_r4
from dual;

prompt validando sinónimos para pais
select
(select count(*) from pais_r1) as pais_r1,
(select count(*) from pais_r2) as pais_r2,
(select count(*) from pais_r3) as pais_r3,
(select count(*) from pais_r4) as pais_r4
from dual;

prompt validando sinónimos para archivo_programa
select
(select count(*) from archivo_programa_f1) as archivo_programa_f1,
(select count(*) from archivo_programa_f2) as archivo_programa_f2
from dual;