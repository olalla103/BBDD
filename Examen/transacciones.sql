-- Crea una base de datos llamada cine, con su usuario de acceso con permisos totales,
-- que contenga dos tablas con las siguientes columnas.

-- Tabla cuentas:
-- id_cuenta: entero sin signo (clave primaria).
-- saldo: real sin signo.

-- Tabla entradas:
-- id_butaca: entero sin signo (clave primaria).
-- nif: cadena de 9 caracteres.

create database cine;
use cine;

create table cuentas(
    id_cuenta int unsigned,
    saldo float unsigned,
    primary key (id_cuenta)
);

create table entradas(
    id_butaca int unsigned,
    nif varchar(9),
    primary key (id_butaca)
);

-- Una vez creada la base de datos y las tablas deberá crear 
-- un procedimiento llamado comprar_entrada con las siguientes características. 
-- El procedimiento recibe 3 parámetros de entrada (nif, id_cuenta, id_butaca) y 
-- devolverá como salida un parámetro llamado error que tendrá un valor igual a 0 si la compra 
-- de la entrada se ha podido realizar con éxito y un valor igual a 1 en caso contrario.
-- El procedimiento de compra realiza los siguientes pasos:
-- Inicia una transacción.
-- Actualiza la columna saldo de la tabla cuentas cobrando 5 euros a la cuenta con el id_cuenta adecuado.
-- Inserta una una fila en la tabla entradas indicando la butaca (id_butaca) que acaba de comprar el usuario (nif).
-- Comprueba si ha ocurrido algún error en las operaciones anteriores. Si no ocurre ningún error 
-- entonces aplica un COMMIT a la transacción y si ha ocurrido algún error aplica un ROLLBACK.

-- Deberá manejar los siguientes errores que puedan ocurrir durante el proceso.
-- ERROR 1264 (Out of range value)
-- ERROR 1062 (Duplicate entry for PRIMARY KEY)

-- ¿Qué ocurre cuando intentamos comprar una entrada y le pasamos como parámetro un número de 
-- cuenta que no existe en la tabla cuentas? ¿Ocurre algún error o podemos comprar la entrada? 
-- En caso de que exista algún error, ¿cómo podríamos resolverlo?
-- Pista: si hubiera que crear una cuenta, ésta tendrá como saldo inicial 100€.


-- Realizar los ejercicios anteriores siguiendo los pasos siguientes:
-- Crear la base de datos y las tablas.
-- Crear el usuario con permisos específicos para la base de datos.
-- Crear procedimiento (versión 1):     realizar operaciones pedidas 
-- (inserción de entrada y actualización de saldo) sin realizar control de errores ni transacciones.
-- Modificar procedimiento (versión 2):     insertar una cuenta nueva en caso que ésta no exista.
-- Modificar procedimiento (versión 3):     añadir control de errores para el caso de valor duplicado 
-- en clave primaria en ambas tablas. No se puede usar transacciones.
-- Modificar procedimiento (versión 4):   añadir bloques de instrucciones dentro de una 
-- transacción finalizando en COMMIT (en caso de no haber error) y modificar la gestión de errores para 
-- se realice ROLLBACK en caso de error.
