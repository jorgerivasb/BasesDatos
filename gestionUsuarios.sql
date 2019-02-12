1. Crea un usuario 'creausuarios' y otórgale permisos para que pueda crear usuarios.

create user 'jorge0'@'localhost' identified by 'Admin$2018';
GRANT all privileges on *.* to jorge0@'localhost' with grant option;
show grants for 'jorge0'@'localhost';
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for jorge0@localhost                                                                                                                                                                                                                                                                                                                                                                                   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `jorge0`@`localhost` WITH GRANT OPTION    |
| GRANT APPLICATION_PASSWORD_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SYSTEM_VARIABLES_ADMIN,XA_RECOVER_ADMIN ON *.* TO `jorge0`@`localhost` WITH GRANT OPTION |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

2. Conecta como 'creausuarios' crea un nuevo usuario 'usujardineria'.

mysql -u jorge0 -p;
create user 'usujardineria'@'localhost' identified by 'Admin$2018';

3. Conecta como 'root', otórgale permisos al usuario 'usujardineria' para que pueda crear tablas en jardineria.

GRANT create on jardineria.* to usujardineria@'localhost';

4. Conecta como 'usujardineria' comprueba que dispone de los permisos creando una tabla de árboles en jardineria. La tabla debe tener código, 
	nombre, altura máxima y edad de vida media.
    
create table arboles (id int, nombre varchar(20), alturaMaxima float, vidaMedia int);

5. Conecta como 'root', muestra los permisos que tiene el usuario 'usujardineria'.

show grants for 'usujardineria'@'localhost';
+---------------------------------------------------------------------------------+
| Grants for usujardineria@localhost                                              |
+---------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `usujardineria`@`localhost`                               |
| GRANT CREATE ON `jardineria`.* TO `usujardineria`@`localhost` WITH GRANT OPTION |
+---------------------------------------------------------------------------------+

6. Conecta como 'usujardineria' muestra los permisos que posee y comprueba que son los mismos a los de la orden anterior.

 show grants for 'usujardineria'@'localhost';
+---------------------------------------------------------------------------------+
| Grants for usujardineria@localhost                                              |
+---------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `usujardineria`@`localhost`                               |
| GRANT CREATE ON `jardineria`.* TO `usujardineria`@`localhost` WITH GRANT OPTION |
+---------------------------------------------------------------------------------+

7. Conecta como 'root' otorga permiso de creación y borrado, así como de ejecución al usuario 'usujardineria' sobre una base de datos creada previamente.

GRANT create, delete, execute  on jardineria.* to usujardineria@'localhost';

8. Conecta como 'root' crea un usuario de nombre 'creartablasnba' que tenga permisos para crear, borrar y modificar tablas de nba.

create user 'creartablasnba'@'localhost' identified by 'Admin$2018';
GRANT create, delete, insert, update  on nba.* to creartablasnba@'localhost';

9. Conecta como 'creartablasnba' crea un tabla sencilla de al menos dos columnas.

create table mvps (id int, nombre varchar(20));

10. Conecta como 'root' crea un usuario de nombre 'soloconsulta' que pueda realizar operaciones de consulta sobre todas las tablas de todas las bases de datos.

create user 'soloconsulta'@'localhost' identified by 'Admin$2018';
GRANT select on *.* to soloconsulta@'localhost';

11. Añade a 'soloconsulta' el permiso de insertar en la tabla jugadores de nba.

GRANT insert on nba.jugadores to soloconsulta@'localhost';

12. Conecta como 'soloconsulta' añade una fila a la tabla arboles creada anteriormente. Intenta borrar la fila creada. Describe la respuesta obtenida.

INSERT INTO arboles VALUES (1, 'Pino', 6, 60);
ERROR 1142 (42000): INSERT command denied to user 'soloconsulta'@'localhost' for table 'arboles'

13. Conecta como 'root' crea un usuario de nombre 'localaccess' que pueda seleccionar todas las tablas de la base de datos jardineria.

create user 'localaccess'@'localhost' identified by 'Admin$2018';
grant select on jardineria.* to localaccess@'localhost';

14. Conecta como 'root' crea un usuario de nombre 'limitedaccess' que pueda realizar operaciones de inserción, actualización y consulta sobre la primera columna de la tabla 
	creada previamente (arboles).
    
create user 'limitedaccess'@'localhost' identified by 'Admin$2018';
GRANT select(id), insert(id), update (id) on jardineria.arboles to limitedaccess@'localhost';

15. Conéctate como 'limitedaccess' y comprueba que tienes los permisos ejecutando las órdenes SQL SELECT, UPDATE e INSERT.

insert into arboles (id) values (0);

update arboles set id=2 where id=0;

select id from arboles;
+------+
| id   |
+------+
|    2 |
+------+

(comprobamos que no nos deja actualizar, modificar o ver otros campos de la tabla)

insert into arboles values (1, 'Pino', 4, 89);
ERROR 1142 (42000): INSERT command denied to user 'limitedaccess'@'localhost' for table 'arboles'
select* from arboles;
ERROR 1142 (42000): SELECT command denied to user 'limitedaccess'@'localhost' for table 'arboles'

16. Comprueba qué permisos tienes con el usuario actual.

show grants for limitedaccess@'localhost';  
+------------------------------------------------------------------------------------------------------------+
| Grants for limitedaccess@localhost                                                                         |
+------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `limitedaccess`@`localhost`                                                          |
| GRANT SELECT (`id`), INSERT (`id`), UPDATE (`id`) ON `jardineria`.`arboles` TO `limitedaccess`@`localhost` |
+------------------------------------------------------------------------------------------------------------+