create database if not exists aprenderjoin character set utf8mb4;
use aprenderjoin;

drop table if exists garcom_restaurantes;
drop table if exists garcom;
drop table if exists restaurantes;
drop table if exists cidade;
drop table if exists estado;

create table estado (
    id_estado integer primary key auto_increment,
    nome varchar(255) not null,
    regiao ENUM ('sul','sudeste','centro-oeste','nordeste','norte') 
);


create table cidade (
    id_cidade integer primary key auto_increment,
    nome varchar(255) NOT NULL,
    id_estado integer NOT NULL,
    foreign key (id_estado) references estado (id_estado)
);

insert into
    estado(nome, regiao)
values
    ('Parana','sul'),
    ('Sao Paulo','sudeste'),
    ('Rio de Janeiro','sudeste'),
    ('Bahia','nordeste'),
    ('Pernanbuco','nordeste'),
    ('Para','norte'),
    ('Mato grosso','centro-oeste');


set @idParana = (select id_estado from estado where estado.nome = "Parana");
set @idSaoPaulo = (select id_estado from estado where estado.nome = "Sao Paulo");
set @idRioDeJaneiro = (select id_estado from estado where estado.nome = "Rio de Janeiro");
set @idBahia = (select id_estado from estado where estado.nome = "Bahia");
set @idPernanbuco = (select id_estado from estado where estado.nome = "Pernanbuco");
set @idPara = (select id_estado from estado where estado.nome = "Para");
set @idMatoGrosso = (select id_estado from estado where estado.nome = "Mato Grosso");

insert into cidade (nome, id_estado)values
    ('Curitiba',@idParana),
    ('Londrina',@idParana),
    ('Paranagua',@idParana),
    ('Sao Paulo',@idSaoPaulo),
    ('Sorocaba',@idSaoPaulo),
    ('Rio de Janeiro',@idRioDeJaneiro),
    ('Niteroi',@idRioDeJaneiro),
    ('Mage',@idRioDeJaneiro),
    ('Porto Real',@idRioDeJaneiro),
    ('Petropoles',@idRioDeJaneiro),
    ('Salvador',@idBahia),
    ('Feira de Santana',@idBahia),
    ('Recife',@idPernanbuco),
    ('Olinda',@idPernanbuco),
    ('Petrolina',@idPernanbuco),
    ('Belem',@idPara),
    ('Cuiaba',@idMatoGrosso);

select * from cidade ;
select nome from estado where id_estado = (select id_estado from
cidade where nome = 'Petropoles');

select
    *
from
    cidade
inner join /* junta */
    estado on cidade.id_estado = estado.id_estado
where
    cidade.nome = 'Petropoles';

create table restaurantes (
    id_restaurante integer primary key auto_increment,
    nome varchar(255),
    descricao varchar (255),
    id_cidade integer,
    foreign key (id_cidade) references cidade (id_cidade)

);

set @idCuritibaCidade := (select id_cidade from cidade where nome = 'Curitiba');
set @idSaoPauloCidade := (select id_cidade from cidade where nome = 'Sao Paulo');
set @idRioDeJaneiroCidade := (select id_cidade from cidade where nome = 'Rio de Janeiro');
set @idPetropolesCidade := (select id_cidade from cidade where nome = 'Petropoles');
set @idFeiraDeSantanaCidade := (select id_cidade from cidade where nome = 'Feira de Santana');

select @idFeiraDeSantanaCidade as 'cidade';

insert into restaurantes (nome, descricao, id_cidade)values
   ('Comida Mineira','Comida tipica de Minas voce nao viu o nome?',@idCuritibaCidade), /*cada virgula dentro deste insert e uma coluna*/
   ('Fogo de chao','Acho que serve costela de fogo de chao',@idSaoPauloCidade),
   ('Fragao','Uma homenagem a todos os goleiros frangos',@idRioDeJaneiroCidade),
   ('Pizza de maionese','so pode comer aqui se usas bomba',@idPetropolesCidade),
   ('onde tem rabanetes','so se ligar e onde tem comida boa',@idFeiraDeSantanaCidade);

select 
    * 
    from 
    restaurantes /* ESTA SEMPRE A ESQUERDA */
inner join /* junta */
    cidade on restaurantes.id_cidade = cidade.id_cidade
    
where
    restaurantes.nome = 'Comida Mineira';

select 'cidade antes ----------------' as 'INFO';

select
    *
from
    cidade
INNER JOIN RESTAURANTES ON RESTAURANTES.id_cidade = CIDADE.id_cidade
where
    restaurantes.nome ='fOGO DE CHAO';

SELECT 'CONTROLANDO COLUNAS----------------------'AS 'INFO';

select
    CIDADE.NOME AS NOME_DA_CIDADE,
    RESTAURANTES.NOME AS NOME_DO_RESTAURANTE,
    RESTAURANTES.DESCRICAO AS DESCRICAO_DO_RESTAURANTE
from
    CIDADE
INNER JOIN
    RESTAURANTES
        ON RESTAURANTES.ID_CIDADE = CIDADE.ID_CIDADE
where
    RESTAURANTES.NOME = 'COMIDA MINEIRA';

    

SELECT ' COLUNAS LIKE ----------------------'AS 'INFO';

