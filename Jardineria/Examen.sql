-- Apartado 1  Consultas sobre una tabla       CE: 3a, 3b
-- Devuelve un listado con el código de cliente de aquellos
-- clientes que realizaron algún pago en 2008. Tenga
-- en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. 
select
    distinct(c.codigo_cliente)
from
    cliente c
    join pago p on c.codigo_cliente = p.codigo_cliente
where
    year(p.fecha_pago) = 2008;

-- Devuelve un listado con todos los clientes que sean de la ciudad
-- de Madrid y  cuyo representante de ventas tenga el código de empleado 11 o 30.
select
    c.codigo_empleado_rep_ventas,
    c.codigo_cliente,
    c.nombre_cliente
from
    cliente c
    join empleado e
where
    c.ciudad like 'Madrid'
    and c.codigo_empleado_rep_ventas = 11
    or c.codigo_empleado_rep_ventas = 30
group by
    c.codigo_cliente;

-- Apartado 2  Consultas usando composición interna     CE: 3a, 3c
-- Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select
    e.codigo_empleado,
    o.linea_direccion1
from
    oficina o
    join empleado e on o.codigo_oficina = e.codigo_oficina
where
    e.codigo_empleado_rep_ventas in (
        select
            codigo_empleado_rep_ventas
        from
            cliente
        where
            ciudad like 'Fuenlabrada'
    );

-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select
    e.nombre as 'nombre empleado',
    CONCAT(j.codigo_empleado, ' ', j.nombre) as 'codigo y nombre jefe'
from
    empleado e
    left join empleado j on e.codigo_jefe = j.codigo_empleado;

-- Apartado 3   Consultas usando composición externa      CE: 3a, 3d
-- Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
select
    e.codigo_empleado,
    e.nombre
from
    empleado e
    left join oficina o on e.codigo_oficina = o.codigo_oficina
where
    e.codigo_oficina is null;

-- Devuelve un listado de los productos que nunca han aparecido en un pedido.
-- El resultado debe mostrar el nombre, la descripción y la imagen del producto.
select
    p.codigo_producto,
    p.nombre
from
    producto p
    JOIN gama_producto g ON p.gama = g.gama
    LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE
    dp.codigo_producto IS NULL
group by
    p.nombre
order by
    p.codigo_producto;

-- Apartado 4   Consultas resumen     CE: 3a, 3e
-- Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
select
    e.nombre as 'Nombre representante',
    count(c.codigo_cliente) as 'cantidad de clientes atendidos'
from
    empleado e
    join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
group by
    e.nombre;

-- Devuelve un listado de los 20 productos más vendidos y el número total 
--de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número
-- total de unidades vendidas.
select
    p.codigo_producto,
    p.nombre,
    sum(dp.cantidad) as total_cantidad
from
    producto p
    join detalle_pedido dp on p.codigo_producto = dp.codigo_producto
group by
    p.codigo_producto,
    p.nombre
order by
    total_cantidad desc
limit
    20;

-- Apartado 5   Subconsultas    CE:3a, 3f, 3g
-- Devuelve el nombre del cliente con mayor límite de crédito:
-- usando operadores básicos de comparación
select
    c.nombre_cliente
from
    cliente c
where
    limite_credito =(
        select
            max(limite_credito)
        from
            cliente
    );

-- usando ALL / ANY
select
    c.nombre_cliente
from
    cliente c
where
    limite_credito >= all(
        select
            limite_credito
        from
            cliente
    );

-- Devuelve el nombre, apellido1 y cargo de los empleados que no representan a ningún cliente.
-- usando IN / NOT IN
select
    codigo_empleado,
    nombre,
    apellido1,
    puesto
from
    empleado
where
    codigo_empleado not in(
        select
            cliente.codigo_empleado_rep_ventas
        from
            cliente
    );

-- usando EXISTS/NOT EXISTS
select
    codigo_empleado,
    nombre,
    apellido1,
    puesto
from
    empleado e
where
    not exists (
        select
            *
        from
            cliente c
        where
            c.codigo_empleado_rep_ventas = e.codigo_empleado
    );

-- Apartado 6.   Vistas   CE: 2f (Resultado de Aprendizaje 2)
-- Crear una vista que devuelva un listado indicando todas
-- las ciudades donde hay oficinas y el número de empleados que
-- tiene. La vista debe crear un alias para cada columna que se pide.
create
or replace view vista as
select
    o.ciudad as 'ciudad',
    count(e.codigo_empleado) as 'cantidad_empleados'
from
    oficina o
    join empleado e on o.codigo_oficina = e.codigo_oficina
group by
    o.ciudad;

-- Basándote en la vista anterior se pide obtener aquellas ciudades que tienen más de 5 empleados.
select
    ciudad
from
    vista
where
    cantidad_empleados > 5;

-- Cambia el nombre de la vista a vista_tuacronimo.
rename table vista to vista_LNCO;

-- Apartado 7.   Optimización de consultas  CE:3a, 3h
-- Dada la siguiente consulta:
SELECT
    e.nombre,
    e.apellido1,
    e.apellido2
FROM
    empleado AS e
    JOIN oficina AS o ON o.codigo_oficina = e.codigo_oficina
WHERE
    e.nombre like "A%";

-- Mostrar los índices iniciales que tienen las tablas que
-- intervienen en la consulta anterior. Se piden las 2 sentencias
--  explicadas en clase para mostrar información de los índices,
--  explicando la salida de ambas sentencias.
-- Ejecuta y muestra el resultado, indica qué realiza la consulta y 
-- justifica  el  número de comparaciones que han sido necesarias.
show index
from
    empleado;

show index
from
    oficina;

-- Optimiza la consulta anterior para que haya menos comparaciones. 
--Justifica los pasos dados, teniendo en cuenta que la consulta se hace sobre un JOIN.
explain
SELECT
    e.nombre,
    e.apellido1,
    e.apellido2
FROM
    empleado AS e
    JOIN oficina AS o ON o.codigo_oficina = e.codigo_oficina
WHERE
    e.nombre like "A%";

-- Crea una consulta “optimizada”  que devuelva todos nombres
-- de empleados que comienzan por A. Justifica y muestra el resultado.
alter table
    empleado
add
    index idx_nombre(nombre);

explain
select
    nombre
from
    empleado
where
    nombre like 'A%';

-- Crea una consulta “optimizada”  que devuelva todos
-- nombres de empleados que contengan la palabra “Carlos” pero que no
-- la palabra “Juan”.  Justifica y muestra el resultado.
explain
select
    nombre
from
    empleado
where
    nombre like '%Carlos%'
    and nombre not like '%Juan%';