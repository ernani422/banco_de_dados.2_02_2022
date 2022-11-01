drop database if exists learn_procedures;
create database learn_procedures;
set names utf8mb4;
use learn_procedures;

create table country (
    id_country integer auto_increment primary key,
    country_name varchar(255),
    continent varchar(255)
);

insert into
    country (country_name, continent)
values
    ('Brasil','America do Sul'),
    ('Paraguai','America do Sul'),
    ('Uruguia','America do Sul'),
    ('Peru','America do Sul'),
    ('Libano','Asia'),
    ('Estados Unidos','America do Norte');

/*-------------------------------------*/
    Delimiter $$
    create procedure SelectCountry()
    begin
        select * from country;
    end $$
    Delimiter ;
/*call SelectCountry;*/
 show procedure status;

/*-------------------------------------*/

delimiter $$

create  procedure SelectCountryArgRecive(CountryName varchar (255)) /*"ArGRecive" recebe argumentos ,CountryName (chave)variavel*/
begin
 select
    *
    from
    country
        where
    country.country_name = CountryName;
    end $$
delimiter ;
call SelectCountryArgRecive('Brasil');
/*não definido, podendo colocar outro pais*/

/*-------------------------------------*/

delimiter $$
drop procedure if exists SelectCountryInternArg;
create  procedure SelectCountryInternArg()
begin
 declare countryName varchar (255);
    set CountryName = 'Brasil';
/*definido o modo de chamar*/
    select 
        *
       from
        country
            where
        country.country_name = CountryName;
    end $$
delimiter ;
 call SelectCountryInternArg;

 /*-------------------------------------*/

delimiter $$
    
    create procedure SelectCountryUsingIF(InputNumber integer)
    begin
    declare countryName varchar(255);
  
  
    if InputNumber = 1 then
     set CountryName ='Brasil';
     elseif InputNumber = 2 then
     set CountryName ='Paraguai';
     elseif InputNumber = 3 then
    set CountryName ='Uruguai';
     elseif InputNumber = 4 then
    set CountryName ='Peru';
    elseif InputNumber = 5 then
    set CountryName ='Libano';
    end if;

    select CountryName AS 'Pais Selecionado';

     select 
        *
        from
            country
            where
            country.country_name like CountryName;
end $$    

delimiter ;

 call SelectCountryUsingIF(2);

 /*-------------------------------------*/

 delimiter $$
    
    create procedure SelectCountryCase(InputNumber integer)
    begin
        declare countryName varchar(255);
  
case
    when InputNumber = 1 then
        set CountryName ='Brasil';
    when InputNumber = 2 then
        set CountryName ='Paraguai';
    when InputNumber = 3 then
        set CountryName ='Uruguai';
    when InputNumber = 4 then
        set CountryName ='Peru';
    when InputNumber = 5 then
        set CountryName ='Libano';
end case;

    select CountryName AS 'Pais Selecionado';

     select 
        *
        from
            country
            where
            country.country_name = CountryName;
end $$    

delimiter ;

 call SelectCountryCase(2);

/*------------------------------------*/


/*https://www.arataacademy.com/port/uncategorized/como-aprender-qualquer-materia-fazendo-boas-anotacoes/
https://pt.wikihow.com/Fazer-Anota%C3%A7%C3%B5es-Usando-o-M%C3%A9todo-Cornell
https://gugaalves.net/marketing/perguntas-para-validar-ideias/#:~:text=1%20Que%20problemas%20estou%20resolvendo%3F%202%20Como%20outros,
6%20Quem%20s%C3%A3o%20seus%20potenciais%20competidores%3F%20Mais%20itens
https://mundoescrito.com.br/como-organizo-as-minhas-ideias-antes-de-escrever/
https://www.psicologo.com.br/blog/preguica-como-combater/
https://www.arataacademy.com/port/uncategorized/como-aprender-qualquer-materia-fazendo-boas-anotacoes/
https://www.msn.com/pt-br/estilo-de-vida/other/arrumar-a-cama-%C3%A9-mais-importante-do-que-muita-gente-pensa/
ss-AA10tHno?ocid=entnewsntp&cvid=5e90843541b648f3bab325657a5892dc#image=4*/


         