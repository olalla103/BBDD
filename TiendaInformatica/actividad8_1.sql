--Subconsultas en la cláusula WHERE
--Con operadores básicos de comparación:
--Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select
    *
from
    producto
where
    id_fabricante =(
        select
            id
        from
            fabricante
        where
            nombre = 'Lenovo'
    );

--Devuelve todos los datos de los productos que tienen el mismo precio que el producto más
-- caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select
    *
from
    producto
where
    precio =(
        select
            max(precio)
        from
            producto
        where
            id_fabricante = (
                select
                    id
                from
                    fabricante
                where
                    nombre = 'Lenovo'
            )
    );

--Lista el nombre del producto más caro del fabricante Lenovo.
select
    nombre
from
    producto
where
    precio =(
        select
            max(precio)
        from
            producto
        where
            id_fabricante = (
                select
                    id
                from
                    fabricante
                where
                    nombre = 'Lenovo'
            )
    );

--Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select
    nombre
from
    producto
where
    precio =(
        select
            min(precio)
        from
            producto
        where
            id_fabricante =(
                select
                    id
                from
                    fabricante
                where
                    nombre = 'Hewlett-Packard'
            )
    );

--Devuelve todos los productos de la base de datos que tienen un precio mayor
-- o igual al producto más caro del fabricante Lenovo.
select
    *
from
    producto
where
    precio >= (
        select
            max(precio)
        from
            producto
        where
            id_fabricante = (
                select
                    id
                from
                    fabricante
                where
                    nombre = 'Lenovo'
            )
    );

--Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select
    *
from
    producto
where
    precio > (
        select
            avg(precio)
        from
            producto
        where
            id_fabricante =(
                select
                    id
                from
                    fabricante
                where
                    nombre = 'Asus'
            )
    );

--Con ALL y ANY PREGUNTAR
--Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
--Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
--Con IN y NOT IN
--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select
    nombre
from
    fabricante
where
    id in (
        select
            id_fabricante
        from
            producto
    );

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select
    nombre
from
    fabricante
where
    id not in (
        select
            id_fabricante
        from
            producto
    );

--Con EXISTS y NOT EXISTS
--Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select
    nombre
from
    fabricante f
where
    exists (
        select
            p.id_fabricante
        from
            producto p
        where
            p.id_fabricante = f.id
    );

--Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select
    nombre
from
    fabricante f
where
    not exists (
        select
            id_fabricante
        from
            producto p
        where
            f.id = p.id_fabricante
    );

--Subconsultas correlacionadas. Ver apuntes sobre las consultas correlacionadas más
-- abajo antes de realizar estos ejercicios:
--Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
select
    f.nombre,
    (
        select
            p.nombre
        from
            producto p
            join fabricante f on p.id_fabricante = f.id
    ) as 'Nombre y precio del producto'
from
    fabricante f;

--Devuelve un listado de todos los productos que tienen un precio mayor o igual
-- a la media de todos los productos de su mismo fabricante.
--Lista el nombre del producto más caro del fabricante Lenovo.