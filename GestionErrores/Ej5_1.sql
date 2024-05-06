create database cine;

use cine;

create table cuentas(
    id_cuenta int unsigned,
    saldo float unsigned,
    primary key(id_cuenta)
);

create table entradas(id_butaca int unsigned, nif varchar(9));

-- procedimiento sin nada
-- IDC es id de cuenta
-- IDB es id de butaca
delimiter //
drop procedure if exists comprar_entrada //
create procedure comprar_entrada(in DNI varchar(9),in IDC int,in IDB int)
begin
    update cuentas set saldo=saldo-5 where id_cuenta=IDC;
    insert into entradas (id_butaca,nif) values (IDB,DNI)
end
//
delimiter ;