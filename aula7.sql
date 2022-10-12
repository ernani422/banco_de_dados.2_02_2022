drop database if exists aprendendoleft;
create database aprendendoleft;
use aprendendoleft;

drop table if exists alunos;
drop table if exists classe;
drop table if exists professores;

create table classe (
    id_classe integer not null primary key auto_increment,
    nome_classe varchar(100)not null,
    descricao text,
    ano varchar (4)not null

);

create table alunos (
    id_alunos integer not null primary key auto_increment,
    nome varchar(255)not null,
    sobrenome varchar(255)not null,
    documento varchar (200) not null,
    id_classe integer,
    foreign key (id_classe) references classe(id_classe)
);

create table professores (
    id_professores integer not null primary key auto_increment,
    nome varchar(255)not null,
    sobrenome varchar(255)not null,
    documento varchar (200) not null,
    id_classe integer,
    foreign key (id_classe) references classe(id_classe)
);

insert into classe (nome_classe, descricao,ano) values
('A','turma que entrou no inicio do ano','2021'),
('b','turma que entrou no inicio do ano','2022');

insert into alunos (nome, sobrenome,documento, id_classe)values
('Brunno','sobrenome do Brunno','aa.aaa.aaa.a',1),
('Bryan','sobrenome do Bryan','bb.bbb.bbb.b',1),
('Leandro','sobrenome do Leandro','aa.aaa.aaa.a',1),
('luan','sobrenome do Luan','bb.bbb.bbb.b',1),
('lucas','sobrenome do Lucas','aa.aaa.aaa.a',2),
('Sryon','sobrenome do Aryon','bb.bbb.bbb.b',2),
('Raphael','sobrenome do Raphael','aa.aaa.aaa.a',2),
('Leticia','sobrenome do Leticia','bb.bbb.bbb.b',2),
('Pedro','sobrenome do Pedro','aa.aaa.aaa.a',2),
('Guilherme','sobrenome do Guilherme','bb.bbb.bbb.b',2);

insert into alunos(nome, sobrenome, documento) values
('ernani','sobrenome do ernani','ss.sss.sss.s');

    select 'aluno - inner join ' as 'log';

select
    alunos.nome
from
    alunos
inner join
    classe
        on alunos.id_classe = classe.id_classe;

    select 'ALUNOS - LEFT JOIN'AS 'LOG';

SELECT
    alunos.nome
FROM
   alunos
left join
    classe
        on alunos.id_classe = classe.id_classe;


select 'ALUNOS - left JOIN'AS 'LOG';

SELECT
    alunos.nome
FROM
   classe
left join
    alunos
        on alunos.id_classe = classe.id_classe;


        select 'ALUNOS - OUTER JOIN'AS 'LOG';

SELECT
    alunos.nome,
    CLASSE.NOME_CLASSE
FROM
   classe
left join
    alunos
        on alunos.id_classe = classe.id_classe;


INSERT INTO professores (
    NOME,
    SOBRENOME,
    DOCUMENTO,
    id_classe
) values
('PROFESSOR E','NOME PROFESSOR A','KFKJDHFKJGHDJ',1),
('PROFESSOR B','NOME PROFESSOR A','GJHDFGJHSDFLJ',1),
('PROFESSOR C','SOBRENOME PROFESSOR A','FKSJDFHSKJF',2),
('PROFESSOR D','SOBRENOME PROFESSOR A','FDFKÇDKFGLDK',2);


INSERT INTO professores (
    nome,
    sobrenome,
    documento
)values
('professor E','sobrenome professor A','jkkjjkjkjfjj');



SELECT
    *
FROM
   professores
left join
    CLASSE
        on  professores.id_classe = classe.id_classe;

/* left right inner professores X classe(prof sempre na esquerda)
/* left right inner profossores x classe (prof sempre na direita)
*/