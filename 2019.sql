-- (importamos nueva base de datos: jardineria, para ello primero debemos crear un nuevo schema con el nombre de la base e importarla antes de logear en mysql en el terminal, luego logeamos y usamos database)
1. Nombre, apellidos y email de los empleados a cargo de Alberto Soria

select CodigoEmpleado, nombre from Empleados;
+----------------+-----------------+
| CodigoEmpleado | nombre          |
+----------------+-----------------+
|              1 | Marcos          |
|              2 | Ruben           |
|              3 | Alberto         |
|              4 | Maria           |
|              5 | Felipe          |
|              6 | Juan Carlos     |
|              7 | Carlos          |
|              8 | Mariano         |
|              9 | Lucio           |
|             10 | Hilario         |
|             11 | Emmanuel        |
|             12 | José Manuel     |
|             13 | David           |
|             14 | Oscar           |
|             15 | Francois        |
|             16 | Lionel          |
|             17 | Laurent         |
|             18 | Michael         |
|             19 | Walter Santiago |
|             20 | Hilary          |
|             21 | Marcus          |
|             22 | Lorena          |
|             23 | Nei             |
|             24 | Narumi          |
|             25 | Takuma          |
|             26 | Amy             |
|             27 | Larry           |
|             28 | John            |
|             29 | Kevin           |
|             30 | Julian          |
|             31 | Mariko          |
+----------------+-----------------+

select Nombre, Apellido1, Apellido2, Email from Empleados where CodigoJefe = 3;
+-------------+------------+-----------+---------------------------+
| Nombre      | Apellido1  | Apellido2 | Email                     |
+-------------+------------+-----------+---------------------------+
| Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
| Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
| Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
| Emmanuel    | Magaña     | Perez     | manu@jardineria.es        |
| Francois    | Fignon     |           | ffignon@gardening.com     |
| Michael     | Bolton     |           | mbolton@gardening.com     |
| Hilary      | Washington |           | hwashington@gardening.com |
| Nei         | Nishikori  |           | nnishikori@gardening.com  |
| Amy         | Johnson    |           | ajohnson@gardening.com    |
| Kevin       | Fallmer    |           | kfalmer@gardening.com     |
+-------------+------------+-----------+---------------------------+

2. Ciudad y teléfono de las oficinas de EEUU

describe Oficinas;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| CodigoOficina   | varchar(10) | NO   | PRI | NULL    |       |
| Ciudad          | varchar(30) | NO   |     | NULL    |       |
| Pais            | varchar(50) | NO   |     | NULL    |       |
| Region          | varchar(50) | YES  |     | NULL    |       |
| CodigoPostal    | varchar(10) | NO   |     | NULL    |       |
| Telefono        | varchar(20) | NO   |     | NULL    |       |
| LineaDireccion1 | varchar(50) | NO   |     | NULL    |       |
| LineaDireccion2 | varchar(50) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+

select Ciudad, Telefono from Oficinas where Pais = 'EEUU';
+---------------+-----------------+
| Ciudad        | Telefono        |
+---------------+-----------------+
| Boston        | +1 215 837 0825 |
| San Francisco | +1 650 219 4782 |
+---------------+-----------------+

3. Nombre, apellidos y cargo de aquellos que _no_ sean representantes de ventas

select Nombre, Apellido1, Apellido2, Puesto from Empleados where Puesto<>'Representante Ventas';
+----------+------------+-----------+-----------------------+
| Nombre   | Apellido1  | Apellido2 | Puesto                |
+----------+------------+-----------+-----------------------+
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Emmanuel | Magaña     | Perez     | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |
+----------+------------+-----------+-----------------------+

4. Cargo, nombre, apellidos y email del jefe de la empresa.

select Nombre, Apellido1, Apellido2, Email, Puesto from Empleados where Puesto = 'Director General';
+--------+-----------+-----------+----------------------+------------------+
| Nombre | Apellido1 | Apellido2 | Email                | Puesto           |
+--------+-----------+-----------+----------------------+------------------+
| Marcos | Magaña    | Perez     | marcos@jardineria.es | Director General |
+--------+-----------+-----------+----------------------+------------------+

5. Número de clientes que tiene la empresa.

 select count(NombreCliente) from Clientes;
+----------------------+
| count(NombreCliente) |
+----------------------+
|                   36 |
+----------------------+

6. Nombre de los clientes españoles.

select NombreCliente,Pais from Clientes where Pais='Spain';
+-----------------------+-------+
| NombreCliente         | Pais  |
+-----------------------+-------+
| Lasas S.A.            | Spain |
| Lasas S.A.            | Spain |
| Camunas Jardines S.L. | Spain |
| Dardena S.A.          | Spain |
+-----------------------+-------+
7. Cuántos clientes tiene cada país.
select Pais, count(*) from Clientes group by Pais;
+----------------+----------+
| Pais           | count(*) |
+----------------+----------+
| USA            |        4 |
| Spain          |        4 |
| España         |       23 |
| France         |        2 |
| Australia      |        2 |
| United Kingdom |        1 |
+----------------+----------+

8. Cuántos clientes tiene Madrid.

select count(*) from Clientes where Region='Madrid';
+----------+
| count(*) |
+----------+
|       20 |
+----------+
9. Cuántos clientes tienen las ciudades que empiezan por M.

