-- (orden para conectar el usuario root a mysql)
sudo mysql -u root -p 
-- (para salir)
quit;
-- (orden mostrar bases de datos)
show databases;
-- (para usar una concreta)
use (nombre de la base);
-- (mostrar version y fecha)
SELECT VERSION(), CURRENT_DATE;
-- (mostrar fecha y hora)
SELECT NOW();
-- (realizar operaciones)
SELECT SIN(PI()/4), (4+1)*5;
-- (cancelar orden en proceso)
mysql> SELECT
    -> USER()
    -> \c
mysql>
-- (crear un usuario)
mysql> GRANT ALL ON nombre_bd.* TO 'nombre_usuario'@'dominio';
-- (crear base datos)
mysql> CREATE DATABASE nombre_bd;
-- ()
SHOW CHARACTER SET;
-- ()
CREATE DATABASE testsql CHARACTER SET Latin1 COLLATE latin1_spanish_ci;
-- (modificar: utf8 es lo nuevo que metes)
ALTER DATABASE testsql CHARACTER SET  utf8;
-- (eliminar)
DROP DATABASE nombre;
-- ()
SHOW TABLES;
-- (mostar el contenido de la tabla)
SELECT * FROM nombre_tabla
-- (mostrar el contenido de parte (user en mayúsculas es el nombre de la tabla))
SELECT user,host FROM USER
-- (nos muestra la estructura de la tabla)
describe nombre_tabla
-- (crear tabla)
CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);
-- ()
INSERT INTO pet
VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);
-- (ejemplo tabla distintos tipos de datos)
CREATE TABLE tiposdatos (t TIME, dt DATETIME, f FLOAT, i INT, d DECIMAL(5,2), v VARCHAR(20), se SET('20','23','25'), tx TEXT);

