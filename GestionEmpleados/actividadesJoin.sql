-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select
    e.nombre,
    d.*
from
    empleado e
    join departamento d on e.id_departamento = d.id;

-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y 
--en segundo lugar por los apellidos y el nombre de los empleados.
select
    e.nombre,
    e.id,
    d.*
from
    empleado e
    join departamento d on e.id_departamento = d.id
order by
    d.nombre asc,
    e.apellido1 asc,
    e.apellido2 asc,
    e.nombre;

-- Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos
-- departamentos que tienen empleados.
select
    distinct(d.id),
    d.nombre
from
    departamento d
    left join empleado e on e.id_departamento = d.id
where
    e.id_departamento is not null;

-- Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto
-- actual del que dispone, solamente de aquellos departamentos que tienen empleados.
select
    distinct(d.id),
    d.nombre,
    d.presupuesto - d.gastos as 'presupuesto actual'
from
    departamento d
    left join empleado e on d.id = e.id_departamento
where
    e.id_departamento is not null;

-- Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select
    d.nombre
from
    departamento d
    join empleado e on e.id_departamento = d.id
where
    e.nif = '38382980M';

-- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select
    d.nombre
from
    departamento d
    join empleado e on e.id_departamento = d.id
where
    e.nombre = 'Pepe'
    and e.apellido1 = 'Ruiz'
    and e.apellido2 = 'Santana';

-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
-- Ordena el resultado alfabéticamente.
select
    e.*
from
    departamento d
    join empleado e on e.id_departamento = d.id
where
    d.nombre = 'I+D'
order by
    d.nombre asc;

-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas,
-- Contabilidad o I+D. Ordena el resultado alfabéticamente.
select
    e.*
from
    departamento d
    join empleado e on e.id_departamento = d.id
where
    d.nombre = 'I+D'
    or d.nombre = 'Sistemas'
    or d.nombre = 'Contabilidad'
order by
    e.id;

-- Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros.
select
    e.nombre
from
    empleado e
    join departamento d on e.id_departamento = d.id
where
    d.presupuesto not between 100000
    and 200000;

-- Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo
-- apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
select
    distinct(d.nombre)
from
    empleado e
    right join departamento d on e.id_departamento = d.id
where
    e.apellido2 is null;

-- con left y right join
-- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
select
    e.*,
    d.*
from
    empleado e
    left join departamento d on e.id_departamento = d.id;

-- Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select
    e.*
from
    empleado e
    left join departamento d on e.id_departamento = d.id
where
    e.id_departamento is null;

-- Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
select
    d.*
from
    empleado e
    right join departamento d on e.id_departamento = d.id
where
    e.id_departamento is null;

-- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos
-- que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

    select
        *
    from
        empleado e
        left join departamento d on e.id_departamento = d.id
    where
        d.id is null

union
(
    select
        *
    from
        empleado em
        right join departamento de on em.id_departamento = de.id
    where
        em.id_departamento is null
    order by
        de.nombre
);

-- Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos
-- que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
select
    e.*,
    d.*
from
    empleado e
    right join departamento d on e.id_departamento = d.id
order by
    d.nombre;