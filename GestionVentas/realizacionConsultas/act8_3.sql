-- Con operadores básicos de comparación:
-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select
    p.id,
    p.total
from
    pedido p
where
    id_cliente =(
        select
            id
        from
            cliente
        where
            nombre like 'Adela'
            and apellido1 like 'Salas'
            and apellido2 like 'Díaz'
    );

-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select
    count(id) as 'Cantidad de pedidos'
from
    pedido
where
    id_cliente =(
        select
            id
        from
            cliente
        where
            nombre like 'Daniel'
            and apellido1 like 'Sáez'
            and apellido2 like 'Vega'
    );

-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
select
    *
from
    cliente
where
    id =(
        select
            id_cliente
        from
            pedido
        where
            total =(
                select
                    max(total)
                from
                    pedido
                where
                    year(fecha) = 2019
            )
    );

-- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
select
    p.fecha,
    min(p.total)
from
    pedido p
where
    p.id_cliente =(
        select
            id
        from
            cliente
        where
            nombre like 'Pepe'
            and apellido1 like 'Ruiz'
            and apellido2 like 'Santana'
    );

-- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado
-- un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante
-- ese mismo año.
select
    c.id,
    c.nombre,
    concat(c.apellido1, ' ', c.apellido2) as apellidos,
    p.id,
    p.total
from
    cliente c
    join pedido p on c.id = p.id_cliente
where
    year(p.fecha) = 2017
    and p.total >=(
        select
            avg(total)
        from
            pedido
        where
            year(p.fecha) = 2017
    );

-- Con ALL y ANY
--  Devuelve el pedido más caro que existe en la tabla pedido sin hacer uso de MAX, ORDER BY ni LIMIT.
select
    *
from
    pedido
where
    total >= ALL(
        select
            total
        from
            pedido
    );

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
select
    c.*
from
    cliente c
where
    c.id != all(
        select
            id_cliente
        from
            pedido
    );

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
select
    nombre
from
    comercial
where
    id != all(
        select
            id_comercial
        from
            pedido
    );

-- Con IN y NOT IN
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select
    *
from
    cliente
where
    id not in (
        select
            id_cliente
        from
            pedido
    );

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select
    *
from
    comercial
where
    id not in (
        select
            id_comercial
        from
            pedido
    );

-- Con EXISTS y NOT EXISTS
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select
    id,
    nombre
from
    cliente
where
    not exists(
        select
            id_cliente
        from
            pedido
        where
            pedido.id_cliente = cliente.id
    );

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select
    id,
    nombre
from
    comercial
where
    not exists(
        select
            id_comercial
        from
            pedido
        where
            comercial.id = pedido.id_comercial
    );