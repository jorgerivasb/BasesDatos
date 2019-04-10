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

DROP TRIGGER IF EXISTS nuevoPedidoCliente;
delimiter $$
CREATE TRIGGER nuevoPedidoCliente
    BEFORE insert ON DetallePedidos FOR EACH ROW
    BEGIN
         IF NEW.Cantidad*NEW.PrecioUnidad>0 THEN
			update Clientes
				SET LimiteCredito=LimiteCredito-(NEW.Cantidad*NEW.PrecioUnidad)
			where CodigoCliente=(select CodigoCliente from Pedidos where CodigoPedido=NEW.CodigoPedido);
		 END IF;
         
    END;
$$

insert into DetallePedidos values (1, '11679', 100, 10, 6, 1.21, 100);
select * from Clientes;

