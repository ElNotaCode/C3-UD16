USE empleados;
/* CREA 10 TUPLAS*/
INSERT INTO departamentos(nombre,presupuesto) VALUES
("MARKETING",20),
("FINANZAS",5000),
("COMERCIALES",30000),
("ASUNTOS INTERNOS",1000000),
("DIRECCION",300);

/* dni generado con https://numbergenerator.org/random-8-digit-number-generator */
INSERT INTO empleados(dni,nombre,apellidos,departamento) VALUES
("00120954 ","Kim","Jun",1),
("09908109 ","Jon","Koock",2),
("23663041 ","Park","Jimin",2),
("56374870 ","Kim","Tae",2),
("97818373 ","Min","Suga",2),
("05890313 ","Jin","Kim",3),
("25037474 ","Hobby","Jeon",3),
("92262195 ","Fox","Mulder",4),
("86860699 ","Eloi","Martorell",5),
("34060177 ","Cristina","Castany",5);

/*2.1*/
SELECT apellidos FROM empleados;
/*2.2 - Lo hago con nombre ay que en mi caso es lo que se repite y con lo que puedo comprobar si va la consulta*/
SELECT DISTINCT nombre FROM empleados;
/*2.3*/
SELECT apellidos FROM empleados WHERE apellidos LIKE "%Smith%";
/*2.4*/
SELECT apellidos FROM empleados WHERE apellidos LIKE "%Smith%" OR "%Rogers%";
/*2.5*/
SELECT dni, nombre, apellidos FROM empleados WHERE departamento LIKE 14;
/*2.6*/
SELECT dni, nombre, apellidos FROM empleados WHERE departamento LIKE 37 OR 77;
/*2.7*/
SELECT apellidos FROM empleados WHERE apellidos LIKE "P%";
/*2.8*/
SELECT SUM(presupuesto) FROM departamentos;
/*2.9*/
SELECT departamento,COUNT(departamento)
FROM empleados
GROUP BY departamento;
/*2.10*/
SELECT empleados.dni, empleados.nombre, empleados.apellidos, empleados.departamento, departamentos.nombre, departamentos.presupuesto
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo;
/*2.11*/
SELECT empleados.dni, empleados.nombre, empleados.apellidos, empleados.departamento, departamentos.nombre, departamentos.presupuesto
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo;
/*2.12*/
SELECT empleados.nombre, empleados.apellidos
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;
/*2.13*/
SELECT codigo,nombre,presupuesto
FROM departamentos
WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);
/*2.14*/
SELECT departamentos.nombre
FROM departamentos
INNER JOIN empleados
ON  departamentos.codigo = empleados.departamento
GROUP BY departamentos.nombre
HAVING COUNT(empleados.departamento) > 2;
/*2.15*/
INSERT INTO departamentos(codigo,nombre,presupuesto) VALUES
(11,"Calidad",40000);
INSERT INTO empleados(dni,nombre,apellidos,departamento) VALUES
(89267109,"Esther","Vázquez",11);
/*2.16*/
SET SQL_SAFE_UPDATES = 0;
UPDATE departamentos
SET presupuesto = presupuesto * 0.9;
/*2.17*/
INSERT INTO departamentos(codigo,nombre,presupuesto) VALUES
(77,"Investigación",100000),
(14,"Iformatica",10000);
INSERT INTO empleados(dni,nombre,apellidos,departamento) VALUES
(93054450,"Albert","Torregrosa",77),
(64265649,"Olga","Martos",77),
(67994742,"Joan","Rofes",77);
UPDATE empleados
SET departamento = 14
WHERE departamento = 77;
/*2.18*/
DELETE
FROM empleados
WHERE departamento = 14;
/*2.19*/
DELETE empleados
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000;
/*2.20*/
DELETE
FROM empleados;