
drop database if exists learn_trigger;
create database learn_trigger;

use learn_trigger;


create table seller (
    id_seller integer not null primary key auto_increment,
    name_seller varchar (255),
    created_at timestamp default now()
);

insert into seller (name_seller) values
 ('Roberto'),
 ('Fabio'),
 ('tiago');

create table product(
    id_product integer not null primary key auto_increment,
    name_product varchar(255) not null,
    company      varchar (255),
    created_at timestamp default now()
);

insert into product(name_product, company) values
 ('Refrigerante','Coca-Cola'),
 ('chocolate','Garoto'),
 ('sabao em po','OMO'),
 ('acholotado','nescau');

create table inventory(
    id_inventory integer not null primary key auto_increment,
    id_last_seller integer,
    id_product integer not null,
    quantity integer not null,
    created_at timestamp default now(),
    foreign key (id_last_seller) references seller (id_seller),
    foreign key (id_product) references product(id_product)
);

insert into inventory (id_product, quantity) values
(1,40),
(2,70),
(3,50);

 
create table balance (
    id_balance integer not null primary key auto_increment,
    quantity_input integer not null,
    quantity_output integer not null,
    id_inventory integer not null,
    foreign key (id_inventory) references inventory(id_inventory)
);

DELIMITER $$

/* toda vez que oq o ocorrer i insert na tabela balance*/
/* toda vez executar trigger vai acontecer*/
 create trigger tgr_itensvenda_insert after insert on balance 
  for each row
  /* para cada linha*/
    begin 
        update /* na tabela inventory atuakuzar quantidade*/
            inventory
        set /* setar a quantidade tabela inventory*/
            /* input entrada - output saida*/
            quantity = new.quantity_input - new.quantity_output
        where
            inventory.id_inventory = new.id_inventory;
        end $$
    DELIMITER ;

    /* Delimiter um comando quando precisamos fazer um procetimento*/
    /* tgr_itensvenda_insert */

select * from inventory where inventory.id_inventory = 1 ;
insert into
    balance (quantity_input, quantity_output, id_inventory)
values
    (90, 40, 1);

select * from inventory where inventory.id_inventory = 1 ;


select id_inventory ,quantity from inventory;

insert into
    balance (quantity_input, quantity_output, id_inventory)
values
    (90, 40, 1),
    (30, 20, 2),
    (100, 30, 3);

select id_inventory ,quantity from inventory;

reate trigger tgr_itensvenda_insert after update on balance 
  for each row
  /* para cada linha*/
    begin 
        update /* na tabela inventory atuakuzar quantidade*/
            inventory
        set /* setar a quantidade tabela inventory*/
            /* input entrada - output saida*/
            quantity = new.quantity_input - new.quantity_output
        where
            inventory.id_inventory = new.id_inventory;
        end $$
    DELIMITER ;


select * from inventory;
 
 select * from balance;
 update
    balance
set
    quantity_input = 80,
    quantity_output = 50
where
    id_inventory = 1;
 select * from balance;

select * from inventory;