select
    CIDADE.NOME AS NOME_DA_CIDADE,
    RESTAURANTES.NOME AS NOME_DO_RESTAURANTE,
    RESTAURANTES.DESCRICAO AS DESCRICAO_DO_RESTAURANTE
from
    CIDADE
INNER JOIN
    RESTAURANTES
        ON RESTAURANTES.ID_CIDADE = CIDADE.ID_CIDADE
where
    RESTAURANTES.NOME LIKE '%M%';

 

    SELECT 'transformando em uma TABELA ----------------------'AS 'INFO';

select
    T1.NOME_DA_CIDADE,
    T1.NOME_DO_RESTAURANTE
from
(
    select
    CIDADE.NOME AS NOME_DA_CIDADE,
    RESTAURANTES.NOME AS NOME_DO_RESTAURANTE,
    RESTAURANTES.DESCRICAO AS DESCRICAO_DO_RESTAURANTE
from
    CIDADE
INNER JOIN
    RESTAURANTES
        ON RESTAURANTES.ID_CIDADE = CIDADE.ID_CIDADE
where
    RESTAURANTES.NOME LIKE '%M%'
) AS T1

where
    t1.NOME_DA_CIDADE = 'CURITIBA';



    SELECT 'COM MAIS DE UM INNER JOIN ----------------------'AS 'INFO';


    select
    CIDADE.NOME AS NOME_DA_CIDADE,
    ESTADO.NOME AS NOME_DO_ESTADO,
    RESTAURANTES.NOME AS NOME_DO_RESTAURANTE
from
    restaurantes
INNER JOIN
    CIDADE
        ON RESTAURANTES.ID_CIDADE = CIDADE.ID_CIDADE
INNER JOIN
    estado
        ON CIDADE.ID_ESTADO = ESTADO.ID_ESTADO   
where
    RESTAURANTES.NOME LIKE 'COMIDA M%';

@idCuritibaCidade
select
    *
    from
    CIDADE
    inner join
    restaurantes
    on
    cidade.id_cidade = restaurantes.ID_CIDADE
    where
    RESTAURANTES.NOME = 'RESTAURANTE QUE NAO ESTA EM CIDADE ALGUMA';

    SELECT
    "fAZENDO BUSCA COM CIDADE NA ESQUERDA EM REGISTRO SEM RELACAO ENRE MINHAS TABELAS"
    AS
    "LOG";

    select
    *
    from
    restaurantes
    inner join
  CIDADE
    on
    cidade.id_cidade = restaurantes.ID_CIDADE
    where
    RESTAURANTES.NOME = 'RESTAURANTE QUE NAO ESTA EM CIDADE ALGUMA';

    SELECT
    "fAZENDO BUSCA COM RESTAURANTES NA ESQUERDA EM REGISTRO SEM RELACAO ENRE MINHAS TABELAS"
    AS
    "LOG";
    
    SELECT 
    "TRAGA TUDO"
    AS
    "LOG";

    SELECT 

    CIDADE.NOME,
    RESTAURANTES.NOME
    from
    RESTAURANTES
    INNER JOIN
    CIDADE
    ON
   cidade.id_cidade = restaurantes.ID_CIDADE;

   insert into restaurantes (nome, descricao, id_cidade)values
   ('pizza maromba','BIGMAC',@idCuritibaCidade), /*cada virgula dentro deste insert e uma coluna*/
   ('Restaurante Ad','esfirra',@idCuritibaCidade),
   ('terrezo','manjare',@idCuritibaCidade),
   ('Calabouco','milkshake',@idCuritibaCidade),
   ('Pertuti','pizza maromba',@idCuritibaCidade);
   ('mc donalds','pizza maromba',@idCuritibaCidade);


   SELECT
   *
   from
   RESTAURANTES
inner join
    cidade on restaurantes.id_cidade = cidade.id_cidade
    where
    cidade.nome ="curitiba";

insert into restaurantes (nome, descricao, id_cidade)values
   ('Comida Mineira','Comida tipica de Minas voce nao viu o nome?',@idSaoPauloCidade);
   
   SELECT
   *
   from
   RESTAURANTES
inner join
    cidade on restaurantes.id_cidade = cidade.id_cidade
    where
    cidade.nome in('curitiba','Sao paulo');



create table garcom (
    id_garcom integer not null primary key auto_increment,
    nome varchar (255)not null,
    experiencia ENUM('junior','pleno','senior'),
    tipo_documento enum('cpf','rg'),
    documento varchar (20)

);

insert into
garcom (NOME ,experiencia, tipo_documento, documento)
values
    ('jorge','junior','cpf','086000000000'),
    ('Fernando','pleno','rg','0865540000'),
    ('Roberto','pleno','rg','086000000000'),
    ('Alexandre','pleno','rg','0865540000'),
    ('Rodrigo','pleno','rg','086000000000'),
    ('Odair','pleno','rg','0865540000'),
    ('Gerson','senior','cpf','086000000000'),
    ('Pedro','senior','cpf','0865540000'),
    ('joao','senior','cpf','086000000000');

select * from garcom;

 CREATE TABLE garcom_restaurantes (
    id_restaurante INTEGER NOT NULL,
    id_garcom INTEGER NOT NULL,
    dia_semana ENUM('segunda', 'terca', 'quarta', 'quinta', 'sexta', 'sabado', 'domingo'),
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id_restaurante),
    FOREIGN KEY (id_garcom) REFERENCES garcom(id_garcom)        
);

