/* 1. Calcula cuantos participantes jugaron algún torneo en Barcelona, mostrando el nombre de todos los torneos jugados por 
los jugadores en una única columna.*/

SELECT COUNT(DISTINCT torneosjugadores.idJugador) AS "Número de jugadores", GROUP_CONCAT(DISTINCT torneos.nombre) AS "Torneos"
FROM torneosjugadores INNER JOIN torneos
    ON torneosjugadores.idTorneo = torneos.id
    INNER JOIN casino
    ON torneos.idCasino = casino.id
WHERE casino.localidad = "Barcelona";

-- 2. Devuelve el nombre de la ciudad que organizó algún torneo en el que no ha participado ningún jugador. --

SELECT casino.localidad
FROM casino INNER JOIN torneos      
    ON casino.id = torneos.idCasino
    LEFT JOIN torneosjugadores
    ON torneos.id = torneosjugadores.idTorneo
WHERE torneosjugadores.idJugador IS NULL;

-- Empezando por la otra tabla --

SELECT casino.localidad
FROM torneosjugadores RIGHT JOIN torneos 
    ON torneosjugadores.idTorneo = torneos.id
    INNER JOIN casino
    ON torneos.idCasino = casino.id
WHERE torneosjugadores.idJugador IS NULL;

-- en el segundo join también podríamos utilizar un LEFT JOIN, pero lo más correcto sería usar el INNER JOIN --

/* 3. Muestra el nombre del jugador, el nombre del torneo y el nombre de la modalidad favorita del jugador que ha jugado un 
torneo con un premio mayor a la media de todos los torneos de nuestra base de datos.*/

SELECT jugadores.nombre, torneos.nombre, modalidad.nombre
FROM torneos INNER JOIN torneosjugadores
    ON torneos.id = torneosjugadores.idTorneo
    INNER JOIN jugadores
    ON torneosjugadores.idJugador = jugadores.id
    INNER JOIN modalidad
    ON jugadores.idModalidad = modalidad.id
WHERE torneos.premio > (
    SELECT AVG(premio)
    FROM torneos
);

/* 4. Muestra la cantidad de caracteres que tiene el nombre del jugador que tiene como modalidad favorita Omaha y que ha 
jugado en Barcelona o de aquel jugador que participase en un torneo con premio mayor a 100 000.*/

SELECT CHAR_LENGTH(jugadores.nombre) AS "Longitud del nombre del jugador"
FROM modalidad INNER JOIN jugadores 
    ON modalidad.idJugador = jugadores.id
    INNER JOIN torneosjugadores
    ON jugadores.id = torneosjugadores.idJugador
    INNER JOIN torneos
    ON torneosjugadores.idTorneo = torneos.id
    INNER JOIN casino
    ON torneos.idCasino = casino.id
WHERE (jugadores.modalidad = (
    SELECT modalidad.id
    FROM modalidad
    WHERE modalidad.nombre LIKE "Omaha"
) AND casino.localidad = "Barcelona") OR torneos.premio > 100000.00;

-- 5. Elimina los torneos que no tengan ningún participante. --

DELETE
FROM torneos 
WHERE id IN (
    SELECT torneos.id
    FROM torneos LEFT JOIN torneosjugadores
        ON torneos.id = torneosjugadores.idTorneo
    WHERE torneosjugadores.idJugador IS NULL
);

-- 6. Muestra la información de aquellos jugadores que hayan participado en más de 1 torneo. --

SELECT jugadores.*
FROM jugadores INNER JOIN torneosjugadores
    ON jugadores.id = torneosjugadores.idJugador
GROUP BY torneosjugadores.idJugador
HAVING COUNT(DISTINCT torneosjugadores.idTorneo) > 1;

/* 7. Muestra la información de los jugadores que hayan jugado 3 torneos y que tengan como segunda letra del nombre una “e” y 
como última una “s”. */

SELECT jugadores.*
FROM jugadores INNER JOIN torneosjugadores
    ON jugadores.id = torneosjugadores.idJugador
WHERE jugadores.nombre LIKE "_e%s" 
GROUP BY jugadores.nombre
HAVING COUNT(DISTINCT torneosjugadores.idTorneo) = 3;

-- 8. Muestra cuánto suman los premios de los torneos según la localidad en la que se celebren. --

SELECT SUM(torneos.premio) AS "Suma de los premios", casino.localidad
FROM torneos INNER JOIN casino  
    ON torneos.idCasino = casino.id
GROUP BY casino.localidad;