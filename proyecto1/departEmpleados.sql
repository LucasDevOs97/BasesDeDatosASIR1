CREATE DATABASE departEmpleados;

CREATE TABLE departamentos (
    codigo INT(2) AUTO_INCREMENT, 
    nombre VARCHAR(100),
    presupuesto INT(5),
    PRIMARY KEY (codigo)
);

CREATE TABLE empleados (
    idEmpleado INT(2) AUTO_INCREMENT,
    dni VARCHAR(8) UNIQUE,
    nombre VARCHAR(100), 
    apellidos VARCHAR(255),
    departamento INT(2),
    PRIMARY KEY (idEmpleado)
);

-- Corección --

CREATE TABLE empleados (
id INT(8) AUTO_INCREMENT,
nombre VARCHAR(45),
apellidos VARCHAR(155),
departamento INT(2),
PRIMARY KEY(id)
);

-- Fin corrección --

ALTER TABLE empleados
ADD FOREIGN KEY (departamento)
REFERENCES departamentos (codigo);

/*

INTRODUCE 10 EMPLEADOS Y 5 DEPARTAMENTOS.
2 EMPLEADOS DEBEN APELLIDARSE López y 1 Pérez
Debe haber un departamento número 2 y otro 4.
Al menos 2 departamentos deben tener un presupuesto mayor a 60 000 euros

*/

INSERT INTO departamentos (nombre, presupuesto) VALUES
("investigación", 30200),
("informática", 90000),
("finanzas", 55000), -- 2 --
("administración", 65000), -- 4 --
("marketing", 99999); -- 5 --

UPDATE departamentos
SET codigo = 14
WHERE codigo = 2;

UPDATE departamentos
SET codigo = 77
WHERE codigo = 1;

UPDATE departamentos
SET codigo = 2
WHERE codigo = 3;

INSERT INTO empleados (dni, nombre, apellidos, departamento) VALUES
("12345678", "Ana", "Lopez", 14),
("87654321", "Alfonso", "Gutierrez", 14),
("45612378", "Felipe", "Perez", 77),
("78456123", "Alejandro", "Sueiro", 77),
("15342687", "Pedro", "Perez", 2),
("42615378", "Sabela", "Garcia", 2),
("15342678", "Marta", "Machado", 2),
("82641387", "Manuel", "Gonzalez", 4),
("34162578", "Joel", "Maroñas", 4),
("34162587", "Gabriel", "Muñoz", 5),
("12345687", "Irene", "Campos", 5);

/*
Si intento insertar todos a la vez me aparece el siguiente error:
ERROR 1136 (21S01): Column count doesn't match value count at row 4
Este error era porque le estoy diciendo que le voy a pasar dni, nombre, apellidos y departamento, pero había un empelado al que no le 
había puesto apellido.
*/


/*1. Obtener los apellidos de los empleados */

SELECT apellidos
FROM empleados;

/*2. Obtener los apellidos de los empleados sin repeticiones */

SELECT DISTINCT apellidos
FROM empleados;

/*3. Obtener todos los datos de los empleados que se apellidan ‘López’ */

SELECT *
FROM empleados
WHERE apellidos = "Lopez";

-- Corrección --

SELECT *
FROM empleados
WHERE apellidos LIKE "%Lopez%";

-- Fin corrección --

/*4. Obtener todos los datos de los empleados que se apellidan ‘López’ y los que se apellidan ‘Pérez’*/

SELECT *
FROM empleados
WHERE apellidos = "Lopez" OR apellidos = "Perez";

-- Corrección --

SELECT *
FROM empleados
WHERE apellidos LIKE "%Lopez%" OR apelldios LIKE "%Perez%";

-- Fin corrección --

/*5. Obtener todos los datos de los empleados que trabajan para el departamento 4 */

SELECT *
FROM empleados
WHERE departamento = 4;

/*6. Obtener todos los datos de los empleados que trabajan para el departamento 2 y para el departamento 4*/

SELECT *
FROM empleados
WHERE departamento IN (2,4);

/*7. Obtener todos los datos de los empleados cuyo apellido comience por ‘P’*/ 

SELECT *
FROM empleados
WHERE apellidos LIKE("P%");

/*8. Obtener el presupuesto total de todos los departamentos*/ 

SELECT SUM(presupuesto) AS "TotalPresupuesto"
FROM departamentos;

-- Como en el alias no hemos dejado ningún espacio en blanco, podríamos no poner las comillas --

SELECT SUM(presupuesto) AS TotalPresupuesto
FROM departamentos;

/*9. Obtener el número de empleados en cada departamento*/ 

SELECT departamentos, COUNT(departamentos) 
FROM empleados 
GROUP BY departamento;

-- Corrección, había entendido mal el enunciado --

SELECT departamento, COUNT(*) AS numEmpleados
FROM empleados
GROUP BY departamento;

/*10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento*/ 

-- INER JOIN --


/*11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de 
su departamento. */

-- INER JOIN --

/*12. Obtener los nombres y apellidos de los empleados que trabajan en departamentos cuyo presupuesto sea mayor de 60.000€ */ 

SELECT nombre, apellidos, departamento
FROM empleados
WHERE departamento IN (
    SELECT codigo
    FROM departamentos
    WHERE presupuesto > 60000
);

/*15.  Añadir un nuevo departamento: ‘Calidad’, con presupuesto de 40.000€ y código 11. Añadir un empleado vinculado al 
departamento recién creado: Esther Vázquez, DNI: 89267109 */

INSERT INTO departamentos (codigo, nombre, presupuesto) VALUES
(11, "Calidad", 40000);

INSERT INTO empleados (dni, nombre, apellidos, departamento) VALUES
("89267109", "Esther", "Vazquez", 11);

/*16.  Aplicar un recorte presupuestario del 10% a todos los departamentos*/ 

-- Hacer un Update aplicando el recorte del 10% --

/*17. Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14)*/ 

-- Hacer un update cambiando los codigos de departemento --

UPDATE empleados
SET departamento = 14
WHERE departamento = 77;

/*18. Despedir a todos los empleados que trabajan para el departamento de informática (código 14) */

-- eliminar los registros de empelados cuyo departamento sea el 14 --

DELETE FROM empleados
WHERE departamento = 14;

/*19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000€*/ 

DELETE FROM empleados
WHERE departamento IN (
    SELECT codigo
    FROM departamentos
    WHERE presupuesto > 60000
);

/*20. Despedir a todos los empleados */

DELETE FROM empleados;
