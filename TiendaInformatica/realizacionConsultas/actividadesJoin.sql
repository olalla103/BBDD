-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto,
    fabricante
where
    producto.id_fabricante = fabricante.id;

-- con join
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos 
-- de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto,
    fabricante
where
    producto.id_fabricante = fabricante.id
order by
    fabricante.nombre;

-- con join
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
order by
    fabricante.nombre;

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante
-- y nombre del fabricante, de todos los productos de la base de datos.
select
    producto.id,
    producto.nombre,
    fabricante.id,
    fabricante.nombre
from
    producto,
    fabricante
where
    producto.id_fabricante = fabricante.id;

-- con join
select
    producto.id,
    producto.nombre,
    fabricante.id,
    fabricante.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
order by
    producto.precio asc
limit
    1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
order by
    producto.precio desc
limit
    1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
select
    producto.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    fabricante.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select
    producto.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    fabricante.nombre = 'Crucial'
    and producto.precio > 200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
-- Sin utilizar el operador IN.
select
    producto.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    fabricante.nombre = 'Asus'
    or fabricante.nombre = 'Hewlett-Packardy'
    or fabricante.nombre = 'Seagate';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
-- Utilizando el operador IN.
select
    producto.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    fabricante.nombre in('Asus', 'Hewlett-Packardy', 'Seagate');

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por
-- la vocal e.
select
    producto.nombre,
    producto.precio
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    fabricante.nombre like '%e';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de
-- fabricante contenga el carácter w en su nombre.
select
    producto.nombre,
    producto.precio
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    fabricante.nombre like '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos
-- los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio
-- (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select
    producto.nombre,
    producto.precio,
    fabricante.nombre
from
    producto
    join fabricante on producto.id_fabricante = fabricante.id
where
    producto.precio >= 180
order by
    producto.precio desc,
    producto.nombre asc;

-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos
-- fabricantes que tienen productos asociados en la base de datos
select
    distinct(fabricante.id),
    fabricante.nombre
from
    fabricante
    join producto on fabricante.id = producto.id_fabricante;

-- left y rigth join
-- Devuelve un listado de todos los fabricantes que existen en la base de datos, 
-- junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos
-- fabricantes que no tienen productos asociados.
select
    fabricante.id,
    fabricante.nombre
from
    fabricante
    left join producto on fabricante.id = producto.id_fabricante;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select
    distinct(f.id),
    f.nombre
from
    fabricante f
    left join producto p on f.id = p.id_fabricante
where
    p.id_fabricante is null;