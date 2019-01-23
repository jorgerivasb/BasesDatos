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

CREATE VIEW ejer1 AS
    SELECT 
        Clientes.NombreCliente, Pedidos.CodigoCliente
    FROM
        Clientes,
        Pedidos
    WHERE
        Pedidos.CodigoCliente = Clientes.CodigoCliente;

-- ()
SELECT 
    COUNT(*), NombreCliente
FROM
    ejer1
GROUP BY CodigoCliente; 
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

SELECT 
    Clientes.NombreCliente,
    SUM(DetallePedidos.Cantidad) * DetallePedidos.PrecioUnidad AS 'Gasto'
FROM
    Pedidos
        INNER JOIN
    Clientes ON Clientes.CodigoCliente = Pedidos.CodigoCliente
        INNER JOIN
    DetallePedidos ON DetallePedidos.CodigoPedido = Pedidos.CodigoPedido
GROUP BY Clientes.NombreCliente , DetallePedidos.PrecioUnidad;
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
CREATE VIEW ejer22 AS
    SELECT 
        Clientes.NombreCliente,
        SUM(DetallePedidos.Cantidad) * DetallePedidos.PrecioUnidad AS 'Gasto'
    FROM
        Pedidos
            INNER JOIN
        Clientes ON Clientes.CodigoCliente = Pedidos.CodigoCliente
            INNER JOIN
        DetallePedidos ON DetallePedidos.CodigoPedido = Pedidos.CodigoPedido
    GROUP BY Clientes.NombreCliente , DetallePedidos.PrecioUnidad;
    
-- ()
SELECT 
    NombreCliente, SUM(Gasto)
FROM
    ejer22
GROUP BY NombreCliente;
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

SELECT 
    Clientes.NombreCliente
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
WHERE
    Pedidos.FechaPedido LIKE '2008%'
GROUP BY Clientes.NombreCliente;
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

SELECT 
    Clientes.NombreCliente,
    Empleados.Nombre,
    Empleados.Apellido1
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
WHERE
    Clientes.Ciudad = 'Madrid';
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

SELECT 
    Clientes.NombreCliente, Empleados.Nombre, Oficinas.Ciudad
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
        INNER JOIN
    Oficinas ON Empleados.CodigoOficina = Oficinas.CodigoOficina; 
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

SELECT 
    Empleados.Nombre,
    Empleados.Apellido1,
    Empleados.Puesto,
    Oficinas.Ciudad
FROM
    Empleados
        INNER JOIN
    Oficinas ON Empleados.CodigoOficina = Oficinas.CodigoOficina
WHERE
    Empleados.Puesto <> 'Representante Ventas';
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

SELECT 
    Oficinas.CodigoOficina,
    Oficinas.Ciudad,
    COUNT(Empleados.CodigoEmpleado)
FROM
    Oficinas
        INNER JOIN
    Empleados ON Oficinas.CodigoOficina = Empleados.CodigoOficina
GROUP BY CodigoOficina;
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

SELECT 
    E.Nombre AS 'Nombre empleado',
    E.Apellido1,
    E.Apellido2,
    J.Nombre AS 'Nombre Jefe',
    J.Apellido1,
    J.Apellido2
FROM
    Empleados E
        INNER JOIN
    Empleados J ON J.CodigoEmpleado = E.CodigoJefe;
