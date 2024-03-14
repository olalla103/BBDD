-- 1. Devuelve un listado con todos los pedidos que se han realizado.
select * from pedido;
-- 2. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
-- Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido order by  total desc, fecha desc limit 2;
-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct(id_cliente) from pedido;
-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017,
-- cuya cantidad total sea superior a 500€.
select * from pedido where year(fecha) = 2017 and total > 500;
-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
select nombre, concat(apellido1,' ',apellido2) as apellidos from comercial where comisión between 0.05 and 0.11;
-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select max(comisión) from comercial;
-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo
-- apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from cliente where apellido1 is not null order by apellido1,apellido2,nombre;
-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y
-- también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
select nombre from cliente where nombre like 'A%N' or nombre like 'P%' order by nombre;
-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado 
--alfabéticamente.
select nombre from cliente where nombre not like 'A%' order by nombre;
-- 10. Devuelve un listado con los nombres de los comerciales que terminan por el o o.
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.
 select distinct(nombre) from comercial where nombre like '%o';
