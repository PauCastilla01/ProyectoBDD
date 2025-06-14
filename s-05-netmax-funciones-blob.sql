--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación: dd/mm/yyyy
--@Descripción: Definición de funciones para acceso a BLOBs

--@Descripción: Definición de funciones para acceso a BLOBs
Prompt funciones para acceso de blobs - DOCUMENTAL

--Función que obtiene BLOB del fragmento 1
create or replace function get_remote_trailer_f1_by_id(v_id in number)
    return blob is
    pragma autonomous_transaction;
    v_temp_trailer blob;
begin
--asegura que no haya registros
    delete from ts_documental_1;
    --inserta los datos obtenidos del fragmento remoto a la tabla temporal.
    insert into ts_documental_1
        select programa_id,trailer from documental_f1 where programa_id = v_id;
--obtiene el registro de la tabla temporal y lo regresa como blob
    select trailer into v_temp_trailer
    from ts_documental_1 where programa_id = v_id;
--elimina los registros de la tabla temporal una vez que han sido obtenidos.
    delete from ts_documental_1;
    commit;
    return v_temp_trailer;
    exception
        when others then
        rollback;
        raise;
end;
/
show errors

--Función que obtiene BLOB del fragmento 2
create or replace function get_remote_trailer_f2_by_id(v_id in number)
    return blob is
    pragma autonomous_transaction;
    v_temp_trailer blob;
begin
--asegura que no haya registros
    delete from ts_documental_2;
    --inserta los datos obtenidos del fragmento remoto a la tabla temporal.
    insert into ts_documental_2
        select programa_id,trailer from documental_f2 where programa_id = v_id;
--obtiene el registro de la tabla temporal y lo regresa como blob
    select trailer into v_temp_trailer
    from ts_documental_2 where programa_id = v_id;
--elimina los registros de la tabla temporal una vez que han sido obtenidos.
    delete from ts_documental_2;
    commit;
    return v_temp_trailer;
    exception
        when others then
        rollback;
        raise;
end;
/
show errors

--Función que obtiene BLOB del fragmento 4
create or replace function get_remote_trailer_f3_by_id(v_id in number)
    return blob is
    pragma autonomous_transaction;
    v_temp_trailer blob;
begin
--asegura que no haya registros
    delete from ts_documental_3;
    --inserta los datos obtenidos del fragmento remoto a la tabla temporal.
    insert into ts_documental_3
        select programa_id,trailer from documental_f3 where programa_id = v_id;
--obtiene el registro de la tabla temporal y lo regresa como blob
    select trailer into v_temp_trailer
    from ts_documental_3 where programa_id = v_id;
--elimina los registros de la tabla temporal una vez que han sido obtenidos.
    delete from ts_documental_3;
    commit;
    return v_temp_trailer;
    exception
        when others then
        rollback;
        raise;
end;
/
show errors


--Función que obtiene BLOB del fragmento 1

create or replace function get_remote_archivo_f1_by_id(
    v_num_archivo in number,
    v_programa_id in number
) return blob is
    pragma autonomous_transaction;
    v_temp_archivo blob;
begin
    delete from ts_archivo_programa_1;
    insert into ts_archivo_programa_1
        select num_archivo, programa_id, archivo
        from archivo_programa_f1
        where num_archivo = v_num_archivo and programa_id = v_programa_id;
    select archivo into v_temp_archivo
    from ts_archivo_programa_1
    where num_archivo = v_num_archivo and programa_id = v_programa_id;
    delete from ts_archivo_programa_1;
    commit;
    return v_temp_archivo;
exception
    when others then
        rollback;
        raise;
end;
/
show errors

--Función que obtiene BLOB del fragmento 2

create or replace function get_remote_archivo_f2_by_id(
    v_num_archivo in number,
    v_programa_id in number
) return blob is
    pragma autonomous_transaction;
    v_temp_archivo blob;
begin
    delete from ts_archivo_programa_2;
    insert into ts_archivo_programa_2
        select num_archivo, programa_id, archivo
        from archivo_programa_f2
        where num_archivo = v_num_archivo and programa_id = v_programa_id;
    select archivo into v_temp_archivo
    from ts_archivo_programa_2
    where num_archivo = v_num_archivo and programa_id = v_programa_id;
    delete from ts_archivo_programa_2;
    commit;
    return v_temp_archivo;
exception
    when others then
        rollback;
        raise;
end;
/
show errors