delimiter $$
CREATE TRIGGER StatusChangeDateTrigger
    BEFORE UPDATE ON expedientes FOR EACH ROW
    BEGIN
         -- ¿Ha cambiado el estado?
         IF NEW.state != OLD.state THEN
            -- Actualizamos el campo stateChangedDate a la fecha/hora actual
            SET NEW.stateChangedDate = NOW();

            -- A modo de auditoría, añadimos un registro en la tabla expStatusHistory
            INSERT INTO expStatusHistory (`code`, `state`) VALUES (NEW.code, NEW.state);
         END IF;
    END;
$$

update expedientes set state='ko' where code='expediente1';
select * from expedientes;