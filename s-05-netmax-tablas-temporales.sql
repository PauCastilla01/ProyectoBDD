--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@Descripción: Definición de tablas temporales para manejo de datos BLOB

Prompt tablas temporales para transparencia - Select
-- Tablas temporales para DOCUMENTAL
drop table if exists ts_documental_1;
create global temporary table ts_documental_1 (
programa_id number(10,0) constraint ts_documental_1_pk primary key,
trailer blob not null
) on commit preserve rows;

drop table if exists ts_documental_2;
create global temporary table ts_documental_2 (
programa_id number(10,0) constraint ts_documental_2_pk primary key,
trailer blob not null
) on commit preserve rows;

drop table if exists ts_documental_3;
create global temporary table ts_documental_3 (
programa_id number(10,0) constraint ts_documental_3_pk primary key,
trailer blob not null
) on commit preserve rows;

--tablas temporales para ARCHIVO_PROGRAMA
drop table if exists ts_archivo_programa_1;
create global temporary table ts_archivo_programa_1 (
num_archivo number(5,0),
programa_id number(10,0),
archivo blob not null,
constraint ts_archivo_programa_1_pk primary key(num_archivo,programa_id)
) on commit preserve rows;

drop table if exists ts_archivo_programa_2;
create global temporary table ts_archivo_programa_2 (
num_archivo number(5,0),
programa_id number(10,0),
archivo blob not null,
constraint ts_archivo_programa_2_pk primary key(num_archivo,programa_id)
) on commit preserve rows;

Prompt Prompt tablas temporales para transparencia - Insert
-- Tablas temporales para ARCHIVO_PROGRAMA
drop table if exists ti_documental_1;
create global temporary table ti_documental_1 (
programa_id number(10,0) constraint ti_documental_1_pk primary key,
tematica varchar2(100) not null,
duracion numeric(5,2) not null,
pais_id numeric(2,0) not null
trailer blob not null
) on commit preserve rows;

drop table if exists ti_documental_2;
create global temporary table ti_documental_2 (
programa_id number(10,0) constraint ti_documental_2_pk primary key,
tematica varchar2(100) not null,
duracion numeric(5,2) not null,
pais_id numeric(2,0) not null,
trailer blob not null
) on commit preserve rows;

drop table if exists ti_documental_3;
create global temporary table ti_documental_3 (
programa_id number(10,0) constraint ti_documental_3_pk primary key,
tematica varchar2(100) not null,
duracion numeric(5,2) not null,
pais_id numeric(2,0) not null,
trailer blob not null
) on commit preserve rows;
-- Tablas temporales para ARCHIVO_PROGRAMA
drop table if exists ti_archivo_programa_1;
create global temporary table ti_archivo_programa_1 (
num_archivo number(5,0),
programa_id number(10,0),
archivo blob not null,
tamanio number(10,2) not null,
constraint ti_archivo_programa_1_pk primary key(num_archivo,programa_id)
) on commit preserve rows;

drop table if exists ti_archivo_programa_2;
create global temporary table ti_archivo_programa_2 (
num_archivo number(5,0),
programa_id number(10,0),
archivo blob not null,
tamanio number(10,2) not null,
constraint ti_archivo_programa_2_pk primary key(num_archivo,programa_id)
) on commit preserve rows;