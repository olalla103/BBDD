-- Escribe un procedimiento que reciba como parámetro
--  de entrada una forma de pago, que será una cadena de caracteres 
-- (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida el
--  pago de máximo valor realizado para esa forma de pago. 
-- Deberá hacer uso de la tabla pago de la base de datos jardineria.
delimiter // 
drop procedure if exists formaPago // 
create procedure formaPago(in p_formaDePago varchar(20)) 
begin
select
    max(total)
from
    pago
where
    forma_pago = p_formaDePago;
end 
// 
delimiter;

-- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, 
-- que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc) y 
-- devuelva como salida los siguientes valores teniendo en cuenta la forma de pago
--  seleccionada como parámetro de entrada:
-- el pago de máximo valor,
-- el pago de mínimo valor,
-- el valor medio de los pagos realizados,
-- la suma de todos los pagos,
-- el número de pagos realizados para esa forma de pago.
-- Deberá hacer uso de la tabla pago de la base de datos jardineria.
delimiter // 
drop procedure if exists formaPago // 
create procedure formaPago(in p_formaDePago varchar(20)) 
begin
select
    max(total) as 'Pago máximo',
    min(total) as 'Pago mínimo',
    avg(total) as 'Media de los pagos',
    sum(total) as 'Suma de los pagos',
    count(id_transaccion) as 'Cantidad de pagos'
from
    pago
where
    forma_pago = p_formaDePago;
end 
// 
delimiter ;
-- Crea una base de datos llamada procedimientos que contenga
--  una tabla llamada cuadrados. La tabla cuadrados debe tener dos columnas de tipo
--  INT UNSIGNED, una columna llamada número y otra columna llamada cuadrado.
-- Una vez creada la base de datos y la tabla deberá crear un 
-- procedimiento llamado calcular_cuadrados con las siguientes
-- características. El procedimiento recibe un parámetro de entrada
-- llamado tope de tipo INT UNSIGNED y calculará el valor de los cuadrados
-- de los primeros números naturales hasta el valor introducido como parámetro.
-- El valor del números y de sus cuadrados deberán ser almacenados en la tabla
-- cuadrados que hemos creado previamente.
-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual
-- de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.
-- Utilice un bucle WHILE para resolver el procedimiento.
drop database if exists procedimientos; 
create database procedimientos;
use procedimientos;
create table cuadrados (
    numero int UNSIGNED,
    cuadrado int UNSIGNED
) engine=innoDB;

delimiter //
drop procedure if exists calcular_cuadrados //
create procedure calcular_cuadrados(in tope int)
begin
    declare i int UNSIGNED default 0;
    declare cuadradoAct int UNSIGNED;

    delete from cuadrados;

   while i < tope do
    set cuadradoAct=i * i;
    insert into procedimientos (numero,cuadrado) values (i,cuadradoAct);
    set i=i+1;
   end while;
end //
delimiter ;

-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
drop database if exists procedimientos; 
create database procedimientos;
use procedimientos;

create table cuadrados (
    numero int unsigned,
    cuadrado int unsigned
) engine=innodb;

delimiter //
drop procedure if exists calcular_cuadrados //
create procedure calcular_cuadrados(in tope int)
begin
    declare i int unsigned default 0;
    declare cuadrado_act int unsigned;

    delete from cuadrados;

    repeat
        set cuadrado_act = i * i;
        insert into cuadrados (numero, cuadrado) values (i, cuadrado_act);
        set i = i + 1;
    until i >= tope end repeat;
end //
delimiter ;

-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
drop database if exists procedimientos; 
create database procedimientos;
use procedimientos;

create table cuadrados (
    numero int unsigned,
    cuadrado int unsigned
) engine=innodb;

delimiter //
drop procedure if exists calcular_cuadrados //
create procedure calcular_cuadrados(in tope int)
begin
    declare i int unsigned default 0;
    declare cuadrado_act int unsigned;

    delete from cuadrados;

    loop_label: LOOP
        set cuadrado_act = i * i;
        insert into cuadrados (numero, cuadrado) values (i, cuadrado_act);
        set i = i + 1;
        if i >= tope then
            leave loop_label;
        end if;
    END LOOP loop_label;
end //
delimiter ;
-- Crea una base de datos llamada procedimientos que contenga una tabla llamada ejercicio.
-- La tabla debe tener una única columna llamada número y el tipo de dato de esta columna
-- debe ser INT UNSIGNED.
drop database if exists procedimientos;
create database procedimientos;
use procedimientos;
create table numero (numero int UNSIGNED);

-- Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado
-- calcular_números con las siguientes características. El procedimiento recibe un parámetro
-- de entrada llamado valor_inicial de tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio
-- toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.
delimiter //
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(in valor_inicial int UNSIGNED);
declare i int default valor_inicial;

delete from numero;

while i > 0 do
insert into numero (numero) values (i);
i = i - 1;
end while;
end
//
delimiter ;

delimiter //
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(in valor_inicial int UNSIGNED)
begin
    declare i int default valor_inicial;

    delete from numero;

    while i > 0 do
        insert into numero (numero) values (i);
        set i = i - 1;
    end while;
end//
delimiter ;


-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.
-- Utilice un bucle WHILE para resolver el procedimiento.

-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
delimiter //
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(in valor_inicial int UNSIGNED)
begin
    declare i int unsigned default valor_inicial;

    delete from numero;

    repeat
        insert into numero (numero) values (i);
        set i = i - 1;
    until i <= 0
    end repeat;
end 
//
delimiter ;

-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
-- Crea una base de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. Las dos tablas deben tener una única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
-- Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado calcular_pares_impares con las siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y deberá almacenar en la tabla pares aquellos números pares que existan entre el número 1 y el valor introducido como parámetro. Habrá que realizar la misma operación para almacenar los números impares en la tabla impares.
-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.
-- Utilice un bucle WHILE para resolver el procedimiento.
-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.