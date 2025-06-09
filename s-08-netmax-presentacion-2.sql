--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: pcphivo de carga inicial.
clear screen
whenever sqlerror exit rollback;
Prompt ======================================
Prompt Cargando catálogos replicados en jabbdd_s1
Prompt ======================================
connect netmax_bdd/netmax_bdd@jabbdd_s1
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;
Prompt ======================================
Prompt Cargando catalogos replicados en jabbdd_s2
Prompt ======================================
connect netmax_bdd/netmax_bdd@jabbdd_s2
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;
Prompt ======================================
Prompt Cargando catalogos replicados en pcpbdd_s1
Prompt ======================================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;
Prompt ======================================
Prompt Cargando catalogos replicados en pcpbdd_s2
Prompt ======================================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;
Prompt Carga de datos replicados exitosa!.
exit