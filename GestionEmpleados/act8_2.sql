-- Con operadores básicos de comparación:
-- Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
select
    e.*
from
    empleado e,
    departamento d
where
    e.id_departamento = d.id
    and d.id =(
        select
            id
        from
            departamento
        where
            nombre = 'Sistemas'
    );

-- Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
select
    nombre
from
    departamento
where
    presupuesto =(
        select
            max(presupuesto)
        from
            departamento
    );

-- Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
select
    nombre
from
    departamento
where
    presupuesto =(
        select
            min(presupuesto)
        from
            departamento
    );

-- Con ALL y ANY
-- Devuelve el nombre del departamento con mayor presupuesto y
-- la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
select
    nombre,
    presupuesto
from
    departamento
where
    presupuesto >= ALL (
        select
            presupuesto
        from
            departamento
    );

-- Devuelve el nombre del departamento con menor presupuesto y la cantidad
-- que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
select
    nombre,
    presupuesto
from
    departamento
where
    presupuesto <= ALL (
        select
            presupuesto
        from
            departamento
    );

-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
select
    nombre
from
    departamento
where
    id = ANY (
        select
            id_departamento
        from
            empleado
    );

-- Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
-- preguntar
select
    nombre
from
    departamento
where
    id = ANY(
        select
            id_departamento
        from
            empleado
        where
            id_departamento is null
    );

-- Con IN y NOT IN
-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
select
    nombre
from
    departamento
where
    id in (
        select
            id_departamento
        from
            empleado
    );

-- Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
-- preguntar
select
    id,
    nombre
from
    departamento
where
    id not in (
        select
            id_departamento
        from
            empleado
        where
            id_departamento is not null
    );

-- Con EXISTS y NOT EXISTS
-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
select
    nombre
from
    departamento
where
    id exists(
        select
            id_departamento
        from
            empleado
        where
            id_departamento is not null
    );

-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).