select Region, count(NombreCliente) from Clientes where Region like 'M%' group by Region;
+--------+----------------------+
| Region | count(NombreCliente) |
+--------+----------------------+
| Miami  |                    1 |
| Madrid |                   20 |
+--------+----------------------+
10. Código de empleado y número de clientes al que atiende cada representante de ventas.

select CodigoEmpleadoRepVentas, count(CodigoEmpleadoRepVentas) from Clientes group by CodigoEmpleadoRepVentas;
+-------------------------+--------------------------------+
| CodigoEmpleadoRepVentas | count(CodigoEmpleadoRepVentas) |
+-------------------------+--------------------------------+
|                       5 |                              5 |
|                       8 |                              4 |
|                       9 |                              2 |
|                      11 |                              5 |
|                      12 |                              5 |
|                      16 |                              2 |
|                      18 |                              2 |
|                      19 |                              2 |
|                      22 |                              2 |
|                      30 |                              5 |
|                      31 |                              2 |
+-------------------------+--------------------------------+
11. Cuántos clientes no tienen asignado representante de ventas.

select count(*) from Clientes where CodigoEmpleadoRepVentas is  NULL;
+----------+
| count(*) |
+----------+
|        0 |
+----------+
12. Cuál han sido el primer y último pagos hechos por clientes.

select min(FechaPago) from Pagos;
+----------------+
| min(FechaPago) |
+----------------+
| 2006-01-18     |
+----------------+

select max(FechaPago) from Pagos;
+----------------+
| max(FechaPago) |
+----------------+
| 2009-03-26     |
+----------------+

13. Código de cliente de los que hicieron pagos en 2008.

select CodigoCliente from Pagos where FechaPago like '2008%';
+---------------+
| CodigoCliente |
+---------------+
|             1 |
|             1 |
|            13 |
|            14 |
|            26 |
+---------------+

select CodigoCliente from Pagos where FechaPago like '2008%' group by CodigoCliente;
+---------------+
| CodigoCliente |
+---------------+
|             1 |
|            13 |
|            14 |
|            26 |
+---------------+
-- (otra manera de hacerlo)
select CodigoCliente from Pagos where year(FechaPago)='2008' group by CodigoCliente;
+---------------+
| CodigoCliente |
+---------------+
|             1 |
|            13 |
|            14 |
|            26 |
+---------------+

14. Qué estados distintos puede tener un pedido.

select Estado from Pedidos group by Estado;
+-----------+
| Estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
| Pediente  |
+-----------+

15. El número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos _no_ entregados a tiempo.

select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEsperada<FechaEntrega;
+--------------+---------------+---------------+--------------+
| CodigoPedido | CodigoCliente | FechaEsperada | FechaEntrega |
+--------------+---------------+---------------+--------------+
|            9 |             1 | 2008-12-27    | 2008-12-28   |
|           13 |             7 | 2009-01-14    | 2009-01-15   |
|           16 |             7 | 2009-01-07    | 2009-01-15   |
|           17 |             7 | 2009-01-09    | 2009-01-11   |
|           18 |             9 | 2009-01-06    | 2009-01-07   |
|           22 |             9 | 2009-01-11    | 2009-01-13   |
|           28 |             3 | 2009-02-17    | 2009-02-20   |
|           31 |            13 | 2008-09-30    | 2008-10-04   |
|           32 |             4 | 2007-01-19    | 2007-01-27   |
|           38 |            19 | 2009-03-06    | 2009-03-07   |
|           39 |            19 | 2009-03-07    | 2009-03-09   |
|           40 |            19 | 2009-03-10    | 2009-03-13   |
|           42 |            19 | 2009-03-23    | 2009-03-27   |
|           43 |            23 | 2009-03-26    | 2009-03-28   |
|           44 |            23 | 2009-03-27    | 2009-03-30   |
|           45 |            23 | 2009-03-04    | 2009-03-07   |
|           46 |            23 | 2009-03-04    | 2009-03-05   |
|           49 |            26 | 2008-07-22    | 2008-07-23   |
|           55 |            14 | 2009-01-10    | 2009-01-11   |
|           60 |             1 | 2008-12-27    | 2008-12-28   |
|           68 |             3 | 2009-02-17    | 2009-02-20   |
|           92 |            27 | 2009-04-30    | 2009-05-03   |
|           96 |            35 | 2008-04-12    | 2008-04-13   |
|          103 |            30 | 2009-01-20    | 2009-01-24   |
|          106 |            30 | 2009-05-15    | 2009-05-20   |
|          112 |            36 | 2009-04-06    | 2009-05-07   |
|          113 |            36 | 2008-11-09    | 2009-01-09   |
|          114 |            36 | 2009-01-29    | 2009-01-31   |
|          115 |            36 | 2009-01-26    | 2009-02-27   |
|          123 |            30 | 2009-01-20    | 2009-01-24   |
|          126 |            30 | 2009-05-15    | 2009-05-20   |
|          128 |            38 | 2008-12-10    | 2008-12-29   |
+--------------+---------------+---------------+--------------+

16. Cuántos productos existen en cada línea de pedido.

