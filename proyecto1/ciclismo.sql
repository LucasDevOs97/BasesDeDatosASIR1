/*1) Obtener el código, el tipo, el color y el premio de todos los maillots que hay.*/

SELECT *
FROM maillot;

/*2) Obtener el dorsal y el nombre de los ciclistas cuya edad sea menor o igual que 25 años.*/

SELECT dorsal, nombre
FROM ciclista 
WHERE edad <= 25;

/*3) Obtener el nombre y la altura de todos los puertos de categoría 'E' (Especial)*/

SELECT nompuerto, altura
FROM puerto 
WHERE categoria LIKE "E";

/*4) Obtener el valor del atributo netapa de aquellas etapas con salida y llegada en la misma ciudad.*/

SELECT netapa
FROM etapa 
WHERE salida = llegada;

/*5) ¿Cuántos ciclistas hay?*/

SELECT COUNT(dorsal) AS "Número de ciclistas"
FROM ciclista;

/*6) ¿Cuántos ciclistas hay con edad superior a 25 años?*/

SELECT COUNT(dorsal) AS "Número de ciclistas mayores de 25 años"
FROM ciclista
WHERE edad > 25;

/*7) ¿Cuántos equipos hay?*/

SELECT COUNT(nomeq) AS "Número de equipos"
FROM equipo;

/*8) Obtener la media de edad de los ciclistas.*/

SELECT AVG(edad)
FROM ciclista;

/*9) Obtener la altura mínima y máxima de los puertos de montaña.*/

-- si suponemos que pide la altura mínima y máxima de cada puerto --

SELECT MIN(puerto.altura) AS "Altura mínima puertos de montaña", MAX(puerto.altura) AS "Altura Máxima puertos de montaña"
FROM puerto INNER JOIN etapa
	ON puerto.netapa = etapa.netapa
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
WHERE maillot.tipo LIKE "Montaña"
GROUP BY puerto.nompuerto;

-- si suponemos que es la altura máxima y mínima de entre todos los puertos --

SELECT MIN(puerto.altura) AS "Altura mínima puertos de montaña", MAX(puerto.altura) AS "Altura Máxima puertos de montaña"
FROM puerto INNER JOIN etapa
	ON puerto.netapa = etapa.netapa
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
WHERE maillot.tipo LIKE "Montaña";

/*10) Obtener el nombre de cada ciclista junto con el nombre del equipo al que pertenece*/

SELECT ciclista.nombre, equipo.nomeq
FROM ciclista INNER JOIN equipo
    ON ciclista.nomeq = equipo.nomeq;

-- 11) Obtener el nombre de los ciclistas que sean de Banesto. --

SELECT ciclista.nombre
FROM ciclista INNER JOIN equipo
    ON ciclista.nomeq = equipo.nomeq
WHERE equipo.nomeq LIKE "banesto";

-- Corrección --

SELECT nombre, nomeq 
FROM ciclista
WHERE nomeq LIKE "BAnesto";

-- 12) ¿Cuántos ciclistas pertenecen al equipo Amore Vita? --

SELECT COUNT(ciclista.dorsal) AS "Ciclistas del equipo Amore Vita"
FROM ciclista INNER JOIN equipo
    ON ciclista.nomeq = equipo.nomeq
WHERE equipo.nomeq LIKE "Amore Vita";


-- Corrección --

SELECT COUNT(*) AS "Ciclistas de Amore Vita"
FROM ciclista
WHERE nomeq LIKE "Amore Vita";

-- 13) Edad media de los ciclistas del equipo TVM. --

SELECT AVG(ciclista.edad) AS "Media de edad del equipo TVM"
FROM ciclista INNER JOIN equipo
    ON ciclista.nomeq = equipo.nomeq
WHERE equipo.nomeq LIKE "TVM";

-- Corrección --

SELECT AVG(edad) AS "Media edad del equipo TVM"
FROM ciclista
WHERE nomeq LIKE "TVM";

-- 14) Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain (SIN SUBCONSULTA) --

SELECT nombre
FROM ciclista AS c1 INNER JOIN ciclista AS c2
    ON c1.nomeq = c2.nomeq
