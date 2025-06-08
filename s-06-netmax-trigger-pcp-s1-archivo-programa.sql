--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: trigger pais

create or replace trigger t_dml_archivo_programa
    instead of insert or update or delete on archivo_programa
declare
begin
    case
        when inserting then
            if :new.tamanio >10 then
                insert into archivo_programa_f1(num_archivo,programa_id,tamanio)
                values (:new.num_archivo, :new.programa_id, :new.tamanio);
                insert into ts_archivo_programa_1(num_archivo,programa_id,archivo)
                values (:new.num_archivo, :new.programa_id, :new.archivo);
                insert into archivo_programa_f1 (num_archivo,programa_id,archivo)
                    select num_archivo,programa_id,archivo from ts_archivo_programa_1 where num_archivo = :new.num_archivo;
                delete from ts_archivo_programa_1 where num_archivo = :new.num_archivo;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en archivo_programa_1');
                end if;
            elsif :new.tamanio <=10 then
                insert into archivo_programa_f2(num_archivo,programa_id,tamanio)
                values (:new.num_archivo, :new.programa_id, :new.tamanio);
                insert into ts_archivo_programa_2(num_archivo,programa_id,archivo)
                values (:new.num_archivo, :new.programa_id, :new.archivo);
                insert into archivo_programa_f2 (num_archivo,programa_id,archivo)
                    select num_archivo,programa_id,archivo from ts_archivo_programa_2 where num_archivo = :new.num_archivo;
                delete from ts_archivo_programa_2 where num_archivo = :new.num_archivo;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en archivo_programa_2');
                end if;
            else
                raise_application_error(-20010, 'El registro que intenta insertar no es valido. EL tamaño del archivo debe ser mayor a 10 o menor o igual a 10'
                    || ' Recibido: tamanio=' || :new.tamanio);
            end if;
        when updating then
            raise_application_error(-20030, 'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');

        when deleting then
            if :old.tamanio >10 then
                delete from archivo_programa_f1 where num_archivo = :old.num_archivo;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en archivo_programa_1');
                end if;
            elsif :old.tamanio <=10 then
                delete from archivo_programa_f2 where num_archivo = :old.num_archivo;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en archivo_programa_2');
                end if;
            else
                raise_application_error(-20010, 'El registro que intenta eliminar no es valido. EL tamaño del archivo debe ser mayor a 10 o menor o igual a 10'
                    || ' Recibido: tamanio=' || :old.tamanio);
            end if;
        else
            raise_application_error(-20050, 'Operación no soportada en el trigger t_dml_archivo_programa. Solo se permiten operaciones INSERT, UPDATE o DELETE.');
    end case;
    commit;
exception
    when others then
        rollback;
        raise_application_error(-20000, 'Error en el trigger t_dml_archivo_programa: ' || sqlerrm);
end;
/