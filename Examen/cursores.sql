-- Escribe las sentencias SQL necesarias para crear una base de datos llamada test, una tabla 
-- llamada alumnos y 4 sentencias de inserción para inicializar la tabla. La tabla alumnos está 
-- formada por las siguientes columnas:
-- id (entero sin signo y clave primaria)
-- nombre (cadena de caracteres)
-- apellido1 (cadena de caracteres)
-- apellido2 (cadena de caracteres
-- fecha_nacimiento (fecha)

drop database if exists test;
create database test;
use test;

create table alumnos(
    id int unsigned,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    fecha_nacimiento date,
    primary key (id)
);

-- Una vez creada la tabla se decide añadir una nueva columna a la tabla llamada 
-- edad que será un valor calculado a partir de la columna fecha_nacimiento. 
update alumnos set edad = year(now())-year(fecha_nacimiento);
-- Escriba la sentencia SQL necesaria para modificar la tabla y añadir la nueva columna.
alter table alumnos add column edad int;
-- Escriba una función llamada calcular_edad que reciba una fecha y devuelva el número 
-- de años que han pasado desde la fecha actual hasta la fecha pasada como parámetro:
-- Función: calcular_edad
-- Entrada: Fecha
-- Salida: Número de años (entero)
-- Ahora escriba un procedimiento que permita calcular la edad de todos los alumnos que 
-- ya existen en la tabla. Para esto será necesario crear un procedimiento llamado 
-- actualizar_columna_edad que calcule la edad de cada alumno y actualice la tabla. 
-- Este procedimiento hará uso de la función calcular_edad que hemos creado en el paso anterior.
-- Modifica la tabla alumnos del ejercicio anterior para añadir una nueva columna email. 
-- Una vez que hemos modificado la tabla necesitamos asignarle una dirección de correo 
-- electrónico de forma automática.
-- Escriba un procedimiento llamado crear_email que dados los parámetros de 
-- entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.
-- Procedimiento: crear_email
-- Entrada:
-- nombre (cadena de caracteres)
-- apellido1 (cadena de caracteres)
-- apellido2 (cadena de caracteres)
-- dominio (cadena de caracteres)
-- Salida:
-- email (cadena de caracteres)
-- Devuelva una dirección de correo electrónico con el siguiente formato:
-- El primer carácter del parámetro nombre.
-- Los tres primeros caracteres del parámetro apellido1.
-- Los tres primeros caracteres del parámetro apellido2.
-- El carácter @.
-- El dominio pasado como parámetro.
-- Ahora escriba un procedimiento que permita crear un email para todos los alumnos que 
-- ya existen en la tabla. Para esto será necesario crear un procedimiento llamado actualizar_columna_email 
-- que actualice la columna email de la tabla alumnos. Este procedimiento hará uso del procedimiento 
-- crear_email que hemos creado en el paso anterior.
-- Escribe un procedimiento llamado crear_lista_emails_alumnos que devuelva la lista de emails 
-- de la tabla alumnos separados por un punto y coma. 
-- Ejemplo: juan@iescelia.org;maria@iescelia.org;pepe@iescelia.org;lucia@iescelia.org.
