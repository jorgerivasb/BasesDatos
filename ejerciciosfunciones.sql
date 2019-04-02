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
drop function if exists `sumar_enteros`;
delimiter $$
create DEFINER='root'@'localhost' function `sumar_enteros`(n int)
returns int
deterministic
BEGIN
	declare i int ;
     declare suma int default 0;
  set i=0;
 
    jorge: while i<n do
		set suma=suma+(i+1);
        set i=i+1;
	end while jorge;
    return suma;
END $$


select sumar_enteros(5);

#4 Crea una función que reciba un número y diga si es primo o no.

drop function if exists `primoSiNO`;
delimiter $$
create DEFINER='root'@'localhost' function `primoSiNO`(n int)
returns boolean
deterministic
BEGIN
	declare i int ;
    declare módulo int;
	declare TF boolean default false;
	set i=2;
 
    jorge: while i<n do
		set modulo=n%i;
        set i=i+1;
        if (modulo!=0) then
			set TF=true;
        end if;
	end while jorge;
    return TF;
END $$


select primoSiNo(5);


#5 Crea un procedimiento que muestre el nombre del representante de ventas que más clientes tiene



#6 Crear mediante cursores un procedimiento que muestre datos de un cliente, los pagos y pedidos que ha hecho.
#Ejemplo cursor

create table tipo_cliente (codigoCliente int, tipo varchar(10));

delimiter $$
drop procedure if exists `cliente` $$
create procedure `cliente`()
begin
declare codigoCliente int;
declare importe int ;
declare finalizado boolean default false;

declare c1 cursor for select c.CodigoCliente, sum(d.PrecioUnidad*d.Cantidad) as importe_pagado from 
Clientes c inner join Pedidos p on c.CodigoCliente = p.CodigoCliente inner join 
DetallePedidos d on p.CodigoPedido=d.CodigoPedido where c.Pais='España' group by 
c.CodigoCliente;

declare continue handler for sqlstate '02000' set finalizado=true;

open c1;
	jorge: loop
    fetch c1 into codigoCliente, importe;
		if `finalizado` then leave jorge; end if;
        if importe<10000 then
			insert into tipo_cliente(CodigoCliente, tipo) values (CodigoCliente, 'Normal');
		else insert into tipo_cliente(CodigoCliente, tipo) values (CodigoCliente, 'Premium');
		end if;
    end loop jorge;
close c1;

end $$


CALL cliente();
