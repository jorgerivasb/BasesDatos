1. Crea una copia de seguridad de la estructura y contenido actual de la BD Jardineria.
    
    mysqldump -u root -p jardineria > data-dump.sql
    
2. Modifica la tabla DetallePedido para insertar una columna para el IV de tipo numérico. Mediante una transacción establece el valor de dicho campo a 18 
	para aquellos registros cuyo pedido tenga fecha a partir del 1 de Julio de 2010. A continuación, actualiza el resto de pedidos estableciendo el IVA a 21.
   
   alter table DetallePedidos add (IVA float(4));
   
   start transaction;
   update DetallePedidos set IVA=18 where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido >= '2008-06-01');
   commit;
   
   update DetallePedidos set IVA=21 where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido < '2008-06-01');
   
3. Modifica la tabla DetallePedido para incorporar una columna llamada pvp_linea de tipo numérico, y actualiza todos sus registros 
	para calcular su valor con la fórmula pvp_linea = PrecioUnidad * Cantidad*IVA/100.
   
   alter table DetallePedidos add (PVP float(4));
   
   update DetallePedidos set PVP=PrecioUnidad*Cantidad*IVA/100;
   
4. Borra el cliente que posea el límite de crédito más bajo. ¿Es posible borrarlo con solo una consulta? Justifica tu respuesta.
   
   delete from Clientes where min(LimiteCredito);
   Cannot delete or update a parent row: a foreign key constraint fails (`jardineria`.`Pagos`, CONSTRAINT `Pagos_clienteFK` 
   FOREIGN KEY (`CodigoCliente`) REFERENCES `Clientes` (`codigocliente`))
Como vemos no podemos realizar esta acción ya que el programa intenta conservar la integridad referencial
   
5. Inserta dos clientes nuevos para un empleado cualquiera que sea representante de ventas. 
	A continuación inserta mediante transacciones un pedido que tenga al menos 3 líneas de detalle.
	
    insert into Clientes values (900, 'Juan', 'Pere', 'Puig', '788878798', '988745621', 'Avda Navarra', NULL, 'Tarazona', 'Zaragoza', 'España', '50500', 5, 1000000), 
    (901, 'Sergio', 'Pere', 'Puig', '008878798', '118745621', 'Plaza España', NULL, 'Tarazona', 'Zaragoza', 'España', '50500', 5, 1000000);
    
     start transaction;
     insert into Pedidos values (130, '2019-01-31', '2019-01-31', '2019-01-31', 'Entregado', NULL, 900);
     
     insert into DetallePedidos values (130, 'OR-150', 10, 2, 1, 21, 24.20),
      (130, 'OR-179', 10, 6.00, 2, 21, 72.60),
      (130, 'OR-146', 10, 4.00, 3, 21, 48.40);
	 commit;

6. Modifica el precio de los artículos con precio superior a 200€ rebajándolos un 5%.
   
   update Productos set PrecioVenta=PrecioVenta*0.95 where PrecioVenta>200;
   
7. Crea una vista que devuelva el cliente que más dinero ha gastado en total. LLámala cliente_top.

create view cliente_top as select Clientes.CodigoCliente, Clientes.NombreCliente, sum(DetallePedidos.Cantidad*DetallePedidos.PrecioUnidad) 
from Clientes inner join Pedidos on Clientes.CodigoCliente=Pedidos.CodigoCliente inner join DetallePedidos 
on Pedidos.CodigoPedido=DetallePedidos.CodigoPedido group by Clientes.CodigoCliente limit 1;

select * from cliente_top;
+---------------+----------------------+----------------------------------------------------------+
| CodigoCliente | NombreCliente        | sum(DetallePedidos.Cantidad*DetallePedidos.PrecioUnidad) |
+---------------+----------------------+----------------------------------------------------------+
|             1 | DGPRODUCTIONS GARDEN |                                                  6165.00 |
+---------------+----------------------+----------------------------------------------------------+



-- (Ejers índices)
1. Localiza los índices ya presentes en la BD employees. ¿Cuáles son y a qué campos afectan?

show index from dept_emp;
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| dept_emp |          0 | PRIMARY  |            1 | emp_no      | A         |      299527 |     NULL |   NULL |      | BTREE      |        
| dept_emp |          0 | PRIMARY  |            2 | dept_no     | A         |      331143 |     NULL |   NULL |      | BTREE      |   
| dept_emp |          1 | dept_no  |            1 | dept_no     | A         |           8 |     NULL |   NULL |      | BTREE      |  
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+

 show index from departments;
+-------------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| Table       | Non_unique | Key_name  | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | 
+-------------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| departments |          0 | PRIMARY   |            1 | dept_no     | A         |           9 |     NULL |   NULL |      | BTREE      | 
| departments |          0 | dept_name |            1 | dept_name   | A         |           9 |     NULL |   NULL |      | BTREE      | 
+-------------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+

show index from dept_manager;
+--------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| Table        | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | 
+--------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| dept_manager |          0 | PRIMARY  |            1 | emp_no      | A         |          24 |     NULL |   NULL |      | BTREE      |
| dept_manager |          0 | PRIMARY  |            2 | dept_no     | A         |          24 |     NULL |   NULL |      | BTREE      | 
| dept_manager |          1 | dept_no  |            1 | dept_no     | A         |           9 |     NULL |   NULL |      | BTREE      |  
+--------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+


show index from employees;
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| Table     | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| employees |          0 | PRIMARY         |            1 | emp_no      | A         |      299600 |     NULL |   NULL |      | BTREE      |
| employees |          1 | employees_birth |            1 | birth_date  | A         |        4700 |     NULL |   NULL |      | BTREE      |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+


show index from salaries;
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | 
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| salaries |          0 | PRIMARY  |            1 | emp_no      | A         |      278005 |     NULL |   NULL |      | BTREE      | 
| salaries |          0 | PRIMARY  |            2 | from_date   | A         |     2657697 |     NULL |   NULL |      | BTREE      | 
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+


show index from titles;
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+
| titles |          0 | PRIMARY  |            1 | emp_no      | A         |      300222 |     NULL |   NULL |      | BTREE      |          
| titles |          0 | PRIMARY  |            2 | title       | A         |      442605 |     NULL |   NULL |      | BTREE      |           
| titles |          0 | PRIMARY  |            3 | from_date   | A         |      443021 |     NULL |   NULL |      | BTREE      |         
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+


2. Explica brevemente la utilidad de introducir índices en la BD.

Los índices sirven para recibir los resultados de nuestras consultas más rapidamente. Sin índices mysql empezaría a buscar por la primera fila de la tabla
hasta encontrar lo que busca. Con índices en las columnas utilizadas en la consulta, mysql tiene una referencia directa hacia los datos sin necesidad de 
recorrer todos hasta llegar a los que busca.

3. Indica cómo mejorarías el rendimiento de consultas de empleados por apellidos.

Primero implementaría un índice FullText ya que es el indicado para campos de tipo varchar, en el caso de que solo necesitara un número determinado de resultados 
usaríamos Limit, solo usaría % para rellenar parte del apellido en caso de extrema necesidad ya que penaliza el rendimiento y aunque normalmente utilizamos varchar
ya que ocupa menos espacio podríamos usar datos del tipo char ya que es mucho más rápido encontrarlos.  