+-----------------+------------+-----------+-------------+------------+-----------+
| Nombre empleado | Apellido1  | Apellido2 | Nombre Jefe | Apellido1  | Apellido2 |
+-----------------+------------+-----------+-------------+------------+-----------+
| Ruben           | López      | Martinez  | Marcos      | Magaña     | Perez     |
| Alberto         | Soria      | Carrasco  | Ruben       | López      | Martinez  |
| Maria           | Solís      | Jerez     | Ruben       | López      | Martinez  |
| Felipe          | Rosas      | Marquez   | Alberto     | Soria      | Carrasco  |
| Juan Carlos     | Ortiz      | Serrano   | Alberto     | Soria      | Carrasco  |
| Carlos          | Soria      | Jimenez   | Alberto     | Soria      | Carrasco  |
| Mariano         | López      | Murcia    | Carlos      | Soria      | Jimenez   |
| Lucio           | Campoamor  | Martín    | Carlos      | Soria      | Jimenez   |
| Hilario         | Rodriguez  | Huertas   | Carlos      | Soria      | Jimenez   |
| Emmanuel        | Magaña     | Perez     | Alberto     | Soria      | Carrasco  |
| José Manuel     | Martinez   | De la Osa | Emmanuel    | Magaña     | Perez     |
| David           | Palma      | Aceituno  | Emmanuel    | Magaña     | Perez     |
| Oscar           | Palma      | Aceituno  | Emmanuel    | Magaña     | Perez     |
| Francois        | Fignon     |           | Alberto     | Soria      | Carrasco  |
| Lionel          | Narvaez    |           | Francois    | Fignon     |           |
| Laurent         | Serra      |           | Francois    | Fignon     |           |
| Michael         | Bolton     |           | Alberto     | Soria      | Carrasco  |
| Walter Santiago | Sanchez    | Lopez     | Michael     | Bolton     |           |
| Hilary          | Washington |           | Alberto     | Soria      | Carrasco  |
| Marcus          | Paxton     |           | Hilary      | Washington |           |
| Lorena          | Paxton     |           | Hilary      | Washington |           |
| Nei             | Nishikori  |           | Alberto     | Soria      | Carrasco  |
| Narumi          | Riko       |           | Nei         | Nishikori  |           |
| Takuma          | Nomura     |           | Nei         | Nishikori  |           |
| Amy             | Johnson    |           | Alberto     | Soria      | Carrasco  |
| Larry           | Westfalls  |           | Amy         | Johnson    |           |
| John            | Walton     |           | Amy         | Johnson    |           |
| Kevin           | Fallmer    |           | Alberto     | Soria      | Carrasco  |
| Julian          | Bellinelli |           | Kevin       | Fallmer    |           |
| Mariko          | Kishi      |           | Kevin       | Fallmer    |           |
+-----------------+------------+-----------+-------------+------------+-----------+

9. Media de unidades en stock de los productos agrupados por gama de producto.

select Gama, sum(CantidadEnStock) from Productos group by Gama;
+--------------+----------------------+
| Gama         | sum(CantidadEnStock) |
+--------------+----------------------+
| Aromáticas   |                 1400 |
| Frutales     |                19670 |
| Herramientas |                   60 |
| Ornamentales |                12617 |
+--------------+----------------------+

10. Clientes que residen en ciudades donde hay oficina, indicando dirección de la oficina.

SELECT 
    Clientes.NombreCliente,
    Clientes.Ciudad,
    Oficinas.CodigoOficina,
    Oficinas.Ciudad,
    Oficinas.LineaDireccion1
FROM
    Clientes
        INNER JOIN
    Oficinas ON Clientes.Ciudad = Oficinas.Ciudad;
+--------------------------------+---------------+---------------+---------------+------------------------------+
| NombreCliente                  | Ciudad        | CodigoOficina | Ciudad        | LineaDireccion1              |
+--------------------------------+---------------+---------------+---------------+------------------------------+
| DGPRODUCTIONS GARDEN           | San Francisco | SFC-USA       | San Francisco | 100 Market Street            |
| Beragua                        | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Club Golf Puerta del hierro    | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Naturagua                      | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| DaraDistribuciones             | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Madrileña de riegos            | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Dardena S.A.                   | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Jardin de Flores               | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Naturajardin                   | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| AYMERICH GOLF MANAGEMENT, SL   | Barcelona     | BCN-ES        | Barcelona     | Avenida Diagonal, 38         |
| Jardines y Mansiones CACTUS SL | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Jardinerías Matías SL          | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| france telecom                 | Paris         | PAR-FR        | Paris         | 29 Rue Jouffroy d'abbans     |
| Musée du Louvre                | Paris         | PAR-FR        | Paris         | 29 Rue Jouffroy d'abbans     |
| Tutifruti S.A                  | Sydney        | SYD-AU        | Sydney        | 5-11 Wentworth Avenue        |
| FLORES S.L.                    | Madrid        | MAD-ES        | Madrid        | Bulevar Indalecio Prieto, 32 |
| El Jardin Viviente S.L         | Sydney        | SYD-AU        | Sydney        | 5-11 Wentworth Avenue        |
+--------------------------------+---------------+---------------+---------------+------------------------------+

