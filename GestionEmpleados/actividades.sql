-- 1. Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.
select nombre, (presupuesto-gastos) as 'Presupuesto actual' from departamento;

-- 2. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by nombre asc;

-- 3. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamento order by nombre desc;

-- 4. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo
--en cuenta en primer lugar sus apellidos y luego su nombre.
select concat(apellido1,' ',apellido2) as 'Apellidos', nombre from empleado order by apellido1,nombre;

-- 5. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre,(presupuesto-gastos) as 'presupuesto' from departamento order by presupuesto desc limit 3;

-- 6. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamento order by presupuesto asc limit  3;

-- 7. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre,gastos from departamento order by gastos desc limit 2;

-- 8. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre,gastos from departamento order by gastos asc limit 2;

-- 9. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado.
-- La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas
-- de la tabla empleado.
select * from empleado limit 5 offset 2;

-- 10. Devuelve una lista con el nombre de los departamentos y el presupuesto, de 
-- aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre,presupuesto from departamento where presupuesto>=150000;

-- 11. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que
-- tienen menos de 5000 euros de gastos.
select nombre, gastos from departamento where gastos<5000;

-- 12. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos
-- que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre,presupuesto from departamento where presupuesto>=100000 or presupuesto<=20000;

-- 13. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto
-- entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre from departamento where presupuesto< 100000 or presupuesto > 200000;

-- 14. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros.
-- Utilizando el operador BETWEEN.
select nombre from departamento where presupuesto between 100000 and 200000;

-- 15. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
-- Utilizando el operador BETWEEN.
select nombre from departamento where presupuesto not between 100000 and 200000;

-- 16. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
-- de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
select nombre,gastos,presupuesto from departamento where gastos>presupuesto; 

-- 17. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
-- de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
select nombre,gastos,presupuesto from departamento where gastos<presupuesto; 

-- 18. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
-- de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
select nombre,gastos,presupuesto from departamento where gastos = presupuesto;

-- 19. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;

-- 20. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 is not null;

-- 21. Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2 = "López";

-- 22. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2='Díaz' or apellido2='Moreno';

-- 23. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in('Díaz','Moreno');

-- 24. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre,concat(apellido1,apellido2) as 'apellidos',nif from empleado where id_departamento=3;

-- 25. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre, nif, concat(apellido1,' ',apellido2) as apellidos from empleado where id_departamento in (2, 4, 5);