select NumeroLinea, sum(Cantidad) from DetallePedidos group by NumeroLinea;
+-------------+---------------+
| NumeroLinea | sum(Cantidad) |
+-------------+---------------+
|           3 |          1415 |
|           1 |          2463 |
|           2 |          2634 |
|           4 |          1016 |
|           5 |           476 |
|           6 |           211 |
|           7 |            23 |
|           8 |            42 |
+-------------+---------------+

17. Listar los 20 códigos de productos más pedidos ordenados por cantidad pedida.

select CodigoProducto, Cantidad from DetallePedidos order by Cantidad Desc limit 0,20;
+----------------+----------+
| CodigoProducto | Cantidad |
+----------------+----------+
| AR-008         |      450 |
| FR-17          |      423 |
| AR-009         |      290 |
| AR-009         |      250 |
| AR-009         |      231 |
| OR-214         |      212 |
| FR-57          |      203 |
| AR-006         |      180 |
| AR-009         |      159 |
| OR-247         |      150 |
| OR-177         |      150 |
| 30310          |      143 |
| FR-29          |      120 |
| FR-48          |      120 |
| OR-157         |      113 |
| AR-002         |      110 |
| OR-139         |       80 |
| OR-247         |       80 |
| FR-106         |       80 |
| AR-001         |       80 |
+----------------+----------+

18. Número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha requerida.

select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEntrega<=FechaEsperada-2;
+--------------+---------------+---------------+--------------+
| CodigoPedido | CodigoCliente | FechaEsperada | FechaEntrega |
+--------------+---------------+---------------+--------------+
|            2 |             5 | 2007-10-28    | 2007-10-26   |
|           24 |            14 | 2008-07-31    | 2008-07-25   |
|           30 |            13 | 2008-09-03    | 2008-08-31   |
|           36 |            14 | 2008-12-15    | 2008-12-10   |
|           53 |            13 | 2008-11-15    | 2008-11-09   |
|           89 |            35 | 2007-12-13    | 2007-12-10   |
|           91 |            27 | 2009-03-29    | 2009-03-27   |
|           93 |            27 | 2009-05-30    | 2009-05-17   |
+--------------+---------------+---------------+--------------+




-- (10/10/19)

1. Listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas

select Clientes.NombreCliente, Empleados.Nombre, Empleados.Apellido1 from Clientes inner join Empleados on Clientes.CodigoEmpleadoRepVentas = Empleados. CodigoEmpleado;
+--------------------------------+-----------------+------------+
| NombreCliente                  | Nombre          | Apellido1  |
+--------------------------------+-----------------+------------+
| DGPRODUCTIONS GARDEN           | Walter Santiago | Sanchez    |
| Gardening Associates           | Walter Santiago | Sanchez    |
| Gerudo Valley                  | Lorena          | Paxton     |
| Tendo Garden                   | Lorena          | Paxton     |
| Lasas S.A.                     | Mariano         | López      |
| Beragua                        | Emmanuel        | Magaña     |
| Club Golf Puerta del hierro    | Emmanuel        | Magaña     |
| Naturagua                      | Emmanuel        | Magaña     |
| DaraDistribuciones             | Emmanuel        | Magaña     |
| Madrileña de riegos            | Emmanuel        | Magaña     |
| Lasas S.A.                     | Mariano         | López      |
| Camunas Jardines S.L.          | Mariano         | López      |
| Dardena S.A.                   | Mariano         | López      |
| Jardin de Flores               | Julian          | Bellinelli |
| Flores Marivi                  | Felipe          | Rosas      |
| Flowers, S.A                   | Felipe          | Rosas      |
| Naturajardin                   | Julian          | Bellinelli |
| Golf S.A.                      | José Manuel     | Martinez   |
| AYMERICH GOLF MANAGEMENT, SL   | José Manuel     | Martinez   |
| Aloha                          | José Manuel     | Martinez   |
| El Prat                        | José Manuel     | Martinez   |
| Sotogrande                     | José Manuel     | Martinez   |
| Vivero Humanes                 | Julian          | Bellinelli |
| Fuenla City                    | Felipe          | Rosas      |
| Jardines y Mansiones CACTUS SL | Lucio           | Campoamor  |
| Jardinerías Matías SL          | Lucio           | Campoamor  |
| Agrojardin                     | Julian          | Bellinelli |
| Top Campo                      | Felipe          | Rosas      |
| Jardineria Sara                | Felipe          | Rosas      |
| Campohermoso                   | Julian          | Bellinelli |
| france telecom                 | Lionel          | Narvaez    |
| Musée du Louvre                | Lionel          | Narvaez    |
| Tutifruti S.A                  | Mariko          | Kishi      |
| FLORES S.L.                    | Michael         | Bolton     |
| THE MAGIC GARDEN               | Michael         | Bolton     |
| El Jardin Viviente S.L         | Mariko          | Kishi      |
+--------------------------------+-----------------+------------+

2. Nombre de los clientes que no hayan realizado pagos junto con el nombre de su representante de ventas

SELECT 
    Clientes.NombreCliente,
    Empleados.Nombre,
    Empleados.Apellido1
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
        LEFT JOIN
    Pagos ON Clientes.CodigoCliente = Pagos.CodigoCliente
