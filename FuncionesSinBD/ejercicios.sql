-- Escribe una función que reciba como parámetro de entrada un valor numérico
-- que represente un día de la semana y que devuelva una cadena de caracteres con
-- el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1
-- debería devolver la cadena lunes.
delimiter //
begin drop function if exists diaSemana //
create function diaSemana(dia int) returns varchar(30)
case
    when dia = 1 then return 'Lunes';

    when dia = 2 then return 'Martes';

    when dia = 3 then return 'Miércoles';

    when dia = 4 then return 'Jueves';

    when dia = 5 then return 'Viernes';

    when dia = 6 then return 'Sábado';

    when dia = 7 then return 'Domingo';

    else return 'Ese día no existe';

end case
;

end / / delimiter;

-- Escribe una función que devuelva como salida el número de años que han
-- transcurrido entre dos fechas que se reciben como parámetros de entrada.
-- Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01
-- la función tiene que devolver que han pasado 10 años.
-- OPCIÓN CON DATEDIFF
delimiter //
drop function if exists cantidadAnios//
create function cantidadAnios(f1 date,f2 date) returns int
begin
    declare anios int default 0;
    set anios=DATEDIFF(f1,f2)/365;
    return anios;
end
//
delimiter ;

-- OPCIÓN TRUNCATE
delimiter //
drop function if exists cantidadAnios//
create function cantidadAnios(f1 date,f2 date) returns int
begin
    declare dias int;
    declare anios int default 0;
    set dias=DATEDIFF(f1,f2);
    set anios=TRUNCATE(dias/365,0);
    return anios;
end
//
delimiter ;

-- Escribe una función que devuelva el valor del área de un círculo a partir
-- del valor del radio que se recibirá como parámetro de entrada.
delimiter // 
drop function if exists areaCirculo // 
create function areaCirculo(radio float) returns float
begin
declare area float default 0.0;
set area = PI() * power(radio,2);
return area;
end 
// 
delimiter ;

-- Escribe una función que reciba una cadena de
--  entrada y devuelva la misma cadena pero sin acentos.
-- La función tendrá que reemplazar todas las vocales que tengan
-- acento por la misma vocal pero sin acento. Por ejemplo, si la función
-- recibe como parámetro de entrada la cadena María la función debe devolver
-- la cadena Maria.
delimiter //
drop function if exists eliminar_acentos //
create function eliminar_acentos(entrada varchar(255))
returns varchar(255)
begin
    declare resultado varchar(255);
    declare i int default 1;
    declare len int;
    declare c char(1);

    -- Mapeo de caracteres acentuados a sus equivalentes sin acento
    declare acentos text default 'áéíóúÁÉÍÓÚüÜ';
    declare sin_acentos text default 'aeiouaeiouuu';

    set len = CHAR_LENGTH(entrada);
    set salida = '';

    while i <= len do
        set c = substring(entrada, i, 1);
        if locate(c, acentos) > 0 then
            set c = substring(sin_acentos, locate(c, acentos), 1);
        end if;
        set salida = concat(salida, c);
        set i = i + 1;
    end while;

    return salida;
end;


