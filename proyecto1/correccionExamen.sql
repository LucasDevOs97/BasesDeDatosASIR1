/*1) DI CUÁNTOS SURFISTAS HAN SURFEADO EN OLAS DE DIFICULTAD “DIFICIL”.*/

SELECT COUNT(DISTINCT playassurfistas.idSurfista) AS "Surfistas olas difíciles"
FROM surfistas INNER JOIN playassurfistas
    ON surfistas.id = playassurfistas.idSurfista
    INNER JOIN playas
    ON playassurfistas.idPlaya = playas.id
    INNER JOIN olas
    ON playas.id = olas.idPlaya
WHERE olas.dificultad LIKE "dificil"; 

/*2) MUESTRA EL NOMBRE Y EL APELLIDO DE LOS SURFISTAS EN  UNA ÚNICA COLUMNA QUE HAYAN SURFEADO EN LA PLAYA DE MAYOR EXTENSIÓN.*/

SELECT CONCAT(surfistas.nombre, " ",surfistas.apellido) 
FROM playas INNER JOIN playassurfistas
	ON playas.id = playassurfistas.idPlaya
    INNER JOIN surfistas
    ON playassurfistas.idSurfista = surfistas.id
WHERE playas.extension IN (
    SELECT MAX(playas.extension)
    FROM playas
);

/*3) MUESTRA LA INFORMACIÓN DE LOS SURFISTAS QUE HAYAN SURFEADO EN MÁS DE 2 PLAYAS DISTINTAS.*/

SELECT COUNT(DISTINCT playassurfistas.idPlaya) AS "Surfistas que surfean en más de 2 playas", surfistas.nombre, surfistas.apellido
FROM surfistas INNER JOIN playassurfistas
    ON surfistas.id = playassurfistas.idSurfista
GROUP BY surfistas.id
HAVING COUNT(DISTINCT playassurfistas.idPlaya) > 2;


/*4) MUESTRA EL NOMBRE DE LA PLAYA ASÍ COMO EL NOMBRE Y APELLIDOS DE LOS SURFISTAS EN UNA ÚNICA COLUMNA JUNTO CON EL 
NÚMERO DE PLAYAS EN LAS QUE HAN SURFEADO.*/

SELECT CONCAT(surfistas.nombre, " ", surfistas.apellido, " - ", GROUP_CONCAT(DISTINCT playas.nombre), " ", COUNT(playassurfistas.idPlaya)) AS "Surfistas, nombre y número de playas en las que han surfeado"
FROM surfistas INNER JOIN playassurfistas
    ON surfistas.id = playassurfistas.idSurfista
    INNER JOIN playas
    ON playassurfistas.idPlaya = playas.id
GROUP BY surfistas.id;

/*5) MUESTRA LAS PLAYAS QUE NO FUERON SURFEADAS POR NINGUN SURFISTA CON OLAS CUYA DIFICULTAD NO SEA NI MEDIA NI FACIL.*/

SELECT *
FROM surfistas LEFT JOIN playassurfistas
    ON surfistas.id = playassurfistas.idSurfista
    RIGHT JOIN playas
    ON playassurfistas.idPlaya = playas.id
    LEFT JOIN olas
    ON playas.id = olas.idPlaya
WHERE olas.dificultad NOT IN ("media", "facil");

/*6) MUESTRA LA INFORMACIÓN DE LAS PLAYAS CON UNA EXTENSIÓN MAYOR A 500,00 METROS CUADRADOS QUE HAYAN SIDO SURFEADAS POR
MENOS DE 2 SURFISTAS.*/

/*7) HAZ QUE LOS SURFISTAS QUE HAYAN SURFEADO EN ALGUNA PLAYA CON OLA DE DIFICULTAD DIFICIL PASEN A SER DE CATEGORIA 
SENIOR (USAD SUBCONSULTA).*/

/*8) BORRA EL REGISTRO DE AQUELLOS SURFISTAS CUYO APELLIDO EMPIECE POR “V” Y CUYA PENULTIMA LETRA SEA LA “E” TENIENDO EN CUENTA 
QUE SU NOMBRE DEBE SUPERAR LOS 4 CARACTERES, EN CASO DE TENER UN NOMBRE DE 4 O MENOS CARACTERES, EL REGISTRO NO SERÁ BORRADO.*/