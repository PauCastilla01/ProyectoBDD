--@Autor: Jorge A. Rodríguez C
--@Fecha creación:
--@Descripción: Script principal empleado para configurar el soporte
-- de datos BLOB en los 4 nodos.
Prompt configurando directorios y otorgando registros.
--jabbdd_s1
Prompt configurando soporte BLOB para jabbdd_s1
connect netmax_bdd/netmax_bdd@jabbdd_s1
@s-07-netmax-configuracion-soporte-blobs.sql
--jabbdd_s2
Prompt configurando soporte BLOB para jabbdd_s2
connect netmax_bdd/netmax_bdd@jabbdd_s2
@s-07-netmax-configuracion-soporte-blobs.sql
--pcpbdd_s1
Prompt configurando soporte BLOB para pcpbdd_s1
connect netmax_bdd/netmax_bdd@pcpbdd_s1
@s-07-netmax-configuracion-soporte-blobs.sql
--pcpbdd_s2
Prompt configurando soporte BLOB para pcpbdd_s2
connect netmax_bdd/netmax_bdd@pcpbdd_s2
@s-07-netmax-configuracion-soporte-blobs.sql
Prompt Listo !