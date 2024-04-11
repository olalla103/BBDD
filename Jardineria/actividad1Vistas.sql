-- 1. Escriba una vista que se llame listado_pagos_clientes que
-- muestre un listado donde aparezcan todos los clientes y los pagos
-- que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas:
-- nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago,
-- total del pago, id de la transacción
create
or replace view listado_de_pagos_clientes as
select
    concat(
        c.nombre_contacto,
        ' ',
        c.apellido_contacto
    ) as 'nombre_apellido',
    c.telefono,
    c.ciudad,
    c.pais,
    p.fecha_pago,
    p.id_transaccion,
    p.forma_pago,
    p.total
from
    cliente c
    join pago p on c.codigo_cliente = p.codigo_cliente;

-- 2. Escriba una vista que se llame listado_pedidos_clientes que muestre
-- un listado donde aparezcan todos los clientes y los pedidos que ha realizado
-- cada uno de ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos
-- del cliente concatenados, teléfono, ciudad, país, código del pedido, fecha del pedido, fecha esperada,
-- fecha de entrega y la cantidad total del pedido, que será la suma del 
--producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
create
or replace view listado_pedidos_clientes as
select
    c.codigo_cliente,
    concat(c.nombre_contacto, ' ', c.apellido_contacto) as 'nombre_apellido',
    c.telefono,
    c.ciudad,
    c.pais,
    p.codigo_pedido,
    p.fecha_pedido,
    p.fecha_esperada,
    p.fecha_entrega,
    (
        select
            sum(cantidad * precio_unidad)
        from
            detalle_pedido
    ) as 'cantidad_total'
from
    cliente c
    join pedido p on c.codigo_cliente = p.codigo_pedido;

-- 3. Utilice las vistas que ha creado en los pasos
-- anteriores para devolver un listado de los clientes de la ciudad
-- de Madrid que han realizado pagos.
select
    nombre_apellido
from
    listado_de_pagos_clientes
where
    ciudad like 'Madrid';

-- 4. Utilice las vistas que ha creado en los pasos anteriores para devolver un 
--listado de los clientes que todavía no han recibido su pedido.
select
    nombre_apellido
from
    listado_pedidos_clientes
where
    fecha_entrega is null;

-- 5. Utilice las vistas que ha creado en los pasos anteriores para calcular el número
-- de pedidos que ha realizado cada uno de los clientes.
select
    nombre_apellido,
    count(codigo_pedido) as 'cantidad de pedidos'
from
    listado_pedidos_clientes
group by
    codigo_cliente
order by
    nombre_apellido asc;

-- 6. Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del
-- pedido máximo y mínimo que ha realizado cada cliente.
select
    nombre_apellido,
    max(total) as 'máximo',
    min(total) as 'mínimo'
from
    listado_de_pagos_clientes
group by
    nombre_apellido;

-- 7. Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos.
-- Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando
-- el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.
rename table listado_de_pagos_clientes to listado_de_pagos;

-- 8. Elimine las vistas que ha creado en los pasos anteriores.
drop view listado_de_pagos;

drop view listado_pedidos_clientes;