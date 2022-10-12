select "use mysql database" as "info";
use mysql;

/*-----------------------------------------------*/

select "drop database aula 1 if exists" as "info";
drop database if exists aula1;

/*-----------------------------------------------*/

select "the creation of database" as "info";
create database aula1;

/*-----------------------------------------------*/

select "use of database" as "info";
use aula1;

/*-----------------------------------------------*/

select "drop TABLE students if exists" as "INFO";
drop table if exists students;

/*-----------------------------------------------*/

create table students(
    id_studend         integer not null primary key AUTO_INCREMENT,
    first_name         varchar(255) not null,
    last_name          varchar(255) not null,
    gender             ENUM('MA','FE'),
    code_registration  integer unique,
    status             boolean default true,
    created_at         datetime default NOW(),
    deleted_at         datetime
);

/*-----------------------------------------------*/

describe students;

insert into students (
    first_name,
    last_name,
    gender,
    code_registration
)
values
(
    'brunno',
    'oliveira',
    'Ma',
    1
),
(
    'douglas',
    'arving',
    'MA',
    2
),
(
    'ernani',
    'paz',
    'MA',
    3
);

select * from students; /*selecionando todos/*/

select 
    "select specific coumns"
as
    "infor";

select
    first_name,
    last_name,
    gender
from
    students;

select 
    "select specific coumns - versio 2"
as
    "infor";

select
    students.first_name,
    students.last_name, 
    students.gender
from
    students;

select 
    "select specific coumns - versio 3"
as
    "infor";

select
    aula1.students.first_name,
    aula1.students.last_name, 
    aula1.students.gender
from
    aula1.students;

select 
    "select specific coumns - versio 4"
as
    "infor";

select
    aula1.students.first_name as primeiro_nome,
    aula1.students.last_name as segundo_nome,
    aula1.students.gender as sexo
from
    students
where
    students.first_name = "ernani";