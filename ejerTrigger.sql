-- before insert pagos +limitecredito cliente el importe del pago

delimiter $$
CREATE TRIGGER nuevoPagoCliente
    BEFORE insert ON Pagos FOR EACH ROW
    BEGIN
         IF NEW.Cantidad>0 THEN
			update Clientes
				SET LimiteCredito=LimiteCredito+NEW.Cantidad
			where CodigoCliente=NEW.CodigoCliente;
		 END IF;
         
    END;
$$

delimiter $$
CREATE TRIGGER nuevoPedidoCliente
    BEFORE insert ON DetallePedidos FOR EACH ROW
    BEGIN
         IF NEW.Cantidad*PrecioUnidad>0 THEN
			update Clientes
				SET LimiteCredito=LimiteCredito-NEW.Cantidad*NEW.PrecioUnidad
			where CodigoCliente=NEW.CodigoCliente;
		 END IF;
         
    END;
$$