WHERE
    Pagos.CodigoCliente IS NULL;

#3. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Mostrar nombre, unidades vendidas, total facturado y total facturado con Impuestos (IVA 21%)

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    Productos.Nombre,
    Productos.CodigoProducto,
    SUM(DetallePedidos.Cantidad) as 'cantidad',
    SUM(DetallePedidos.Cantidad) * DetallePedidos.PrecioUnidad AS 'bruto',
    SUM(DetallePedidos.Cantidad) * DetallePedidos.PrecioUnidad * 1.21 as 'IVA incluido'
FROM
    Productos
        INNER JOIN
    DetallePedidos ON DetallePedidos.CodigoProducto = Productos.CodigoProducto
    group by DetallePedidos.CodigoProducto
HAVING bruto > 3000
order by 4 desc;

#4. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada

SELECT 
    Oficinas.LineaDireccion1
FROM
    Oficinas
        INNER JOIN
    Empleados ON Oficinas.CodigoOficina = Empleados.CodigoOficina
		INNER JOIN Clientes ON Empleados.CodigoEmpleado=Clientes.CodigoEmpleadoRepVentas
WHERE
    Clientes.Ciudad = 'Fuenlabrada';

-- ()
select E.CodigoEmpleado, E.Nombre, E.Apellido1, E.Apellido2, E.CodigoJefe, J.Nombre, J.Apellido1, J.Apellido2 from Empleados E inner join Empleados J on J.CodigoEmpleado=E.CodigoJefe;
+----------------+-----------------+------------+-----------+------------+----------+------------+-----------+
| CodigoEmpleado | Nombre          | Apellido1  | Apellido2 | CodigoJefe | Nombre   | Apellido1  | Apellido2 |
+----------------+-----------------+------------+-----------+------------+----------+------------+-----------+
|              2 | Ruben           | López      | Martinez  |          1 | Marcos   | Magaña     | Perez     |
|              3 | Alberto         | Soria      | Carrasco  |          2 | Ruben    | López      | Martinez  |
|              4 | Maria           | Solís      | Jerez     |          2 | Ruben    | López      | Martinez  |
|              5 | Felipe          | Rosas      | Marquez   |          3 | Alberto  | Soria      | Carrasco  |
|              6 | Juan Carlos     | Ortiz      | Serrano   |          3 | Alberto  | Soria      | Carrasco  |
|              7 | Carlos          | Soria      | Jimenez   |          3 | Alberto  | Soria      | Carrasco  |
|              8 | Mariano         | López      | Murcia    |          7 | Carlos   | Soria      | Jimenez   |
|              9 | Lucio           | Campoamor  | Martín    |          7 | Carlos   | Soria      | Jimenez   |
|             10 | Hilario         | Rodriguez  | Huertas   |          7 | Carlos   | Soria      | Jimenez   |
|             11 | Emmanuel        | Magaña     | Perez     |          3 | Alberto  | Soria      | Carrasco  |
|             12 | José Manuel     | Martinez   | De la Osa |         11 | Emmanuel | Magaña     | Perez     |
|             13 | David           | Palma      | Aceituno  |         11 | Emmanuel | Magaña     | Perez     |
|             14 | Oscar           | Palma      | Aceituno  |         11 | Emmanuel | Magaña     | Perez     |
|             15 | Francois        | Fignon     |           |          3 | Alberto  | Soria      | Carrasco  |
|             16 | Lionel          | Narvaez    |           |         15 | Francois | Fignon     |           |
|             17 | Laurent         | Serra      |           |         15 | Francois | Fignon     |           |
|             18 | Michael         | Bolton     |           |          3 | Alberto  | Soria      | Carrasco  |
|             19 | Walter Santiago | Sanchez    | Lopez     |         18 | Michael  | Bolton     |           |
|             20 | Hilary          | Washington |           |          3 | Alberto  | Soria      | Carrasco  |
|             21 | Marcus          | Paxton     |           |         20 | Hilary   | Washington |           |
|             22 | Lorena          | Paxton     |           |         20 | Hilary   | Washington |           |
|             23 | Nei             | Nishikori  |           |          3 | Alberto  | Soria      | Carrasco  |
|             24 | Narumi          | Riko       |           |         23 | Nei      | Nishikori  |           |
|             25 | Takuma          | Nomura     |           |         23 | Nei      | Nishikori  |           |
|             26 | Amy             | Johnson    |           |          3 | Alberto  | Soria      | Carrasco  |
|             27 | Larry           | Westfalls  |           |         26 | Amy      | Johnson    |           |
|             28 | John            | Walton     |           |         26 | Amy      | Johnson    |           |
|             29 | Kevin           | Fallmer    |           |          3 | Alberto  | Soria      | Carrasco  |
|             30 | Julian          | Bellinelli |           |         29 | Kevin    | Fallmer    |           |
|             31 | Mariko          | Kishi      |           |         29 | Kevin    | Fallmer    |           |
+----------------+-----------------+------------+-----------+------------+----------+------------+-----------+




-- (funciones de fecha y hora)

select CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2019-01-16 |
+------------+

select CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 20:10:59  |
+-----------+

select NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2019-01-16 20:11:09 |
+---------------------+




-- (repaso 22/01)

