sudo mysql -u root -p
-- (he llamado a la database series)
CREATE DATABASE series CHARACTER SET utf8 COLLATE utf8_general_ci;
use series;
CREATE TABLE clientes (clientes VARCHAR(50), dni VARCHAR(9), direccción VARCHAR(50));
CREATE TABLE series (nombre VARCHAR(50), temporadas INT, fecha_emisión DATE, género ENUM('comedia', 'acción', 'drama', 'terror', 'suspense'), idioma VARCHAR(50),director VARCHAR(50), protagonistas VARCHAR(50));
CREATE TABLE actores (nombre VARCHAR(50), dni VARCHAR(9), edad INT, país VARCHAR(50));
CREATE TABLE país (nombre VARCHAR(50), id VARCHAR(20), continente VARCHAR(50));

INSERT INTO clientes VALUES('Pablo Alce Sánchez', '11222333Q', 'avda. La paz s/n Tarazona');
INSERT INTO clientes VALUES('Paula Marquez Sánchez', '11992333r', 'avda. navarra s/n Cunchillos');

INSERT INTO series VALUES('cámera cafe', '7', '2005-03-04', 'comedia', 'español', 'Pablo Tamudo', 'Jesus Quesada');
INSERT INTO series VALUES('aquí no hay quien viva', '5', '2003-03-07', 'comedia', 'español', 'Pablo Caballero', 'Juan Cuesta');

INSERT INTO actores VALUES('Óscar de Marcos Pablos', '00666777I', '37', 'españa');
INSERT INTO actores VALUES('Mario Barrios P', '0099977I', '49', 'españa');

INSERT INTO país VALUES('españa', '101010A', 'europa');
INSERT INTO país VALUES('francia', '090909B', 'europa');

-- (resticción a nivel de tabla, el campo clave primaria ni puede estar vacio ni aceptar valores nulos)
CREATE TABLE empleados (cedula INT(8), nombre VARCHAR(30), apellido VARCHAR(30), cargo VARCHAR(30), tiempo_servicio INT, PRIMARY KEY(cedula));
-- (restricción a nivel de columna)
CREATE TABLE empleados2 (cedula INT PRIMARY KEY, nombre VARCHAR(30), apellido VARCHAR(30), cargo VARCHAR(30), tiempo_servicio INT);
-- (insert múltiple)
INSERT INTO pelis2 (nombre, id, fecha_estreno) VALUES 
('predators', '0012143M', '2010/03/07'), 
('alien', '0013223M', '1980/08/07'), 
('alien_vs_predator', '9992133L', '2003/01/06');


-- (usamos auto_increment)
CREATE TABLE proveedores (código int auto_increment, nombre varchar (20), dirección varchar(50), pago float, primary key(código));
-- (tras usar auto_increment no necesitamos indicar el código)
insert into proveedores (nombre, dirección, pago) values ('Pablo', 'paseo fueros de aragón', '30'), ('Mario', 'paseo constitución', '90');
-- (comprobamos)
select * from proveedores;
+---------+--------+-------------------------+------+
| código  | nombre | dirección               | pago |
+---------+--------+-------------------------+------+
|       1 | Pablo  | paseo fueros de aragón  |   30 |
|       2 | Mario  | paseo constitución      |   90 |
+---------+--------+-------------------------+------+

-- (tercera restricción: foreign key, debe haber el mismo valor en las 2 tablas)
create table productos (código_p int auto_increment, codigo_provee int, nombre varchar(40), precio float, disponible int, primary key(código_p), foreign key(codigo_provee) references proveedores (código));
-- (usamos esto para que se actualice o elimine en la tabla a la que hace referencia)
create table productos2 (código_p int auto_increment, codigo_provee int, nombre varchar(40), precio float, disponible int, primary key(código_p), foreign key(codigo_provee) references proveedores (código) ON DELETE CASCADE ON UPDATE CASCADE);
-- (eliminar claves primarias y volverla a añadir)
show create table productos;
-- ((seguimos) nos muestra algo así: CONSTRAINT `productos_ibfk_1`) 
alter table productos drop foreign key productos_ibfk_1;
alter table productos add foreign key (codigo_provee) references proveedores (código) on delete cascade on update cascade;
-- (eliminar todos los registros de 1 tabla)
truncate table productos3;
-- (eliminar una tabla)
drop table productos3;
-- (para evitar valores nulos, es decir que no te deje introducirlos)
nombre varchar (20) not null;


