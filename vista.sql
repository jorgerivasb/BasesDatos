create view ejer18 as select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEntrega<=FechaEsperada-2;
select* from ejer18 where CodigoCliente='5';