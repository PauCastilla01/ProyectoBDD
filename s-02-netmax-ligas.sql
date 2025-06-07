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
drop database link  jabbdd_s2.fi.unam;
create database link jabbdd_s2.fi.unam using 'jabbdd_s2';
--PDB remotas
drop database link pcpbdd_s1.fi.unam;
create database link pcpbdd_s1.fi.unam using 'pcpbdd_s1';
drop database link pcpbdd_s2.fi.unam;
Create database link pcpbdd_s2.fi.unam using 'pcpbdd_s2';


connect netmax_bdd/netmax_bdd@jabbdd_s2
Prompt ============================
Prompt Creando ligas en jabbdd_s2
Prompt ============================
-- PDB local
drop database link jabbdd_s1.fi.unam;
create database link jabbdd_s1.fi.unam using 'jabbdd_s1';
--PDB remotas
drop database link pcpbdd_s1.fi.unam;
create database link pcpbdd_s1.fi.unam using 'pcpbdd_s1';
drop database link pcpbdd_s2.fi.unam;
Create database link pcpbdd_s2.fi.unam using 'pcpbdd_s2';

Prompt ============================
Prompt Creando ligas en pcpbdd_s1
Prompt ============================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
-- PDB local
drop database link pcpbdd_s2.fi.unam;
Create database link pcpbdd_s2.fi.unam using 'pcpbdd_s2';
-- PDB remotas
drop database link jabbdd_s1.fi.unam;
create database link jabbdd_s1.fi.unam using 'jabbdd_s1';
drop database link jabbdd_s2.fi.unam;
create database link jabbdd_s2.fi.unam using 'jabbdd_s2';
Prompt ============================
Prompt Creando ligas en pcpbdd_s2
Prompt ============================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
-- PDB local
drop database link pcpbdd_s1.fi.unam;
create database link pcpbdd_s1.fi.unam using 'pcpbdd_s1';
-- PDB remotas
drop database link jabbdd_s1.fi.unam;
create database link jabbdd_s1.fi.unam using 'jabbdd_s1';
drop database link jabbdd_s2.fi.unam;
create database link jabbdd_s2.fi.unam using 'jabbdd_s2';
Prompt ============================
Prompt Listo!