11. Clientes que residen en ciudades donde no hay oficina, indicando la ciudad en la que viven

 select Clientes.NombreCliente, Clientes.Ciudad from Clientes left join Oficinas on Clientes.Ciudad=Oficinas.Ciudad where Oficinas.Ciudad is NULL;
+-----------------------+--------------------------+
| NombreCliente         | Ciudad                   |
+-----------------------+--------------------------+
| Gardening Associates  | Miami                    |
| Gerudo Valley         | New York                 |
| Tendo Garden          | Miami                    |
| Lasas S.A.            | Fuenlabrada              |
| Lasas S.A.            | Fuenlabrada              |
| Camunas Jardines S.L. | San Lorenzo del Escorial |
| Flores Marivi         | Fuenlabrada              |
| Flowers, S.A          | Montornes del valles     |
| Golf S.A.             | Santa cruz de Tenerife   |
| Aloha                 | Canarias                 |
| El Prat               |  Barcelona               |
| Sotogrande            | Sotogrande               |
| Vivero Humanes        | Humanes                  |
| Fuenla City           | Fuenlabrada              |
| Agrojardin            | Getafe                   |
| Top Campo             | Humanes                  |
| Jardineria Sara       | Fenlabrada               |
| Campohermoso          | Fuenlabrada              |
| THE MAGIC GARDEN      | London                   |
+-----------------------+--------------------------+

12. Número de clientes asignados a cada representante de ventas.

SELECT 
    Empleados.CodigoEmpleado,
    Empleados.Nombre,
    COUNT(Clientes.CodigoEmpleadoRepVentas) AS 'nº clientes'
FROM
    Empleados
        INNER JOIN
    Clientes ON Empleados.CodigoEmpleado = Clientes.CodigoEmpleadoRepVentas
GROUP BY Clientes.CodigoEmpleadoRepVentas;
+----------------+-----------------+--------------+
| CodigoEmpleado | Nombre          | nº clientes  |
+----------------+-----------------+--------------+
|              5 | Felipe          |            5 |
|              8 | Mariano         |            4 |
|              9 | Lucio           |            2 |
|             11 | Emmanuel        |            5 |
|             12 | José Manuel     |            5 |
|             16 | Lionel          |            2 |
|             18 | Michael         |            2 |
|             19 | Walter Santiago |            2 |
|             22 | Lorena          |            2 |
|             30 | Julian          |            5 |
|             31 | Mariko          |            2 |
+----------------+-----------------+--------------+

13. Listado con el precio total de cada pedido.

