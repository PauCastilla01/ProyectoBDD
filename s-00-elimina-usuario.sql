prompt Creando fragmentos para jabbdd_s1
prompt =====================================
connect sys/system1@jabbdd_s1 as sysdba
drop user netmax_bdd cascade;

connect sys/system1@jabbdd_s2 as sysdba
drop user netmax_bdd cascade;

connect sys/system1@pcpbdd_s1 as sysdba
drop user netmax_bdd cascade;

connect sys/system1@pcpbdd_s2 as sysdba
drop user netmax_bdd cascade;
Prompt Listo!