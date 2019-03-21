delimiter $$
create DEFINER='root'@'localhost' procedure `contar_clientes_comercial`(in codigo int, out nclientes int)
BEGIN
SELECT count(*)
into nclientes
	FROM Clientes
WHERE
	codigoEmpleadoRepVentas=codigo;
END