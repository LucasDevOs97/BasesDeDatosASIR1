/*
1. Crear la base de datos asir2021
2. Crear la tabla alumnos con las siguientes columnas:
- id
- nombre
- apellido1
- apellido 2
- edad
- email (nombreAlumno@gmail.com)
3.Crear la tabla profesores con las siguientes columnas:
- id
- nombre
- apellido 1
- especialidad
- email
4. Cambia las tablas para que "id" sea PRIMARY KEY auto_incremental
    (en caso de no haberlo hecho al crear las tablas);

5. Cambiar la tabla profesores y hacer que los campos nombre, apellido1, 
    especialidad e email NO acepte nulos.

6. Haz un describe y comprueba que se modificaron bien las tablas.

7. Inserta los nombres de tus compañeros (tienes los nombres en la imagen
   asociada al ejercicio).

8. Inserta el alumno con los siguientes datos:
    nombre = "soyLerdiño"
    apellido1 = "noSe"
    apellido2 = "escribir"
    edad=24
    nacionalidad="española"

9. Actualiza el registro del alumnos "soyLerdiño" y Cambia
   los apellidos de tal modo que:
    apellido1 = "peroSe"
    apellido2 = "hacerUpdates"

10. Muestra todas las columnas de la tabla alumnos.
*/

-- Base de Datos --
CREATE DATABASE asir2021;

-- Tabla alumnos --
USE asir2021;

CREATE TABLE alumnos(
    id_al INT(4) AUTO_INCREMENT,
    nom_al VARCHAR(25) NOT NULL,
    ap1_al VARCHAR(25) NOT NULL,
    ap2_al VARCHAR(25) NOT NULL,
    edad_al INT(3) NOT NULL,
    email_al VARCHAR(55),
    PRIMARY KEY(id_al)
);

-- Modificamos la tabla alumnos para que el segundo apellido pueda ser nulo --
ALTER TABLE alumnos
CHANGE ap2_al ap2_al VARCHAR(25) AFTER ap1_al;

-- Tabla profesores --
CREATE TABLE profesores(  
    id_prof INT(4) AUTO_INCREMENT,
    nom_prof VARCHAR(25) NOT NULL,
    ap1_prof VARCHAR(25) NOT NULL,
    especialidad VARCHAR(20) NOT NULL,
    email_prof VARCHAR(55),
    PRIMARY KEY(id_prof)
);

-- Hacemos un DESCRIBE para ver las tablas --
DESCRIBE alumnos;
DESCRIBE profesores;

-- Insertamos los alumnos --
INSERT INTO alumnos (nom_al,ap1_al,ap2_al,edad_al,email_al) VALUES
("Álvaro", "Agraso", "", 18, "alvaro@gmail.com"),
("Alejandro", "Doval", "", 18, "alejandro@gmail.com"),
("Diego Manuel", "García", "Araujo", 18, "diego@gamil.com"),
("Oscar", "Gómez", "", 18, "oscar@gmail.com"),
("Juan", "Maceira", "", 18, "juan@gmail.com"),
("José María", "Rego", "González", 19, "jose@gmail.com"),
("Diego", "Vázquez", "Lama", 19, "diego@gmail.com"),
("Xoel", "Álvarez", "", 19, "xoel@gmail.com"),
("Brais", "Estevez", "", 19, "brais@gmail.com"),
("Antonio", "García", "Cao", 19, "antonio@gmail.com"),
("Francisco", "Iglesias", "", 20, "francisco@gmail.com"),
("Hugo", "Mendez", "", 20, "hugo@gmail.com"),
("Jesús", "Claramunda", "", 20, "jesus@gmail.com"),
("Felipe", "Fernández", "Matos", 20, "felipe@gmail.com"),
("Luis Ángel", "Garacía", "Ulloa", 20, "luis@gmail.com"),
("Nicolás", "Larrea", "", 21, "nicolas@gmail.com"),
("Adrián", "Pereira", "Fernández", 21, "adrian@gmail.com"),
("Manuel", "Rilo", "Rodríguez", 21, "manuel@gmail.com"),
("Álvaro", "Delgado", "", 21, "alvaro@gmail.com"),
("Fernando", "García", "", 21, "fernando@gmail.com"),
("Matias", "Garrido", "", 22, "matias@gmail.com"),
("Sergio", "Lugrís", "", 22, "sergio@gmail.com"),
("Lucas", "Ramos", "Rumbo", 22, "lucas@gmail.com"),
("Antón", "Varela", "Aboy", 22, "anton@gmail.com");

