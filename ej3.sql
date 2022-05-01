USE almacenes;

/* INSERTA 10 TUPLAS */

INSERT INTO almacenes(lugar,capacidad) VALUES
("Reus",10),
("Tarragona",20),
("Barcelona",200),
("Riudoms",4);

INSERT INTO cajas(num_referencia,contenido,valor,almacen) VALUES
("JUGET","JUEGUETES",100,1),
("ZAPAT","ZAPATOS",250,1),
("DIAES","DIAMANTES Y ESMERALDAS",10000000,4),
("INFOR","PRODUCTOS INFORMATICOS",10000,3),
("VERMU","VERMUT",300,3),
("MECAN","PIEZAS MECANICAS",5000,1),
("MASCA","MASCARILLAS",1000,3),
("FERTI","FERTILIZANTE",4000,3),
("PETRO","PETROLEO",1000000,3),
("PESCA","PESCADO FRESCO",1000,2);

/*3.1*/
SELECT *
FROM almacenes;
/*3.2*/
SELECT *
FROM cajas
WHERE valor > 150;
/*3.3*/
SELECT contenido
FROM cajas;
/*3.4*/
SELECT AVG(valor)
FROM cajas;
/*3.5*/
SELECT almacenes.lugar, AVG(cajas.valor)
FROM almacenes
INNER JOIN cajas
ON almacenes.codigo = cajas.almacen
GROUP BY almacenes.lugar;
/*3.6*/
INSERT INTO almacenes(lugar,capacidad) VALUES
("Constanti",1);
SELECT almacenes.codigo
FROM almacenes
INNER JOIN cajas
ON almacenes.codigo = cajas.almacen
GROUP BY almacenes.codigo
HAVING AVG(cajas.valor) > 150;
/*3.7*/
SELECT cajas.num_referencia, almacenes.lugar
FROM cajas
INNER JOIN almacenes
ON almacenes.codigo = cajas.almacen;
/*3.8*/
SELECT almacenes.lugar, COUNT(cajas.num_referencia)
FROM cajas
INNER JOIN almacenes
ON almacenes.codigo = cajas.almacen
GROUP BY  almacenes.lugar;
/*3.9 No me sale preguntar en clase*/

/*3.10*/
INSERT INTO almacenes(lugar,capacidad) VALUES
("Bilbao",2);
INSERT INTO cajas(num_referencia,contenido,valor,almacen) VALUES
("MONTA","MONTADITOS",20,6),
("BITXO","BITXOS",30,6),
("QUPRE","QUESOS PRESIDENT",15,6);
SELECT lugar,cajas.num_referencia
FROM almacenes
INNER JOIN cajas
ON codigo = cajas.almacen
WHERE lugar LIKE "Bilbao";
/*3.11*/
INSERT INTO almacenes(lugar,capacidad) VALUES
("Barcelona-Sants",3);
/*3.12*/
INSERT INTO cajas(num_referencia,contenido,valor,almacen) VALUES
("H5RT","Papel",200,2);
/*3.13*/
SET SQL_SAFE_UPDATES = 0;
UPDATE cajas
SET valor = valor * 0.85;
/*3.14 no me sale preguntar en clase*/
SELECT *
FROM cajas
WHERE valor > (SELECT AVG(valor) FROM cajas);
/*3.15*/
DELETE 
FROM cajas
WHERE valor < 100;
/*3.16 necesito preguntar como se hace el de saturados*/

