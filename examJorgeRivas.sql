#ejer1
insert into Oficinas values ('TRZ-ES', 'Tarazona', 'España', 'Zaragoza', '50500', '976640000', 'Avenida de la Paz 25', NULL);

#vemos que no podemos hacer la inserción propuesta debido a la integridad referencial
insert into Empleados values (32, 'Jorge', 'Rivas', 'Bonilla', '3311', 'jorge@jardineria.es', 'TRZ-ES', 29, 'Representante Ventas');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`exam_jardineria`.`Empleados`, CONSTRAINT `Empleados_OficinasFK` FOREIGN KEY (`CodigoOficina`) REFERENCES `oficinas` (`CodigoOficina`))
#así pues la modificaremos para poder llevar a cabo nuestra consulta
alter table Empleados drop Foreign Key `Empleados_OficinasFK`;
alter table Empleados add Foreign Key (CodigoOficina) references Oficinas(CodigoOficina) on delete restrict on update cascade;
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`exam_jardineria`.`#sql-34d_d`, CONSTRAINT `Empleados_EmpleadosFK` FOREIGN KEY (`CodigoJefe`) REFERENCES `empleados` (`CodigoEmpleado`))
#debemos pues hacer lo propio con otra clave ajena antes de poder hacer esta
alter table Empleados drop Foreign Key `Empleados_EmpleadosFK`;
#ahora si nos deja
alter table Empleados add Foreign Key (CodigoOficina) references Oficinas(CodigoOficina) on delete restrict on update cascade;
alter table Empleados add Foreign Key (CodigoJefe) references Empleados(CodigoEmpleado) on delete restrict on update cascade;
#volvemos a nuestro insert 
insert into Empleados values (32, 'Jorge', 'Rivas', 'Bonilla', '3311', 'jorge@jardineria.es', 'TRZ-ES', 29, 'Representante Ventas');

alter table Clientes drop foreign key `Clientes_EmpleadosFK`;
alter table Clientes add Foreign Key (CodigoEmpleadoRepVentas) references Empleados(CodigoEmpleado) on delete restrict on update cascade;
insert into Clientes (CodigoCliente,NombreCliente,NombreContacto,ApellidoContacto,Telefono,Fax,LineaDireccion1,Ciudad,Region,Pais,CodigoPostal,CodigoEmpleadoRepVentas,LimiteCredito) values 
(1001, 'EcoZuia SL', 'Juan', 'Pérez López', 987654321, 987654654, 'Calle Aduana, 64', 'Zuia', 'Alava','España', 01130, 32, 15000), 
(1002, 'EcoGarden SL', 'Julián', 'Arriba Rodríguez', 987654321, 987654654, 'Avda. Andalucía, 92', 'Clavijo', 'La Rioja','España', 26130, 32, 15000), 
(1003, 'Altos Pinos SL', 'María', 'González Pérez', 987654321, 987654654, 'Ctra. Beas-Cortijos Nuevos, 27', 'Navajún', 'La Rioja','España', 26533, 32, 15000), 
(1004, 'Hoja de Roble SL', 'Luis', 'Martínez Rodríguez', 987654321, 987654654, 'Puerto Lugar, 57', 'Viñuela', 'Málaga','España', 29712, 32, 15000),  
(1005, 'Rosas blancas SL', 'Federico', 'Gutiérrez Marín', 987654321, 987654654, 'C/ Los Herrán, 19', 'Castuera', 'Badajoz','España', 06420, 32, 15000);


 insert into clientes_pagos (razon_social, importe_total, Ciudad) (select Clientes.NombreCliente as razon_social, sum(Pagos.Cantidad) as importe_total, 
 Oficinas.Ciudad as Ciudad from Pagos inner join Clientes on Pagos.CodigoCliente=Clientes.CodigoCliente inner join Empleados on 
 Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado inner join Oficinas on Empleados.CodigoOficina=Oficinas.CodigoOficina group by Pagos.CodigoCliente);





#ejer2
create user administrador identified by '$Ad123456';
GRANT all privileges on exam_jardineria.* to administrador@'localhost';
create user gerente identified by '$Ad123456';
GRANT select,update on exam_jardineria.Clientes to gerente@'localhost';
GRANT select,update on exam_jardineria.Pedidos to gerente@'localhost';
GRANT select,update on exam_jardineria.DetallePedidos to gerente@'localhost';
GRANT select,update on exam_jardineria.Pagos to gerente@'localhost';
create user jardinero identified by '$Ad123456';
GRANT select on *.* to jardinero@'localhost';


#ejer3
 update Clientes set LimiteCredito=LimiteCredito*0.20 where CodigoCliente in (select CodigoCliente from Pagos);
 
 start transaction;
insert into Pedidos values (139, '2019-03-31', '2019-03-31', '2019-03-31', 'Entregado', NULL, 2);
insert into DetallePedidos values (139, 'OR-179', 2, 10, 1);
insert into DetallePedidos values (139, 'OR-189', 2, 10, 2);
commit;

DELETE FROM Clientes 
WHERE
    Ciudad NOT IN (SELECT 
        Ciudad
    FROM
        Oficinas)
    AND CodigoCliente NOT IN (SELECT 
        CodigoCliente
    FROM
        Pedidos);



#ejer4
SELECT 
    Clientes.NombreCliente,
    r.Nombre AS 'Nombre_Rep',
    j.Nombre AS 'Nombre_Jefe'
FROM
    Clientes
        INNER JOIN
    Empleados r ON Clientes.CodigoEmpleadoRepVentas = r.CodigoEmpleado
        INNER JOIN
    Empleados j ON r.CodigoJefe = j.CodigoEmpleado
ORDER BY Clientes.LimiteCredito DESC
LIMIT 1;
+---------------+------------+-------------+
| NombreCliente | Nombre_Rep | Nombre_Jefe |
+---------------+------------+-------------+
| Lasas S.A.    | Mariano    | Carlos      |
+---------------+------------+-------------+




#ejer 5
SELECT 
    Productos.Nombre,
    Productos.Descripcion,
    Productos.PrecioVenta,
    sum(DetallePedidos.Cantidad) as 'unidades_vendidas',
    SUM(DetallePedidos.Cantidad * DetallePedidos.PrecioUnidad) as 'importe_facturado'
FROM
    Productos
        INNER JOIN
    DetallePedidos ON Productos.CodigoProducto = DetallePedidos.CodigoProducto
GROUP BY DetallePedidos.CodigoProducto;


create view total_facturado_producto as SELECT 
    ->     Productos.Nombre,
    ->     Productos.Descripcion,
    ->     Productos.PrecioVenta,
    ->     sum(DetallePedidos.Cantidad) as 'unidades_vendidas',
    ->     SUM(DetallePedidos.Cantidad * DetallePedidos.PrecioUnidad) as 'importe_facturado'
    -> FROM
    ->     Productos
    ->         INNER JOIN
    ->     DetallePedidos ON Productos.CodigoProducto = DetallePedidos.CodigoProducto
    -> GROUP BY DetallePedidos.CodigoProducto;
    
    
select Nombre from total_facturado_producto where importe_facturado>100;




#ejer6
mysqldump -u root -p exam_jardineria > data-dump.sql;