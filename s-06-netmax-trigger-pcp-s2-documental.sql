--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: trigger pais

create or replace trigger t_dml_documental
    instead of insert or update or delete on documental
declare
    v_count number;
begin
    case
        when inserting then
           select count(*) into v_count
            from programa_3
            where programa_id =:new.programa_id;
            if v_count >0 then 
                insert into documental_3(programa_id,tematica,duracion,trailer,pais_id)
                values (:new.programa_id, :new.tematica, :new.duracion, :new.trailer, :new.pais_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en documental_2');
                end if;
            else
                select count(*) into v_count
                from programa_1
                where programa_id =:new.programa_id;
                if v_count >0 then 
                    insert into documental_1(programa_id,tematica,duracion,trailer,pais_id)
                    values (:new.programa_id, :new.tematica, :new.duracion, :new.trailer, :new.pais_id);
                    insert into ts_documental_1(programa_id, trailer)
                    values (:new.programa_id, :new.trailer);
                    insert into documental_1 
                        select * from ts_documental_1 where programa_id = :new.programa_id;
                    delete from ts_documental_1 where programa_id = :new.programa_id;
                    if sql%rowcount != 1 then
                        raise_application_error(-20040, 'No se insertó el registro en documental_1');
                    end if;
                else
                    select count(*) into v_count
                    from programa_2
                    where programa_id =:new.programa_id;
                    if v_count >0 then 
                        insert into documental_2(programa_id,tematica,duracion,trailer,pais_id)
                        values (:new.programa_id, :new.tematica, :new.duracion, :new.trailer, :new.pais_id);
                        insert into ts_documental_2(programa_id, trailer)
                        values (:new.programa_id, :new.trailer);
                        insert into documental_2 
                            select * from ts_documental_2 where programa_id = :new.programa_id;
                        delete from ts_documental_2 where programa_id = :new.programa_id;
                        if sql%rowcount != 1 then
                            raise_application_error(-20040, 'No se insertó el registro en documental_3');
                        end if;
                    else
                        raise_application_error(-20020, 'Error de integridad para el campo programa_id :'|| :new.programa_id || 
                            '. No se encontró el registro padre en fragmentos para insertar.');
                    end if;
                end if;
            end if;
        when updating then
            raise_application_error(-20030, 'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');

       when deleting then
            select count(*) into v_count
            from programa_3
            where programa_id =:old.programa_id;
            if v_count >0 then 
                delete from documental_3 where programa_id =:old.programa_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en documental_2');
                end if;
            else
                select count(*) into v_count
                from programa_1
                where programa_id =:old.programa_id;
                if v_count >0 then 
                    delete from documental_1 where programa_id =:old.programa_id;
                    if sql%rowcount != 1 then
                        raise_application_error(-20040, 'No se eliminó el registro en documental_1 ');
                    end if;
                else
                    select count(*) into v_count
                    from programa_2
                    where programa_id =:old.programa_id;
                    if v_count >0 then 
                        delete from documental_2 where programa_id =:old.programa_id;
                        if sql%rowcount != 1 then
                            raise_application_error(-20040, 'No se eliminó el registro en documental_3');
                        end if;
                    else
                        raise_application_error(-20020, 'Error de integridad para el campo programa_id :'|| :old.programa_id || 
                            '. No se encontró el registro padre en fragmentos para eliminar.');
                    end if;
                end if;
            end if;
        else
            raise_application_error(-20050, 'Operación no soportada en el trigger t_dml_documental. Solo se permiten insert, update y delete.');
    end case;
    commit;
exception
    when others then
        rollback;
        raise_application_error(-20000, 'Error en el trigger t_dml_documental: ' || sqlerrm);
end;
/