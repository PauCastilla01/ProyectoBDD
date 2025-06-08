--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: Script principal - creación de triggers
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando triggers para jabbdd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jabbdd_s1
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-jab-s1-serie.sql
@s-06-netmax-trigger-jab-s1-pelicula.sql
@s-06-netmax-trigger-jab-s1-documental.sql
@s-06-netmax-trigger-jab-s1-archivo-programa.sql
@s-06-netmax-trigger-jab-s1-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql
prompt =====================================
prompt Creando triggers para jabbdd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jabbdd_s2
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-jab-s2-serie.sql
@s-06-netmax-trigger-jab-s2-pelicula.sql
@s-06-netmax-trigger-jab-s2-documental.sql
@s-06-netmax-trigger-jab-s2-archivo-programa.sql
@s-06-netmax-trigger-jab-s2-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql
prompt =====================================
prompt Creando triggers para pcpbdd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@pcpbdd_s1
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-pcp-s1-serie.sql
@s-06-netmax-trigger-pcp-s1-pelicula.sql
@s-06-netmax-trigger-pcp-s1-documental.sql
@s-06-netmax-trigger-pcp-s1-archivo-programa.sql
@s-06-netmax-trigger-pcp-s1-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql
prompt =====================================
prompt Creando triggers para pcpbdd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@pcpbdd_s2
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-pcp-s2-serie.sql
@s-06-netmax-trigger-pcp-s2-pelicula.sql
@s-06-netmax-trigger-pcp-s2-documental.sql
@s-06-netmax-trigger-pcp-s2-archivo-programa.sql
@s-06-netmax-trigger-pcp-s2-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql
prompt Listo!