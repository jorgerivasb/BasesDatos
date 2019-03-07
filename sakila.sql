#Ejercicios

    #En primer lugar hay que importar tanto el schema de la BD como los datos que vienen en dos script SQL diferentes.

	mysql -u root -p sakila<ruta_schema.sql;
    mysql -u root -p sakila<ruta_data.sql;
    
#Modificaciones

    #La base de datos está un poco anticuada en las fechas. Para actualizarla se propone:
        #Añadir a las columnas de la fecha de alquiler y devolución 13 años sobre sus valores actuales.
        
        update rental set last_update=now();
        update rental set rental_date=date_add("2006-02-14 15:16:03", interval 13 year);
        update rental set return_date=date_add("2006-02-14 15:16:03", interval 13 year);

        #Añadir 8 meses más a las columnas previamente modificadas.
        
        update rental set rental_date=date_add("2006-02-14 15:16:03", interval 8 month);
        update rental set return_date=date_add("2006-02-14 15:16:03", interval 8 month);

    #Localizar las ciudades españolas y comprobar si están correctamente escritas. Corregirlas en caso de haber errores.
	
		select * from city where country_id=87;
		+---------+------------------------+------------+---------------------+
		| city_id | city                   | country_id | last_update         |
		+---------+------------------------+------------+---------------------+
		|       1 | A Corua (La Corua)     |         87 | 2006-02-15 04:45:25 |
		|     146 | Donostia-San Sebastin  |         87 | 2006-02-15 04:45:25 |
		|     181 | Gijn                   |         87 | 2006-02-15 04:45:25 |
		|     388 | Ourense (Orense)       |         87 | 2006-02-15 04:45:25 |
		|     459 | Santiago de Compostela |         87 | 2006-02-15 04:45:25 |
		+---------+------------------------+------------+---------------------+
		
        update city set city="A Coruña" where city_id=1;
        update city set city="Donostia-San Sebastian" where city_id=146;
        update city set city="Gijon" where city_id=181;
        
#Consultas I

    ¿Qué actores se llaman 'John'?
    
    select * from actor where first_name= 'John';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|      192 | JOHN       | SUVARI    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+

    ¿Qué actores se apellidan 'Williams'?
    
    select * from actor where last_name= 'Williams';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       72 | SEAN       | WILLIAMS  | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS  | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
    
    ¿Cuántos apellidos distintos de actores hay?
    
    select count(distinct last_name) from actor;
	+---------------------------+
	| count(distinct last_name) |
	+---------------------------+
	|                       121 |
	+---------------------------+
    
    ¿Qué apellidos que no se repiten?
    
    create view jorge as select count(*) as 'cuantos' from actor group by last_name;
    select count(*) from jorge where cuantos=1;
	+----------+
	| count(*) |
	+----------+
	|       66 |
	+----------+

    ¿Qué apellidos aparecen más de una vez?
    ¿Qué actor aparece en más películas?
    ¿Está 'Academy Dinosaur' disponible para alquilar desde la Store 1?
    Inserta un registro para señalar que Mary Smith alquila 'Academy Dinosaur' siendo atendida por Mike Hillyer en la Store 1 hoy.
    ¿Cuál es la duración media de las películas?
    ¿Cuál es la duración media de las películas por categoría?
    ¿Cuántos actores no han actuado en ninguna película?
    ¿Cuántas películas están alquiladas actualmente?
    ¿Qué categoría de películas ha generado mayores ingresos?
    ¿A qué hora se dan los pagos por alquiler con más frecuencia?
    ¿Por qué la siguiente consulta devuelve 0 filas?

	select * from film natural join inventory;