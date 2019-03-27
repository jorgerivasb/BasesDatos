delimiter $$
create function status_actual(in_status char(1))
 
	returns varchar(20)
deterministic
begin
	declare status varchar(20);
    
    if in_status = 'P' then
		set status = 'Pasado';
	elseif in_status = 'O' then
		set status = 'Presente';
	elseif in_status = 'N' then
		set status = 'Futuro';
end if;
return (status);
end $$