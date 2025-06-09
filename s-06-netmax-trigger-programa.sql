--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: trigger pais

create or replace trigger t_dml_programa
    instead of insert or update or delete on programa
declare
begin
    case
        when inserting then
            if substr(:new.folio, 1, 1) between 'A' and 'M' then
                insert into programa_f1(programa_id,folio,nombre,descripcion,fecha_status,tipo,status_programa_id)
                values (:new.programa_id, :new.folio, :new.nombre, :new.descripcion, :new.fecha_status, :new.tipo, :new.status_programa_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en programa_f1');
                end if;
            elsif substr(:new.folio, 1, 1) between 'N' and 'Z'  and :new.status_programa_id in (1, 2, 3) then
                insert into programa_f2(programa_id,folio,nombre,descripcion,fecha_status,tipo,status_programa_id)
                values (:new.programa_id, :new.folio, :new.nombre, :new.descripcion, :new.fecha_status, :new.tipo, :new.status_programa_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en programa_f2');
                end if;
            elsif substr(:new.folio, 1, 1) between 'N' and 'Z' and :new.status_programa_id in (4,5) then
                insert into programa_f3(programa_id,folio,nombre,descripcion,fecha_status,tipo,status_programa_id)
                values (:new.programa_id, :new.folio, :new.nombre, :new.descripcion, :new.fecha_status, :new.tipo, :new.status_programa_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en programa_f3');
                end if;
            else
                raise_application_error(-20010, 'El registro que intenta insertar no es valido. Folio debe iniciar con una letra entre A y M o N y Z y status_programa_id debe ser 1-5'
                    || ' Recibido: folio=' || :new.folio || ', status_programa_id=' || :new.status_programa_id);
            end if;
        when updating then
            raise_application_error(-20030, 'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');

        when deleting then
            if substr(:old.folio, 1, 1) between 'A' and 'M' then
                delete from programa_f1 where programa_id = :old.programa_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en programa_f1');
                end if;
            elsif substr(:old.folio, 1, 1) between 'N' and 'Z' and :old.status_programa_id in (1, 2, 3) then
                delete from programa_f2 where programa_id = :old.programa_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en programa_f2');
                end if;
            elsif substr(:old.folio, 1, 1) between 'N' and 'Z' and :old.status_programa_id in (4,5) then
                delete from programa_f3 where programa_id = :old.programa_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en programa_f3');
                end if;
            else
                raise_application_error(-20010, 'El registro que intenta eliminar no es valido. Folio debe iniciar con una letra entre A y M o N y Z y status_programa_id debe ser 1-5'
                    || ' Recibido: folio=' || :old.folio || ', status_programa_id=' || :old.status_programa_id);
            end if;
        else
            raise_application_error(-20050, 'Operación no soportada en el trigger t_dml_programa. Solo se permiten insert, update y delete.');
    end case;
    ----    commit;
-- exception
--     when others then
--         --    rollback;
--         raise_application_error(-20000, 'Error en el trigger t_dml_programa: ' || sqlerrm);
end;
/