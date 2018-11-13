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