-- Alumno nombre = "soyLerdiño" --
-- Primero tenemos que añadir una columna llamada nacionalidad --
ALTER TABLE alumnos 
ADD COLUMN nac_al VARCHAR(55);

-- Ahora añadimos el alumno --
INSERT INTO alumnos (nom_al,ap1_al,ap2_al,edad_al,email_al, nac_al) VALUES
("soyLerdiño", "noSe", "escribir", 24, "", "española");

/*
9. Actualiza el registro del alumnos "soyLerdiño" y Cambia
   los apellidos de tal modo que:
    apellido1 = "peroSe"
    apellido2 = "hacerUpdates"
*/

UPDATE alumnos 
SET ap1_al = "peroSe", ap2_al = "hacerUpdates"
WHERE id_al = 25;

-- Mostrar todas las columnas de la tabla alumnos --
SELECT * FROM alumnos;






-----------------------------------------------------------------------------------------------------
-- Ejercicio 2--
/*
1. Inserta la tabla profesores con los profesores de tu clase.
 Especialidades:
 - Rico: Bases de datos.
 - Begoña: Hardware.
 - Jose Antonio: Redes.
 - Xabi: Sistemas Operativos.
 - Mónica: Desarrollo Web.*/

INSERT INTO profesores (nom_prof, ap1_prof, especialidad, email_prof) VALUES
("Manuel", "Rico", "bases de datos", "manuel@gmail.com"),
("Begoña", "Cambeiro", "hardware", "begoña@gmail.com"),
("Jose Antonio", "Pereira", "Redes", "jose@gmail.com"),
("Xabi", "Pérez", "sistemas operativos", "xabi@gmail.com"),
("Mónica", "Pérez", "desarrollo web", "monica@gmail.com"),
("Jesús", "Varela", "leyes", "jesus@gmail.com");


 /*2. Cambia los emails para que ningún alumno tenga el mismo
 email. Soluciónalo poniendo "hotmail.es" en alguno de ellos.*/

UPDATE alumnos 
SET email_al = "alvaro@hotmail.es"
WHERE id_al = 1;

 /*3. Haz que el campo email no acepte valores repetidos (UNIQUE).*/

ALTER TABLE alumnos
MODIFY COLUMN email_al VARCHAR(55) UNIQUE;

ALTER TABLE profesores
MODIFY COLUMN email_prof VARCHAR(55) UNIQUE;


 /*4. Introduce las edades reales de tus compañeros.*/

/*UPDATE [table_name]
SET [nomColumna = valorColumna]
[WHERE];*/

UPDATE alumnos 
SET edad_al = 21
WHERE ap1_al = "Agraso";

UPDATE alumnos 
SET edad_al = 67
WHERE nom_al = "Xoel";

UPDATE alumnos 
SET edad_al = 18
WHERE nom_al = "Jesus";

UPDATE alumnos 
SET edad_al = 65
WHERE ap1_al = "Delgado";

UPDATE alumnos 
SET edad_al = 80
WHERE nom_al = "Alejandro";

UPDATE alumnos 
SET edad_al = 18
WHERE nom_al = "Brais";

UPDATE alumnos 
SET edad_al = 20
WHERE nom_al = "Felipe";

UPDATE alumnos 
SET edad_al = 99
WHERE nom_al = "Fernando";

UPDATE alumnos 
SET edad_al = 22
WHERE nom_al = "Diego Manuel";

