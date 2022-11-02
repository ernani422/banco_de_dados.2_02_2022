DROP DATABASE IF EXISTS trabalho1quartobi;
CREATE DATABASE trabalho1quartobi;

USE trabalho1quartobi;

CREATE TABLE petshop (
        id_petshop INTEGER PRIMARY KEY AUTO_INCREMENT,
        name_pet VARCHAR(255),
        type_service ENUM('banho','tosa')
);

/*http://www.inf.ufes.br/~vitorsouza/archive/2020/wp-content/uploads/teaching-lp-20192-seminario-dart.pdf
https://stackoverflow.com/questions/71946458/exception-global-evaluation-requires-a-thread-to-have-been-loaded-on-vscode-wh
https://slideplayer.com.br/slide/12969635/*/