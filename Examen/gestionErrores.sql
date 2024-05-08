-- Crea una base de datos llamada test que contenga una tabla llamada
-- alumno. La tabla debe tener cuatro columnas:
-- id: entero sin signo (clave primaria).
-- nombre: cadena de 50 caracteres.
-- apellido1: cadena de 50 caracteres.
-- apellido2: cadena de 50 caracteres.
create database test;
use test;

create table alumno(
    id int unsigned,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    primary key (id)
);

-- Una vez creada la base de datos y la tabla:
-- Deberá crear un procedimiento llamado insertar_alumno con las siguientes características. 
-- el procedimiento recibe cuatro parámetros de entrada (id, nombre, apellido1, apellido2) y
-- los insertará en la tabla alumno. El procedimiento devolverá como salida un parámetro llamado
-- error que tendrá un valor igual a 0 si la operación se ha podido realizar con éxito y un valor
-- igual a 1 en caso contrario. 
-- Deberá manejar los errores que puedan ocurrir cuando se intenta insertar una fila que contiene
-- una clave primaria repetida.
delimiter //
drop procedure insertar_alumno //
create procedure insertar_alumno(in id int, in nombre varchar(50), in apellido1 varchar(50), in apellido2 varchar(50))
    begin
        declare exit handler for sqlstate '1062' set x = 1;
         
    end
//
delimiter ;



-- Teniendo en cuenta el significado del código de error 1062 (ER_DUP_ENTRY).
-- Duplicate entry ‘%s’ for key %d
-- Paso 1
-- CREATE TABLE t (s1 INT, PRIMARY KEY (s1));
-- Paso 2
-- DELIMITER $$
-- CREATE PROCEDURE handlerexam(IN a INT, IN b INT, IN c INT, OUT x INT)
-- BEGIN
--  	DECLARE EXIT HANDLER FOR 1036 SET x = 10;
--  	DECLARE EXIT HANDLER FOR 1062 SET x = 30;
-- 
-- 
--  SET x = 1;
--  INSERT INTO t VALUES (a);
--  SET x = 2;
--  INSERT INTO t VALUES (b);
--  SET x = 3;
--  INSERT INTO t VALUES (c);
--  SET x = 4;
-- END
-- $$


-- ¿Qué devolvería la última sentencia SELECT @x en cada caso (a y b)? Justifique su 
-- respuesta. Sin una justificación válida la respuesta será considerada incorrecta.
-- a)
-- CALL handlerexam(1, 2, 3, @x);
-- SELECT @x;
-- b)
-- CALL handlerexam(1, 2, 1, @x);
-- SELECT @x;

-- Modifica el procedimiento en una función y 
-- repite los apartados a y b.
