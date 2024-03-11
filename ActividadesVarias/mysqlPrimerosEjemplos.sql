create database cadenatiendas;

use cadenatiendas;

create table tiendas(
    nif varchar(10),
    nombre varchar(20),
    direccion varchar(20),
    poblacion varchar(20),
    provincia varchar(20),
    codpostal tinyint
);

create table fabricantes(
    cod_fabricante tinyint,
    nombre varchar(15),
    pais varchar(15)
);

create table articulos(
    articulo varchar(20),
    cod_fabricante tinyint,
    peso tinyint,
    categoria varchar(10),
    precio_venta smallint,
    precio_costo smallint,
    existencias smallint
);

create table ventas(
    nif varchar(10),
    articulo varchar(20),
    cod_fabricante tinyint,
    peso tinyint,
    categoria varchar(10),
    fecha_pedido date,
    unidades_pedidas smallint,
    existencias smallint
);

create table pedidos(
    nif varchar(10),
    articulo varchar(20),
    cod_fabricante tinyint,
    peso tinyint,
    categoria varchar(10),
    fecha_pedido date,
    unidades_pedidas smallint,
    existencias smallint
);

-- añadimos restricciones.
--TABLA TIENDAS
alter table
    tiendas
add
    primary key (nif);

alter table
    tiendas
modify
    nombre varchar(30) not null;

--TABLA FABRICANTES
alter table
    fabricantes
add
    primary key(cod_fabricante);

--TABLA ARTÍCULOS
alter table
    articulos
add
    primary key(articulo, cod_fabricante, peso, categoria);

alter table
    articulos
add
    foreign key (cod_fabricante) references fabricantes (cod_fabricante);

alter table
    articulos
add
    check(
        precio_venta > 0
        and precio_costo > 0
        and peso > 0
    );

alter table
    articulos
add
    check(
        categoria = 'Primera'
        or categoria = 'Segunda'
        or categoria = 'Tercera'
    );

--TABLA PEDIDOS
alter table
    pedidos
add
    primary key(
        nif,
        articulo,
        cod_fabricante,
        peso,
        categoria,
        fecha_pedido
    );

alter table
    pedidos
add
    foreign key(nif, cod_fabricante, peso, categoria, articulo) references tiendas(nif),
    articulos(cod_fabricante, peso, categoria, articulo);

alter table
    pedidos
add
    foreign key(cod_fabricante, peso, categoria, articulo) references articulos(cod_fabricante, peso, categoria, articulo);