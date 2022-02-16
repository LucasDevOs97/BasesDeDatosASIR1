INSERT INTO asesinos (nombre, apellidos, apodo, sexo) VALUES
("Harold", "Frederik Shipman", "dr. Muerte", "m"),
("Aleksandr", "Pichushkin", "el asesino del martillo", "m"),
("Alexe Katherina", "Popova", "Madame Popova", "f"),
("Irina", "Gaidamachuk", "El Demonio con vestido", "f"),
("Francisca", "Ballesteros", "La viuda negra", "f"),
("Yago", "Ares", "El inocente", "m");

INSERT INTO prisiones (nombre, dimensiones, seguridad) VALUES
("Alcatraz", 999, "maxima"),
("Teixeiro", 500, "media"),
("Robben Island", 750, "maxima");

INSERT INTO victimas (nombre, apellidos, edad) VALUES
("Daniel", "Vázquez", 19),
("Heitor", "Sardina", 20),
("Héctor", "Niqui", 20),
("Pablo", "Molina Cánovas", 18),
("Cristian", "Pombo", 21),
("Diego", "Vizoso", 22),
("David", "Ferreiro", 20),
("Javier", "Romeo", 19),
("Adrián", "González Franco", 85),
("Daniel", "Esperante", 78),
("Juan", "Vidal", 69),
("Pablo", "Seoane", 89),
("Jaime", "García", 80),
("Jesús", "Carreira", 19),
("Raquel", "Fariña", 22),
("Nuria", "Bodelón", 20);

INSERT INTO asesinosvictimas (id_asesino, id_victima, fecha) VALUES
(1, 1, "2020-03-06"),
(1, 2, "2020-03-03"),
(1, 3, "2020-02-01"),
(2, 4, "1999-05-05"),
(2, 5, "1998-06-06"),
(2, 6, "1997-07-07"),
(3, 7, "1888-08-08"),
(3, 8, "1888-09-09"),
(4, 9, "2020-01-01"),
(4, 10, "2020-01-01"),
(4, 11, "2019-03-02"),
(4, 12, "2019-05-01"),
(4, 13, "2017-07-07"),
(5, 14, "2004-01-01"),
(5, 15, "2003-03-03"),
(5, 16, "2002-02-02");

INSERT INTO modusoperandi (modus, id_asesino) VALUES
("veneno", 1),
("arma blanca", 2),
("arma de fuego", 3),
("a mano", 4), 
("veneno", 5),
("a mano", 6);

INSERT INTO asesinos_prisiones (id_asesino, id_prision, fecha) VALUES
(1, 1, "2020-04-04"),
(2, 2, "2000-05-18"),
(3, 3, "1900-10-20"),
(4, 2, "2020-01-01"),
(5, 2, "2005-12-31"),
(6, 2, "2020-03-09");

INSERT INTO asesinos_prisiones (id_asesino, id_prision, fecha) VALUES
(2, 1, "1999-12-13"),
(4, 1, "2020-01-02"),
(5, 1, "2004-01-02"),
(2, 1, "2002-05-24");

-- EJERCICIOS --

/*1) Inserta la prisión “Isla del diablo” en la Guayana Francesa con 650m y seguridad máxima.*/

INSERT INTO prisiones (nombre, dimensiones, seguridad) VALUES
("Isla del diablo", 650, "maxima");