1. Listado de clientes indicando nombre del cliente y cuántos pedidos ha efectuado.
-- (creamos una vista para hacerlo más sencillo)

create view ejer1 as select Clientes.NombreCliente, Pedidos.CodigoCliente from Clientes, Pedidos where Pedidos.CodigoCliente=Clientes.CodigoCliente;

select count(*), NombreCliente from ejer1 group by CodigoCliente; 
+----------+--------------------------------+
| count(*) | NombreCliente                  |
+----------+--------------------------------+
|       11 | DGPRODUCTIONS GARDEN           |
|        9 | Gardening Associates           |
|        5 | Gerudo Valley                  |
|        5 | Tendo Garden                   |
|        5 | Beragua                        |
|        5 | Naturagua                      |
|        5 | Camunas Jardines S.L.          |
|        5 | Dardena S.A.                   |
|        5 | Jardin de Flores               |
|       10 | Flores Marivi                  |
|        5 | Golf S.A.                      |
|        5 | Sotogrande                     |
|        5 | Jardines y Mansiones CACTUS SL |
|        5 | Jardinerías Matías SL          |
|        5 | Agrojardin                     |
|       10 | Jardineria Sara                |
|        5 | Tutifruti S.A                  |
|        5 | FLORES S.L.                    |
|        5 | El Jardin Viviente S.L         |
+----------+--------------------------------+

2. Listado con los nombres de los clientes y el total pagado por cada uno de ellos.

