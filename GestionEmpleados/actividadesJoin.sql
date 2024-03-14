-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre, d.* from empleado e join departamento d on empleado
-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y 
--en segundo lugar por los apellidos y el nombre de los empleados.

-- Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos
-- departamentos que tienen empleados.

-- Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto
-- actual del que dispone, solamente de aquellos departamentos que tienen empleados.
-- El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial
-- (columna presupuesto) el valor de los gastos que ha generado (columna gastos).

-- Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

-- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
-- Ordena el resultado alfabéticamente.

-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas,
-- Contabilidad o I+D. Ordena el resultado alfabéticamente.

-- Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros.

-- Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo
-- apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

-- con left y right join
-- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.

-- Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.

-- Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

-- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos
-- que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

-- Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos
-- que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

