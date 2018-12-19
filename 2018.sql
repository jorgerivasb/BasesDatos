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
 
 
 
 
 
 
 -- (13/12)
 -- (podemos realizar operaciones)
 select 3+5;
+-----+
| 3+5 |
+-----+
|   8 |
+-----+
-- (función media)
select avg(peso)from jugadores;
+-----------+
| avg(peso) |
+-----------+
|  223.1181 |
+-----------+
-- ()
select nombre, peso from jugadores where peso between 220 and 250;
-- (convertimos el peso a quilos de los jugadores que pesan entre 200 y 250lbs)
select nombre, peso/2.20462 from jugadores where peso between 200 and 250;
 +---------------------+--------------+
| nombre              | peso/2.20462 |
+---------------------+--------------+
| Greg Buckner        |      95.2545 |
| Randy Foye          |      96.6153 |
| Ryan Gomes          |     113.3982 |
| Marko Jaric         |     101.6048 |
| Mark Madsen         |     113.3982 |
| Craig Smith         |     113.3982 |

-- (para decir que nombre de columna debe mostrar)
select nombre, peso/2.20462 as 'peso en kg'from jugadores where peso between
+---------------------+------------+
| nombre              | peso en kg |
+---------------------+------------+
| Greg Buckner        |    95.2545 |
| Randy Foye          |    96.6153 |

-- ()
select count(*) from jugadores where nombre_equipo='Timberwolves';
+----------+
| count(*) |
+----------+
|       14 |
+----------+
-- ()
select avg(peso) from jugadores where nombre_equipo='Knicks';
+-----------+
| avg(peso) |
+-----------+
|  235.4667 |
+-----------+
select avg(peso/2.20462) as 'peso en kg'from jugadores where nombre_equipo='Knicks';
+--------------+
| peso en kg   |
+--------------+
| 106.80601041 |
+--------------+
-- (los jugadores que juegan en equipos de LA, el nombre del jugador está en la tabla jugadores y la ciudad en la tabla equipos)
select jugadores.nombre from jugadores, equipos where ciudad="Los Angeles"and jugadores.nombre_equipo=equipos.nombre;
-- (los jugadores de la conferencia oeste que midan más de 7 feet)
select jugadores.nombre from jugadores, equipos where equipos.conferencia='West'and jugadores.altura>'7-0' and jugadores.nombre_equipo=equipos.nombre;
-- (ordenados por altura del más alto)
select jugadores.nombre from jugadores, equipos where equipos.conferencia='West'and jugadores.altura>'7-0' and jugadores.nombre_equipo=equipos.nombre order by altura desc;





-- (18/12/18)
-- (Subconsulta)
select nombre, altura from jugadores where altura= (select max(altura) from jugadores);
+----------+--------+
| nombre   | altura |
+----------+--------+
| Yao Ming | 7-6    |
+----------+--------+
-- ()
select conferencia, count(*) from equipos group by conferencia;
+-------------+----------+
| conferencia | count(*) |
+-------------+----------+
| East        |       15 |
| West        |       15 |
+-------------+----------+
-- ()
select conferencia, count(*) from equipos where nombre like 'C%' group by conferencia;
+-------------+----------+
| conferencia | count(*) |
+-------------+----------+
| East        |        2 |
| West        |        1 |
+-------------+----------+
-- ()
select procedencia, avg(peso) from jugadores where Procedencia='Spain';
+-------------+-----------+
| procedencia | avg(peso) |
+-------------+-----------+
| Spain       |  208.6000 |
+-------------+-----------+
-- ()
select Procedencia, avg(peso) from jugadores where Procedencia IN ('Spain', 'France') group by Procedencia;
+-------------+-----------+
| Procedencia | avg(peso) |
+-------------+-----------+
| Spain       |  208.6000 |
| France      |  219.2500 |
+-------------+-----------+
-- ()
select nombre_equipo, avg(peso) from jugadores group by nombre_equipo having avg(peso)>230 order by avg(peso);
+---------------+-----------+
| nombre_equipo | avg(peso) |
+---------------+-----------+
| Jazz          |  230.0714 |
| Knicks        |  235.4667 |
+---------------+-----------+
-- (cuantos jugadores en total)
select count(*) from jugadores;
+----------+
| count(*) |
+----------+
|      432 |
+----------+
-- (cuantos jugadores en la conferencia oeste)
select count(jugadores.nombre) from jugadores, equipos where equipos.Conferencia='west' and jugadores.nombre_equipo=equipos.nombre;
+-------------------------+
| count(jugadores.nombre) |
+-------------------------+
|                     216 |
+-------------------------+
-- (igual que la anterior pero con una subconsulta en vez de con 2 tablas)
select count(nombre) from jugadores where nombre_equipo IN(select nombre from equipos where conferencia='west');
+---------------+
| count(nombre) |
+---------------+
|           216 |
+---------------+




-- (19/12)
-- ()
show tables;
+---------------+
| Tables_in_nba |
+---------------+
| equipos       |
| estadisticas  |
| jugadores     |
| partidos      |
+---------------+
-- (nombre y ciudad de los equipos en los que juegan españoles)
select nombre, ciudad from equipos where EXISTS (select * from jugadores where jugadores.procedencia='Spain' and jugadores.nombre_equipo=equipos.nombre); 
+---------------+-------------+
| nombre        | ciudad      |
+---------------+-------------+
| Grizzlies     | Memphis     |
| Lakers        | Los Angeles |
| Raptors       | Toronto     |
| Trail Blazers | Portland    |
+---------------+-------------+
-- (nos muestra los jugadores que pesan más que el jugador español más pesado)
select nombre from jugadores where peso>all(select peso from jugadores where procedencia='Spain');
-- (los bases que pesan más que algún pivot)
select nombre from jugadores where posicion='G' and peso>any(select peso from jugadores where posicion='C');
+-------------+
| nombre      |
+-------------+
| Joe Johnson |
+-------------+
-- ()
select equipos.nombre, equipos.ciudad, jugadores.nombre from equipos, jugadores where jugadores.procedencia='Spain' and jugadores.nombre_equipo=equipos.nombre;
+---------------+-------------+---------------------+
| nombre        | ciudad      | nombre              |
+---------------+-------------+---------------------+
| Grizzlies     | Memphis     | Juan Carlos Navarro |
| Lakers        | Los Angeles | Pau Gasol           |
| Raptors       | Toronto     | Jose Calderon       |
| Raptors       | Toronto     | Jorge Garbajosa     |
| Trail Blazers | Portland    | Sergio Rodriguez    |
+---------------+-------------+---------------------+
-- ()
select jugadores.nombre, estadisticas.puntos_por_partido from estadisticas, jugadores where jugadores.procedencia='Spain' and jugadores.codigo=estadisticas.jugador and estadisticas.temporada='01/02';
+-----------+--------------------+
| nombre    | puntos_por_partido |
+-----------+--------------------+
| Pau Gasol |               17.6 |
+-----------+--------------------+