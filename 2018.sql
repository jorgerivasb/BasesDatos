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







-- (12/12/2018)
-- (distinct eiimina los elementos repetidos)
select distinct Division from equipos;
+-----------+
| Division  |
+-----------+
| Atlantic  |
| SouthEast |
| Central   |
| Pacific   |
| SouthWest |
| NorthWest |
+-----------+
-- ()
select Posicion,nombre from jugadores where nombre="Pau Gasol";
+----------+-----------+
| Posicion | nombre    |
+----------+-----------+
| F-C      | Pau Gasol |
+----------+-----------+
1 row in set (0,00 sec)

select Posicion,nombre from jugadores where Nombre_equipo="Grizzlies";
+----------+---------------------+
| Posicion | nombre              |
+----------+---------------------+
| F        | Andre Brown         |
| C        | Kwame Brown         |
| F        | Brian Cardinal      |
| C-F      | Jason Collins       |
| G        | Mike Conley         |
| G        | Javaris Crittenton  |
| F        | Rudy Gay            |
| g        | Casey Jacobsen      |
| G        | Kyle Lowry          |
| G        | Aaron Mckie         |
| C-F      | Darko Milicic       |
| G-F      | Mike Miller         |
| G        | Juan Carlos Navarro |
| F        | Hakim Warrick       |
+----------+---------------------+
-- ()
select Posicion,nombre from jugadores where Nombre_equipo='Lakers' and Posicion='F-C';
+----------+--------------+
| Posicion | nombre       |
+----------+--------------+
| F-C      | Pau Gasol    |
| F-C      | Ronny Turiaf |
+----------+--------------+
-- ()
select nombre from jugadores where Posicion='F-C' and Altura<'6-0';
-- (contamos cuantos partidos jugaron de locales)
select count(*)from partidos where equipo_local='Raptors' and temporada='99/00';
+----------+
| count(*) |
+----------+
|       58 |
+----------+

-- (partido en que el visitante anotó menos puntos)
select min(puntos_visitante)from partidos;
+-----------------------+
| min(puntos_visitante) |
+-----------------------+
|                    50 |
+-----------------------+
-- ()
select equipo_local, equipo_visitante from partidos where puntos_visitante='158';
-- ()
select count(*)from partidos where equipo_local='Lakers' and temporada='99/00' and puntos_local<puntos_visitante;
+----------+
| count(*) |
+----------+
|       28 |
+----------+
-- ()
select equipo_local, equipo_visitante, puntos_local, puntos_visitante from partidos where equipo_local='Lakers' and temporada='99/00' and puntos_local<puntos_visitante;
+--------------+------------------+--------------+------------------+
| equipo_local | equipo_visitante | puntos_local | puntos_visitante |
+--------------+------------------+--------------+------------------+
| Lakers       | Grizzlies        |           80 |               91 |
| Lakers       | Clippers         |           81 |               92 |
| Lakers       | Knicks           |           86 |              121 |
| Lakers       | Timberwolves     |           95 |               97 |
| Lakers       | Celtics          |           65 |              116 |
| Lakers       | Nets             |           76 |              154 |
| Lakers       | Cavaliers        |           59 |              118 |
| Lakers       | Magic            |          104 |              128 |
| Lakers       | Nuggets          |           54 |               68 |
| Lakers       | Supersonics      |          142 |              149 |
| Lakers       | Warriors         |          104 |              140 |
| Lakers       | Kings            |           79 |              110 |
| Lakers       | Hornets          |           59 |              134 |
| Lakers       | Spurs            |          108 |              129 |
| Lakers       | Suns             |           53 |              158 |
| Lakers       | Grizzlies        |           69 |              108 |
| Lakers       | Clippers         |           52 |               86 |
| Lakers       | Knicks           |          139 |              158 |
| Lakers       | Celtics          |          121 |              133 |
| Lakers       | Nets             |           53 |               58 |
| Lakers       | Cavaliers        |           62 |              138 |
| Lakers       | Pacers           |           50 |              158 |
| Lakers       | Bulls            |           52 |              143 |
| Lakers       | Magic            |           88 |              134 |
| Lakers       | Bobcats          |           63 |               91 |
| Lakers       | Jazz             |           61 |              142 |
| Lakers       | Hornets          |           80 |               91 |
| Lakers       | Rockets          |           88 |              142 |
+--------------+------------------+--------------+------------------+
-- ()
select equipo_local, equipo_visitante, puntos_local, puntos_visitante from partidos where equipo_local='Lakers' and temporada='99/00' and puntos_local<puntos_visitante or equipo_visitante='Lakers'and temporada='99/00'and puntos_local<puntos_visitante;
-- (con esta nos ordena alfabeticamente la tabla según la colunma indicada)
select equipo_local, equipo_visitante, puntos_local, puntos_visitante from partidos where equipo_local='Lakers' and temporada='99/00' and puntos_local<puntos_visitante or equipo_visitante='Lakers'and temporada='99/00'and puntos_local<puntos_visitante order by equipo_local asc;
