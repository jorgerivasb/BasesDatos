delimiter $$
create function par_impar(num int)
 
	returns char(1)
deterministic
begin
	declare status char(1);
    
    if num%2 = 0 then
		set status = 'V';
	elseif num%2 <> 0 then
		set status = 'F';
end if;
return (status);
end $$