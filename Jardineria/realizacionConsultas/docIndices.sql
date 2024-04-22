-- creo índice en la tabla cliente, columna pais
create index idx_pais on cliente(pais);

-- crea índice de tipo unique sobre la columna email
create unique index idx_email on empleado(email);

-- crea un índice con varias columnas
create index idx_apellido_nombre on cliente(apellido_contacto, nombre_contacto);

-- crea un índice con prefijo de una columna, dando otro valor
create index idx_nombre_cliente on cliente(nombre_cliente(25));

-- índices con fulltext
create fulltext index idx_nombre_descripcion on producto(nombre, descripcion);

-- consulta en el índice
select
    *
from
    producto
where
    match(nombre, descripcion) against('acero');

-- eliminar indice
drop index idx_nombre_cliente on cliente;

-- Ejemplo de optimización de consultas
EXPLAIN
SELECT
    nombre_contacto,
    telefono
FROM
    cliente
WHERE
    pais = 'France';

-- apartado 1.2.2 del documento
CREATE FULLTEXT INDEX idx_nombre_descripcion ON producto(nombre, descripcion);

select
    *
from
    producto
where
    match(nombre, descripcion) against('acero');

-- Ejercicios
explain
SELECT
    *
FROM
    producto
WHERE
    codigo_producto = 'OR-114';

explain
SELECT
    *
FROM
    producto
WHERE
    nombre = 'Evonimus Pulchellus';