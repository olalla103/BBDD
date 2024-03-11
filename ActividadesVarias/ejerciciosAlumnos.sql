-- 1
select
    date_format(fecha_nacimiento, '%d,%m,%Y') as 'Fecha de nacimiento',
    day(fecha_nacimiento) as 'Día de nacimiento',
    month(fecha_nacimiento) as 'Mes de nacimiento',
    year(fecha_nacimiento) as 'Año de nacimiento'
from
    alumno
limit
    4;

-- 2
select
    date_format(fecha_nacimiento, '%d,%m,%Y') as 'Fecha de nacimiento',
    dayname(fecha_nacimiento) as 'Día de la semana',
    monthname(fecha_nacimiento) as 'Mes de nacimiento'
from
    alumno
limit
    3;

-- 3
select
    date_format(fecha_nacimiento, '%d,%m,%Y') as 'Fecha de nacimiento',
    datediff(now(), fecha_nacimiento) as 'Diferencia de días entre la fecha de nacimiento y hoy'
from
    alumno;

-- 4
select
    date_format(fecha_nacimiento, '%d,%m,%Y') as 'Fecha de nacimiento',
    truncate(datediff(now(), fecha_nacimiento) / 365.25, 0) as 'Edad'
from
    alumno;