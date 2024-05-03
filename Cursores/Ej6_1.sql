drop database if exists test;

create database test;

use test;

create table alumnos(
    id int unsigned,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    fecha_nacimiento date
);

alter table
    alumnos
add
    column edad int;

-- insertamos alumnos
INSERT INTO alumnos (id, nombre, apellido1, apellido2, fecha_nacimiento)
VALUES 
    (1, 'Juan', 'García', 'López', '1999-03-15'),
    (2, 'María', 'Martínez', 'Rodríguez', '2000-05-20'),
    (3, 'Carlos', 'Fernández', 'González', '1998-09-10'),
    (4, 'Laura', 'López', 'Sánchez', '2001-11-25'),
    (5, 'Pedro', 'Díaz', 'Martínez', '1997-07-03');


-- creamos función para calcular edad
delimiter //
    drop function if exists calcular_edad //
    create function calcular_edad(fecha_nacimiento date) returns int
    begin 
        declare e int;
        set e = year(curdate())-year(fecha_nacimiento);
        return e;
    end
//

delimiter ;

-- creamos procedimiento
-- me da un error, me mete la misma edad en todos los registros
delimiter // 
    drop procedure if exists actualizar_columna_edad //
    create procedure actualizar_columna_edad()
    begin
        declare i date;
        declare e date;
        declare done boolean default false;
        declare curEdad cursor for select id,fecha_nacimiento from alumnos;
        declare continue handler for not found set done = true;

        -- abrimos cursor 
        open curEdad;
        bucle_lector: loop 
            -- introducimos fecha en la variable
            fetch curEdad into i;
            fetch curEdad into e;
                if done then 
                    leave bucle_lector;
                end if;
                
                update alumnos 
                    set edad=
                        calcular_edad(e) 
                        where id=i;
            set e = 0;
        end loop;
        close curEdad;
            
    end 
//
delimiter ;