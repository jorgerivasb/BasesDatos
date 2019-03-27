#1 Crea una función que reciba una fecha 'YYYY-MM-DD' y devuelva el día de la semana (nombre) que es.

delimiter $$
create function dia_semana(year_month_day date)
 
	returns varchar(20)
deterministic
begin
	declare status varchar(20);
    
		set status = dayname(year_month_day);
	
return (status);
end $$

select dia_semana('2018-03-25');

#2 Crea una función que devuelva el menor de tres números pasados como parámetros.

delimiter $$
create function numero_mayor(numero1 int, numero2 int, numero3 int)
 
	returns int
deterministic
begin
	declare status int;
    
    if numero1 > numero2 and numero1>numero3 then 
		set status = numero1;
	elseif numero2 > numero1 and numero2>numero3 then 
		set status = numero2;
	elseif numero3 > numero2 and numero3>numero1 then 
		set status = numero3;
end if;
return (status);
end $$

select numero_mayor(5, 19, 12);

#3 Crea un procedimiento que muestre la suma de los n primeros números enteros, pasando n como parámetro.

delimiter $$
create DEFINER='root'@'localhost' procedure `sumar_enteros`(in n int, out suma int)
BEGIN
	declare n int;
    declare suma int;
    declare i int ;
    set suma=0;
    set i=0;
    
    jorge: while i<n do
		set suma=suma+(i+1);
        set i=i+1;
	end while jorge;
END $$

CALL sumar_enteros(2, @suma);
select @suma;

#4 Crea una función que reciba un número y diga si es primo o no.
#5 Crea un procedimiento que muestre el nombre del representante de ventas que más clientes tiene
#6 Crear mediante cursores un procedimiento que muestre datos de un cliente, los pagos y pedidos que ha hecho.
