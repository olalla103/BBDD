create database alquilerCoches;
use alquilerCoches;

create table cliente(
    cod_cliente varchar(10),
    DNI varchar(10),
    nombre varchar(10),
    direccion varchar(10),
    telefono varchar(10)
);

create table reserva(
    numero varchar(10),
    fecha_inicio varchar(10),
    fecha_fin varchar(10),
    precioTotal varchar(10),
    cod_cliente varchar(10)
);

create table coche(
    matricula varchar(10),
    marca varchar(10),
    modelo varchar(10),
    color varchar(10),
    precio_Hora varchar(10)
);

create table avala(
    avalado varchar(10),
    avalador varchar(10)
);

create table incluye(
    numero varchar(10),
    matricula varchar(10),
    litrosGas varchar(10)
);

--TABLA CLIENTE
alter table
    cliente
add
    primary key (cod_cliente);

--TABLA RESERVA
alter table
    reserva
add
    primary key (numero);

alter table
    reserva
add
    foreign key (cod_cliente) references cliente (cod_cliente);

--TABLA COCHE
alter table
    coche
add
    primary key (matricula);

--TABLA AVALA
alter table
    avala
add
    primary key(avalado);

alter table
    avala
add
    foreign key(avalado) references cliente (cod_cliente);

alter table
    avala
add
    foreign key(avalador) references cliente (cod_cliente);

--TABLA INCLUYE
alter table
    incluye
add
    primary key (numero, matricula);

alter table
    incluye
add
    foreign key (numero) references reserva(numero);

alter table
    incluye
add
    foreign key(matricula) references coche(matricula);

--CAMBIO A LOS DATOS
--TABLA CLIENTE
alter table cliente modify cod_cliente tinyint;
alter table cliente modify direccion varchar(100);

--TABLA COCHE
alter table coche modify precio_Hora double;

--TABLA RESERVA
alter table reserva modify fecha_inicio date, modify fecha_fin date;
alter table reserva modify precioTotal double, modify cod_cliente tinyint, modify numero tinyint;

--TABLA AVALA
alter table avala modify avalado tinyint, modify avalador tinyint;

--TABLA INCLUYE
alter table incluye modify numero tinyint;