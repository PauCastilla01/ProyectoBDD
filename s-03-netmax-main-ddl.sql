--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Creación de fragmentos en los 4 nodos
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando fragmentos para jabbdd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jabbdd_s1
@s-03-netmax-jab-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para jabbdd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jabbdd_s2
@s-03-netmax-jab-s2-ddl.sql
prompt =====================================
prompt Creando fragmentos para pcpbdd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
@s-03-netmax-pcp-s1-ddl.sql
prompt =====================================
prompt Creando fragmentos para pcpbdd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
@s-03-netmax-pcp-s2-ddl.sql
Prompt Listo!