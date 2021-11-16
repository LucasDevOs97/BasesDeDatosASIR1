-- Consultas de Selección --

/*
Muestra el nombre, apellido1 y email de los alumnos cuya
edad sea menor a 20 años.
*/

SELECT nom_al, ap1_al, email_al, edad_al
FROM alumnos
WHERE edad_al < 20
ORDER BY ap1_al DESC;


/*
Muestra el nombre, apellido1 y email de los alumnos cuya edad
sea menor o igual a 20.
*/

SELECT nom_al, ap1_al, email_al, edad_al
FROM alumnos
WHERE edad_al <= 20
ORDER BY ap1_al ASC;

-- Operadores de filtros en el WHERE --

/* 

AND
OR
BETWEEN -> Incluye los números en el rango
IN
NOT IN
<
>
<=
>=
>
LIKE (Patrón de búsqueda & y _) solo con VARCHAR
NOT LIKE solo con VARCHAR

*/

-- Muestra la información de los alumnos cuya edad es 20 años y tienen de nombre "Lucas" --

SELECT *
FROM alumnos
WHERE edad_al = 20 AND nom_al = "Lucas";

SELECT *
FROM alumnos 
WHERE edad_al = 20 AND nom_al LIKE ('Lucas');

-- Muestra la información de los alumnos cuya edad es 19 años y su apellido empieza por 'G' --

SELECT *
FROM alumnos
WHERE edad_al = 19 AND ap1_al LIKE('G%');

-- Muestra la información de los alumnos cuya edad es mayor o igual a 19 años y su apellido empieza por 'Ga' --

SELECT *
FROM alumnos
WHERE edad_al >= 19 AND ap1_al LIKE('Ga%');

-- Muestra la información de los alumnos cuya edad es mayor o igual a 19 años y su apellido empieza por 'G' y termine po 'a' --

SELECT *
FROM alumnos
WHERE edad_al >= 19 AND ap1_al LIKE('G%a');

--  Muestra la información de los alumnos cuya edad es mayor o igual a 19 años y su apellido empieza por 'G' y la penúltima letra sea la 'e' --

SELECT *
FROM alumnos
WHERE edad_al >= 19 AND ap1_al LIKE('G%e_');

-- Muestra la información de los alumnos cuya edad esté entre 18 y 25 años y su email no sea gmail --

SELECT *
FROM alumnos
WHERE edad_al BETWEEN 18 AND 25 AND email_al NOT LIKE ('%@gmail.com');

-- Muestra la información de los alumnos que no se llamen 'Brais' --

SELECT *
FROM alumnos 
WHERE nom_al != "Brais";

-- Puede usarse != porque es una cadena literal --

SELECT *
FROM alumnos 
WHERE nom_al NOT LIKE ('Brais');

-- Muestra el nombre la edad y el email de los alumnos que tengan 20, 22 y 27 años y ordena por apellido1 de forma descendente --

SELECT nom_al, edad_al, email_al, ap1_al
FROM alumnos 
WHERE edad_al IN (20, 22, 27)
ORDER BY ap1_al DESC;

-- Muestra la información de los alumnos cuya edad no sea de 20, 22 y 26 años y su nombre empiece por 'A' o 'D' --

SELECT * 
FROM alumnos
WHERE edad_al NOT IN (20, 22, 26) AND (nom_al LIKE ('A%') OR nom_al LIKE ('D%'));

-- explicacion sin parentesis --

SELECT * 
FROM alumnos
WHERE edad_al NOT IN (20, 22, 26) AND nom_al LIKE ('A%') OR nom_al LIKE ('D%');

/*



*/


-- Ordenaciones por nievel: más de una a la vez --

-- Muestra el nombre, la edad y el email de los alumnos que tengan 20 y 22 años ordenador de forma descendente, primero por edad y después por apellido --

SELECT nom_al, edad_al, email_al, ap1_al
FROM alumnos 
WHERE edad_al IN (20, 22)
ORDER BY edad_al DESC, ap1_al DESC;

-- Muestra el nombre, la edad y el email de los alumnos que tengan 20, 22 y 36 años ordenador de forma descendente, primero por edad y después por apellido de forma ascendene --

SELECT nom_al, edad_al, email_al, ap1_al
FROM alumnos 
WHERE edad_al IN (20, 22)
ORDER BY edad_al DESC, ap1_al ASC;