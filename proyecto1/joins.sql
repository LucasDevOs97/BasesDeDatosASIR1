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



*/


/*

EJEMPLO CLASE RICO:

un jugador solo podrá jugar en una plataforma.

Con los JOINS lo que hacemos es un producto cartesiano

PASAR LO DE LA LIBRETA

*/

