-- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select
    sum(total)
from
    pedido;

-- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select
    avg(total)
from
    pedido;

-- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select
    count(distinct(id))
from
    comercial;

-- Calcula el número total de clientes que aparecen en la tabla cliente.
select
    count(id)
from
    cliente;

-- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select
    max(total)
from
    pedido;

-- Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select
    min(total)
from
    pedido;

-- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select
    max(categoría)
from
    cliente
group by
    ciudad;

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes.
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
--Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha
-- realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
select
    c.id,
    c.nombre,
    concat(c.apellido1, ' ', c.apellido2) as apellidos,
    p.fecha,
    max(p.total)
from
    cliente c
    join pedido p on c.id = p.id_cliente
group by
    day(p.fecha);

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes,
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
select
    c.id,
    c.nombre,
    concat(c.apellido1, ' ', c.apellido2) as apellidos,
    p.fecha,
    max(p.total)
from
    cliente c
    join pedido p on c.id = p.id_cliente
where
    p.total > 2000
group by
    day(p.fecha);

-- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17.
-- Muestra el identificador del comercial, nombre, apellidos y total.
select
    c.id,
    c.nombre,
    concat(c.apellido1, ' ', c.apellido2) as apellidos,
    max(p.total)
from
    pedido p
    join comercial c on c.id = p.id_comercial
where
    p.fecha = '2016-08-17'
group by
    p.id_comercial;

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos
-- que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select
    c.id,
    c.nombre,
    concat(c.apellido1, ' ', c.apellido2) as apellidos,
    count(p.id) as 'cantidad de pedidos'
from
    cliente c
    left join pedido p on c.id = p.id_cliente
group by
    p.id_cliente;

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos
-- que ha realizado cada uno de clientes durante el año 2017.
select
    c.id,
    c.nombre,
    concat(c.apellido1, ' ', c.apellido2) as apellidos,
    count(p.id) as 'cantidad de pedidos'
from
    cliente c
    join pedido p on c.id = p.id_cliente
where
    year(p.fecha) = 2017;

-- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el
-- valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe
-- mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos
-- realizados es 0. Puede hacer uso de la función IFNULL.
select
    c.id,
    c.nombre,
    c.apellido1,
    ifnull(max(p.total), 'nada') as total
from
    cliente c
    left join pedido p on c.id = p.id_cliente
group by
    p.id_cliente;

-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select
    id,
    max(total)
from
    pedido
group by
    year(fecha);

-- Devuelve el número total de pedidos que se han realizado cada año.
select
    count(id) as 'número total de pedidos'
from
    pedido
group by
    year(fecha);