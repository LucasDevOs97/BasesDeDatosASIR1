-- CREACIÓN DE VISTAS --


-- peliculas INNER JOIN peliculas_actores --
CREATE VIEW actores_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_actores
    	ON peliculas.id = peliculas_actores.pelicula_id;

-- peliculas INNER JOIN peliculas_directores --

CREATE VIEW directores_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_directores
    	ON peliculas.id = peliculas_directores.pelicula_id;

-- peliculas INNER JOIN peliculas_estudios --

CREATE VIEW estudios_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_estudios
    	ON peliculas.id = peliculas_estudios.pelicula_id;

-- peliculas INNER JOIN peliculas_generos --

CREATE VIEW generos_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_generos
    	ON peliculas.id = peliculas_generos.pelicula_id;

-- peliculas INNER JOIN peliculas_distribuidoras --

CREATE VIEW distribuidoras_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_distribuidoras
    	ON peliculas.id = peliculas_distribuidoras.pelicula_id;

-- peliculas INNER JOIN peliculas_fotografos --

CREATE VIEW fotografos_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_fotografos
    	ON peliculas.id = peliculas_fotografos.pelicula_id;

-- peliculas INNER JOIN peliculas_guionistas --

CREATE VIEW guionistas_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_guionistas
    	ON peliculas.id = peliculas_guionistas.pelicula_id;

-- peliculas INNER JOIN peliculas_montadores --

CREATE VIEW montadores_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_montadores
    	ON peliculas.id = peliculas_montadores.pelicula_id;

-- peliculas INNER JOIN peliculas_musicos --

CREATE VIEW musicos_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_musicos
    	ON peliculas.id = peliculas_musicos.pelicula_id;

-- peliculas INNER JOIN peliculas_nacionalidades --

CREATE VIEW nacionalidades_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_nacionalidades
    	ON peliculas.id = peliculas_nacionalidades.pelicula_id;

-- peliculas INNER JOIN peliculas_productores --

CREATE VIEW productores_peliculas AS
	SELECT *
    FROM peliculas INNER JOIN peliculas_productores
    	ON peliculas.id = peliculas_productores.pelicula_id;




-- CONSULTAS --

/* 1) Directores y actores con más películas */



/* 2) Películas que han sido producidas por Kathleen Kennedy. Incluir el director y ordenar por año de producción. */

SELECT productores_peliculas.titulo, productores_peliculas.produccion, directores.director
FROM productores_peliculas INNER JOIN productores
	On productores_peliculas.productor_id = productores.id
    INNER JOIN directores_peliculas
    ON directores_peliculas.pelicula_id = productores_peliculas.pelicula_id
    INNER JOIN directores
    ON directores_peliculas.director_id = directores.id
WHERE productores.productor LIKE "Kathleen Kennedy"
ORDER BY productores_peliculas.produccion;

/* 3) Películas realizadas por cualquiera de los actores que trabajaron en "Forrest Gump" */

SELECT directores_peliculas.titulo
FROM directores_peliculas INNER JOIN directores
	ON directores_peliculas.director_id = directores.id
WHERE directores.director IN (
	SELECT actores.actor
    FROM actores INNER JOIN actores_peliculas
        ON actores.id = actores_peliculas.actor_id
    WHERE actores_peliculas.titulo LIKE "Forrest Gump"
);

/* 4) Películas dirigidas por Billy Wilder donde hayan actuado Marilyn Monroe o Jack Lemmon */

SELECT directores_peliculas.titulo, directores_peliculas.produccion, actores.actor
FROM directores_peliculas INNER JOIN directores 
	ON directores_peliculas.director_id = directores.id
    INNER JOIN actores_peliculas
    ON actores_peliculas.pelicula_id = directores_peliculas.pelicula_id
    INNER JOIN actores
    ON actores_peliculas.actor_id = actores.id
WHERE directores.director LIKE "Billy Wilder" AND actores.actor IN ("Marilyn Monroe", "Jack Lemmon")
ORDER BY directores_peliculas.titulo, actores.actor;

-- Otra forma --

SELECT peliculas.titulo, peliculas.produccion, actores.actor
FROM peliculas 
  INNER JOIN directores_peliculas 
  	ON peliculas.id = directores_peliculas.pelicula_id
    INNER JOIN directores
    ON directores_peliculas.director_id = directores.id
  INNER JOIN actores_peliculas 
  ON actores_peliculas.pelicula_id = peliculas.id
  INNER JOIN actores 
  ON actores_peliculas.actor_id = actores.id
WHERE directores.director = 'Billy Wilder' 
  AND actores.actor IN ('Marilyn Monroe','Jack Lemmon')
ORDER BY peliculas.titulo, actores.actor

-- Películas dirigidas por Billy Wilder --
/*SELECT *
FROM directores_peliculas INNER JOIN directores 
	ON directores_peliculas.director_id = directores.id
WHERE directores.director LIKE "Billy Wilder";*/

-- Películas en las que actúan Marilyn Monroe o Jasck Lemmon --
/*SELECT *
FROM actores_peliculas INNER JOIN actores
	ON actores_peliculas.actor_id = actores.id
WHERE actores.actor IN ("Marilyn Monroe", "Jack Lemmon");*/

/* 5) Géneros de película preferidos del director John Ford (Contar cuantas películas de cada género ha hecho Jhon Ford)*/
SELECT COUNT(*) AS "Número de películas de ese género", generos.genero
FROM generos INNER JOIN generos_peliculas
	ON generos.id = generos_peliculas.genero_id
    INNER JOIN directores_peliculas
    ON generos_peliculas.pelicula_id = directores_peliculas.pelicula_id
    INNER JOIN directores
    ON directores_peliculas.director_id = directores.id
WHERE directores.director LIKE "John Ford"
GROUP BY generos.genero
ORDER BY COUNT(*) DESC;

/* 6) Películas de animación o dibujos animados ordenadas de más a menos reciente */

SELECT generos_peliculas.titulo, generos_peliculas.produccion, generos.genero
FROM generos_peliculas INNER JOIN generos
	ON generos_peliculas.genero_id = generos.id
WHERE generos.genero IN ("Animacion", "Dibujos Animados")
ORDER BY generos_peliculas.produccion DESC;

/* 7) Películas dónde actúan "Cary Grant" y "Ingrid Bergman" */

SELECT actores_peliculas.titulo, actores_peliculas.produccion
FROM actores INNER JOIN actores_peliculas
	ON actores.id = actores_peliculas.actor_id
WHERE actores.actor = "Ingrid Bergman" AND actores_peliculas.titulo IN (
	SELECT actores_peliculas.titulo
    FROM actores INNER JOIN actores_peliculas
        ON actores.id = actores_peliculas.actor_id
    WHERE actores.actor = "Cary Grant"
);

/* 8) Películas y actores del año 1982 */

SELECT actores_peliculas.titulo, GROUP_CONCAT(actores.actor) AS "actores"
FROM actores_peliculas INNER JOIN actores
	ON actores_peliculas.actor_id = actores.id
WHERE actores_peliculas.produccion = 1982
GROUP BY actores_peliculas.titulo;

/* 9) Películas y actores de la década de los 90 con al menos 2 directores */

/* 10) Películas del director que tenga más películas */