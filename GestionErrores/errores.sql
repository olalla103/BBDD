delimiter //
drop procedure if exists handlerExam //
create procedure handlerExam(in a int, in b int, in c int,out x int)
begin
    declare continue handler for sqlstate '1062 '
        begin

        rollback;


end
//
delimiter ;