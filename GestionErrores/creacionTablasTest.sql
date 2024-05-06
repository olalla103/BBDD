DROP DATABASE if EXISTS tests;

CREATE DATABASE tests;

USE TESTS;

CREATE TABLE IF NOT EXISTS alumno(
    id INT unsigned PRIMARY KEY,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50)
);

-- creacion del usuario testUser
CREATE USER 'testUser' @'%' IDENTIFIED BY 'testUser';

GRANT all PRIVILEGES on tests.* to 'tests' @'%';

FLUSH PRIVILEGES;