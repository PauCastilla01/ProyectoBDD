--@Autor: Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: Creación de ligas en los 4 nodos.
clear screen
whenever sqlerror exit rollback;

connect netmax_bdd/netmax_bdd@jabbdd_s1
Prompt ============================
Prompt Creando ligas en jabbdd_s1
Prompt ============================
Prompt Creando ligas en jabbdd_s1
-- PDB local
create database link jabbdd_s2.fi.unam using 'jabbdd_s2';
--PDB remotas
create database link pcpbdd_s1.fi.unam using 'pcpbdd_s1';
Create database link pcpbdd_s2.fi.unam using 'pcpbdd_s2';


connect netmax_bdd/netmax_bdd@jabbdd_s2
Prompt ============================
Prompt Creando ligas en jabbdd_s2
Prompt ============================
-- PDB local
create database link jabbdd_s1.fi.unam using 'jabbdd_s1';
--PDB remotas
create database link pcpbdd_s1.fi.unam using 'pcpbdd_s1';
Create database link pcpbdd_s2.fi.unam using 'pcpbdd_s2';

Prompt ============================
Prompt Creando ligas en pcpbdd_s1
Prompt ============================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
-- PDB local
create database link pcpbdd_s2.fi.unam using 'pcpbdd_s2';
-- PDB remotas
create database link jabbdd_s1.fi.unam using 'jabbdd_s1';
create database link jabbdd_s2.fi.unam using 'pcpbdd_s2';
Prompt ============================
Prompt Creando ligas en pcpbdd_s2
Prompt ============================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
-- PDB local
create database link pcpbdd_s1.fi.unam using 'pcpbdd_s1';
-- PDB remotas
create database link jabbdd_s1.fi.unam using 'jabbdd_s1';
create database link jabbdd_s2.fi.unam using 'pcpbdd_s2';
Prompt ============================
Prompt Listo!