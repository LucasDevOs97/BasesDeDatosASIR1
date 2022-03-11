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



/* 5) Géneros de película preferidos del director John Ford */

/* 6) Películas de animación o dibujos animados ordenadas de más a menos reciente */

/* 7) Películas dónde actúan "Cary Grant" y "Ingrid Bergman" */

/* 8) Películas y actores del año 1982 */

/* 9) Películas y actores de la década de los 90 con al menos 2 directores */

/* 10) Películas del director que tenga más películas */