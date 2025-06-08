--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: trigger pais

create or replace trigger t_dml_usuario
    instead of insert or update or delete on usuario
declare
begin
    case
        when inserting then
            if :new:vigente = 0 then
                insert into usuario_f2(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en usuario_f2');
                end if;
            elsif :new:vigente = 1 and :new:tipo_cuenta_id = 1 then
                insert into usuario_f3(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en usuario_f3');
                end if;
            elsif :new:vigente = 1 and :new:tipo_cuenta_id = 2 then
                insert into usuario_f4(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en usuario_f4');
                end if;
            elsif :new:vigente = 1 and :new:tipo_cuenta_id = 3 then
                insert into usuario_f5(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se insertó el registro en usuario_f5');
                end if;
            else
                raise_application_error(-20010, 'El registro que intenta insertar no es valido. Valor de vigente debe ser 0 o 1 y tipo_cuenta_id debe ser 1,2 o 3'
                    || ' Recibido: vigente=' || :new.vigente || ', tipo_cuenta_id=' || :new.tipo_cuenta_id);
            end if;

            insert into usuario_f1(usuario_id, password, num_tarjeta)
            values (:new.usuario_id, :new.password, :new.num_tarjeta);
            if sql%rowcount != 1 then
                raise_application_error(-20040, 'No se insertó el registro en usuario_f1');
            end if;

        when updating then
            raise_application_error(-20030, 'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');

        when deleting then
            if :old:vigente = 0 then
                delete from usuario_f2 where usuario_id = :old.usuario_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en usuario_f2');
                end if;
            elsif :old:vigente = 1 and :old:tipo_cuenta_id = 1 then
                delete from usuario_f3 where usuario_id = :old.usuario_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en usuario_f3');
                end if;
            elsif :old:vigente = 1 and :old:tipo_cuenta_id = 2 then
                delete from usuario_f4 where usuario_id = :old.usuario_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en usuario_f4');
                end if;
            elsif :old:vigente = 1 and :old:tipo_cuenta_id = 3 then
                delete from usuario_f5 where usuario_id = :old.usuario_id;
                if sql%rowcount != 1 then
                    raise_application_error(-20040, 'No se eliminó el registro en usuario_f5');
                end if;
            else
                raise_application_error(-20020, 'El registro que intenta eliminar no es valido. Valor de vigente debe ser 0 o 1 y tipo_cuenta_id debe ser 1,2 o 3'
                    || ' Recibido: vigente=' || :old.vigente || ', tipo_cuenta_id=' || :old.tipo_cuenta_id);
            end if;

            delete from usuario_f1 where usuario_id = :old.usuario_id;
            if sql%rowcount != 1 then
                raise_application_error(-20040, 'No se eliminó el registro en usuario_f1');
            end if;
        else
            raise_application_error(-20050, 'Operación no soportada en el trigger t_dml_usuario. Solo se permiten insert, update y delete.');
    end case;
    commit;
exception
    when others then
        rollback;
        raise_application_error(-20000, 'Error en el trigger t_dml_usuario: ' || sqlerrm);
end;
/