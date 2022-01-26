/*

    Distinguiremos entre:
    - INNER JOIN
    - LEFT JOIN
    - RIGHT JOIN
    - OUTER JOIN

    En el caso del último tipo de JOIN, como estamos trabajando en MySql no lo podremos emplear, en su lugar
    haremos: LEFT JOIN - UNION ALL - RIGHT JOIN

    Imaginemos, para cada uno, dos círculos que tienen partes en común (diagramas de Venn), el círculo A, siuado
    en la izquierda, y el círculo B, situado a la derecha.
    
    - LEFT JOIN: 
        - Seleccionará todo lo del círculo A, incluyendo la parte común con el círculo B.
    - INNER JOIN:
        - Seleccionará, únicamente, lo que ambos círculos tengan en común.
    - RIGHT JOIN:
        - Seleccionará todo lo del círculo B, incluyendo la parte común con el círculo A.

    Pongamos ejemplos sobre la base de datos que hemos creado (medicina).

    -- INNER JOIN --

    En este caso, tanto el campo "id" de la tabla "medicos" como el "idMedico" de la tabla "pacientes", será el mismo, es decir,
    este es un valor común. Por lo tanto, si las unimos empleando un INNER JOIN, mostraremos información de ambas tablas en las que 
    el valor es el mismo para este campo (id).
    Ejemplo de enunciados:
        - Muestra la información de los pacientes y su médico asociado.
        - Muestra la información de los médicos y sus pacientes asignados.
        - SELECT *
        -> FROM pacientes INNER JOIN medicos
        -> ON pacientes.idMedico = medicos.id;

        En este caso los únicos médicos que no tienen pacientes asignados son los jubilados, ya que por esta condición, no atienden pacientes.

    -- LEFT JOIN --

    En este caso, sería el mismo resultado que el INNER JOIN anterior más todos los datos de la tabla de la izquierda ya sean
    datos comunes a ambas o NO.

    - SELECT *
    - FROM pacientes LEFT JOIN medicos
    - ON pacientes.idMedico = medicos.id;

    En este caso el resultado será exactamente igual al del INNER JOIN porque no hay ningún paciente que no tenga asociado
    algún médico.

    -- RIGHT JOIN --

    Funciona igual que el LEFT JOIN pero cogerá los valores de la tabla de la derecha y los del ON aunque no cumplan la condición


*/

/*

    EXPLICACIÓN RICO

    SELECT *
    FROM tablaA INNER JOIN tablaB
    ON tablaA.PK = tablaB.FK;


    SELECT *
    FROM pacientes INNER JOIN medicos
    ON pacientes.idMedico = medicos.id;

    Esta consulta devolverá los datos de los pacientes que tienen algún médico asignado, pasando por alto los médicos que no tienen 
    pacientes.

    Si quisiéramos ver todos los pacientes, tengan o no médicos, haríamos un LEFT JOIN

    SELECT *
    FROM pacientes LEFT JOIN medicos
    ON pacientes.idMedico = medicos.id;

    Enseñar los pacientes que NO tienen un médico asociado.

    SELECT *
    FROM pacientes LEFT JOIN medicos
        ON pacientes.idMedico = medicos.id
    WHERE pacientes.idMedico IS NULL;

    SELECT *
    FROM paciente RIGHT JOIN medicos
        ON pacientes.idMedico = medicos.id;

    Muestra todos los médicos

    Si quisiéramos mostrar todos los médicos que no tienen pacientes:

    SELECT *
    FROM paciente RIGHT JOIN medicos
        ON pacientes.idMedico = medicos.id
    WHERE pacientes.idMedico IS NULL;

    -- TRES TABLAS --

    Mostrar los pacientes que tienen algún tratamiento.

    SELECT *
    FROM pacientes INNER JOIN pacientestratamientos
        ON pacientes.id = pacientestratamientos.idPaciente
            INNER JOIN tratamientos
                ON pacientestratamientos.idTratamiento = tratamientos.id;


    Mostrar la información de todos los pacientes, tanto de los que tienen tratamiento como los que no

    SELECT *
    FROM pacientes LEFT JOIN pacientestratamientos
        ON pacientes.id = pacientestratamientos.idPaciente
            LEFT JOIN tratamientos
                ON pacientestratamientos.idTratamiento = tratamientos.id;


    Mostrar información de los médicos, de los pacientes y sus tratamientos

    SELECT *
    FROM medicos INNER JOIN pacientes
        ON medicos.id = pacientes.idMedico
            INNER JOIN pacientestratamientos
                ON pacientes.id = pacientestratamientos.idPaciente
                    INNER JOIN tratamientos
                        ON pacientestratamientos.idTratamiento = tratamientos.id;

    lo anterior + que el tatamiento sea ibuprofeno

    SELECT *
    FROM medicos INNER JOIN pacientes
        ON medicos.id = pacientes.idMedico
            INNER JOIN pacientestratamientos
                ON pacientes.id = pacientestratamientos.idPaciente
                    INNER JOIN tratamientos
                        ON pacientestratamientos.idTratamiento = tratamientos.id
    WHERE tratamientos.nombre = "ibuprofeno"
    GROUP BY medicos.nombre;



*/