select Clientes.NombreCliente, sum(DetallePedidos.Cantidad) * DetallePedidos.PrecioUnidad as 'Gasto' from Pedidos inner join Clientes on Clientes.CodigoCliente=Pedidos.CodigoCliente inner join DetallePedidos on DetallePedidos.CodigoPedido=Pedidos.CodigoPedido group by Clientes.NombreCliente, DetallePedidos.PrecioUnidad;
+--------------------------------+----------+
| NombreCliente                  | Gasto    |
+--------------------------------+----------+
| DGPRODUCTIONS GARDEN           |    33.00 |
| DGPRODUCTIONS GARDEN           |    32.00 |
| DGPRODUCTIONS GARDEN           |  1000.00 |
| DGPRODUCTIONS GARDEN           |  1000.00 |
| DGPRODUCTIONS GARDEN           |  1280.00 |
| DGPRODUCTIONS GARDEN           |  1365.00 |
| DGPRODUCTIONS GARDEN           |  1035.00 |
| DGPRODUCTIONS GARDEN           |   420.00 |
| Gardening Associates           |   350.00 |
| Gardening Associates           |  2250.00 |
| Gardening Associates           |   320.00 |
| Gardening Associates           |   675.00 |
| Gardening Associates           |   504.00 |
| Gardening Associates           |   792.00 |
| Gardening Associates           |   798.00 |
| Gardening Associates           |   462.00 |
| Gardening Associates           |  1170.00 |
| Gardening Associates           |   320.00 |
| Gardening Associates           |  3285.00 |
| Gerudo Valley                  |   182.00 |
| Gerudo Valley                  |    75.00 |
| Gerudo Valley                  |  2900.00 |
| Gerudo Valley                  |   100.00 |
| Gerudo Valley                  |   846.00 |
| Gerudo Valley                  |  3024.00 |
| Gerudo Valley                  |  3610.00 |
| Gerudo Valley                  | 69300.00 |
| Gerudo Valley                  |   392.00 |
| Gerudo Valley                  |   348.00 |
| Gerudo Valley                  |   792.00 |
| Gerudo Valley                  |   280.00 |
| Tendo Garden                   |   980.00 |
| Tendo Garden                   |   460.00 |
| Tendo Garden                   |   285.00 |
| Tendo Garden                   |   322.00 |
| Tendo Garden                   |    87.00 |
| Tendo Garden                   |   488.00 |
| Tendo Garden                   |   465.00 |
| Tendo Garden                   |   114.00 |
| Tendo Garden                   |  4288.00 |
| Tendo Garden                   |  2310.00 |
| Tendo Garden                   |  1611.00 |
| Tendo Garden                   |  7980.00 |
| Tendo Garden                   |   975.00 |
| Tendo Garden                   |   600.00 |
| Tendo Garden                   |   380.00 |
| Tendo Garden                   |  1239.00 |
| Tendo Garden                   |   110.00 |
| Tendo Garden                   |  1100.00 |
| Beragua                        |   308.00 |
| Beragua                        |   500.00 |
| Beragua                        |    88.00 |
| Beragua                        |   741.00 |
| Beragua                        |    52.00 |
| Beragua                        |    12.00 |
| Beragua                        |   150.00 |
| Beragua                        |   204.00 |
| Beragua                        |   135.00 |
| Beragua                        |   110.00 |
| Beragua                        |    90.00 |
| Naturagua                      |   252.00 |
| Naturagua                      |   176.00 |
| Naturagua                      |    66.00 |
| Naturagua                      |    72.00 |
| Naturagua                      |    32.00 |
| Naturagua                      |    65.00 |
| Naturagua                      |   266.00 |
| Camunas Jardines S.L.          |    10.00 |
| Camunas Jardines S.L.          |    64.00 |
| Camunas Jardines S.L.          |    38.00 |
| Camunas Jardines S.L.          |   124.00 |
| Camunas Jardines S.L.          |   450.00 |
| Camunas Jardines S.L.          |    25.00 |
| Camunas Jardines S.L.          |    50.00 |
| Camunas Jardines S.L.          |    20.00 |
| Camunas Jardines S.L.          |   174.00 |
| Camunas Jardines S.L.          |    49.00 |
| Camunas Jardines S.L.          |    70.00 |
| Camunas Jardines S.L.          |    22.00 |
| Camunas Jardines S.L.          |   115.00 |
| Camunas Jardines S.L.          |   180.00 |
| Camunas Jardines S.L.          |     6.00 |
| Camunas Jardines S.L.          |    60.00 |
| Camunas Jardines S.L.          |    16.00 |
| Camunas Jardines S.L.          |   546.00 |
| Camunas Jardines S.L.          |   147.00 |
| Camunas Jardines S.L.          |    26.00 |
| Camunas Jardines S.L.          |    54.00 |
| Dardena S.A.                   |    45.00 |
| Dardena S.A.                   |   217.00 |
| Dardena S.A.                   |   200.00 |
| Dardena S.A.                   |   280.00 |
| Dardena S.A.                   |   112.00 |
| Dardena S.A.                   |   620.00 |
| Dardena S.A.                   |   222.00 |
| Dardena S.A.                   |    90.00 |
| Dardena S.A.                   |    60.00 |
| Dardena S.A.                   |   195.00 |
| Dardena S.A.                   |    42.00 |
| Dardena S.A.                   |   470.00 |
| Dardena S.A.                   |    20.00 |
| Dardena S.A.                   |    66.00 |
| Dardena S.A.                   |    15.00 |
| Dardena S.A.                   |   532.00 |
| Dardena S.A.                   |   512.00 |
| Dardena S.A.                   |   462.00 |
| Jardin de Flores               |  4970.00 |
| Jardin de Flores               |  2176.00 |
| Jardin de Flores               |   536.00 |
| Jardin de Flores               |   310.00 |
| Jardin de Flores               |  1936.00 |
| Jardin de Flores               |  1130.00 |
| Jardin de Flores               |   315.00 |
| Jardin de Flores               |   588.00 |
| Jardin de Flores               |   120.00 |
| Flores Marivi                  |   150.00 |
| Flores Marivi                  |  1920.00 |
| Flores Marivi                  |   440.00 |
| Flores Marivi                  |   360.00 |
| Flores Marivi                  |   209.00 |
| Flores Marivi                  |   660.00 |
| Flores Marivi                  |   424.00 |
| Flores Marivi                  |   236.00 |
| Golf S.A.                      |    98.00 |
| Golf S.A.                      |   108.00 |
| Golf S.A.                      |    26.00 |
| Sotogrande                     |    24.00 |
| Sotogrande                     |    84.00 |
| Sotogrande                     |    99.00 |
| Sotogrande                     |    65.00 |
| Jardines y Mansiones CACTUS SL |    18.00 |
| Jardines y Mansiones CACTUS SL |    25.00 |
| Jardines y Mansiones CACTUS SL |  6016.00 |
| Jardines y Mansiones CACTUS SL |  2205.00 |
| Jardines y Mansiones CACTUS SL |   950.00 |
| Jardines y Mansiones CACTUS SL |  1220.00 |
| Jardines y Mansiones CACTUS SL |    25.00 |
| Jardines y Mansiones CACTUS SL |   570.00 |
| Jardines y Mansiones CACTUS SL |  3120.00 |
| Jardines y Mansiones CACTUS SL |  4130.00 |
| Jardinerías Matías SL          |    41.00 |
| Jardinerías Matías SL          |  1133.00 |
| Jardinerías Matías SL          |   182.00 |
| Jardinerías Matías SL          |   630.00 |
| Jardinerías Matías SL          |   276.00 |
| Jardinerías Matías SL          |  5300.00 |
| Jardinerías Matías SL          |   630.00 |
| Jardinerías Matías SL          |   225.00 |
| Jardinerías Matías SL          |    96.00 |
| Jardinerías Matías SL          |   168.00 |
| Jardinerías Matías SL          |  2291.00 |
| Agrojardin                     |   300.00 |
| Agrojardin                     |  4000.00 |
| Agrojardin                     |   423.00 |
| Agrojardin                     |  1350.00 |
| Agrojardin                     |   240.00 |
| Agrojardin                     |  2176.00 |
| Jardineria Sara                |    96.00 |
| Jardineria Sara                |   208.00 |
| Jardineria Sara                |   630.00 |
| Jardineria Sara                |  1130.00 |
| Jardineria Sara                |  1344.00 |
| Jardineria Sara                |   162.00 |
| Jardineria Sara                |   231.00 |
| Jardineria Sara                |   846.00 |
| Jardineria Sara                |  1716.00 |
| Jardineria Sara                |  1500.00 |
| Tutifruti S.A                  |   544.00 |
| Tutifruti S.A                  |   280.00 |
| Tutifruti S.A                  |   480.00 |
| Tutifruti S.A                  |   245.00 |
| Tutifruti S.A                  |   308.00 |
| Tutifruti S.A                  |   180.00 |
| Tutifruti S.A                  |  1050.00 |
| Tutifruti S.A                  |   126.00 |
| Tutifruti S.A                  |   108.00 |
| El Jardin Viviente S.L         |   140.00 |
| El Jardin Viviente S.L         |   108.00 |
| El Jardin Viviente S.L         |   216.00 |
| El Jardin Viviente S.L         |   200.00 |
| El Jardin Viviente S.L         |    65.00 |
| El Jardin Viviente S.L         |    36.00 |
| El Jardin Viviente S.L         |    71.00 |
| El Jardin Viviente S.L         |    98.00 |
| El Jardin Viviente S.L         |    45.00 |
| El Jardin Viviente S.L         |    70.00 |
| El Jardin Viviente S.L         |    30.00 |
| El Jardin Viviente S.L         |    32.00 |
| El Jardin Viviente S.L         |    24.00 |
| El Jardin Viviente S.L         |    36.00 |
+--------------------------------+----------+

