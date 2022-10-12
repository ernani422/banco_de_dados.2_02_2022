create database aula8;
drop table editora;
create index idx_editora on editora (nome);

use aula8;

create table if not exists editora (

    editora_id integer primary key auto_increment,
    nome varchar(20) not null,
    endereco varchar (255) not null
);

insert INTO editora(nome,endereco) values
('Abril','Rua Abcd 111'),
('Madras','Rua Dcb 222'),
('Globo' ,'Rua Xhd 222');

