-- 1. Escriba una vista que se llame listado_pagos_clientes que
-- muestre un listado donde aparezcan todos los clientes y los pagos
-- que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas:
-- nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago,
-- total del pago, id de la transacción
create
or replace view listado_pagos_clientes as
select
    concat(nombre_contacto, ' ', apellido_contacto) as nombre,
    telefono,
    ciudad,
    pais,
    pago.fecha_pago as 'fecha_pago',
    total,
    id_transaccion
from
    cliente
    join pago on cliente.codigo_cliente = pago.codigo_cliente;

-- 2. Escriba una vista que se llame listado_pedidos_clientes que muestre
-- un listado donde aparezcan todos los clientes y los pedidos que ha realizado
-- cada uno de ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos
-- del cliente concatenados, teléfono, ciudad, país, código del pedido, fecha del pedido, fecha esperada,
-- fecha de entrega y la cantidad total del pedido, que será la suma del 
--producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
CREATE
OR REPLACE VIEW listado_pedidos_clientes AS
SELECT
    cliente.codigo_cliente,
    concat(nombre_contacto, ' ', apellido_contacto) as nombre,
    cliente.telefono,
    cliente.ciudad,
    cliente.pais,
    pedido.codigo_pedido,
    pedido.fecha_pedido,
    pedido.fecha_esperada,
    pedido.fecha_entrega,
    sum(
        detalle_pedido.cantidad * detalle_pedido.precio_unidad
    ) as totalpedido
FROM
    cliente
    JOIN pedido on pedido.codigo_pedido = cliente.codigo_cliente
    JOIN detalle_pedido on pedido.codigo_pedido = detalle_pedido.codigo_pedido
GROUP BY
    pedido.codigo_pedido;

-- 3. Utilice las vistas que ha creado en los pasos
-- anteriores para devolver un listado de los clientes de la ciudad
-- de Madrid que han realizado pagos.
select
    nombre
from
    listado_pagos_clientes
where
    ciudad = 'Madrid'
    and fecha_pago is not null;

-- 4. Utilice las vistas que ha creado en los pasos anteriores para devolver un 
--listado de los clientes que todavía no han recibido su pedido.
select
    nombre
from
    listado_pedidos_clientes
where
    fecha_entrega is null;

-- 5. Utilice las vistas que ha creado en los pasos anteriores para calcular el número
-- de pedidos que ha realizado cada uno de los clientes.
select
    codigo_cliente,
    count(codigo_pedido) as 'cantidad de pedidos'
from
    listado_pedidos_clientes
where
    codigo_pedido
group by
    codigo_cliente;

-- 6. Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del
-- pedido máximo y mínimo que ha realizado cada cliente.
select
    nombre,
    max(total),
    min(total)
from
    listado_de_pagos
group by
    nombre;

-- 7. Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos.
-- Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando
-- el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.
rename table listado_pagos_clientes to listado_de_pagos;

select
    *
from
    listado_de_pagos;

-- 8. Elimine las vistas que ha creado en los pasos anteriores. 
drop view listado_de_pagos;

drop view listado_pedidos_clientes;