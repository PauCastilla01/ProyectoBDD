--@Autor: Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@Descripción: Eliminación y creación del usuario.

connect sys/system1 as sysdba;

Prompt Creando al usuario netmax_bdd
drop user if exists netmax_bdd;



create user netmax_bdd identified by netmax_bdd  quota unlimited on users;

prompt Concediendo privilegios al usuario netmax_bdd
grant create session, create table, create procedure, create sequence,
    create database link, create synonym, create type, create view to editorial_bdd;

