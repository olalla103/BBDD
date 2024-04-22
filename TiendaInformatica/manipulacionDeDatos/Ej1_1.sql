-- Inserta un nuevo fabricante indicando su código y su nombre.
insert into
    fabricante (nombre)
values
    ('samtek');

-- Inserta un nuevo fabricante indicando solamente su nombre.
insert into
    fabricante (nombre)
values
    ('olalla');

-- Inserta un nuevo producto asociado a uno de los nuevos fabricantes.
-- La sentencia de inserción debe incluir: código, nombre, precio y código_fabricante.
insert into
    producto
values
    (13, 'espátula', 10.00, 11);

-- Inserta un nuevo producto asociado a uno de los nuevos fabricantes. 
-- La sentencia de inserción debe incluir: nombre, precio y código_fabricante.
insert into
    producto (nombre, precio, id_fabricante)
values
    ('ordenador', 500.00, 10);

-- Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas: 
-- nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los registros de 
-- la base de datos tienda en esta tabla haciendo uso de única operación de inserción.
create table fabricante_productos(
    nombre_fabricante varchar(100),
    nombre_producto varchar(100),
    precio double
);

insert into
    fabricante_productos (nombre_fabricante, nombre_producto, precio)
select
    f.nombre,
    p.nombre,
    p.precio
from
    fabricante f
    join producto p on f.id = p.id_fabricante;

-- Crea una vista con el nombre vista_fabricante_productos que tenga las siguientes columnas: 
-- nombre_fabricante, nombre_producto y precio.
create
or replace view vista_fabricante_productos as
select
    f.nombre as nombre_fabricante,
    p.nombre as nombre_producto,
    p.precio as precio
from
    fabricante f
    join producto p on f.id = p.id_fabricante;

-- Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, 
-- ¿qué cambios debería realizar para que fuese posible borrarlo?
delete from
    vista_fabricante_productos
where
    nombre_fabricante like 'Asus';

-- debería de eliminar los productos que pertenecieran a ese fabricante.
-- Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, 
-- ¿qué cambios debería realizar para que fuese posible borrarlo?
delete from
    vista_fabricante_productos
where
    nombre_fabricante like 'Xiaomi';

-- debería de eliminar los productos que pertenecieran a ese fabricante.
-- Actualiza el código del fabricante Lenovo y asígnale el valor 20.
-- ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
update
    producto
set
    id = 20
where
    id_fabricante =(
        select
            id
        from
            fabricante
        where
            nombre like 'Lenovo'
    );

-- Actualiza el código del fabricante Huawei y asígnale el valor 30. 
-- ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
-- Actualiza el precio de todos los productos sumándole 5 € al precio actual.
update
    vista_fabricante_productos
set
    precio = precio + 5;

-- Elimina todas las impresoras que tienen un precio menor de 200 €.
delete from
    vista_fabricante_productos
where
    nombre_producto like 'impresora%'
    and precio < 200;