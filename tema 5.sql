-- (actualizamos el equipo de Pau)
select* from jugadores where nombre="Pau Gasol";
+--------+-----------+-------------+--------+------+----------+---------------+
| codigo | Nombre    | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-----------+-------------+--------+------+----------+---------------+
|     66 | Pau Gasol | Spain       | 7-0    |  250 | F-C      | Lakers        |
+--------+-----------+-------------+--------+------+----------+---------------+

update jugadores set Nombre_equipo="Spurs" where nombre="Pau Gasol";

select* from jugadores where nombre="Pau Gasol";
+--------+-----------+-------------+--------+------+----------+---------------+
| codigo | Nombre    | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-----------+-------------+--------+------+----------+---------------+
|     66 | Pau Gasol | Spain       | 7-0    |  250 | F-C      | Spurs         |
+--------+-----------+-------------+--------+------+----------+---------------+

-- (creamos un nuevo jugador)
insert into jugadores values (614,'Ricky Rubio', 'Spain', '6-4', 210, 'G', 'Jazz');
select* from jugadores where nombre='Ricky Rubio';
+--------+-------------+-------------+--------+------+----------+---------------+
| codigo | Nombre      | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-------------+-------------+--------+------+----------+---------------+
|    614 | Ricky Rubio | Spain       | 6-4    |  210 | G        | Jazz          |
+--------+-------------+-------------+--------+------+----------+---------------+

-- (aumentamos su peso un 1%)
update jugadores set Peso=Peso*1.01 where nombre="Ricky Rubio";
select* from jugadores where nombre='Ricky Rubio';
+--------+-------------+-------------+--------+------+----------+---------------+
| codigo | Nombre      | Procedencia | Altura | Peso | Posicion | Nombre_equipo |
+--------+-------------+-------------+--------+------+----------+---------------+
|    614 | Ricky Rubio | Spain       | 6-4    |  212 | G        | Jazz          |
+--------+-------------+-------------+--------+------+----------+---------------+

-- (borramos el jugador)
delete from jugadores where nombre="Ricky Rubio";
select* from jugadores where nombre='Ricky Rubio';
Empty set

-- (creamos nueva database)
create database nbaPruebas;
use nbaPruebas