/*

EJEMPLO CLASE RICO:

un jugador solo podrá jugar en una plataforma.

Con los JOINS lo que hacemos es un producto cartesiano

PASAR LO DE LA LIBRETA

*/

-- EJERCICIOS --

/*1. Muestra los datos de los pacientes y los id de los tratamientos que siguen.*/

SELECT  pacientes.*, pacientestratamientos.idTratamiento
FROM pacientes INNER JOIN pacientestratamientos 
ON pacientes.id = pacientestratamientos.idPaciente
INNER JOIN tratamientos
ON pacientestratamientos.idTratamiento = tratamientos.id;

/*2. Muestra los datos de los pacientes y los datos de los tratamientos que siguen.*/

SELECT pacientes.*, tratamientos.*
FROM pacientes INNER JOIN pacientestratamientos
    ON pacientes.id = pacientestratamientos.idPaciente
    INNER JOIN tratamientos
        ON pacientestratamientos.idTratamiento = tratamientos.id;

/*3. Muestra el nombre y apellido de los pacientes y el nombre del tratamiento que siguen junto con la eficacia de dicho tratamiento.*/

SELECT pacientes.nombre, pacientes.apellido, tratamientos.nombre, tratamientos.eficacia
FROM pacientes INNER JOIN pacientestratamientos
    ON pacientes.id = pacientestratamientos.idPaciente
    INNER JOIN tratamientos
        ON pacientestratamientos.idTratamiento = tratamientos.id;

/*4. Muestra el nombre y apellido de los pacientes que siguen algún tratamiento con eficacia menor al 85%.*/

SELECT pacientes.nombre, pacientes.apellido
FROM pacientes INNER JOIN pacientestratamientos
    ON pacientes.id = pacientestratamientos.idPaciente
    INNER JOIN tratamientos
        ON pacientestratamientos.idTratamiento = tratamientos.id
WHERE tratamientos.eficacia < 85;

/*5. Muestra el nombre y apellido de los pacientes y el número de tratamientos que recibe cada uno.*/

SELECT pacientes.nombre, pacientes.apellido, COUNT(*)
FROM pacientes INNER JOIN pacientestratamientos
    ON pacientes.id = pacientestratamientos.idPaciente
    INNER JOIN tratamientos
        ON pacientestratamientos.idTratamiento = tratamientos.id
GROUP BY pacientes.nombre;

/*6. Muestra el nombre y apellido de los pacientes que reciban más de 2 tratamientos.*/

SELECT pacientes.nombre, pacientes.apellido
FROM pacientes INNER JOIN pacientestratamientos
    ON pacientes.id = pacientestratamientos.idPaciente
    INNER JOIN tratamientos
        ON pacientestratamientos.idTratamiento = tratamientos.id
HAVING COUNT(*) > 2
GROUP BY pacientes.nombre;

/*7. Muestra el número de pacientes que pesan más de 70kg.*/
/*8. Muestra el número de pacientes que miden entre 165 y 175 cm.*/
/*9. Muestra el número de pacientes que miden entre 165 y 175 cm y son mujeres.*/
/*10. Muestra el nombre, apellido y peso de los pacientes que toman resacol.*/
/*11. Muestra el nombre y apellido de los doctores junto con el nombre y apellido de sus pacientes asignados.*/
/*12. Muestra el nombre y apellido de los doctores tengan o no pacientes asignados, en caso de tenerlos, muestra el
 nombre y apellido de dichos pacientes.*/
/*13. Muestra el nombre y apellido de los doctores que tienen algún paciente que está siendo tratado con resacol.*/
/*14. Muestra los datos de los doctores, de sus pacientes asignados y los datos de los tratamientos que siguen dichos pacientes.*/
/*15. Muestra los datos de los tratamientos, de los pacientes que se someten a dichos tratamientos y de los doctores asignados
 a dichos pacientes.*/
/*16. Muestra los datos de los tratamientos, de los pacientes que se someten a dichos tratamientos y de los doctores tengan
 o no pacientes asignados.*/
/*17. Muestra cuántos pacientes tiene cada doctor (incluyendo a los doctores que no tengan pacientes asignados)
/*18. Muestra los datos de los doctores, así como los datos de sus pacientes, en caso de que los doctores tengan menos de
 2 pacientes (NO se incluirán los doctores que no tengan pacientes).*/
/*19. Inserta un paciente que no se someta a tratamiento alguno.*/
/*20. Muestra los datos del paciente que no sigue ningún tratamiento.*/
/*21. Muestra los datos de los pacientes que siguen algún tratamiento y de los que no, mostrando también los datos de los tratamientos.*/
/*22. Muestra los datos de los doctores que tienen algún paciente cuyo nombre empiece por M y tenga entre 20 y 28 años.*/
/*23. Muestra cuántos pacientes reciben tratamiento en el Canalejo.*/
/*24. Muestra cuántos pacientes son masculinos y cuántos son femeninos distinguiéndolos según su altura.*/
/*25. Muestra cuántos doctores trabajan en cada hospital siempre y cuando su nombre tenga más de 4 letras.*/

*/









/*

freecodecamp

coursera.org



*/

