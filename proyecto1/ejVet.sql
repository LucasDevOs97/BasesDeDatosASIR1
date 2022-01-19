-- ¿Cuántos perros de cada sexo hay en total actualmente en el centro? --

SELECT sexo, COUNT(*)
FROM mascotas
WHERE especie = "P" AND estado = "A"
GROUP BY sexo;

-- ¿Cuántos ejemplares contiene cada jaula o ubicación? --

SELECT ubicacion, COUNT(*)
FROM mascotas
WHERE estado = "A"
GROUP BY ubicacion;

/*  ¿Cuántos ejemplares de cada especie, y dentro de cada especie, de cada sexo, hay actualmente en el centro? 
(En este ejercicio tendremos que agrupar por dos niveles de la misma manera que con ORDER BY podíamos ordenador 
los registros según los valores de sus campos por niveles).*/

SELECT especie, sexo, COUNT(*) AS ejemplares
FROM mascotas
WHERE estado = "A"
GROUP BY especie, sexo;

-- ¿Cuántos perros y gatos han pasado por el centro y han sido dados de baja? --

SELECT especie, COUNT(*)
FROM mascotas
WHERE estado = "B";

/*En este caso no habría que agruparlos porque nos dice cuantos perros y gatos (ejempleares), agruparíamos por especies 
si preguntase cuántos perros y cuántos gatos*/

SELECT especie, COUNT(*)
FROM mascotas 
WHERE estado = "B"
GROUP BY especie;

-- ¿Cuántos perros macho hay en el centro agrupados por ubicación? --

SELECT ubicacion, COUNT(*)
FROM mascotas
WHERE sexo = "M" AND especie = "P" AND estado = "A"
GROUP BY ubicacion;

-- Construir una consulta que nos devuelva qué especies distintas hay en cada ubicación. --

SELECT especie, ubicacion
FROM mascotas
WHERE estado = "A"
GROUP BY ubicacion, especie;

-- ¿Cuántos ejemplares habrá dados de alta en las ubicaciones E02 y E03? --

SELECT COUNT(*) AS ejemplares, ubicacion
FROM mascotas
WHERE (ubicacion = "E02" OR ubicacion = "EO3") AND estado = "A";

-- Mejor así: -- -- ¡¡¡¡¡¡¡Con COUNt siempre tenemos que agrupar!!!!!!!! --

SELECT COUNT(*) AS ejemplares, ubicacion
FROM mascotas
WHERE ubicacion IN ("E02", "E03") AND estado = "A"
GROUP BY ubicacion;


-- ¿Qué ubicaciones del centro de veterinaria tienen tan solo un ejemplar? --

SELECT ubicacion, COUNT(*)
FROM mascotas
WHERE estado = "A"
GROUP BY ubicacion
HAVING COUNT(*) = 1;

-- Devuelve aquellas ubicaciones que tengan entre 2 y 3 animales. --

SELECT ubicacion, COUNT(*)
FROM mascotas
WHERE estado = "A"
GROUP BY ubicacion
HAVING COUNT(*) BETWEEN 2 AND 3;

-- ¿Qué ubicaciones del centro tiene más de 2 ejemplares? --

SELECT ubicacion, COUNT(*)
FROM mascotas
WHERE estado = "A"
GROUP BY ubicacion
HAVING COUNT(*) > 2;

-- Las mascotas tienen que estar de alta en la clínica --

/*

Desde phpmyadmin hemos creado una nueva tabla llamada "veterinarios", con los siguientes campos: id, nombre, apellido, telefono
Además, añadimos otra tabla más, llamada "atienden" que relacionará las tablas veterinarios y mascotas (N:M)
Para crear las claves foráneas, tenemos que situarnos en la tabla atienden (id, idVet, idMasc, fecha), 
en la estructura y apartado de 'Vista de relaciones'. 
Le ponemos un nombre a la restricción (constraint), en columna seleccionamos idVet (es la FK), base de datos en este caso 'veterinaria',
y elegimos la tabla a la que referencia, de la que extrae los datos. Detectará automáticamente el campo al que queremos referenciar.

*/