select CodigoPedido, sum(Cantidad * PrecioUnidad) as 'precio sin iva' from DetallePedidos group by CodigoPedido;
+--------------+----------------+
| CodigoPedido | precio sin iva |
+--------------+----------------+
|            1 |        1567.00 |
|            2 |        7113.00 |
|            3 |       10850.00 |
|            4 |        2624.00 |
|            8 |        1065.00 |
|            9 |        2535.00 |
|           10 |        2920.00 |
|           11 |         820.00 |
|           12 |         290.00 |
|           13 |         738.00 |
|           14 |         829.00 |
|           15 |         214.00 |
|           16 |         234.00 |
|           17 |         375.00 |
|           18 |         116.00 |
|           19 |         333.00 |
|           20 |         292.00 |
|           21 |         182.00 |
|           22 |           6.00 |
|           23 |        1640.00 |
|           24 |         287.00 |
|           25 |        1455.00 |
|           26 |         675.00 |
|           27 |         504.00 |
|           28 |        2052.00 |
|           29 |        1324.00 |
|           30 |         711.00 |
|           31 |         244.00 |
|           32 |        3089.00 |
|           33 |       73226.00 |
|           34 |        1532.00 |
|           35 |        1718.00 |
|           36 |         311.00 |
|           37 |        2284.00 |
|           38 |          98.00 |
|           39 |         108.00 |
|           40 |          12.00 |
|           41 |          10.00 |
|           42 |           4.00 |
|           43 |           9.00 |
|           44 |           5.00 |
|           45 |          10.00 |
|           46 |          84.00 |
|           47 |         164.00 |
|           48 |        6398.00 |
|           49 |         625.00 |
|           50 |        3506.00 |
|           51 |        7750.00 |
|           53 |         141.00 |
|           54 |         669.00 |
|           55 |        1569.00 |
|           56 |         377.00 |
|           57 |         773.00 |
|           58 |        4775.00 |
|           74 |        3562.00 |
|           75 |        1048.00 |
|           76 |        2223.00 |
|           77 |         588.00 |
|           78 |        4660.00 |
|           79 |         300.00 |
|           80 |        5773.00 |
|           81 |         120.00 |
|           82 |        2176.00 |
|           83 |         120.00 |
|           89 |         710.00 |
|           90 |          41.00 |
|           91 |        1384.00 |
|           92 |        2906.00 |
|           93 |         882.00 |
|           94 |        5759.00 |
|           95 |         605.00 |
|           96 |         660.00 |
|           97 |         322.00 |
|           98 |        1024.00 |
|           99 |        2070.00 |
|          100 |         800.00 |
|          101 |         209.00 |
|          102 |         660.00 |
|          103 |         304.00 |
|          104 |        1760.00 |
|          105 |        1506.00 |
|          106 |        1077.00 |
|          107 |        3216.00 |
|          108 |         660.00 |
|          109 |         553.00 |
|          110 |         149.00 |
|          116 |         264.00 |
|          117 |         154.00 |
|          128 |          51.00 |
+--------------+----------------+

14. Clientes que hayan hecho pedidos en 2008 por importe superior a 2000 euros.

SELECT 
    Clientes.NombreCliente,
    SUM(DetallePedidos.Cantidad * DetallePedidos.PrecioUnidad) AS 'importe sin iva'
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
        INNER JOIN
    DetallePedidos ON Pedidos.CodigoPedido = DetallePedidos.CodigoPedido
WHERE
    Pedidos.FechaPedido LIKE '2008%'
GROUP BY Clientes.NombreCliente
HAVING SUM(DetallePedidos.Cantidad * DetallePedidos.PrecioUnidad) > 2000
ORDER BY 2 DESC;
+--------------------------------+-----------------+
| NombreCliente                  | importe sin iva |
+--------------------------------+-----------------+
| Jardines y Mansiones CACTUS SL |        18279.00 |
| Tendo Garden                   |        12490.00 |
| Jardin de Flores               |         6883.00 |
| Gerudo Valley                  |         4002.00 |
| DGPRODUCTIONS GARDEN           |         3600.00 |
| Dardena S.A.                   |         3491.00 |
+--------------------------------+-----------------+

15. Cuántos pedidos tiene cada cliente en cada estado.

