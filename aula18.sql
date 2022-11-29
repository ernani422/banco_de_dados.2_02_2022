DROP DATABASE IF EXISTS db_functions;
CREATE DATABASE db_functions;
SET NAMES utf8mb4;

USE db_functions;

CREATE TABLE country (
    id_country INTEGER AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255),
    continent VARCHAR(255)
);

INSERT INTO 
    country(country_name,continent) 
VALUES
    ('Brasil', 'America do Sul'),
    ('Paraguai', 'America do Sul'),
    ('Uruguai', 'América do Sul'),
    ('Peru', 'America do Sul'),
    ('Líbano', 'Asia'),
    ('Estados Unidos', 'América do Norte')
;
/*
DELIMITER $$

CREATE FUNCTION SelectCountry() RETURNS VARCHAR(255)  
BEGIN
  RETURN "TESTE";
END $$

DELIMITER ;

SELECT SelectCountry();
*/
DELIMITER $$ ;

CREATE FUNCTION TypeOfContinent(continent VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE response VARCHAR(255) DEFAULT "NOT-DEFINED";

IF continent = 'America do Sul' THEN
    SET response = 'AS';
ELSEIF continent = 'Asia' THEN
    SET response = 'A';
ELSEIF continent = 'America do Norte' THEN
    SET response = 'AN';
END IF ;

RETURN response ;
END $$

DELIMITER ;

SELECT TypeOfContinent('America do Norte');
/*
SELECT
    country_name,
    TypeOfContinent (continent) AS 'continent'
from
    country ;*/

