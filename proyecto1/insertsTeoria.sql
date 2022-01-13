CREATE DATABASE veterinaria;

USE veterinaria;

CREATE TABLE mascotas (
    id_mascota INT(11) AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    especie ENUM("G", "P") NOT NULL,
    sexo ENUM("H", "M") NOT NULL,
    ubicacion VARCHAR(6) NOT NULL,
    estado ENUM("A", "B") NOT NULL,
    PRIMARY KEY(id_mascota)
);

INSERT INTO mascotas (nombre ,especie, sexo, ubicacion, estado) VALUES
("BUDY", "P", "M", "E05", "B"),
("PIPO", "P", "M", "E02", "B"),
("NUNA", "P", "H", "E02", "A"),
("BRUTS", "P", "M", "E03", "A"),
("AMERICO", "G", "M", "E04", "A"),
("SOMBRA", "P", "H", "E05", "A"),
("AMAYA", "G", "H", "E04", "A"),
("TALIA", "G", "H", "E01", "B"),
("TRABIS", "P", "M", "E02", "A"),
("TESA", "G", "H", "E01", "A"),
("TITITO", "G", "M", "E04", "B"),
("TRUCA", "P", "H", "E02", "A"),
("ZULAY", "P", "H", "E05", "A"),
("DANDI", "G", "M", "E04", "A"),
("RAS", "G", "M", "E01", "A"),
("CANELA", "P", "H", "E02", "A");
