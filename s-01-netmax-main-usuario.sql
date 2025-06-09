--@Autor: Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@Descripción: Creación de usuarios en los 4 nodos
clear screen
whenever sqlerror exit rollback;
set serveroutput on
Prompt Inciando creacion/eliminacion de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide

connect sys/&&syspass as sysdba
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE=BOTH;
prompt =====================================
prompt Creando usuario en jabbdd_s1
prompt =====================================
connect sys/&&syspass@jabbdd_s1 as sysdba
@s-01-netmax-usuario.sql
prompt =====================================
prompt Creando usuario en jabbdd_s2
prompt =====================================
connect sys/&&syspass@jabbdd_s2 as sysdba
@s-01-netmax-usuario.sql
prompt =====================================
prompt Creando usuario en pcpbdd_s1
prompt =====================================
connect sys/&&syspass@pcpbdd_s1 as sysdba
@s-01-netmax-usuario.sql
prompt =====================================
prompt Creando usuario en pcpbdd_s2
prompt =====================================
connect sys/&&syspass@pcpbdd_s2 as sysdba
@s-01-netmax-usuario.sql
Prompt Listo!
