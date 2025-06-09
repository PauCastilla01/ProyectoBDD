--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: trigger pais

create or replace trigger t_dml_historico_status_programa
    instead of insert or update or delete on historico_status_programa
declare
begin
    case
        when inserting then
            insert into historico_status_programa_f1 (historico_status_prog_id, fecha_status, status_programa_id, programa_id)
            values (:new.historico_status_prog_id, :new.fecha_status, :new.status_programa_id, :new.programa_id);
            if sql%rowcount != 1 then
                raise_application_error(-20040, 'No se insertó el registro en historico_status_programa_f1');
            end if;
            

        when updating then
            raise_application_error(-20030, 'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');

        when deleting then
            delete from historico_status_programa_f1 where historico_status_prog_id = :old.historico_status_prog_id;
            if sql%rowcount != 1 then
                raise_application_error(-20040, 'No se eliminó el registro en historico_status_programa_f1');
            end if;
           
    end case;
    --commit;
-- exception
--     when others then
--         --    --    rollback;
--         raise_application_error(-20000, 'Error en el trigger t_dml_usuario: ' || sqlerrm);
end;
/