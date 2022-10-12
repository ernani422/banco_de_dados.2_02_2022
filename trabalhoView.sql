/* Faça a criação de uma tabela com o nome país. Essa tabela deve contar id_pais (primary key e auto_increment) e nome. 
Faça uma tabela com o nome cidade. Essa tabela deve contar id_cidade (auto_increment primary key), nome (varchar),id_pais (forekey id_pais). Registre quatro países diferentes. 
Registre 3 cidades para cada país. Faça uma view que trás todos os países e cidades. */

drop database if exists learn_View;
create database learn_View;

use learn_View;

create table pais (
    id_pais integer not null primary key auto_increment,
    nome_pais varchar(255)
);

create table cidade (
    id_cidade integer not null primary key auto_increment,
    nome_cidade varchar(255),
    foreign key (id_pais) references pais(id_pais)
);

insert into pais(nome_pais, id_pais) values
('franca',1),
('alemanha',2),
('ucrania',3);



insert into cidade (id_cidade, nome_cidade, id_pais) values
(1,'Paris',1),
(2,'Lyon',1),
(3,'Dijon',1),
(4,'Berlim',2),
(5,'Munique',2),
(6,'Nuremberg',2),
(7,'Kiev',3),
(8,'Chernobyl',3),
(9,'Odesa',3);

select 
 nome_cidade
 from 
 cidade;

 /*
from 
cidade
   inner join pais
    on cidade.id_cidade = pais.id_cidade
where
  pais.id_pais = 1
  group by cidade.id_cidade;
 */