WHERE c2.nombre LIKE "Miguel Indurain" AND c1.nombre NOT LIKE "Miguel Indurain";

-- 15) Nombre de los ciclistas que han ganado alguna etapa. --

SELECT ciclista.nombre
FROM ciclista INNER JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
GROUP BY ciclista.nombre;

-- Corrección --

SELECT DISTINCT ciclista.nombre
FROM ciclista INNER JOIN etapa 
    ciclista.dorsal = etapa.dorsal;

-- Me da error en el phpMyAdmin --

-- 16) Nombre de los ciclistas que han llevado el maillot General. -- -- -14, 16, 24, 25, 36 SIN SUBCONSULTA-

SELECT ciclista.nombre
FROM ciclista INNER JOIN llevar
    ON ciclista.dorsal = llevar.dorsal
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
WHERE maillot.tipo LIKE "general";

-- 17) Obtener el nombre del ciclista más joven -- -- 17, 27, 37, 38 SUBCONSULTA --

SELECT ciclista.nombre
FROM ciclista 
WHERE edad = (
	SELECT MIN(edad)
    FROM ciclista
);

/* USANDO ALL. Se quedará solo con la edad que cumpla siempre la condición, en este caso menor o igual. Lo que hace es comparar la edad de cada
ciclista con todos los registros de edades. Aquí el único que cumple que siempre es menor o igual es el 17
*/

SELECT nombre
FROM ciclista
WHERE edad <= ALL (
    SELECT edad
    FROM ciclista
);

-- 18) Obtener el número de ciclistas de cada equipo. --

SELECT COUNT(ciclista.dorsal) AS "Número de ciclistas de cada equipo"
FROM ciclista INNER JOIN equipo
	ON ciclista.nomeq = equipo.nomeq
GROUP BY equipo.nomeq;

-- Corrección --

SELECT COUNT(*) AS "Número de ciclsitas de cada equipo", nombre
FROM ciclista
GROUP BY nomeq;

-- 19) Obtener el nombre de los equipos que tengan más de 5 ciclistas. --

SELECT equipo.nomeq
FROM ciclista INNER JOIN equipo
	ON ciclista.nomeq = equipo.nomeq
GROUP BY equipo.nomeq
HAVING COUNT(ciclista.dorsal) > 5;

-- Corrección --

SELECT COUNT(*)
FROM ciclista
GROUP BY nomeq
HAVING COUNT(*) > 5;

-- 20) Obtener el número de puertos que ha ganado cada ciclista. --

SELECT COUNT(puerto.nompuerto) AS "Puertos que ha ganado cada ciclsita"
FROM ciclista INNER JOIN puerto
    ON ciclista.dorsal = puerto.dorsal
GROUP BY cilista.dorsal;

-- 21) Obtener el nombre de los ciclistas que han ganado más de un puerto. --

SELECT ciclista.nombre
FROM ciclista INNER JOIN puerto USING (dorsal)
GROUP BY ciclista.dorsal
HAVING COUNT(*) > 1;

-- 22) Obtener el nombre y el director de los equipos a los que pertenezca algún ciclista mayor de 33 años. --

SELECT equipo.nomeq, equipo.director
FROM equipo INNER JOIN ciclista
	ON equipo.nomeq = ciclista.nomeq
WHERE ciclista.edad > 33;

-- 23) Nombre de los ciclistas que no pertenezcan a Kelme --

SELECT ciclista.nombre
FROM equipo INNER JOIN ciclista
	ON equipo.nomeq = ciclista.nomeq
WHERE equipo.nomeq NOT LIKE "Kelme";

-- Corrección --

SELECT nombre
FROM ciclista
WHERE nomeq NOT LIKE "Kelme";

-- 24) Nombre de los ciclistas que no hayan ganado ninguna etapa. --

SELECT DISTINCT ciclista.nombre
FROM ciclista LEFT JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
WHERE etapa.dorsal IS NULL;

-- 25) Nombre de los ciclistas que no hayan ganado ningún puerto de montaña. --

-- Nombre los ciclistas que han ganado más de un puerto --

