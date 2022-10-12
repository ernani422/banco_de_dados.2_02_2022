


drop database if exists exercicioAB;

create database exercicioAB;

use exercicioAB;

create table B (
id_B integer not null primary key auto_increment,
nome_B varchar(255)not null
);

create table A(
id_A integer not null primary key auto_increment,
nome_A varchar(255)not null,
id_B integer,
foreign key (id_B) references B(id_B)
);

insert into
    B(nome_B)
values
('Q'),
('W'),
('E'),
('R'),
('T'),
('Y'),
('U');

insert into 
      A(nome_A, id_B)
values
    ('A',1),
    ('S',7),
    ('D',5),
    ('F',2),
    ('G',4),
    ('H',3),
    ('J',6),
    ('K',null),
    ('L',null),
    ('Tal que',null);

Select * from A left join B on A.id_B = B.id_B;

Select  B.id_B from B inner join A on B.id_B = A.id_B;


Select * from B where  B.id_B not in(select B.id_B from B  inner join A on B.id_B = A.id_B;


