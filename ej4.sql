USE cine;

ALTER TABLE `cine`.`salas` 
CHANGE COLUMN `id_pelicula` `id_sala` INT NOT NULL AUTO_INCREMENT ;

INSERT INTO peliculas(nombre,calificacion_edad) VALUES
("The Batman", 18),
("Estopa la pelicula", 12),
("Marselo, la venganza de los caidos",16),
("La plaza",16),
("Gran torino", 12),
("Aventuras Robots",3),
("Star Wars: Jar Jar Returns", 7),
("Warhammer40k: Wolves at the gate",12),
("8 hour long SQL tutorial Part 2",3),
("Jojo Bizarre Adventure: Paella is forever",18);

INSERT INTO salas(nombre,pelicula) VALUES
("Sala 1", NULL),
("Sala 2",13),
("Sala 3",21),
("Sala 4",20),
("Sala 5",19),
("Sala 6",19),
("Sala 7",NULL),
("Sala 8",NULL),
("Sala 9",17),
("Sala 10",14);

/*4.1*/
SELECT nombre
FROM peliculas;
/*4.2*/
SELECT DISTINCT(calificacion_edad)
FROM peliculas
ORDER BY calificacion_edad DESC;
/*4.3*/
INSERT INTO peliculas(nombre,calificacion_edad) VALUES
("Teletubbies in Crystal Lake Camp",NULL),
("Crusader Clones",NULL);
SELECT *
FROM peliculas
WHERE calificacion_edad IS NULL;
/*4.4*/
SELECT *
FROM salas
WHERE pelicula IS NULL;
/*4.5 en teoría tendría que funcionar, según la teoría*/
SELECT *
FROM salas
FULL JOIN peliculas
ON pelicula = peliculas.id_pelicula;
/*4.6 preguntar*/

/*4.7 no sale*/
SELECT peliculas.nombre
FROM peliculas
WHERE nombre NOT IN (
SELECT pelicula
FROM salas);
/*4.8*/
INSERT INTO peliculas(nombre,calificacion_edad) VALUES
("Uno, Dos, Tres",7);
/*4.9*/
ALTER TABLE `cine`.`peliculas` 
CHANGE COLUMN `calificacion_edad` `calificacion_edad` INT NULL DEFAULT 13 ;
INSERT INTO peliculas(nombre) VALUES
("Campamento del Terror");
/*4.10 MIRAR MAÑANA*/
SELECT *
FROM salas
WHERE pelicula = (SELECT calificacion_edad FROM peliculas WHERE calificacion_edad > 3)
