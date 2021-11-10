-- Situarnos en la carpeta bin de mysql para poder acceder a mysql --
 cd C:\xampp\mysql\bin

-- Entrar en el servidor --
mysql -u root -p


-- Crear base de datos --
CREATE DATABASE plataformas;


-- Seleccionar la base de datos --
USE plataformas;


-- Crear tabla plataformas --
CREATE TABLE plataformas (
    id_plat INT(2) AUTO_INCREMENT,
    nom_plat VARCHAR(25) NOT NULL,
    mensualidad DECIMAL(4,2) NOT NULL,
    PRIMARY KEY(id_plat)
);


-- Mostrar tablas creadas --
SHOW TABLES;


-- Borar tabla sería --
DROP TABLE [table_name];



-- Mostrar estructura de una tabla --
DESCRIBE plataformas;


-- Crear tabla series -- 
-- El género en un futuro será otra tabla; también podríamos usar ENUM("valor","valor2")
CREATE TABLE series(
    id_serie INT(5) AUTO_INCREMENT,
    nom_serie VARCHAR(55) NOT NULL,
    genero_serie VARCHAR(15) NOT NULL,
    presupuesto DECIMAL(10,2),
    nac_serie VARCHAR(55) NOT NULL,
    PRIMARY KEY(id_serie)
);


-- Crear tabla actores --
CREATE TABLE actores(
    id_act INT(3) AUTO_INCREMENT,
    nom_act VARCHAR(55) NOT NULL,
    edad_act INT(3),
    sexo_act ENUM("MASCULINO","FEMENINO"),
    cache DECIMAL(10,2),
    PRIMARY KEY(id_act)    
);


-- Insertar datos plataformas --
INSERT INTO plataformas(nom_plat,mensualidad) VALUES 
("Netflix",9.90);

INSERT INTO plataformas(nom_plat,mensualidad) VALUES
("Disney+",11.99);

INSERT INTO plataformas(nom_plat,mensualidad) VALUES
("HBO",7.99);

INSERT INTO plataformas(nom_plat,mensualidad) VALUES
("Prime Video",5.99);


-- Insertar datos actores --
-- Omitimos edad --
INSERT INTO actores (nom_act, sexo_act, cache) VALUES 
("Nicolas Cage", "MASCULINO",9999999.99);

INSERT INTO actores (nom_act, edad_act,sexo_act,cache) VALUES
("Angelina Jolie", 44, "FEMENINO", 500000.00),
("Arnold",66, "MASCULINO", 10000000.00),
("Antonio Resines", 74, "MASCULINO",13000000.00);


-- Sin indicar las columnas hay que poner TODOS los campos, incluyendo el id --
INSERT INTO actores VALUES 
(5,"Belen Rueda", 65, "FEMENINO", 13000000.00);


-- Modificar tablas --
-- Añadir columnas --
ALTER TABLE series
ADD COLUMN director_serie VARCHAR(75),
ADD COLUMN num_temporadas INT(3);
/* 
Podemos añadir varias columnas a la vez, cuando ya hemos especificado 
todo lo necesario para la nueva columna, ponemos una coma y podemos añadir otra.
 */



 CREATE TABLE directores (
     nom_director VARCHAR(55) NOT NULL,
     apellido VARCHAR(55) NOT NULL,
     nac_director VARCHAR(55)
 );


 -- Modificar el orden de las columnas. Poner 2 veces el nombre de la columna --
ALTER TABLE directores
CHANGE id id INT(2) AUTO_INCREMENT FIRST; -- situar al inicio de la tabla --

ALTER TABLE directores
CHANGE id id INT(3) AUTO_INCREMENT AFTER nom_director; -- situar a la derecha de la columna nom_director --


-- Modificar el tipo de datos o longitud de dato de una columna --
ALTER TABLE directores
MODIFY COLUMN id INT(3) AUTO_INCREMENT;


-- Eliminar columna --
ALTER TABLE directores
DROP COLUMN nacionalidad;


-- Modificar el nombre de la tabla --
CREATE TABLE pelicolas(
    id_peli INT(3) AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    genero_peli VARCHAR(25) NOT NULL,
    fec_estreno VARCHAR(8),
    valoracion DECIMAL(3,1),
    PRIMARY KEY (id_peli)
);

ALTER TABLE pelicolas
RENAME TO peliculas;

