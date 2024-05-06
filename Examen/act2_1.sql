-- SIN SENTENCIAS SQL
-- Escribe un procedimiento que no tenga ningún parámetro de entrada 
-- ni de salida y que muestre el texto ¡Hola mundo!
delimiter //
drop procedure if exists holaMundo //
create procedure holaMundo()
    begin
        select "¡Hola mundo!" as 'Procedimiento sin sentencia SQL';
    end
//
delimiter ;

call holaMundo();

-- Escribe un procedimiento que reciba un número real de entrada y
-- muestre un mensaje indicando si el número es positivo, negativo o cero.
-- Modifique el procedimiento diseñado en el ejercicio anterior para que tenga
-- un parámetro de entrada, con el valor un número real, y un parámetro de salida,
-- con una cadena de caracteres indicando si el número es positivo, negativo o cero.
delimiter //
drop procedure if exists numeros //
create procedure numeros(in a int, out cadena varchar(15))
    begin
        if a = 0 then set cadena = "Cero";
        elseif a > 0 then set cadena = "Positivo";
        else set cadena="Negativo";
        end if;
    end
//
delimiter ;

call numeros(0,@cadena);
select @cadena;

-- Escribe un procedimiento que reciba un número real de entrada, que representa
-- el valor de la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido
-- teniendo en cuenta las siguientes condiciones:
-- [0,5) = Insuficiente
-- [5,6) = Aprobado
-- [6, 7) = Bien
-- [7, 9) = Notable
-- [9, 10] = Sobresaliente
-- En cualquier otro caso la nota no será válida.
delimiter //
drop procedure if exists notas //
create procedure notas(in nota float, out mensaje varchar(20))
    begin
        case
        when nota = 0 or nota < 5 then set mensaje = "Insuficiente";
        when nota >= 5 or nota < 6 then set mensaje = "Aprobado";
        when nota >= 6 or nota < 7 then set mensaje = "Bien";
        when nota >= 7 or nota < 9 then set mensaje = "Notable";
        when nota >= 9 or nota <= 10 then set mensaje = "Sobresaliente";
        else set mensaje = "No válido";
        end case;
    end
//
delimiter ; 

-- Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro
-- de entrada, con el valor de la nota en formato numérico y un parámetro de salida, con una cadena
-- de texto indicando la nota correspondiente. Debe usarse IF.
delimiter //
drop procedure if exists notas //
create procedure notas(in nota float, out mensaje varchar(20))
    begin
        if nota = 0 or nota < 5 then set mensaje = "Insuficiente";
        elseif nota >= 5 or nota < 6 then set mensaje = "Aprobado";
        elseif nota >= 6 or nota < 7 then set mensaje = "Bien";
        elseif nota >= 7 or nota < 9 then set mensaje = "Notable";
        elseif nota >= 9 or nota <= 10 then set mensaje = "Sobresaliente";
        else set mensaje = "No válido";
        end if;
    end
//
delimiter ; 

-- Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente
-- un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana
-- correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
-- Resuelva el procedimiento haciendo uso de la estructura de control IF.
delimiter //
drop procedure if exists diaSemana //
create procedure diaSemana(in d int, out palabra varchar(20))
    begin
        if d = 1 then set palabra = "Lunes";
        elseif d = 2 then set palabra = "Martes";
        elseif d = 3 then set palabra = "Miércoles";
        elseif d = 4 then set palabra = "Jueves";
        elseif d = 5 then set palabra = "Viernes";
        elseif d = 6 then set palabra = "Sábado";
        elseif d = 7 then set palabra = "Domingo";
        else set palabra = "no valido";
        end if;
    end
//
delimiter ;
call diaSemana(3,@dia);
select @dia;

-- Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
delimiter //
drop procedure if exists diaSemana //
create procedure diaSemana(in d int, out palabra varchar(20))
    begin
        case
        when d = 1 then set palabra = "Lunes";
        when d = 2 then set palabra = "Martes";
        when d = 3 then set palabra = "Miércoles";
        when d = 4 then set palabra = "Jueves";
        when d = 5 then set palabra = "Viernes";
        when d = 6 then set palabra = "Sábado";
        when d = 7 then set palabra = "Domingo";
        else set palabra = "no valido";
        end case;
    end
//
delimiter ;
call diaSemana(3,@dia);
select @dia;

