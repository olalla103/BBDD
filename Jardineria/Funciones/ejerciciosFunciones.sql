-- Escribe una función para la base de datos tienda que devuelva el
-- valor medio del precio de los productos de un determinado fabricante
-- que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
delimiter //
drop function if exists valorMedio //
create function valorMedio(f_nombreFab varchar(100)) returns float 
begin
    declare media float;
        select avg(precio) into media
        from producto 
        where id_fabricante=
            (
                select id 
                from fabricante 
                where nombre=f_nombreFab
            );
    return media;
end
//
delimiter ;

-- Escribe una función para la base de datos tienda que devuelva el valor máximo del precio de los
-- productos de un determinado fabricante que se recibirá como parámetro de entrada.
-- El parámetro de entrada será el nombre del fabricante.
delimiter //
drop function if exists valorMaximo //
create function valorMaximo(f_nombreFab varchar(100)) returns float 
begin
    declare media float;
        select max(precio) into media
        from producto 
        where id_fabricante=
            (
                select id 
                from fabricante 
                where nombre=f_nombreFab
            );
    return media;
end
//
delimiter ;

-- Escribe una función para la base de datos tienda que devuelva el
-- valor mínimo del precio de los productos de un determinado fabricante
-- que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
delimiter //
drop function if exists valorMin //
create function valorMin(f_nombreFab varchar(100)) returns float 
begin
    declare media float;
        select min(precio) into media
        from producto 
        where id_fabricante=
            (
                select id 
                from fabricante 
                where nombre=f_nombreFab
            );
    return media;
end
//
delimiter ;

