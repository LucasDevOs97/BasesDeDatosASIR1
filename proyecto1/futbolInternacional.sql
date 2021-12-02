/*1. Queremos diseñar una base de datos por encargo de la FOFA. A la FOFA le interesa 
guardar información acerca de las distintas federaciones de cada país. Estas federaciones, serán
las encargadas de organizar las distintas ligas, las cuales, tendrán distintas divisiones de los 
diferentes campeonatos nacionales.
Habrá torneos intercontinentales que no organizarán las federaciones nacionales, de la organización
de estos torneos se encargarán otras federaciones organizadas por continentes.
Las distintas divisiones contendrán varios equipos, como mínimo, 5 equipos. Estos equipos, jugarán
como locales en un estadio, pudiendo ser más de un equipo local en un mismo estadio (por ejemplo,
Milán e Inter de Milán). 
Es conocido por todos que cada equipo de fútbol tiene un único grupo de ultras, de los que también
interesará guardar infomación.

De las federaciones interesará guardar:
- nombre NN.
- pais NN.
- ligas (numero de ligas).

De las divisiones interesará guardar:
- nombre NN.
- numEquipos NN.

De las ligas interesará guardar:
- nombre NN
- pais NN

De los torneos internacionales interesará guardar:
- nombre NN.
- numEquipos.
- premio.

De los estadios nos interesará guardar: 
- nombre NN.
- patrocinador.
- olimpico ("si" o "no")

De los ultras:

- nombreBanda NN.
- violencia ("baja", "media", "alta").

De los equipos:

- nombre NN
- division NN
- presupuesto
- grupoUltra NN
- estadio NN*/

/*1. Crear MER.*/
/*2. Crear la BBDD que se llame futbolInternacional.*/

CREATE DATABASE futbolInternacional;

/*3. Crear las estructuras que creas convenientes para almacenar toda la información.*/

CREATE TABLE fedContinental (
    idFed INT(3) AUTO_INCREMENT,
    nomFed VARCHAR(25) NOT NULL,
    ligas INT(3),
    continente VARCHAR(20), 
    PRIMARY KEY (idFed)   
);

CREATE TABLE fedNacional (
    idFed INT(3) AUTO_INCREMENT,
    nomFed VARCHAR(25) NOT NULL,
    ligas INT(3),
    pais VARCHAR(25) NOT NULL,
    PRIMARY KEY (idFed)
);

CREATE TABLE torneos (
    idT INT(3) AUTO_INCREMENT,
    idFed INT(3),
    nomTorneo VARCHAR(25) NOT NULL,
    numEquiposT INT(3),
    premio DECIMAL(10,2),
    PRIMARY KEY (idT),
    CONSTRAINT FK_Federacion_Torneo FOREIGN KEY (idFed)
    REFERENCES fedContinental (idFed)
);

CREATE TABLE ligas (
    idL INT(3) AUTO_INCREMENT,
    idFed INT(3),
    nomLiga VARCHAR(25) NOT NULL,
    paisLiga VARCHAR(30) NOT NULL,
    PRIMARY KEY (idL),
    CONSTRAINT FK_Federacion_Liga FOREIGN KEY (idFed)    
    REFERENCES fedNacional (idFed)
);

CREATE TABLE divisiones (
    idD INT(3) AUTO_INCREMENT,
    idL INT(3),
    nomDivision VARCHAR(25) NOT NULL,
    numEquiposD INT(2) NOT NULL,
    PRIMARY KEY (idD),
    CONSTRAINT FK_Liga_Division FOREIGN KEY (idL)
    REFERENCES ligas (idL)  
);

CREATE TABLE equipos (
    idE INT(3) AUTO_INCREMENT,
    idD INT(3),
    nomEquipo VARCHAR(25) NOT NULL,
    division VARCHAR(25) NOT NULL,
    presupuesto DECIMAL(11,2),
    grupoUltra VARCHAR(25) NOT NULL,
    nomEstadio VARCHAR(25) NOT NULL,
    PRIMARY KEY (idE),
    CONSTRAINT FK_Equipos_Division FOREIGN KEY (idD)  
    REFERENCES divisiones (idD)
);