SELECT nombre
FROM ciclista
WHERE dorsal NOT IN (
    SELECT dorsal
    FROM puerto
);

-- Solución --

SELECT ciclista.nombre
FROM ciclista LEFT JOIN puerto
    ON ciclista.dorsal = puerto.dorsal
WHERE puerto.dorsal IS NULL;

-- 26) Nombre de los ciclistas que hayan ganado más de un puerto de montaña. --

SELECT DISTINCT ciclista.nombre
FROM ciclista INNER JOIN puerto
    ON ciclista.dorsal = puerto.dorsal
    INNER JOIN etapa
    ciclista.codigo = etapa.codigo
    INNER JOIN llevar 
    ON ciclista.codigo = llevar.codigo
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
WHERE maillot.tipo LIKE "montaña";

-- Corrección --

SELECT COUNT(*) AS "Número de ciclistas", ciclista.nombre
FROM ciclista INNER JOIN puerto
    ON ciclista.dorsal = puerto.dorsal
GROUP BY ciclista.dorsal
HAVING COUNT(*) > 1;

-- 27) ¿Qué ciclistas han llevado el mismo maillot que Miguel Indurain? Subconsulta --

SELECT ciclista.nombre
FROM ciclista INNER JOIN llevar
	ON ciclista.dorsal = llevar.dorsal
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
WHERE maillot.tipo IN (
	SELECT maillot.tipo
	FROM ciclista INNER JOIN llevar
		ON ciclista.dorsal = llevar.dorsal
    	INNER JOIN maillot
    	ON llevar.codigo = maillot.codigo
	WHERE ciclista.nombre LIKE "Miguel Indurain"
	GROUP BY maillot.tipo
) AND ciclista.nombre NOT LIKE "Miguel indurain";

-- Otra forma --

SELECT ciclista.nombre
FROM ciclista INNER JOIN llevar
    ON ciclista.dorsal = llevar.dorsal
WHERE llevar.codigo IN (
    SELECT llevar.codigo
    FROM ciclista INNER JOIN llevar
        ON ciclista.dorsal = llevar.dorsal
    WHERE ciclista.nombre LIKE "Miguel Indurain"
) AND ciclista.nombre NOT LIKE "Miguel Indurain";

-- 28) De cada equipo obtener la edad media, la máxima edad y la mínima edad. --

SELECT equipo.nomeq, MIN(ciclista.edad) AS "EDAD MÍNIMA", MAX(ciclista.edad) AS "EDAD MÁXIMA", AVG(ciclista.edad) AS "EDAD MEDIA"
FROM equipo INNER JOIN ciclista
	ON equipo.nomeq = ciclista.nomeq
GROUP BY equipo.nomeq;

-- Corrección --

SELECT nomeq, MIN(ciclista.edad) AS "EDAD MÍNIMA", MAX(ciclista.edad) AS "EDAD MÁXIMA", AVG(ciclista.edad) AS "EDAD MEDIA"
FROM ciclista 
GROUP BY nomeq;

-- 29) Nombre de aquellos ciclistas que tengan una edad entre 25 y 30 años y que no pertenezcan a los equipos Kelme y Banesto. --

SELECT ciclista.nombre
FROM equipo INNER JOIN ciclista
	ON equipo.nomeq = ciclista.nomeq
WHERE ciclista.edad BETWEEN 25 AND 30 AND equipo.nomeq NOT IN ("Kelme", "Banesto");

-- Corrección --

SELECT nombre
FROM ciclista
WHERE edad BETWEEN 25 AND 30 AND nomeq NOT IN ("Kelme", "Banesto");

-- 30) Nombre de los ciclistas que han ganado la etapa que comienza en Zamora. --

SELECT ciclista.nombre
FROM ciclista INNER JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
WHERE etapa.salida LIKE "Zamora";

-- 31) Obtén el nombre y la categoría de los puertos ganados por ciclistas del equipo 'Banesto'. --

SELECT puerto.nompuerto, puerto.categoria
FROM equipo INNER JOIN puerto
    ON ciclista.dorsal = puerto.dorsal
WHERE ciclista.nomeq LIKE "Banesto";

