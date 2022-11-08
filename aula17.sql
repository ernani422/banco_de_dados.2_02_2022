drop database if exists calendars;
create database calendars;
use calendars;

create table calendars(
    id int auto_increment,
    fulldate date unique,
    day tinyint not null,
    month tinyint not null,
    quarter tinyint not null,
    year int not null,
    primary key (id)

);

delimiter $$

create procedure InsertCalendars(dt date)
begin
    insert into calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    value(
        dt,
        extract(DAY FROM dt),/* FUNÇÃO CONSTANTE QUE EXTRAI A DATA*/
        extract(MONTH FROM dt),
        extract(QUARTER FROM dt),
        extract(YEAR FROM dt)
    );
end $$

delimiter ;

call InsertCalendars("2021-11-22");
call InsertCalendars("2021-09-22");

select * from calendars;

/*------------------------------------------------------------------------*/
delimiter $$

create procedure LoadCalendars(
    startDate Date, /* insere day == dias int apartir de start date*/
    day int
)
begin
    declare counter int default 1;/*== acaso n inserir o set*/
    declare dt date default startDate;

    while counter <= day DO /* como nao usa array , ele usa while por opcao*/
        call InsertCalendars(dt);
        set counter = counter + 1;
        set dt = DATE_ADD(dt,interval 1 day);
    end while;
end $$

delimiter ;

call LoadCalendars("2022-05-12",10);

select * from calendars;

/*----------------------------------------------------------------------*/

/*-----*/
delimiter $$

 create procedure RepeatDemo()
 begin
    declare counter int default 1;
    declare result varchar (100) default '';

    Repeat
        set result = concat(result, counter, ',');
        select result as 'log';
        set counter = counter + 1;
    until counter >= 10
    end repeat;

    /*--display result--*/
    select result as resultado;
end $$

delimiter ;

 call RepeatDemo();

 /*---------------------------------------------------------------------*/