CREATE TABLE estadios (
    idEstadio INT(3) AUTO_INCREMENT,
    idE INT(3),
    nomEstadio VARCHAR(25) NOT NULL,
    patEs VARCHAR(55),
    olimpico ENUM("S", "N"),
    PRIMARY KEY (idEstadio),
    CONSTRAINT FK_Estadios_Equipos FOREIGN KEY (idE)  
    REFERENCES equipos (idE)
);

CREATE TABLE ultras (
    idU INT(2) AUTO_INCREMENT,
    idE INT(3),
    nomBanda VARCHAR(25) NOT NULL,
    violencia ENUM("baja", "media", "alta"),
    PRIMARY KEY (idU),
    CONSTRAINT FK_Ultras_Equipos FOREIGN KEY (idE)  
    REFERENCES estadios (idE)
);

/*4. Inserta la siguiente información:

federaciones:
Federacion española ESPAÑA 3
The Football Association INGLATERRA 2
Federazione Italiana Giuoco Calcio ITALIA 2
UEFA
CONMEBOL

nomFed, ligas, pais

*/

INSERT INTO fedNacional (nomFed, ligas, pais) VALUES
("Federación española", 3, "España"),
("The Football Association", 2, "Inglaterra"),
("Federazione Italiana Giuoco Calcio", 2, "Italia");

INSERT INTO fedContinental (nomFed, ligas, continente) VALUES
("UEFA", NULL, NULL),
("CONMEBOL", NULL, NULL);

/*divisiones:
primera 20 -> relacionada con liga BBVA -> federacion española
segunda 22 -> liga Santader -> federacion española
segundaB 64 -> liga Federación -> federacion española
premier 20 -> premier -> The Football Association
first 22 -> EFL Championship -> The Football Association
serieA 20 -> Serie A TIM -> Federazione Italiana Giuoco Calcio
serieB 22 -> Serie B TIM -> Federazione Italiana Giuoco Calcio

nomDivision, numEquiposD

*/

INSERT INTO divisiones (idL, nomDivision, numEquiposD) VALUES
(1, "primera", 20),
(2, "segunda", 22),
(3, "segundaB", 64),
(4, "premier", 20),
(5, "first", 22),
(6, "serieA", 20),
(7, "serieB", 22);

/*ligas: 
liga BBVA
liga Santader
liga Federación
premier
EFL Championship
Serie A TIM
Serie B TIM

nomLiga, paisLiga,

*/

INSERT INTO ligas (idFed, nomLiga) VALUES
(1, "liga BBVA"),
(1, "liga Santander"),
(1, "liga Federación"),
(2, "premier"),
(2, "EFL Championship"),
(3, "Serie A TIM"),
(3, "Serie B TIM");

/*torneos:
UEFA ChampionsLeague 32  100 000 000.00-> UEFA
Europa League 64  25 000 000.00-> UEFA
Libertadores 32 25 000 000 00-> CONMEBOL*/

INSERT INTO torneos (idFed, nomTorneo, numEquiposT, premio) VALUES
(1, "UEFA ChampionsLeague", 32, 100000000.00),
(1, "Europa League", 64, 25000000.00),
(2, "Libertadores", 32, 25000000.00);

/*estadios:
Riazor ABANCA "NO"
Camp Nou RAKUTEN "NO"
Wembley NULL "SI"
San Siro NULL "NO"
Dean Court NULL "NO"

idE, nomEstadio, patEs, olimpico

*/

INSERT INTO estadios (idE, nomEstadio, patEs, olimpico) VALUES
(1, "Riazor", "ABANCA", "N"),
(2, "Camp Nou", "RAKUTEN", "N"),
(5, "Wembley", NULL, "S"),
(3,"San Siro", NULL, "N"),
(4,"San Siro", NULL, "N"),
(6, "Dean Court", NULL, "N");

/*grupoUltra:
Riazor Blues "MEDIA"
Boixos Nois "ALTA"
Yid Army "ALTA"
Curva Sud "ALTA"
Curva Nod "ALTA"
Hooligans "ALTA"*/

INSERT INTO ultras (idE, nomBanda, violencia) VALUES
(1, "Riazor Blues", "media"),
(2, "Boixos Nois", "alta"),
(5, "Yid Army", "alta"),
(3, "Curva Sud", "alta"),
(4, "Curva Nod", "alta"),
(6, "Hoolignas", "alta");

