/*1. Crea la base de datos liga2021.*/

CREATE DATABASE liga2021;

/*2. Crea la tabla equipos con las columnas:
    - nombre de equipo sin aceptar nulos
    - nacionaliad de equipo sin aceptar nulos (teniendo en cuenta 
    solamente equipos de "ESPAÑA", "ITALIA" e "INGLATERRA")
    - año fundacion
    - presupuesto sin aceptar nulos
    Añade las columnas que creas convenientes con el comportamiento 
    que creas conveniente*/

    USE liga2021;

    CREATE TABLE equipos(
        id_equipo INT(8) AUTO_INCREMENT,
        nom_equipo VARCHAR(55) NOT NULL,
        nac_equipo ENUM("española", "italiana", "inglesa") NOT NULL,
        fec_fundacion INT(4),
        presupuesto DECIMAL(11,2) NOT NULL,
        num_jugadores INT(2),
        PRIMARY KEY(id_equipo)
    );

/*3. Crea la tabla ligas:
    - nombre de liga
    - patrocinador
    - pais
    - division
    Añade las columnas que creas convenientes*/

    CREATE TABLE ligas(
        id_liga INT(8) AUTO_INCREMENT,
        nom_liga VARCHAR(55),
        patrocinador VARCHAR(55),
        pais ENUM("españa", "italia", "inglaterra"),
        division VARCHAR(25),
        PRIMARY KEY (id_liga)
    );

/*4. Rellena la tabla equipos con 3 equipos de cada link proporcionado:
https://www.marca.com/futbol/primera/equipos.html?intcmp=MENUMIGA&s_kw=equipos
https://www.marca.com/futbol/premier-league/equipos.html?intcmp=MENUPROD&s_kw=premier-league-equipos
https://www.marca.com/futbol/liga-italiana/equipos.html?intcmp=MENUPROD&s_kw=serie-a-equipos*/

INSERT INTO equipos (nom_equipo, nac_equipo, fec_fundacion, presupuesto, num_jugadores) VALUES
("Enpanyol", "española", 1900, 33333.3, 29),
("Rayo Vallecano", "española", 1924, 12345.5, 29),
("Osasuna", "española", 1920, 10100.2, 30),
("Liverpool", "inglesa", 1892, 91324.5, 36),
("Tottenham Hotspur", "inglesa", 1882, 1552.5, 37),
("Chelsea", "inglesa", 1905, 42534.9, 29),
("Milan", "italiana", 1899, 43214.8, 32),
("Verona", "italiana", 1903, 1423.8, 28),
("Napoli", "italiana", 1926, 23412.3, 29);

/*5. Ingresa información para la tabla ligas ingresando las ligas BBVA, PREMIER y SERIE A*/

INSERT INTO ligas (nom_liga, patrocinador, pais, division) VALUES
("BBVA", "Puma, EA Sports", "españa", "Primera División"),
("PREMIER", "Barclays", "inglaterra", "Primera División"),
("SERIE A", "TIM", "italia", "Primera División");

/*6. Modifica la tabla ligas para que la columna division aparezca en la segunda columna*/

ALTER TABLE ligas
CHANGE division division VARCHAR(25) AFTER id_liga;

/*7. Cambia el nombre de la tabla ligas por el de "campeonatos"*/

ALTER TABLE ligas
RENAME TO campeonatos;

/* Añadir tabla de relación */

CREATE TABLE campeontaosEquipos (
    id_liga INT(8),
    id_equipo INT(8),
    PRIMARY KEY (id_liga, id_equipo),
    CONSTRAINT FK_Campeonatos
    FOREIGN KEY (id_liga)
    REFERENCES campeonatos (id_liga),
    CONSTRAINT FK_equipos
    FOREIGN KEY (id_equipo)
    REFERENCES equipos(id_equipo)
);