select CodigoCliente, Estado, count(Estado) as 'nº pedidos' from Pedidos group by Estado, CodigoCliente order by 1 asc;
+---------------+-----------+-------------+
| CodigoCliente | Estado    | nº pedidos  |
+---------------+-----------+-------------+
|             1 | Pendiente |           4 |
|             1 | Entregado |           5 |
|             1 | Rechazado |           2 |
|             3 | Rechazado |           2 |
|             3 | Entregado |           5 |
|             3 | Pendiente |           2 |
|             4 | Entregado |           2 |
|             4 | Rechazado |           2 |
|             4 | Pendiente |           1 |
|             5 | Entregado |           2 |
|             5 | Rechazado |           2 |
|             5 | Pendiente |           1 |
|             7 | entregado |           4 |
|             7 | rechazado |           1 |
|             9 | entregado |           2 |
|             9 | pendiente |           2 |
|             9 | rechazado |           1 |
|            13 | Pendiente |           1 |
|            13 | Entregado |           2 |
|            13 | Rechazado |           2 |
|            14 | Pendiente |           1 |
|            14 | Rechazado |           1 |
|            14 | Entregado |           3 |
|            15 | Rechazado |           1 |
|            15 | Entregado |           3 |
|            15 | Pendiente |           1 |
|            16 | Pendiente |           2 |
|            16 | Entregado |           6 |
|            16 | Rechazado |           2 |
|            19 | Entregado |           3 |
|            19 | Pendiente |           1 |
|            19 | Rechazado |           1 |
|            23 | Pendiente |           2 |
|            23 | Entregado |           2 |
|            23 | Rechazado |           1 |
|            26 | Entregado |           3 |
|            26 | Pendiente |           2 |
|            27 | Pendiente |           2 |
|            27 | Entregado |           3 |
|            28 | Entregado |           3 |
|            28 | Pendiente |           1 |
|            28 | Rechazado |           1 |
|            30 | Entregado |           4 |
|            30 | Rechazado |           2 |
|            30 | Pendiente |           4 |
|            35 | Entregado |           4 |
|            35 | Pediente  |           1 |
|            36 | Entregado |           2 |
|            36 | Pendiente |           2 |
|            36 | Rechazado |           1 |
|            38 | Entregado |           3 |
|            38 | Rechazado |           2 |
+---------------+-----------+-------------+

16. Los clientes que hayan pedido más de 200 unidades de cualquier producto.

SELECT 
    Clientes.NombreCliente, SUM(DetallePedidos.Cantidad)
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
        INNER JOIN
    DetallePedidos ON Pedidos.CodigoPedido = DetallePedidos.CodigoPedido
GROUP BY Clientes.NombreCliente
HAVING SUM(DetallePedidos.Cantidad) > 200
ORDER BY 2 DESC;
+--------------------------------+------------------------------+
| NombreCliente                  | sum(DetallePedidos.Cantidad) |
+--------------------------------+------------------------------+
| Gerudo Valley                  |                         1480 |
| DGPRODUCTIONS GARDEN           |                         1218 |
| Tendo Garden                   |                          882 |
| Jardin de Flores               |                          797 |
| Jardineria Sara                |                          670 |
| Gardening Associates           |                          527 |
| Jardines y Mansiones CACTUS SL |                          483 |
| Flores Marivi                  |                          481 |
| Jardinerías Matías SL          |                          407 |
| Agrojardin                     |                          306 |
| El Jardin Viviente S.L         |                          225 |
| Tutifruti S.A                  |                          201 |
+--------------------------------+------------------------------+

17. Cliente que hizo el pedido de mayor cuantía e importe.

CREATE VIEW ejer17 AS
    SELECT 
        Clientes.CodigoCliente,
        Clientes.NombreCliente,
        SUM(DetallePedidos.Cantidad * DetallePedidos.PrecioUnidad) AS 'cuantía'
    FROM
        Clientes
            INNER JOIN
        Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
            INNER JOIN
        DetallePedidos ON Pedidos.CodigoPedido = DetallePedidos.CodigoPedido
    GROUP BY DetallePedidos.CodigoPedido;

-- ()
SELECT 
    MAX(cuantía), NombreCliente
FROM
    ejer17
GROUP BY NombreCliente
ORDER BY 1 DESC
LIMIT 0 , 1;
+---------------+---------------+
| max(cuantía)  | NombreCliente |
+---------------+---------------+
|      73226.00 | Gerudo Valley |
+---------------+---------------+

18. Cliente que hizo el pedido de menor cuantía e importe.

-- (utilizamos la vista creada en el ejercicio 17)
SELECT 
    MIN(cuantía), NombreCliente
FROM
    ejer17
GROUP BY NombreCliente
ORDER BY 1 ASC
LIMIT 0 , 1;
+---------------+---------------+
| min(cuantía)  | NombreCliente |
+---------------+---------------+
|          4.00 | Golf S.A.     |
+---------------+---------------+