/*Equipos:
- Deportivo de La Coruña segundaB 100 riazor blues riazor
- Barcelona primera 100 000 000.00 boixos nois camp nou
- Milán FC serieA 50 000 000.00 curva sud san siro
- Inter de Milán serieA 55 000 000.00 curva nod san siro
- Tottenham premier 500 000 000.00 yid army wembley
- Bournemouth first 50 000 000.00 hooligans dean court*/

INSERT INTO equipos (idD, nomEquipo, division, presupuesto, grupoUltra, nomEstadio) VALUES
(3, "Deportivo de La Coruña", "segundaB", 100, "riazor blues", "riazor"),
(1, "Barcelona", "primera", 100000000.00, "boixos nois", "camp nou"),
(6, "Milásn FC", "serieA", 50000000.00, "curva sud", "san siro"),
(6, "Inter de Milán", "serieA", 55000000.00, "curva nod", "san siro"),
(4, "Tottenham", "premier", 500000000.00, "yid army", "wembley"),
(5, "Bournemouth", "first", 50000000.00, "hooligans", "dean court"); 

/*5. Establece las relaciones entre las tablas creando las claves primarias y claves foráneas que creáis convenientes.*/
/*6. Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones.*/

SELECT *
FROM equipos
WHERE presupuesto BETWEEN 50000000 AND 100000000;

/*7. Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones cuyo
nombre tenga como segunda letra "a" y penúltima letra "n".*/

SELECT *
FROM equipos 
WHERE presupuesto BETWEEN 50000000 AND 100000000 AND nomEquipo LIKE("%a%n%");

/*8.  Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones cuyo
nombre tenga como segunda letra "a" y penúltima letra "n", o que simplemente se llame Deportivo de La Coruña.*/

SELECT *
FROM equipos
WHERE (presupuesto BETWEEN 50000000 AND 100000000 AND nomEquipo LIKE("%a%n%")) OR nomEquipo = "Deportivo de La Coruña";

/*9. Muestra la información de los estadios que NO tengan patrocinador.*/

SELECT *
FROM estadios
WHERE patEs IS NULL;

/*10. Muestra la información de los estadios que tengan patrocinador.*/

SELECT * 
FROM estadios
WHERE patEs IS NOT NULL;

/*11. Muestra la información de las ligas que tengan 20 o 22 equipos.*/

SELECT idL
FROM divisiones
WHERE numEquiposD = 20 OR numEquiposD = 22;

SELECT *
FROM ligas
WHERE idL = 1 OR idL = 2 OR idL = 4 OR idL = 5 OR idL = 6 OR idL = 7;

/*12. Muestra la información de los grupos ultras cuyo nombre NO contenga la palabra "CURVA".*/

SELECT *
FROM ultras 
WHERE nomBanda NOT LIKE ("Curva%");

/*13. Muestra la información de los grupos ultras cuyo nivel de violencia sea "BAJA".*/

SELECT *
FROM ultras
WHERE violencia = "baja";

-- Corrección --

CREATE DATABASE futbolInternacional;

-- Creamos primero las tablas y después hacemos las relaciones --

CREATE TABLE federaciones (
    id INT(2) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    pais VARCHAR(55) NOT NULL,
    ligas INT(1),
    PRIMARY KEY (id)
);

CREATE TABLE ligas (
    id INT(3) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    pais VARCHAR(55) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE divisiones (
    id INt(3) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    numEquipos INT(2) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE torneos (
    id INT(3) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    numEquipos INT(2),
    premio DECIMAL(11,2),
    PRIMARY KEY(id)
);

CREATE TABLE estadios (
    id INT(3) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    patrocinador VARCHAR(155),
    olimpico ENUM("SI", "NO"),
    PRIMARY KEY(id)
);

CREATE TABLE ultras (
    id INT(3) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    violencia ENUM("BAJA", "MEDIA", "ALTA"),
    PRIMARY KEY(id)
);

CREATE TABLE equipos (
    id INT(3) AUTO_INCREMENT,
    nombre VARCHAR(55) NOT NULL,
    presupuesto DECIMAL(11,2),
    division VARCHAR(55)  NOT NULL,
    grupoUltra VARCHAR(55) NOT NULL,
    estadio VARCHAR(55) NOT NULL,
    PRIMARY KEY(id)
);

SHOW TABLES;

/*

recomendación: relacionar las tablas ANTES de insertar información

*/

ALTER TABLE torneos
ADD COLUMN idFed INT(2),
ADD FOREIGN KEY (idFed) 
REFERENCES federaciones (id);

