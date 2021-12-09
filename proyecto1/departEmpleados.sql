CREATE DATABASE departEmpleados;

CREATE TABLE departamento (
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

ALTER TABLE empleados
ADD FOREIGN KEY (departamento)
REFERENCES departamento (codigo);

/*

INTRODUCE 10 EMPLEADOS Y 5 DEPARTAMENTOS.
2 EMPLEADOS DEBEN APELLIDARSE López y 1 Pérez
Debe haber un departamento número 2 y otro 4.
Al menos 2 departamentos deben tener un presupuesto mayor a 60 000 euros

*/

INSERT INTO departamento (nombre, presupuesto) VALUES
("investigación", 30200),
("informática", 90000),
("finanzas", 55000), -- 2 --
("administración", 65000), -- 4 --
("marketing", 99999); -- 5 --

UPDATE departamento
SET codigo = 14
WHERE codigo = 2;

UPDATE departamento
SET codigo = 77
WHERE codigo = 1;

UPDATE departamento
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

/*4. Obtener todos los datos de los empleados que se apellidan ‘López’ y los que se apellidan ‘Pérez’*/

SELECT *
FROM empleados
WHERE apellidos = "Lopez" OR apellidos = "Perez";

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

SELECT SUM(presupuesto) AS "totalPresupuesto"
FROM departamento;

/*9. Obtener el número de empleados en cada departamento*/ 



/*10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento*/ 



/*11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de 
su departamento. 
*/


