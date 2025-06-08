--@Autor: Jorge A. Rodríguez C
--@Fecha creación:
--@Descripción: Creación de vistas para todos los sitios
clear screen
whenever sqlerror exit rollback;
prompt ===========================================
prompt Creando vistas para jabbdd_s1
prompt ===========================================
connect netmax_bdd/netmax_bdd@jabbdd_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-jab-s1-vistas-blob.sql
prompt ===========================================
prompt Creando vistas para jabbdd_s2
prompt ===========================================
connect netmax_bdd/netmax_bdd@jabbdd_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-jab-s2-vistas-blob.sql
prompt ===========================================
prompt Creando vistas para pcpbdd_s1
prompt ===========================================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-pcp-s1-vistas-blob.sql
prompt ===========================================
prompt Creando vistas para pcpbdd_s2
prompt ===========================================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-pcp-s2-vistas-blob.sql
prompt Listo!