-- CON SENTENCIAS SQL
-- Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada
-- y realice una consulta sobre la tabla cliente para obtener todos los clientes que
-- existen en la tabla de ese país.
delimiter //
drop procedure if exists paises //
create procedure paises(in nombreP varchar(50))
    begin 
        select 
            codigo_cliente as 'Código cliente',
            nombre_cliente as 'Nombre cliente'
        from 
            cliente 
        where 
            pais = nombreP;
    end
//
delimiter ;
call paises("Spain");

-- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago,
-- que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida el 
-- pago de máximo valor realizado para esa forma de pago. Deberá hacer uso de
-- la tabla pago de la base de datos jardineria.
delimiter //
drop procedure if exists formaPago //
create procedure formaPago(in forma varchar(20))
    begin 
        select 
            max(total) 
        from 
            pago 
        where 
            forma_pago = forma;
    end 
//
delimiter ;

call formaPago("PayPal");

-- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago,
-- que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc) y devuelva
-- como salida los siguientes valores teniendo en cuenta la forma de pago seleccionada
-- como parámetro de entrada:
-- el pago de máximo valor,
-- el pago de mínimo valor,
-- el valor medio de los pagos realizados,
-- la suma de todos los pagos,
-- el número de pagos realizados para esa forma de pago.
-- Deberá hacer uso de la tabla pago de la base de datos jardineria.
delimiter //
drop procedure formaPago //
create procedure formaPago(in forma varchar(20))
    begin
        select 
            count(id_transaccion) as 'Cantidad de pagos', 
            max(total) as máximo,
            avg(total) as 'valor medio',
            min(total) as mínimo,
            sum(total) as 'suma total' 
        from 
            pago
        where 
            forma_pago = forma;
    end
//
delimiter ;
call formaPago('PayPal');

-- Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados.
-- La tabla cuadrados debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número
-- y otra columna llamada cuadrado.
create database procedimientos;
use procedimientos;

create table cuadrados(
    numero int UNSIGNED,
    cuadrado int UNSIGNED
);

-- Una vez creada la base de datos y la tabla deberá crear un procedimiento
-- llamado calcular_cuadrados con las siguientes características. El procedimiento recibe un
-- parámetro de entrada llamado tope de tipo INT UNSIGNED y calculará el valor de los cuadrados
-- de los primeros números naturales hasta el valor introducido como parámetro.
-- El valor del números y de sus cuadrados deberán ser almacenados en la tabla cuadrados que
-- hemos creado previamente.
-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual
-- de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.
-- Utilice un bucle WHILE para resolver el procedimiento.
delimiter //
drop procedure if exists sqr//
create procedure sqr(in n int)
begin
    declare s int;
    delete from cuadrados;
    while n != 0 do
        set s = n * n;
        insert into cuadrados(numero,cuadrado) values (n,s);
        set n = n - 1;
    end while;
end
//
delimiter ;


-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
delimiter //
drop procedure if exists sqr//
create procedure sqr(in n int)
begin
    declare s int;
    delete from cuadrados;
    repeat
        set s = n * n;
        insert into cuadrados(numero,cuadrado) values (n,s);
        set n = n - 1;
    until n = 0
    end repeat;
end
//
delimiter ;
;
-- Crea una base de datos llamada procedimientos2 que contenga una tabla llamada ejercicio.
-- La tabla debe tener una única columna llamada número y el tipo de dato de esta columna
-- debe ser INT UNSIGNED.
create database procedimientos2;

create table ejercicio
;
-- Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado
-- calcular_números con las siguientes características. El procedimiento recibe un parámetro
-- de entrada llamado valor_inicial de tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio
-- toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.
;
-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de
-- las tablas antes de insertar los nuevos valores.
-- Utilice un bucle WHILE para resolver el procedimiento.
-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
;
-- Crea una base de datos llamada procedimientos3 que contenga una tabla llamada
-- pares y otra tabla llamada impares. Las dos tablas deben tener una única columna llamada
-- número y el tipo de dato de esta columna debe ser INT UNSIGNED.
-- Una vez creada la base de datos y las tablas deberá crear un procedimiento
-- llamado calcular_pares_impares con las siguientes características. El procedimiento
-- recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y deberá almacenar en
-- la tabla pares aquellos números pares que existan entre el número 1 y el valor introducido
-- como parámetro. Habrá que realizar la misma operación para almacenar los números impares
-- en la tabla impares.
-- Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes
-- de insertar los nuevos valores.
-- Utilice un bucle WHILE para resolver el procedimiento.
-- Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
-- Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
;