drop database if exists loja;
create database loja;
use loja;

create table carros (
    id_carro integer not null primary key auto_increment,
    nome  varchar(100)not null,
    modelo text,
    ano varchar (4)not null
);

create table vendedores (
    id_vendedor integer not null primary key auto_increment,
    nome varchar(255)not null,
    sobrenome varchar(255)not null,
    cpf varchar (255)not null
);

create table compradores (
    id_comprador integer not null primary key auto_increment,
    nome varchar(255)not null,
    sobrenome varchar(255)not null,
    cpf varchar (255)not null,
    cpfstatus enum('ok','negativado')
);

create table comp_vend_carro (
    id_comp_vend_carro integer not null primary key auto_increment,
    id_carro integer,
    foreign key (id_carro) references carros (id_carro),
    id_comprador integer,
    foreign key (id_comprador) references compradores (id_comprador),
    id_vendedor integer,
    foreign key (id_vendedor) references vendedores (id_vendedor)

);

insert into carros (nome, modelo,ano) values
('Chevette','Checrolet','1995'),
('Gol','Volkswagen','2010'),
('Onix','Chevrolet','2020');

insert into vendedores ( nome,sobrenome,cpf) values
('Carlos','Adornelis','03458996332'),
('Jose','Josafa','03845696321'),
('Evaristo','Indonesio','08545669878'),
('Evandro','Estanio','034589963456'),
('joao','Arlindo','03845696589'),
('Wellington','Coutinho','08545669956');

insert into compradores ( nome, sobrenome, cpf, cpfstatus) values
('Eduardo','Terra','15789659804','ok'),
('Arlindo','Cruz','03845696321','negativado'),
('Estenio','Carvao','08545669878','ok'),
('Ernani','Paz','034589963456','ok'),
('julio','Mendonca','03845696589','ok'),
('Weslley','Tavares','08545669956','ok');


insert into
    comp_vend_carro (id_carro, id_vendedor,id_comprador)
values
    (
        (Select id_carro from carros where nome = 'Gol'),
        (Select id_vendedor from vendedores where nome = 'Evaristo'),
        (Select id_comprador from compradores where nome = 'Ernani')

    );

select * from carros;
select * from vendedores;
select * from compradores;
select * from comp_vend_carro;

select 
comp_vend_carro.id_carro, comp_vend_carro.id_vendedor, comp_vend_carro.id_comprador 
    from 
        comp_vend_carro 
            inner join 
                carros 
                    on 
                        comp_vend_carro.id_carro = carros.id_carro where carros.ano = 2010;


select 
    *
    from
    comp_vend_carro
inner join
    compradores
    on comp_vend_carro.id_comprador = compradores.id_comprador
inner join
    vendedores
    on comp_vend_carro.id_vendedor = vendedores.id_vendedor
inner join
    carros
     on comp_vend_carro.id_carro = carros.id_carro;

     
insert into carros (nome, modelo,ano) values
('Civicao','Honda','2022','ok');

create 
    view status_cpf
 as(
    select
      compradores.nome,
      compradores.sobrenome,
      compradores.cpf,
      compradores.cpfstatus

    from 
     compradores
 );


 select * from status_cpf;



