-- ¿Cuántos perros de cada sexo hay en total actualmente en el centro? --

SELECT sexo, COUNT(*)
FROM mascotas
WHERE especie = "P" AND estado = "A"
GROUP BY sexo;

-- ¿Cuántos ejemplares contiene cada jaula o ubicación? --
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
WHERE estado = "B"
GROUP BY especie;

-- ¿Cuántos perros macho hay en el centro agrupados por ubicación? --

SELECT ubicacion, COUNT(*)
FROM mascotas
WHERE sexo = "M" AND especie = "P"
GROUP BY ubicacion;

-- Construir una consulta que nos devuelva qué especies distintas hay en cada ubicación. --

SELECT especie, ubicacion, COUNT(*)
FROM mascotas
GROUP BY ubicacion, especie;

-- ¿Cuántos ejemplares habrá dados de alta en las ubicaciones E02 y E03? --

SELECT COUNT(*) AS ejemplares, especie
FROM mascotas
WHERE (ubicacion = "E02" OR ubicacion = "EO3") AND estado = "A";

-- ¿Qué ubicaciones del centro de veterinaria tienen tan solo un ejemplar? --

SELECT ubicacion, COUNT(*)
FROM mascotas
GROUP BY ubicacion
HAVING COUNT(*) = 1;

-- Devuelve aquellas ubicaciones que tengan entre 2 y 3 animales. --

SELECT ubicacion, COUNT(*)
FROM mascotas
GROUP BY ubicacion
HAVING COUNT(*) IN (2,3);

-- ¿Qué ubicaciones del centro tiene más de 2 ejemplares? --

SELECT ubicacion, COUNT(*)
FROM mascotas
GROUP BY ubicacion
HAVING COUNT(*) > 2;