USE tienda_informatica;

/* inserta 10 tuplas validas por cada tabla*/

INSERT INTO fabricantes(nombre) VALUES
("CIMPASA"),
("TICNOVA"),
("IBM"),
("INTEL"),
("AMD"),
("INDRA"),
("TSYSTEMS"),
("BOSTONTEC"),
("WIRESL"),
("NASA");

INSERT INTO articulos(nombre,precio,codigo_fabricante) VALUES
("RATON",10,1),
("TECLADO",30,2),
("PANTALLA",115,2),
("GRAFICA",300,5),
("PLACA BASE",350,4),
("AURICULARES",85,10),
("ALTAVOCES",10,9),
("IMPRESORA",60,1),
("WEBCAM",30,7),
("CPU",199,3);

/* 1.1 */
SELECT nombre FROM articulos;
/* 1.2 */
SELECT nombre,precio FROM articulos;
/* 1.3 */
SELECT nombre FROM articulos WHERE (precio <= 200);
/* 1.4 */
SELECT nombre FROM articulos WHERE precio <= 120 AND precio >= 60;
SELECT nombre FROM articulos WHERE precio BETWEEN 60 AND 120;
/* 1.5 */
SELECT nombre,(precio * 166.386) FROM articulos;
/* 1.6 */
SELECT AVG(precio) FROM articulos;
/* 1.7 */
SELECT codigo_articulo FROM articulos WHERE codigo_fabricante = 2;
/* 1.8 */
SELECT COUNT(codigo_articulo) FROM articulos WHERE precio>=180;
/* 1.9 */
SELECT nombre,precio FROM articulos WHERE precio>=180 ORDER BY precio DESC;
SELECT nombre,precio FROM articulos WHERE precio>=180 ORDER BY nombre DESC;
/*1.10*/
SELECT articulos.codigo_articulo,articulos.nombre,precio,articulos.codigo_fabricante,fabricantes.nombre 
FROM articulos
INNER JOIN fabricantes 
ON articulos.codigo_fabricante = fabricantes.codigo_fabricante;
/*1.11*/
SELECT articulos.nombre,articulos.precio,fabricantes.nombre 
FROM articulos
INNER JOIN fabricantes 
ON articulos.codigo_fabricante = fabricantes.codigo_fabricante;
/*1.12*/
SELECT fabricantes.codigo_fabricante, AVG(articulos.precio)
FROM articulos
INNER JOIN fabricantes 
ON articulos.codigo_fabricante = fabricantes.codigo_fabricante
GROUP BY fabricantes.codigo_fabricante;
/*1.13*/
SELECT fabricantes.nombre, AVG(articulos.precio)
FROM articulos
INNER JOIN fabricantes 
ON articulos.codigo_fabricante = fabricantes.codigo_fabricante
GROUP BY fabricantes.codigo_fabricante;
/*1.14*/
SELECT fabricantes.nombre, AVG(articulos.precio)
FROM articulos
INNER JOIN fabricantes 
ON articulos.codigo_fabricante = fabricantes.codigo_fabricante
GROUP BY fabricantes.codigo_fabricante
HAVING AVG(articulos.precio) >= 150;
/*1.15*/
SELECT nombre,precio
FROM articulos
WHERE precio = (SELECT MIN(precio) FROM articulos);
/*1.16  No me sale */
SELECT  articulos.nombre, MAX(articulos.precio), fabricantes.nombre
FROM articulos
INNER JOIN fabricantes 
ON articulos.codigo_fabricante = fabricantes.codigo_fabricante
GROUP BY fabricantes.nombre,articulos.nombre;
/*1.17*/
INSERT INTO articulos(nombre,precio,codigo_fabricante) VALUES
("Altavoces",70,2);
/*1.18*/
UPDATE articulos
SET nombre = "impresora laser"
WHERE codigo_articulo = 8;
/*1.19*/
SET SQL_SAFE_UPDATES = 0;
UPDATE articulos
SET precio = precio*0.9;
SELECT codigo_articulo,nombre,precio
FROM articulos;
/*1.20*/
UPDATE articulos
SET precio = precio-10
WHERE precio >= 120;
SELECT codigo_articulo,nombre,precio
FROM articulos;