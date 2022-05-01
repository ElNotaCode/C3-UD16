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
ON almacenes.codigo = cajas.almacen

