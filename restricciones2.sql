-- (usamos not null despues del campo de una tabla para indicar que ese valor nunca podrá ser nulo o desconocido)
create table proveedores4 (id int auto_increment, nombre varchar(50)not null, dirección varchar(50), pago float, primary key(id));
-- (con la primera vemos los proveedores cuyo pago es NULL(desconocido), mientras que con la segunda vemos aquellos cuyo pago es igual a 0)
select * from  proveedores where pago is null
select * from proveedores where pago=0;
-- (con la primera pasa lo mismo que antes y con la segunda nos muestra los proveedores cuya dirección guarda una cadena vacía)
select * from  proveedores where dirección is null;
select * from  proveedores where dirección='' '';
-- (year o year(4))
create table fechas (fecha date, hora time, fecha_hora timestamp, fecha_hora2 datetime, año year);
-- (usamos default valor para asignarle un valor por defecto)
create table farmacia (medicamentos int default 20, complementos_alimenticios integer default 30, ultima_reposicion date default '2018-05-03', stock_seguridad enum('si', 'no') default 'si', dia_guardia varchar (20) default 'domingo');
-- (usamos zerofill para que al introducir valores inferiores al indicado se rellene con ceros a su izquierda)
create table ventas (codigo int(6) zerofill auto_increment, id_empleado varchar(40)not null, precio decimal(5,2) unsigned, cantidad smallint zerofill, primary key(codigo));