-- (como no nos agrupa por nombre de cliente probamos de otra manera)
create view ejer22 as select Clientes.NombreCliente, sum(DetallePedidos.Cantidad) * DetallePedidos.PrecioUnidad as 'Gasto' from Pedidos inner join Clientes on Clientes.CodigoCliente=Pedidos.CodigoCliente inner join DetallePedidos on DetallePedidos.CodigoPedido=Pedidos.CodigoPedido group by Clientes.NombreCliente, DetallePedidos.PrecioUnidad;

select NombreCliente, sum(Gasto) from ejer22 group by NombreCliente;
+--------------------------------+------------+
| NombreCliente                  | sum(Gasto) |
+--------------------------------+------------+
| DGPRODUCTIONS GARDEN           |    6165.00 |
| Gardening Associates           |   10926.00 |
| Gerudo Valley                  |   81849.00 |
| Tendo Garden                   |   23794.00 |
| Beragua                        |    2390.00 |
| Naturagua                      |     929.00 |
| Camunas Jardines S.L.          |    2246.00 |
| Dardena S.A.                   |    4160.00 |
| Jardin de Flores               |   12081.00 |
| Flores Marivi                  |    4399.00 |
| Golf S.A.                      |     232.00 |
| Sotogrande                     |     272.00 |
| Jardines y Mansiones CACTUS SL |   18279.00 |
| Jardinerías Matías SL          |   10972.00 |
| Agrojardin                     |    8489.00 |
| Jardineria Sara                |    7863.00 |
| Tutifruti S.A                  |    3321.00 |
| El Jardin Viviente S.L         |    1171.00 |
+--------------------------------+------------+

3. El nombre de los clientes que hayan hecho pedidos en 2009.

select Clientes.NombreCliente from Clientes inner join Pedidos on Clientes.CodigoCliente=Pedidos.CodigoCliente where Pedidos.FechaPedido like '2008%' group by Clientes.NombreCliente;
+--------------------------------+
| NombreCliente                  |
+--------------------------------+
| Tendo Garden                   |
| DGPRODUCTIONS GARDEN           |
| Dardena S.A.                   |
| Camunas Jardines S.L.          |
| Gerudo Valley                  |
| Jardines y Mansiones CACTUS SL |
| Jardin de Flores               |
| Tutifruti S.A                  |
| Flores Marivi                  |
| FLORES S.L.                    |
| El Jardin Viviente S.L         |
+--------------------------------+

4. El nombre del cliente y el nombre y apellido de sus representantes de los clientes de Madrid.

select Clientes.NombreCliente, Empleados.Nombre, Empleados.Apellido1 from Clientes inner join Empleados on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado where Clientes.Ciudad='Madrid';;
+--------------------------------+----------+------------+
| NombreCliente                  | Nombre   | Apellido1  |
+--------------------------------+----------+------------+
| Beragua                        | Emmanuel | Magaña     |
| Club Golf Puerta del hierro    | Emmanuel | Magaña     |
| Naturagua                      | Emmanuel | Magaña     |
| DaraDistribuciones             | Emmanuel | Magaña     |
| Madrileña de riegos            | Emmanuel | Magaña     |
| Dardena S.A.                   | Mariano  | López      |
| Jardin de Flores               | Julian   | Bellinelli |
| Naturajardin                   | Julian   | Bellinelli |
| Jardines y Mansiones CACTUS SL | Lucio    | Campoamor  |
| Jardinerías Matías SL          | Lucio    | Campoamor  |
| FLORES S.L.                    | Michael  | Bolton     |
+--------------------------------+----------+------------+

5. Un listado de clientes con el nombre de su representante y la ciudad donde está su oficina.

