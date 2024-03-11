create database bd_prueba_lnco;
use bd_prueba_lnco;

ADD CONSTRAINT fk_nombre_constraint
FOREIGN KEY (nombre_columna_foranea)
REFERENCES tabla_principal(nombre_columna_referenciada)
ON DELETE CASCADE;
alter table actores alter fecha fechaNac date not null;

create table actores(
    codigo tinyint auto_increment,
    nombre varchar(50) not null,
    fecha date not null,
    nacionalidad varchar(100) not null,
    constraint pk_actores_lnco primary key (codigo)
);

create table personajes(
    codigo tinyint auto_increment,
    nombre varchar(50) not null,
    raza varchar(50) not null,
    grado varchar(60) not null,
    codigoActor tinyint not null,
    codigoSuperior tinyint not null,
    constraint pk_personajes_lnco primary key (codigo),
    constraint fk_actores_lnco foreign key (codigoActor) references actores(codigo), 
    constraint fk_personajes_lnco foreign key (codigoSuperior) references personajes(codigo)
);

create table planetas(
    codigo tinyint auto_increment,
    galaxia varchar(100) not null,
    nombre varchar(100) not null,
    constraint pk_planetas_lnco primary key (codigo)
);
ALTER TABLE Planetas
ADD Galaxia ENUM('Vía Láctea', 'Andrómeda', 'Sombrero') NOT NULL;


create table capitulos(
    temporada tinyint not null,
    orden tinyint not null,
    titulo varchar(100) not null,
    fecha date not null,
    constraint pk_capitulos_lnco primary key (temporada,orden)
);

create table peliculas(
    codigo tinyint auto_increment,
    titulo varchar(100) not null,
    director varchar (50) not null,
    anio int not null,
    constraint pk_peliculas_lnco primary key (codigo)
);

create table naves(
    codigo tinyint auto_increment,
    numTripulantes tinyint not null,
    nombre varchar(50) not null,
    constraint pk_naves_lnco primary key (codigo)
);

create table personajesCapitulos(
    codigoPersonaje tinyint not null,
    temporada tinyint not null,
    orden tinyint not null,
    constraint pk_personajesCapitulos_lnco primary key (codigoPersonaje,temporada,orden),
    constraint fk_personajes2_lnco foreign key (codigoPersonaje) references personajes(codigo),
    constraint fk_capitulos1_lnco foreign key (temporada,orden) references capitulos(temporada,orden) 
);


create table personajesPeliculas(
    codigoPersonaje tinyint not null,
    codigoPelicula tinyint not null,
    constraint pk_personajesPeliculas primary key (codigoPersonaje,codigoPelicula),
    constraint fk_personajes1_lnco foreign key (codigoPersonaje) references personajes(codigo),
    constraint fk_peliculas1_lnco foreign key (codigoPelicula) references peliculas(codigo)
);

create table visitas(
    codigoNave tinyint not null,
    codigoPlaneta tinyint not null,
    temporada tinyint not null,
    orden tinyint not null,
    problema varchar(100) not null,
    constraint pk_visitas_lnco primary key (codigoNave,codigoPlaneta,temporada,orden),
    constraint fk_naves_lnco foreign key (codigoNave) references naves(codigo),
    constraint fk_planetas_lnco foreign key(codigoPlaneta) references planetas(codigo),
    foreign key fk_capitulos_lnco (temporada,orden) references capitulos(temporada,orden)
);


 

