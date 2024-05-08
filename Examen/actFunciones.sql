-- Funciones sin sentencias SQL:
-- Escribe una función que reciba un número entero de entrada y devuelva TRUE si
-- el número es par o FALSE en caso contrario.
delimiter //
drop function parim //
create function parim(in n int) returns boolean 
    begin 
        declare vuelta boolean;
        if n % 2 = 0 then 
            set vuelta = true;
        else 
            set vuelta = false;
        end if;
        return vuelta;
    end 
//
delimiter ;

-- Escribe una función que devuelva el valor de la hipotenusa de un triángulo a
-- partir de los valores de sus lados.
delimiter //
drop function hipo //
create function hipo(in lado1 int, in lado2 int) returns int
    begin
        declare total int; 
        set total = (lado1 * lado1) + (lado2 * lado2);
        return total;
    end
//
delimiter ;
-- Escribe una función que reciba como parámetro de entrada un valor numérico
-- que represente un día de la semana y que devuelva una cadena de caracteres
-- con el nombre del día de la semana correspondiente. Por ejemplo, para el valor
-- de entrada 1 debería devolver la cadena lunes.
delimiter //
drop function semanaday //
create function semanaday(in n int) returns varchar(15)
    begin
        declare vuelta varchar(15);
        case
            when n = 1 then 
            set vuelta = "Lunes";

            when n = 2 then 
            set vuelta = "Martes";

            when n = 3 then 
            set vuelta = "Miércoles";

            when n = 4 then 
            set vuelta = "Jueves";

            when n = 5 then 
            set vuelta = "Viernes";

            when n = 6 then 
            set vuelta = "Sábado";

            when n = 7 then 
            set vuelta = "Domingo";

        end case;
        return vuelta;
    end
//
delimiter ;

-- Escribe una función que reciba tres números reales como parámetros de entrada
-- y devuelva el mayor de los tres.
delimiter //
drop function maximo//
create function maximo(in n1 int, in n2 int, in n3 int) returns int 
    begin
        declare vuelta int;
        if n1 > n2 and n1 > n3 then 
            set vuelta = n1;
        elseif n2 > n1 and n2 > n3 then 
            set vuelta = n2;
        elseif n3 > n1 and n3 > n2 then 
            set vuelta = n3;
        else 
            set vuelta = n1;
        end if;
        return vuelta;
    end
//
delimiter ;

select maximo(1,3,2);
select maximo(1,1,1);

-- Escribe una función que devuelva el valor del área de un círculo a partir
-- del valor del radio que se recibirá como parámetro de entrada.
delimiter //
drop function circulo //
create function circulo(in radio float) returns float
    begin
        declare ratio float;
        set ratio = pi() * (radio*radio);
        return ratio;
    end
//
delimiter ;
-- Escribe una función que devuelva como salida el número de años que han
-- transcurrido entre dos fechas que se reciben como parámetros de entrada.
-- Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01
-- la función tiene que devolver que han pasado 10 años.
delimiter //
drop function anios //
create function anios(in f1 date, in f2 date) returns int
    begin
    declare cantidad int;
    set cantidad = DATEDIFF(f2,f2)/365;
    return cantidad;
    end
//
delimiter ;

select anios('2008-01-01','2018-01-01');


-- Funciones con sentencias SQL
-- Escribe una función para la base de datos tienda que devuelva el número
-- total de productos que hay en la tabla productos. Créate un usuario “tienda”
-- con permisos sobre esta base de datos y opera con este usuario.
create user 'tienda'@'localhost' identified BY 'tienda';
grant all privileges ON tienda.* TO 'tienda'@'localhost';
flush privileges;

delimiter //
drop function totalProductos() //
create function totalProductos() returns int
    begin
        declare toral int;
        select count(id) into toral from producto;
        return toral;
    end
//
delimiter ;
select totalProductos();

-- Escribe una función para la base de datos tienda que devuelva el valor medio
-- del precio de los productos de un determinado fabricante que se recibirá como
-- parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
-- No puede usarse una variable para almacenar el resultado. 
delimiter //
drop function media //
create function media(in i int) returns float 
    begin
        declare metia float;
        select 
            avg(precio) into metia 
        from 
            producto
        where
            id=i    
        group by id;
        return metia;
    end
//
delimiter ;

-- Escribe una función para la base de datos tienda que devuelva el valor máximo
-- del precio de los productos de un determinado fabricante que se recibirá como
-- parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
-- Se pide usar una variable para almacenar el resultado y la estructura SET …)
delimiter //
drop function maxFab //
create function maxFab(in nombreFab varchar(50)) returns float 
    begin
        declare ma float;
        select 
            max(precio) into ma 
        from
            producto 
        where 
            id_fabricante = (
                select 
                    id 
                from 
                    fabricante 
                where 
                    nombre = nombreFab 
            );
        return ma;
    end
//
delimiter ;
-- Escribe una función para la base de datos tienda que devuelva el valor mínimo
-- del precio de los productos de un determinado fabricante que se recibirá como
-- parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
--  Debe usarse la estructura “SELECT … INTO”.
delimiter //
drop function  //
create function returns 
    begin
    declare ma float;
        select 
            min(precio) into ma 
        from
            producto 
        where 
            id_fabricante = (
                select 
                    id 
                from 
                    fabricante 
                where 
                    nombre = nombreFab 
            );
        return ma;
    end
//
delimiter ;