UPDATE alumnos 
SET edad_al = 18
WHERE nom_al = "Antonio";

UPDATE alumnos 
SET edad_al = 23
WHERE nom_al = "Luis Ángel";

UPDATE alumnos 
SET edad_al = 19
WHERE nom_al = "Matias";

UPDATE alumnos 
SET edad_al = 19
WHERE nom_al = "Oscar";

UPDATE alumnos 
SET edad_al = 19
WHERE nom_al = "Francisco";

UPDATE alumnos 
SET edad_al = 18
WHERE nom_al = "Nicolás";

UPDATE alumnos 
SET edad_al = 19
WHERE nom_al = "Sergio";

UPDATE alumnos 
SET edad_al = 77
WHERE nom_al = "Juan";

UPDATE alumnos 
SET edad_al = 18
WHERE nom_al = "Hugo";

UPDATE alumnos 
SET edad_al = 65
WHERE nom_al = "Adrián";

UPDATE alumnos 
SET edad_al = 20
WHERE nom_al = "Lucas";


UPDATE alumnos 
SET edad_al = 22
WHERE nom_al = "Manuel";
UPDATE alumnos 
SET edad_al = 21
WHERE nom_al = "José María";

UPDATE alumnos 
SET edad_al = 18
WHERE nom_al = "Antón";

UPDATE alumnos 
SET edad_al = 26
WHERE nom_al = "Diego";

 /*5. Elimina al alumno soyLerdiño. */

 DELETE FROM alumnos
 WHERE nom_al = "soyLerdiño";

 /*6. Elimina la columna "nacionalidad" de la tabla alumnos.*/

ALTER TABLE alumnos
DROP COLUMN nac_al;

-- comprobamos --
DESCRIBE alumnos;


 /*7. Crea la tabla asignaturas:
  id entero de 2 dígitos autoincremental y PK (primary key).
  nombre cadena de texto 55 caracteres sin aceptar valores nulos.
  abreviatura cadena de texto de 4 caracteres sin aceptar valores nulos.
  horasSemanales entero de 2 dígitos.
  dificultad enumerado, valores posibles: bajo, medio, alto.*/

CREATE TABLE asignaturas(
    id_asig INT(2) AUTO_INCREMENT,
    nom_asig VARCHAR(55) NOT NULL,
    abreviatura VARCHAR(4) NOT NULL,
    h_semana INT(2),
    dificultad ENUM("bajo", "medio", "alto"),
    PRIMARY KEY(id_asig)
);

 /*8. Modifica la tabla asignaturas para que la columna "dificultad" no acepte valores nulos.*/

ALTER TABLE asignaturas
CHANGE dificultad dificultad ENUM("bajo", "medio", "alto") NOT NULL AFTER h_semana;

 /*9. Inserta un alumno con los siguientes valores:
    id=45
    nombre= "soyUn"
    apellido1= "adelantado"
    apellido2 = null
    edad = 77
    email = "soyUn@gmail.com"*/

INSERT INTO alumnos (id_al, nom_al, ap1_al,ap2_al,edad_al,email_al) VALUES
(45, "soyUn", "adelantado", "", 77, "soyUn@gmail.com");

 /*10. Inserta otro alumno con cualquier valor sin asignar un valor
    a la columna id. ¿Qué valor tendrá en id? ¿Cuál es la razón?*/

INSERT INTO alumnos (nom_al, ap1_al,ap2_al,edad_al,email_al) VALUES
("alumno", "ap1", "ap2", 30, "alumno@gmail.com");

/*
Como en el ejercicio anterior añadimos a un alumno especificando un id de alumno, los siguientes alumnos que añadamos
tendrán el id a partir del asignado al otro, en este caso, el nuevo que añadimos tiene el id 46
*/

 /*11. Elimina a los dos últimos alumnos insertados (en ejercicios 9 y 10).
*/
DELETE FROM alumnos
WHERE id_al = 45;

DELETE FROM alumnos
WHERE id_al = 46;