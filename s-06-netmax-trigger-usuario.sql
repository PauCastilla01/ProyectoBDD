--@Autor:  Argueta Bravo y Castilla Padilla
--@Fecha creación:
--@Descripción: trigger pais

create or replace trigger t_dml_usuario
    instead of insert or update or delete on usuario
declare
begin
    case
        when inserting then
            if :new.vigente = 0 then
                insert into usuario_f2(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                
            elsif :new.vigente = 1 and :new.tipo_cuenta_id = 1 then
                insert into usuario_f3(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                
            elsif :new.vigente = 1 and :new.tipo_cuenta_id = 2 then
                insert into usuario_f4(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
               
            elsif :new.vigente = 1 and :new.tipo_cuenta_id = 3 then
                insert into usuario_f5(usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);
                
            else
                 raise_application_error(
        -20010,
        'El registro que intenta insertar no es valido. '
        || 'Valor de vigente debe ser 0 o 1 y tipo_cuenta_id debe ser 1,2 o 3. '
        || 'Recibido: '
        || 'usuario_id=' || :new.usuario_id || ', '
        || 'email=' || :new.email || ', '
        || 'nombre=' || :new.nombre || ', '
        || 'ap_paterno=' || :new.ap_paterno || ', '
        || 'ap_materno=' || :new.ap_materno || ', '
        || 'fecha_ingreso=' || TO_CHAR(:new.fecha_ingreso, 'YYYY-MM-DD HH24:MI:SS') || ', '
        || 'fecha_cuenta_fin=' || TO_CHAR(:new.fecha_cuenta_fin, 'YYYY-MM-DD HH24:MI:SS') || ', '
        || 'vigente=' || :new.vigente || ', '
        || 'tipo_cuenta_id=' || :new.tipo_cuenta_id || ', '
        || 'password=' || :new.password || ', '
        || 'num_tarjeta=' || :new.num_tarjeta
    );
            end if;

            insert into usuario_f1(usuario_id, password, num_tarjeta)
            values (:new.usuario_id, :new.password, :new.num_tarjeta);
           
        when updating then
            raise_application_error(-20020, 'Se intentó realizar una operación update en una tabla con esquema de fragmentación. Para propósitos del proyecto, esta operación no estará implementada.');

        when deleting then
            if :old.vigente = 0 then
                delete from usuario_f2 where usuario_id = :old.usuario_id;
                
            elsif :old.vigente = 1 and :old.tipo_cuenta_id = 1 then
                delete from usuario_f3 where usuario_id = :old.usuario_id;
                
            elsif :old.vigente = 1 and :old.tipo_cuenta_id = 2 then
                delete from usuario_f4 where usuario_id = :old.usuario_id;
                
            elsif :old.vigente = 1 and :old.tipo_cuenta_id = 3 then
                delete from usuario_f5 where usuario_id = :old.usuario_id;
                
            else
                raise_application_error(-20010, 'El registro que intenta eliminar no es valido. Valor de vigente debe ser 0 o 1 y tipo_cuenta_id debe ser 1,2 o 3'
                    || ' Recibido: vigente=' || :old.vigente || ', tipo_cuenta_id=' || :old.tipo_cuenta_id);
            end if;

            delete from usuario_f1 where usuario_id = :old.usuario_id;
            
        else
            raise_application_error(-20050, 'Operación no soportada en el trigger t_dml_usuario. Solo se permiten insert, update y delete.');
    end case;

--     --commit;
-- exception
--     when others then
--         --    --    rollback;
--         raise_application_error(-20050, 'Error en el trigger t_dml_usuario: ' || sqlerrm);
end;
/   