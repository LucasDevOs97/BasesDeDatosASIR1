CREATE DATABASE bd_agenda;

CREATE TABLE personas (
    dni INT(8),
    cod_hospital INT(1) NOT NULL,
    apellidos VARCHAR(55) NOT NULL,
    funcion ENUM("CONSERJE", "MEDICO", "DIRECTOR") NOT NULL,
    salario INT(4) NOT NULL,
    localidad ENUM("LORCA", "MURCIA", "CARTAGENA") NOT NULL,
    PRIMARY KEY (dni)
);

INSERT INTO personas (cod_hospital, dni, apellidos, funcion, salario, localidad) VALUES
(1, 12345678, "García Hernández, Eladio", "CONSERJE", 1200, "LORCA"),
(1, 87654321, "Fuentes Bermejo, Carlos", "DIRECTOR", 2000, "MURCIA"), 
(2, 55544433, "González Marín, Alicia", "CONSERJE", 1200, "MURCIA"),
(1, 66655544, "Castillo Montes, Pedro", "MEDICO", 1700, "MURCIA"),
(2, 22233322, "Tristán García, Ana", "MEDICO", 1900, "MURCIA"),
(3, 55544411, "Ruiz Hernández, Caridad", "MEDICO", 1900, "LORCA"),
(3, 99988333, "Serrano Díaz, Alejandro", "DIRECTOR", 2400, "CARTAGENA"),
(4, 33222111, "Martínez Molina, Andrés", "MEDICO", 1600, "CARTAGENA"),
(4, 55544412, "Jiménez Jiménez, Dolores", "CONSERJE", 1200, "MURCIA"),
(4, 22233311, "Martínez Molina, Gloria", "MEDICO", 1600, "MURCIA");


/* 1-Mostrar todos los datos de las personas */

SELECT *
FROM personas;


/* 2-Obtén el DNI, apellidos y función de todas las personas */

SELECT dni, apellidos, funcion
FROM personas;

/*3- Mostrar los apellidos de las persoans que vivan en LORCA */

SELECT apellidos, localidad
FROM personas
WHERE localidad = "LORCA";

/* 4-Mostrar los apellidos de las personas que vivan en MURCIA o LORCA */

SELECT apellidos, localidad
FROM personas 
WHERE localidad = "LORCA" OR localidad = "MURCIA";


/* 5-Seleccionar los datos de aquellas peronas que vivan en MURCIA y tengan un salario superior a 1500€ */

SELECT *
FROM personas 
WHERE localidad = "MURCIA" AND salario > 1500;

/* 6-Mostrar los datos de las peronas que vivan en MURCIA, tengan un salario superior a los 1500€ y sean DIRECTORES */

SELECT *
FROM peronas
WHERE localidad = "MURCIA" AND salario > 1500 AND funcion = "DIRECTOR";

/* 7-Mostrar los datos de las personas cuya función sea MEDICO ordenados por apellidos descendentemente */

SELECT *
FROM personas 
WHERE funcion = "MEDICO"
ORDER BY apellidos DESC;

/*  8-Mostrar los datos de todas las localidad que hay en la tabla personas sin repeticiones (debes emplear la cláusula DISTINCT)*/

SELECT DISTINCT localidad 
FROM personas;

/* 9-Mostrar los datos de las peronas que tengan un salario superior a 1500 euros y sean médicos. Ordenar la salida por salario descendentemente */

SELECT *
FROM persoans
WHERE salario > 1500 AND funcion = "MEDICO"
ORDER BY salario DESC;

/* 10-Seleccionar aquellas peronas cuyo apellido comience por M */

SELECT apellidos
FROM persoans
WHERE apellidos LIKE ("M%");

/* 11-Mostrar los datos de las personas que tengan una M en el apellido y cuya función sea CONSERJE */

SELECT *
FROM peronas
WHERE apellidos LIKE ("%m%") AND funcion = "CONSERJE";

/* 12-Mostrar aquellas peronas que tengan un salario entre 1500 y 2000 euros */

SELECT *
FROM persoans
WHERE salario BETWEEN 1500 AND 2000;

/* 13-Seleccionar los datos de aquellas personas cuya función sea MEDICO o DIRECTOR (utilizar operador IN) */

SELECT *
FROM peronas
WHERE funcion IN ("MEDICO", "DIRECTOR");

/* 14-Obtener los datos de aquellas personas cuya función no sea CONSERJE (utilizar operador NOT IN) y tengan un salario superior a los 1500 euros, ordenados por apellidos descendentemente */

SELECT * 
FROM peronas
WHERE funcion NOT IN ("CONSERJE") AND salario > 1500
ORDER BY apellidos DESC;

/* 15-Mostrar los datos de las personas que sean de MURCIA o CARTAGENA y que pertenezcan al hospital número 1 */

SELECT *
FROM peronas
WHERE (localidad IN ("MURCIA", "CARTAGENA")) AND cod_hospital = 1;

SELECT *
FROM peronas
WHERE (localidad = "MURCIA" OR localidad = "CARTAGENA") AND cod_hospital = 1;

/* 16-Obtén los apellidos en mayúsculas de las personas que trabajen en el hospital número 1 */

SELECT UCASE(apellidos), cod_hospital
FROM peronas
WHERE cod_hospital = 1;

/* 17-Con una consulta devuelve los apellidos de todas las personas. Al lado debe aparecer la longitud de cada apellido */

SELECT apellidos, LENGTH(apellidos)
FROM peronas;

/* 18-Obtenner los apellidos y localidad en minúsuclas de todas aquellas personas que no trabajen en el hospital número 1 */

SELECT LCASE(apellidos), LCASE(localidad)
FROM peronas
WHERE cod_hospital != 1;

SELECT LCASE(apellidos), LCASE(localidad)
FROM peronas
WHERE cod_hospital NOT IN (1);

/* 19-Obtener los datos de las personas que trabajen en los hospitales 1 ó 2 y tengan un salario superior a 1500 euros */

SELECT *
FROM peronas
WHERE (cod_hospital = 2 OR cod_hospital = 1) AND salario > 1500;

SELECT *
FROM peronas
WHERE cod_hospital IN (1,2) ANd salario > 1500;

/* 20-Visualizar los datos de aquellas personas que no trabajen en el hospital número 2 y que sean de MURCIA */

SELECT *
FROM peronas
WHERE cod_hospital != 2 AND localidad = "MURCIA";

SELECT *
FROM peronas
WHERE cod_hospital NOT IN (2) AND localidad = "MURCIA";