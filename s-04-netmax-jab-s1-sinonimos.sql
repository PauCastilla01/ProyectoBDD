--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@Descripción: Creación de sinónimos para jabbdd_s1

prompt Creando sinónimos para jabbdd_s1

connect netmax_bdd/netmax_bdd@jabbdd_s1
clear screen
whenever sqlerror exit rollback;

Prompt creando sinonimos para el sitio 1 
create or replace synonym USUARIO_F3 for USUARIO_F3_JAB_S1;
create or replace synonym PLAYLIST_F1 for PLAYLIST_F1_JAB_S1;
create or replace synonym SERIE_F1 for SERIE_F1_JAB_S1;
create or replace synonym PELICULA_F1 for PELICULA_F1_JAB_S1;
create or replace synonym DOCUMENTAL_F1 for DOCUMENTAL_F1_JAB_S1;
create or replace synonym PROGRAMA_F1 for PROGRAMA_F1_JAB_S1;
create or replace synonym TIPO_CUENTA_R1 for TIPO_CUENTA_R_JAB_S1;
create or replace synonym TIPO_SERIE_R1 for TIPO_SERIE_R_JAB_S1;
create or replace synonym PAIS_R1 for PAIS_R_JAB_S1;

Prompt creando sinonimos para el sitio 2
create or replace synonym USUARIO_F5 for USUARIO_F5_PCP_S2@pcpbdd_s1;
create or replace synonym TIPO_SERIE_R2 for TIPO_SERIE_R_PCP_S2@pcpbdd_s1;
create or replace synonym TIPO_CUENTA_R2 for TIPO_CUENTA_R_PCP_S2@pcpbdd_s1;
create or replace synonym PAIS_R2 for PAIS_R_PCP_S2@pcpbdd_s1;

Prompt creando sinonimos para el sitio 3
create or replace synonym serie_f2 for serie_f2_jab_s3@jabbdd_s2;
create or replace synonym playlist_f2 for playlist_f2_jab_s3@jabbdd_s2;
create or replace synonym documental_f2 for documental_f2_jab_s3@jabbdd_s2;
create or replace synonym pelicula_f2 for pelicula_f2_jab_s3@jabbdd_s2;
create or replace synonym usuario_f4 for usuario_f4_jab_s3@jabbdd_s2;
create or replace synonym programa_f2 for programa_f2_jab_s3@jabbdd_s2;
create or replace synonym tipo_cuenta_r3 for tipo_cuenta_r_jab_s3@jabbdd_s2;
create or replace synonym tipo_serie_r3 for tipo_serie_r_jab_s3@jabbdd_s2;
create or replace synonym usuario_f1 for usuario_f1_jab_s3@jabbdd_s2;
create or replace synonym archivo_programa_f2 for archivo_programa_f2_jab_s3@jabbdd_s2;
create or replace synonym pais_r3 for pais_r_jab_s3@jabbdd_s2;


Prompt creando sinonimos para el sitio 4
create or replace synonym USUARIO_F2 for USUARIO_F2_PCP_S4@pcpbdd_s2;
create or replace synonym SERIE_F3 for SERIE_F3_PCP_S4@pcpbdd_s2;
create or replace synonym PLAYLIST_F3 for PLAYLIST_F3_PCP_S4@pcpbdd_s2;
create or replace synonym DOCUMENTAL_F3 for DOCUMENTAL_F3_PCP_S4@pcpbdd_s2;
create or replace synonym PELICULA_F3 for PELICULA_F3_PCP_S4@pcpbdd_s2;
create or replace synonym PROGRAMA_F3 for PROGRAMA_F3_PCP_S4@pcpbdd_s2;
create or replace synonym TIPO_CUENTA_R4 for TIPO_CUENTA_R_PCP_S4@pcpbdd_s2;
create or replace synonym TIPO_SERIE_R4 for TIPO_SERIE_R_PCP_S4@pcpbdd_s2;
create or replace synonym ARCHIVO_PROGRAMA_F1 for ARCHIVO_PROGRAMA_F1_PCP_S4@pcpbdd_s2;
create or replace synonym PAIS_R4 for PAIS_R_PCP_S4@pcpbdd_s2;

