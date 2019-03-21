-- (actualizamos el equipo de Pau)
select* from jugadores where nombre="Pau Gasol";
+--------+-----------+-------------+--------+------+----------+---------------+
| codigo | Nombre    | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-----------+-------------+--------+------+----------+---------------+
|     66 | Pau Gasol | Spain       | 7-0    |  250 | F-C      | Lakers        |
+--------+-----------+-------------+--------+------+----------+---------------+

update jugadores set Nombre_equipo="Spurs" where nombre="Pau Gasol";

select* from jugadores where nombre="Pau Gasol";
+--------+-----------+-------------+--------+------+----------+---------------+
| codigo | Nombre    | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-----------+-------------+--------+------+----------+---------------+
|     66 | Pau Gasol | Spain       | 7-0    |  250 | F-C      | Spurs         |
+--------+-----------+-------------+--------+------+----------+---------------+

-- (creamos un nuevo jugador)
insert into jugadores values (614,'Ricky Rubio', 'Spain', '6-4', 210, 'G', 'Jazz');
select* from jugadores where nombre='Ricky Rubio';
+--------+-------------+-------------+--------+------+----------+---------------+
| codigo | Nombre      | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-------------+-------------+--------+------+----------+---------------+
|    614 | Ricky Rubio | Spain       | 6-4    |  210 | G        | Jazz          |
+--------+-------------+-------------+--------+------+----------+---------------+

-- (aumentamos su peso un 1%)
update jugadores set Peso=Peso*1.01 where nombre="Ricky Rubio";
select* from jugadores where nombre='Ricky Rubio';
+--------+-------------+-------------+--------+------+----------+---------------+
| codigo | Nombre      | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-------------+-------------+--------+------+----------+---------------+
|    614 | Ricky Rubio | Spain       | 6-4    |  212 | G        | Jazz          |
+--------+-------------+-------------+--------+------+----------+---------------+

-- (borramos el jugador)
delete from jugadores where nombre="Ricky Rubio";
select* from jugadores where nombre='Ricky Rubio';
Empty set


-- (31/01 Ejercicios jardineria DML)

1. Insertar una oficina con sede en Tarazona.
insert into Oficinas values ('TRZN-ES', 'Tarazona', 'España', 'Zaragoza', '50500', '976640000', 'Paseo Fueros de Aragón nº874', 'Paseo Constitución');
select* from Oficinas;

TRZN-ES       | Tarazona             | España     | Zaragoza          | 50500        | 976640000       | Paseo Fueros de Aragón nº874   | Paseo Constitución  

2. Insertar un empleado para la oficina de Tarazona que sea representante de ventas.
insert into Empleados values (32, 'Pablo', 'Perez', 'Padilla', '2442', 'pppadilla@jardineria.es', 'TRZN-ES', '3', 'Representante Ventas');
select* from Empleados;

 32 | Pablo           | Perez      | Padilla   | 2442      | pppadilla@jardineria.es   | TRZN-ES       |          3 | Representante Ventas

3. Insertar un cliente cuyo representante de ventas sea el insertado previamente en el ejercicio 2.
 insert into Clientes values (39, 'Feliciano', 'Cristina', 'Pacheco', '8004-7985', '456987123', 'Avenida Navarra', 'NULL', 'Tarazona', 'Zaragoza', 'España', '50500', 32, '12000');

4. Insertar un pedido del cliente anterior.
insert into Pedidos values (129, '2019-01-31', '2019-02-22', '2019-02-17', 'Entregado', 'El pedido llega en perfectas condiciones', 39);
select* from Pedidos;

 129 | 2019-01-31  | 2019-02-22    | 2019-02-17   | Entregado | El pedido llega en perfectas condiciones                                                                  |            39

5. Modifica el código del cliente del ejercicio 4 y verifica si se han producido cambios en las otras tablas.
update Clientes set CodigoCliente=77 where CodigoCliente=39;
#(no nos permite modificar el código debido a que esto violaría la integridad referencial)

6. Elimina el cliente del ejercicio 4 y verifica si se han producido cambios.
delete from Clientes where CodigoCliente=39;
#(no nos permite eliminarlo ya que violaría la integridad referencial)

-- (subconsultas)

1. Elimina los clientes que no tengan pedidos.
delete from Clientes where CodigoCliente not in (select CodigoCliente from Pedidos);
#(hemos eliminado 17 clientes)

2. Incrementa un 20% el precio de los productos que no tengan pedidos.
update Productos set PrecioVenta=PrecioVenta*1.21 where CodigoProducto not in (select CodigoProducto from DetallePedidos);
#(actualiza 129 de las 276 filas de la tabla)

3. Borra los pagos del cliente con menor límite de crédito.
delete from Pagos where CodigoCliente=16;

4. Sitúa a 0 el límite de crédito del cliente que menos unidades haya pedido del producto 'OR-179'.
update Clientes set LimiteCredito=0 where CodigoCliente in (select CodigoCliente from Pedidos where CodigoPedido in 
(select CodigoPedido from DetallePedidos where CodigoProducto='OR-179'));
#(así, en realidad, hemos modificado el crédito de los 2 clientes que pidieron unidades de dicho producto)


#otro ejer parecido 
update Clientes set LimiteCredito=2222 where CodigoCliente = (select p.CodigoCliente from Pedidos p inner join DetallePedidos d on p.CodigoPedido=d.CodigoPedido 
where d.CodigoProducto='OR-179' group by p.CodigoCliente having min(d.Cantidad) limit 1);