select Clientes.NombreCliente, Empleados.Nombre, Oficinas.Ciudad from Clientes inner join Empleados on Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado inner join Oficinas on Empleados.CodigoOficina=Oficinas.CodigoOficina; 
+--------------------------------+-----------------+----------------------+
| NombreCliente                  | Nombre          | Ciudad               |
+--------------------------------+-----------------+----------------------+
| Beragua                        | Emmanuel        | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel        | Barcelona            |
| Naturagua                      | Emmanuel        | Barcelona            |
| DaraDistribuciones             | Emmanuel        | Barcelona            |
| Madrileña de riegos            | Emmanuel        | Barcelona            |
| Golf S.A.                      | José Manuel     | Barcelona            |
| AYMERICH GOLF MANAGEMENT, SL   | José Manuel     | Barcelona            |
| Aloha                          | José Manuel     | Barcelona            |
| El Prat                        | José Manuel     | Barcelona            |
| Sotogrande                     | José Manuel     | Barcelona            |
| Gerudo Valley                  | Lorena          | Boston               |
| Tendo Garden                   | Lorena          | Boston               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Camunas Jardines S.L.          | Mariano         | Madrid               |
| Dardena S.A.                   | Mariano         | Madrid               |
| Jardines y Mansiones CACTUS SL | Lucio           | Madrid               |
| Jardinerías Matías SL          | Lucio           | Madrid               |
| france telecom                 | Lionel          | Paris                |
| Musée du Louvre                | Lionel          | Paris                |
| FLORES S.L.                    | Michael         | San Francisco        |
| THE MAGIC GARDEN               | Michael         | San Francisco        |
| DGPRODUCTIONS GARDEN           | Walter Santiago | San Francisco        |
| Gardening Associates           | Walter Santiago | San Francisco        |
| Jardin de Flores               | Julian          | Sydney               |
| Naturajardin                   | Julian          | Sydney               |
| Vivero Humanes                 | Julian          | Sydney               |
| Agrojardin                     | Julian          | Sydney               |
| Campohermoso                   | Julian          | Sydney               |
| Tutifruti S.A                  | Mariko          | Sydney               |
| El Jardin Viviente S.L         | Mariko          | Sydney               |
| Flores Marivi                  | Felipe          | Talavera de la Reina |
| Flowers, S.A                   | Felipe          | Talavera de la Reina |
| Fuenla City                    | Felipe          | Talavera de la Reina |
| Top Campo                      | Felipe          | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Talavera de la Reina |
+--------------------------------+-----------------+----------------------+

6. Nombre, apellidos, oficina y cargo de los empleados que no son reprentantes de ventas.

select Empleados.Nombre, Empleados.Apellido1, Empleados.Puesto, Oficinas.Ciudad from Empleados inner join Oficinas on Empleados.CodigoOficina=Oficinas.CodigoOficina where Empleados.Puesto <> 'Representante Ventas';
+----------+------------+-----------------------+----------------------+
| Nombre   | Apellido1  | Puesto                | Ciudad               |
+----------+------------+-----------------------+----------------------+
| Emmanuel | Magaña     | Director Oficina      | Barcelona            |
| Hilary   | Washington | Director Oficina      | Boston               |
| Amy      | Johnson    | Director Oficina      | Londres              |
| Carlos   | Soria      | Director Oficina      | Madrid               |
| Francois | Fignon     | Director Oficina      | Paris                |
| Michael  | Bolton     | Director Oficina      | San Francisco        |
| Kevin    | Fallmer    | Director Oficina      | Sydney               |
| Marcos   | Magaña     | Director General      | Talavera de la Reina |
| Ruben    | López      | Subdirector Marketing | Talavera de la Reina |
| Alberto  | Soria      | Subdirector Ventas    | Talavera de la Reina |
| Maria    | Solís      | Secretaria            | Talavera de la Reina |
| Nei      | Nishikori  | Director Oficina      | Tokyo                |
+----------+------------+-----------------------+----------------------+

7. Número de empleados de cada oficina y ciudad donde está situada.

select Oficinas.CodigoOficina, Oficinas.Ciudad, count(Empleados.CodigoEmpleado) from Oficinas inner join Empleados on Oficinas.CodigoOficina=Empleados.CodigoOficina group by CodigoOficina;
+---------------+----------------------+---------------------------------+
| CodigoOficina | Ciudad               | count(Empleados.CodigoEmpleado) |
+---------------+----------------------+---------------------------------+
| BCN-ES        | Barcelona            |                               4 |
| BOS-USA       | Boston               |                               3 |
| LON-UK        | Londres              |                               3 |
| MAD-ES        | Madrid               |                               4 |
| PAR-FR        | Paris                |                               3 |
| SFC-USA       | San Francisco        |                               2 |
| SYD-AU        | Sydney               |                               3 |
| TAL-ES        | Talavera de la Reina |                               6 |
| TOK-JP        | Tokyo                |                               3 |
+---------------+----------------------+---------------------------------+

8. Listado con el nombre de los empleados y el nombre de sus jefes.
9. Media de unidades en stock de los productos agrupados por gama de producto.
10. Clientes que residen en ciudades donde hay oficina, indicando dirección de la oficina.
11. Clientes que residen en ciudades donde no hay oficina, indicando la ciudad en la que viven
12. Número de clientes asignados a cada representante de ventas.
13. Listado con el precio total de cada pedido.
14. Clientes que hayan hecho pedidos en 2008 por importe superior a 2000 euros.
15. Cuántos pedidos tiene cada cliente en cada estado.
16. Los clientes que hayan pedido más de 200 unidades de cualquier producto.
17. Cliente que hizo el pedido de mayor cuantía e importe.
18. Cliente que hizo el pedido de menor cuantía e importe.

