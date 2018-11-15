CREATE DATABASE productos CHARACTER SET utf8 COLLATE utf8_unicode_ci;

CREATE TABLE productos (id INT, nombre VARCHAR(20), descripción VARCHAR(200), stock BIGINT, fecha_alta DATE, proveedor VARCHAR(40), nacional SET('s','n'));

INSERT INTO productos VALUES ('254000', 'Monitores', 'Monitor ordenador negro acer', '150', '2018-10-11', 'acer', 's');

INSERT INTO productos VALUES ('254001', 'Teclados', 'Teclado ordenador negro logitech', '750', '2018-09-11', 'logitech', 's');

INSERT INTO productos VALUES ('254002', 'Ratones', 'Ratón ordenador negro logitech', '220', '2018-08-17', 'logitech', 's');

INSERT INTO productos VALUES ('254003', 'Torres', 'Torre ordenador negro HP', '104', '2018-11-01', 'HP', 's');

INSERT INTO productos VALUES ('254004', 'Almohadillas', 'Almohadillas para ratón azul HP', '174', '2018-10-01', 'HP', 's');

SHOW TABLES;

DROP DATABASE productos;