-- Escribe un procedimiento que reciba un número real de entrada
-- y muestre un mensaje indicando si el número es positivo, negativo o cero.
delimiter //
create procedure negativo_positivo()
begin 
end //
delimiter ;

-- Escribe un procedimiento que reciba un número real de entrada, que representa
-- el valor de la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido
-- teniendo en cuenta las siguientes condiciones:
-- [0,5) = Insuficiente
-- [5,6) = Aprobado
-- [6, 7) = Bien
-- [7, 9) = Notable
-- [9, 10] = Sobresaliente
-- En cualquier otro caso la nota no será válida.
;

-- Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
;

-- Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
;

-- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de
-- caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida el pago de máximo valor
-- realizado para esa forma de pago. Deberá hacer uso de la tabla pago de la base de datos jardineria.
;

-- Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados.
-- La tabla cuadrados debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número
-- y otra columna llamada cuadrado.
;

-- Una vez creada la base de datos y la tabla deberá crear un procedimiento 
--llamado calcular_cuadrados con las siguientes características.
-- El procedimiento recibe un parámetro de entrada llamado tope de tipo 
--INT UNSIGNED y calculará el valor de los cuadrados de los primeros números naturales
-- hasta el valor introducido como parámetro. El valor del números y de sus cuadrados
-- deberán ser almacenados en la tabla cuadrados que hemos creado previamente.
;

-- Tenga en cuenta que el procedimiento deberá eliminar el contenido 
--actual de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.
;

-- Utilice un bucle WHILE para resolver el procedimiento.
;

-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
;

-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
;

-- Crea una base de datos llamada procedimientos que contenga una tabla llamada pares
-- y otra tabla llamada impares. Las dos tablas deben tener una única columna llamada
-- número y el tipo de dato de esta columna debe ser INT UNSIGNED.
;

-- Una vez creada la base de datos y las tablas deberá crear un procedimiento
-- llamado calcular_pares_impares con las siguientes características.
-- El procedimiento recibe un parámetro de entrada llamado tope de tipo 
--INT UNSIGNED y deberá almacenar en la tabla pares aquellos números pares
-- que existan entre el número 1 y el valor introducido como parámetro.
-- Habrá que realizar la misma operación para almacenar los números impares en la tabla impares.
;

-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas
-- antes de insertar los nuevos valores.
;

-- Utilice un bucle WHILE para resolver el procedimiento.
;

-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
;