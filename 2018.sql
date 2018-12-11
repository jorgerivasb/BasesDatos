-- (como importar bases de datos)
mysql -u root -p nombre_base_datos<ruta_fichero.sql;
-- ()
select conferencia from equipos where conferencia = 'East';
+-------------+
| conferencia |
+-------------+
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
| East        |
+-------------+
-- (si usamos * en vez de conferencia nos mostrará todas las columnas)
select * from equipos where conferencia = 'East';
+-----------+--------------+-------------+-----------+
| Nombre    | Ciudad       | Conferencia | Division  |
+-----------+--------------+-------------+-----------+
| 76ers     | Philadelphia | East        | Atlantic  |
| Bobcats   | Charlotte    | East        | SouthEast |
| Bucks     | Milwaukee    | East        | Central   |
| Bulls     | Chicago      | East        | Central   |
| Cavaliers | Cleveland    | East        | Central   |
| Celtics   | Boston       | East        | Atlantic  |
| Hawks     | Atlanta      | East        | SouthEast |
| Heat      | Miami        | East        | SouthEast |
| Knicks    | New York     | East        | Atlantic  |
| Magic     | Orlando      | East        | SouthEast |
| Nets      | New Jersey   | East        | Atlantic  |
| Pacers    | Indiana      | East        | Central   |
| Pistons   | Detroit      | East        | Central   |
| Raptors   | Toronto      | East        | Atlantic  |
| Wizards   | Washington   | East        | SouthEast |
+-----------+--------------+-------------+-----------+
-- (contamos las filas de la consulta anterior, así sabemos cuantos equipos hay en la conferencia)
select count(*) from equipos where conferencia='East';
-- ()
select * from jugadores where peso>300;
select count(*) from jugadores where peso>300;
select * from jugadores where nombre='Pau Gasol';
select * from jugadores where procedencia in('spain', 'Los Angeles', 'Houston');
select max(altura) from jugadores;
+-------------+
| max(altura) |
+-------------+
| 7-6         |
+-------------+
-- (mostramos 2 columnas que ordenamos según la altura en orden descendente)
select nombre, altura from jugadores order by altura desc;
-- ()
select * from jugadores where nombre like '%John%';
+--------+--------------------+----------------+--------+------+----------+---------------+
| codigo | Nombre             | Procedencia    | Altura | Peso | Posicion | Nombre_equipo |
+--------+--------------------+----------------+--------+------+----------+---------------+
|     91 | Linton Johnson III | Tulane         | 6-8    |  205 | F        | Raptors       |
|    265 | Joe Johnson        | Arkansas       | 6-7    |  235 | G        | Hawks         |
|    289 | Alexander Johnson  | Florida State  | 6-9    |  230 | F        | Heat          |
|    305 | Anthony Johnson    | Charleston     | 6-3    |  195 | G        | Kings         |
|    309 | mike john salmons  | Miami          | 6-6    |  207 | G-F      | Kings         |
|    547 | Amir Johnson       | Westchester HS | 6-9    |  210 | F        | Pistons       |
+--------+--------------------+----------------+--------+------+----------+---------------+