-- 32) Obtener el nombre de cada puerto indicando el número (netapa) y los kilómetros de la etapa en la que se encuentra el puerto. --

SELECT puerto.nompuerto, etapa.netapa, etapa.km
FROM puerto INNER JOIN etapa
	ON puerto.netapa = etapa.netapa;

-- 33) Obtener el nombre de los ciclistas con el color de cada maillot que hayan llevado. --

SELECT ciclista.nombre, GROUP_CONCAT(maillot.color)
FROM ciclista INNER JOIN llevar
	ON ciclista.dorsal = llevar.dorsal
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
GROUP BY ciclista.nombre;

/* 36) Obtener el valor del atributo netapa y la ciudad de salida de aquellas etapas que no tengan puertos de montaña.*/

SELECT etapa.netapa, etapa.salida
FROM etapa LEFT JOIN puerto
    ON etapa.netapa = puerto.netapa
WHERE puerto.netapa IS NULL;

/* 37)  Obtener la edad media de los ciclistas que han ganado alguna etapa. */

SELECT AVG(DISTINCT ciclista.edad) AS "Edad media"
FROM ciclista INNER JOIN etapa
    ON ciclista.dorsal = etapa.dorsal;

-- Con subconsulta --

SELECT AVG(edad)
FROM ciclista 
WHERE ciclista.dorsal IN (
    SELECT dorsal
    FROM ciclista INNER JOIN etapa
        ON ciclista.dorsal = etapa.dorsal
)

/* 38) Selecciona el nombre de los puertos con una altura superior a la altura media de todos los puertos.*/

SELECT nompuerto
FROM puerto 
WHERE altura > (
    SELECT AVG(altura)
    FROM puerto
);

-- Última que corregimos: 38 --

/* 39) Obtener el nombre de la ciudad de salida y de llegada de las etapas donde estén los puertos con mayor pendiente.*/

SELECT etapa.salida, etapa.llegada
FROM puerto INNER JOIN etapa
	ON puerto.netapa = etapa.netapa
WHERE puerto.pendiente = (
	SELECT MAX(puerto.pendiente)
    FROM puerto
);

/* 40) Obtener el dorsal y el nombre de los ciclistas que han ganado los puertos de mayor altura. */

SELECT ciclista.dorsal, ciclista.nombre
FROM ciclista INNER JOIN puerto
	ON ciclista.dorsal = puerto.dorsal
WHERE puerto.altura = (
	SELECT MAX(puerto.altura)
    FROM puerto
);

/* 41) Obtener el nombre del ciclista más joven que ha ganado al menos una etapa. */



/* 42) Obtener el valor del atributo netapa de aquellas etapas tales que todos los puertos que están en ellas tienen al menos 2500 metros de altura.*/

SELECT DISTINCT netapa
FROM puerto
WHERE altura >= 2500;

SELECT DISTINCT etapa.netapa
FROM etapa INNER JOIN puerto 
    ON etapa.netapa = puerto.netapa
WHERE puerto.altura >= 2500;

-- 43) Obtener el nombre y el director de los equipos tales que todos sus ciclistas son mayores de 20 años.

SELECT equipo.nomeq, equipo.director
FROM equipo INNER JOIN ciclista
	ON equipo.nomeq = ciclista.nomeq
WHERE ciclista.edad > 20;

/* 44) Obtener el dorsal y el nombre de los ciclistas tales que todas las etapas que han ganado tienen al menos 150 km (es decir que sólo han ganado etapas de 
más o igual a 150 km).*/

SELECT DISTINCT ciclista.dorsal, ciclista.nombre
FROM ciclista INNER JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
WHERE etapa.km >= 150;

-- 45) Obtener el nombre de los ciclistas que han ganado una etapa y algún puerto de esa misma etapa.

SELECT DISTINCT ciclista.nombre
FROM ciclista INNER JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
    INNER JOIN puerto 
    ON etapa.netapa = puerto.netapa;

-- 46) Obtener el nombre de los equipos tales que todos sus corredores han llevado algún maillot o han ganado algún puerto. (ninguno lo comple)

