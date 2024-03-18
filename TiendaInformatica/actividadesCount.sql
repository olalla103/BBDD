-- Calcula el número total de productos que hay en la tabla productos.
select
    count(id)
from
    producto;

-- Calcula el número total de fabricantes que hay en la tabla fabricante.
select
    count(id)
from
    fabricante;

-- Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
select
    count(distinct(id_fabricante))
from
    producto;

-- Calcula la media del precio de todos los productos.
select
    avg(precio)
from
    producto;

-- Calcula el precio más barato de todos los productos.
select
    min(precio)
from
    producto;

-- Calcula el precio más caro de todos los productos.
select
    max(precio)
from
    producto;

-- Lista el nombre y el precio del producto más barato.
select
    nombre,
    precio
from
    producto
where
    precio =(
        select
            min(precio)
        from
            producto
    );

-- Lista el nombre y el precio del producto más caro.
select
    nombre,
    precio
from
    producto
where
    precio =(
        select
            max(precio)
        from
            producto
    );

-- Calcula la suma de los precios de todos los productos.
select
    sum(precio)
from
    producto;

-- Calcula el número de productos que tiene el fabricante Asus.
select
    count(p.id)
from
    fabricante f
    join producto p on p.id_fabricante = f.id
where
    f.nombre = 'Asus';

-- Calcula la media del precio de todos los productos del fabricante Asus.
-- Calcula el precio más barato de todos los productos del fabricante Asus.
-- Calcula el precio más caro de todos los productos del fabricante Asus.
-- Calcula la suma de todos los productos del fabricante Asus.
-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
-- Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado por orden descendente por el número de productos.
-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
-- Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
-- Calcula el número de productos que tienen un precio mayor o igual a 180€.
-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
-- Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
-- Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
-- Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.