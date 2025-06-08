--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Creación de sinonimos en los 4 nodos
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando sinónimos para jabbdd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jabbdd_s1
@s-04-netmax-jab-s1-sinonimos.sql
prompt validando sinónimos para jabbdd_s1
@s-04-netmax-valida-sinonimos.sql
prompt =====================================
prompt creando sinónimos para jabbdd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jabbdd_s2
@s-04-netmax-jab-s2-sinonimos.sql
prompt validando sinónimos para jabbdd_s2
@s-04-netmax-valida-sinonimos.sql
prompt =====================================
prompt creando sinónimos para pcpbdd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
@s-04-netmax-pcp-s1-sinonimos.sql
prompt validando sinónimos para pcpbdd_s1
@s-04-netmax-valida-sinonimos.sql
prompt =====================================
prompt creando sinónimos para pcpbdd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
@s-04-netmax-pcp-s2-sinonimos.sql
prompt validando sinónimos para pcpbdd_s2
@s-04-netmax-valida-sinonimos.sql
prompt Listo!