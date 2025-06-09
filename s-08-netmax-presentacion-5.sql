--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script de eliminación de datos
Prompt Seleccionar la PDB para realizar la eliminación de datos
connect netmax_bdd/netmax_bdd@&pdb
set serveroutput on
Prompt Eliminando datos ...
declare
v_formato varchar2(50) := 'yyy-mm-dd hh24:mi:ss';
begin
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Archivo Programa');
delete from archivo_programa;


dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de playlist');
delete from playlist;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Documental');
delete from documental;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Pelicula');
delete from pelicula;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Serie');
delete from serie;

dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Usuario');
delete from usuario;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Tipo Cuenta');
delete from tipo_cuenta;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Tipo Serie');
delete from tipo_serie;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Pais');
delete from pais;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Historico Status Programa');
delete from historico_status_programa;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Status Programa');
delete from status_programa;
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de Programa');
delete from programa;
--completar
commit;
exception
when others then
dbms_output.put_line('Errores detectados al realizar la eliminacion');
dbms_output.put_line('Se hara rollback');
rollback;
raise;
end;
/
Prompt Listo!
exit