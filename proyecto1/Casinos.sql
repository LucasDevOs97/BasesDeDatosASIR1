/* 1. Calcula cuantos participantes jugaron algún torneo en Barcelona, mostrando el nombre de todos los torneos jugados por 
los jugadores en una única columna.*/

SELECT COUNT(DISTINCT torneosjugadores.idJugador) AS "Número de jugadores", torneos.nombre
FROM torneosjugadores INNER JOIN torneos
    ON torneosjugadores.idTorneo = torneos.id
    INNER JOIN casino
    ON torneos.idCasino = casino.id
WHERE casino.localidad = "Barcelona"
GROUP BY torneos.nombre;

-- 2. Devuelve el nombre de la ciudad que organizó algún torneo en el que no ha participado ningún jugador. --

SELECT casino.localidad
FROM casino INNER JOIN torneos      
    ON casino.id = torneos.idCasino
    RIGHT JOIN torneosjugadores
    ON torneos.id = torneosjugadores.idTorneo
WHERE torneosjugadores.idJugador IS NULL;

/* 3. Muestra el nombre del jugador, el nombre del torneo y el nombre de la modalidad favorita del jugador que ha jugado un 
torneo con un premio mayor a la media de todos los torneos de nuestra base de datos.*/



/* 4. Muestra la cantidad de caracteres que tiene el nombre del jugador que tiene como modalidad favorita Omaha y que ha 
jugado en Barcelona o de aquel jugador que participase en un torneo con premio mayor a 100 000.*/
-- 5. Elimina los torneos que no tengan ningún participante. --
-- 6. Muestra la información de aquellos jugadores que hayan participado en más de 1 torneo. --
/* 7. Muestra la información de los jugadores que hayan jugado 3 torneos y que tengan como segunda letra del nombre una “e” y 
como última una “s”. */
-- 8. Muestra cuánto suman los premios de los torneos según la localidad en la que se celebren. --