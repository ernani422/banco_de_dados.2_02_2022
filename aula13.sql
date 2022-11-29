drop database if exists transaction_rollback;
create database transaction_rollback;

use transaction_rollback;

create table if not exists musics (

    musics_id integer primary key auto_increment,
    name_of_music varchar(20) not null,
    band varchar (255) not null,
    create_at datetime default now()
    
);



insert INTO musics(name_of_music,band) values
('Nothing else matters','Vulgosado'),
('Ender sandam','Hallstar'),
('Rosenrot' ,'Rammstein'),
('La plata' , 'Malucena'),
('Icaro ' , 'OsIniadertais'),
('Cafe' , 'Mc Maroto'),
('La Loto ','Anitta');



select "before delete row of musics table " as 'log';

select * from musics;

set autocommit=0;

start transaction;
    delete from musics where name_of_music = 'la Loto';
 

select "after delete row of musics table" as 'log';

select * from musics;

rollback;

select "ROLLBACK EXECUTED " AS 'LOG';

select * from musics;

set autocommit=1;




/*show engines obs: diretrizes gerais de  como o banco de dados
se comporta */

set autocommit=0;
alter TABLE 

start transaction;
    delete from musics where name_of_music = 'la Loto';
   

select "after delete row of musics table" as 'log';
/*

COMMIT;

select "COMMIT EXECUTED " AS 'LOG';

select * from musics;

*/

rollback;

select "ROLLBACK EXECUTED " AS 'LOG';

select * from musics;

set autocommit=1;


select "this Scenario is with  rollback  " as 'log';

select "before delete row of musics table " as 'log';

select * from musics;

set autocommit=0;

start transaction;
    select "ROLLBACK em alter table " AS 'LOG';
    alter table musics add good boolean ;

    update
     musics
        set
            good =1
        where
            band in ('Metalica','Rammstein');

            update
     musics
        set
            good = 0
        where
            band in ('Anitta');

select "after delete row of musics table" as 'log';

select * from musics;

rollback;

select "ROLLBACK EXECUTED " AS 'LOG';

select * from musics;

set autocommit=1;


/*show engines obs: diretrizes gerais de  como o banco de dados
se comporta 
*/
set autocommit=0;
alter TABLE 

start transaction;
    delete from musics where name_of_music = 'la Loto';
   

select "after delete row of musics table" as 'log';

COMMIT;

select "COMMIT EXECUTED " AS 'LOG';

select * from musics;


rollback;

select "ROLLBACK EXECUTED " AS 'LOG';

select * from musics;

set autocommit=1;


start transaction;
    alter table musics add good boolean;

    update
        musics
    set
     good = 1
    where
     band in('metalica','rammstein');

     update
      musica
    set
     good =0
    where
     band = 'anitta';

     select "aftaer dlete row of musics table" as log 

     /*select table_name, engine from information_schema.tables where table_schema = 'transaction_rolllbak';*/

