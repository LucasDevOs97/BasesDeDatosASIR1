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

-- 12) ¿Cuántos ciclistas pertenecen al equipo Amore Vita? --

SELECT COUNT(ciclista.dorsal) AS "Ciclistas del equipo Amore Vita"
FROM ciclista INNER JOIN equipo
    ON ciclista.nomeq = equipo.nomeq
WHERE equipo.nomeq LIKE "Amore Vita";

-- 13) Edad media de los ciclistas del equipo TVM. --

SELECT AVG(ciclista.edad) AS "Media de edad del equipo TVM"
FROM ciclista INNER JOIN equipo
    ON ciclista.nomeq = equipo.nomeq
WHERE equipo.nomeq LIKE "TVM";

-- 14) Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain (SIN SUBCONSULTA) --



-- 15) Nombre de los ciclistas que han ganado alguna etapa. --

SELECT ciclista.nombre
FROM ciclista INNER JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
GROUP BY ciclista.nombre;

-- 16) Nombre de los ciclistas que han llevado el maillot General. -- -- -14, 16, 24, 25, 36 SIN SUBCONSULTA-

SELECT ciclista.nombre
FROM ciclista INNER JOIN etapa
	ON ciclista.dorsal = etapa.dorsal
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
WHERE maillot.tipo LIKE "General"
GROUP BY ciclista.nombre;

-- 17) Obtener el nombre del ciclista más joven -- -- 17, 27, 37, 38 SUBCONSULTA --

SELECT ciclista.nombre
FROM ciclista 
WHERE edad = (
	SELECT MIN(edad)
    FROM ciclista
);

-- 18) Obtener el número de ciclistas de cada equipo. --

SELECT COUNT(ciclista.dorsal) AS "Número de ciclistas de cada equipo"
FROM ciclista INNER JOIN equipo
	ON ciclista.nomeq = equipo.nomeq
GROUP BY equipo.nomeq;

-- 19) Obtener el nombre de los equipos que tengan más de 5 ciclistas. --

SELECT equipo.nomeq
FROM ciclista INNER JOIN equipo
	ON ciclista.nomeq = equipo.nomeq
GROUP BY equipo.nomeq
HAVING COUNT(ciclista.dorsal) > 5;

-- 20) Obtener el número de puertos que ha ganado cada ciclista. --

SELECT COUNT(puerto.nompuerto) AS "Número de puertos en los que ha ganado cada ciclista"
FROM ciclista INNER JOIN puerto	
	ON ciclista.dorsal = puerto.dorsal
    INNER JOIN etapa
    ON puerto.netapa = etapa.netapa
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
GROUP BY ciclista.dorsal;

-- 21) Obtener el nombre de los ciclistas que han ganado más de un puerto. --

SELECT ciclista.nombre
FROM ciclista INNER JOIN puerto	
	ON ciclista.dorsal = puerto.dorsal
    INNER JOIN etapa
    ON puerto.netapa = etapa.netapa
    INNER JOIN llevar
    ON etapa.netapa = llevar.netapa
    INNER JOIN maillot
    ON llevar.codigo = maillot.codigo
GROUP BY ciclista.dorsal
HAVING COUNT(puerto.nompiuerto) > 1;