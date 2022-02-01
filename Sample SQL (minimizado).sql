/*---------------Database Creation-------------------*/

CREATE DATABASE Settlements_maintenance;

USE Settlements_maintenance;


/*--------------Database Table Schema----------------*/


CREATE TABLE participante (
	id_legajo INT NOT NULl,
	nombre VARCHAR (255),
	apellido VARCHAR (255),
	id_rol INT PRIMARY key
	);


CREATE TABLE rol (
	id INT NOT NULL,
	pago_hora INT,
	descripcion VARCHAR (255),
	CONSTRAINT fk_rol FOREIGN KEY (id)
	REFERENCES participante (id_rol)
	);

	
CREATE TABLE centro_costo (
	id_costo INT NOT NULL PRIMARY KEY,
	monto INT NULL,
	descripcion VARCHAR (255) NULL
	);
	
	
CREATE TABLE centro_facturacion (
	id_facturacion INT NOT NULL PRIMARY KEY,
	monto INT NULL,
	descripcion VARCHAR(255) null
	);
	
	
CREATE TABLE cliente (
	id_cliente INT NOT NULL PRIMARY key,
	id_costo INT NOT NULL,
	id_facturacion INT NOT NULL,
	CONSTRAINT fk_costo FOREIGN KEY (id_costo)
	REFERENCES centro_costo (id_costo),
	CONSTRAINT fk_facturacion FOREIGN KEY (id_facturacion)
	REFERENCES centro_facturacion (id_facturacion)
	);
	
	
CREATE TABLE proyectos (
	id_proyecto INT NOT NULL AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	desc_proyecto VARCHAR (255),
	CONSTRAINT id_proyecto_pk PRIMARY key (id_proyecto),
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente)
	);


CREATE TABLE liquidacion (
	id_liquidacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	id_proyecto INT NOT NULL,
	id_participante INT NOT NULL,
	fecha DATE NOT NULL,
	cant_de_horas int not null,
	Desarrollador INT NOT NULL,
	Analista INT NOT NULL,
	Tester INT NOT NULL,
	devOps INT NOT NULL,
	General_programmer INT NOT NULL,
	Project_manager INT NOT NULL,
	general_manager INT NOT NULL,
	total int not null,
	CONSTRAINT fk_id_client FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente),
	CONSTRAINT fk_id_proyect FOREIGN KEY (id_proyecto)
	REFERENCES proyectos (id_proyecto),
	CONSTRAINT fk_id_participant FOREIGN KEY (id_participante)
	REFERENCES participante (id_rol)
	);


CREATE TABLE asignacion (
	id_asignacion INT NOT NULL PRIMARY KEY,
	id_proyecto int not null,
	id_participante int not null,
	id_cliente INT NOT NULL,
	constraint fk_proyecto1 FOREIGN key (id_proyecto)
	references proyectos (id_proyecto),
	CONSTRAINT fk_participante1 FOREIGN KEY (id_participante)
	REFERENCES participante (id_rol),
	CONSTRAINT fk_cliente1 FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente)
	);


CREATE TABLE horas_rendidas (
	id_proyecto INT NOT NULL,
	id_cliente INT NOT NULL,
	id_participante INT NOT NULL,
	horas INT NOT NULL,
	horas_semanales INT NOT NULL,
	horas_mensuales INT NOT NULL,
	horas_dia INT NOT NULL,
	fecha DATE,
	CONSTRAINT fk_proyecto2 FOREIGN KEY (id_proyecto)
	REFERENCES proyectos (id_proyecto),
	CONSTRAINT fk_cliente2 FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente),
	CONSTRAINT fk_participantee1 FOREIGN KEY (id_participante)
	REFERENCES participante (id_rol)
	);


CREATE TABLE rendimiento_horas (
	id_proyecto INT NOT NULL,
	id_participante INT NOT NULL,
	horas_dia INT NOT NULL,
	horas_semanales INT NOT NULL,
	horas_mensuales INT NOT NULL,
	fecha DATE NOT NULL,
	lapso_dias INT NOT NULL,
	CONSTRAINT fk_participente2 FOREIGN KEY (id_participante)
	REFERENCES participante (id_rol)
	);


CREATE TABLE auditoria (
	id_cliente INT NOT NULL,
	id_proyecto INT NOT NULL,
	id_participante INT NOT NULL,
	fecha DATE NOT NULL,
	horas INT NULL,
	usuario_modificacion VARCHAR(255) NULL
	);


CREATE TABLE modificacion_costos (
	id_costo INT NOT NULL,
	monto INT NULL,
	nuevo_monto INT NULL,
	descripcion VARCHAR (255) NOT null,
	usuario_modificacion VARCHAR (255) NULL,
	fecha DATE NOT null
	);


/*--------------Testing Schema and DML----------------*/
	

INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (1,'Marco','Fernandez',1);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (2,'Juan','Gonzalez',2);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (3,'Matias','Hernandez',3);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (4,'Federico','Capelleti',4);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (5,'Julieta','Rios',5);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (6,'Lucia','Rojas',6);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (7,'Maria','Diaz',7);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (8,'Sofia','Bermudez',8);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (9,'Mango','Belmudez',9);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (10,'Eric','Gonzalez',10);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (11,'Luciano','Hazar',11);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (12,'Nicolas','Ruiz',12);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (13,'Paula','Alonso',13);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (14,'Maria Jose','Contreras',14);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (15,'Lia','Argañaraz',15);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (16,'Eugenia','Barbarosa',16);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (17,'Cristina','Hernandez',17);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (18,'Cristian','Franco',18);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (19,'Eduardo','Melosajk',19);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (20,'Lucio','Farias',20);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (21,'Lucia','Manseloh',21);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (22,'Marta','Artigas',22);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (23,'Maria','Quiroga',23);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (24,'Jessica','Ordoñez',24);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (25,'Juan Pedrio','Falcone',25);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (26,'Fabian','Krauber',26);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (27,'Lucas','Hurijk',27);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (28,'Peter','Sequeira',28);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (29,'Nuno','Garcia',29);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (30,'Tamara','Cejas',30);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (31,'Gabriela','Smithch',31);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (32,'Faustina','Roca',32);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (33,'Alicia','Oñave',33);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (34,'Jauro','Schtalembrbich',34);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (35,'Javier','Zapata',35);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (36,'Hector','Gonzales',36);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (37,'Gabriel','Zulpo',37);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (38,'Ursula','Moralez',38);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (39,'Yamila','Rubia',39);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (40,'Rulo','Benavidez',40);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (41,'Matias','Mendoza',41);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (42,'Lorena','Hujiklamberch',42);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (43,'Fausto','Zapata',43);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (44,'Lucho','Van der patra',44);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (45,'Matias','Gonzales Nieva',45);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (46,'Eugenio','Vibrahma',46);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (47,'Camila','Botas',47);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (48,'Walter','De Castillos',48);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (49,'Armando','Pligdasiou',49);
INSERT INTO participante (id_legajo,nombre,apellido,id_rol) VALUES (50,'Kamilo','Barbarosa',50);

INSERT INTO rol(id,pago_hora,descripcion) VALUES (1,150,'Desarrollador');
INSERT INTO rol(id,pago_hora,descripcion) VALUES (2,230,'Analista');
INSERT INTO rol(id,pago_hora,descripcion) VALUES (3,250,'Tester');
INSERT INTO rol(id,pago_hora,descripcion) VALUES (4,300,'Devops');
INSERT INTO rol(id,pago_hora,descripcion) VALUES (5,350,'General Programmer');
INSERT INTO rol(id,pago_hora,descripcion) VALUES (6,500,'Project Manager');
INSERT INTO rol(id,pago_hora,descripcion) VALUES (7,600,'General Manager');

INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (1,300000,'Prestacion de Servicios');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (2,1500000,'Aplicacion');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (3,350000,'Mantenimiento por sector');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (4,400000,'Marketing');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (5,3000000,'Aplicacion + Branding');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (6,2000000,'Mantenimiento + herramientas');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (7,1000000,'Branding');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (8,1500000,'Mantenimiento general');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (9,360000,'Programacion');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (10,1100000,'Desarrollo');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (11,334000,'Analisis');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (12,340000,'Testeo');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (13,5600000,'Limpieza de Producto');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (14,720000,'Aplicamiento de metologias');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (15,1100000,'Cloud services');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (16,1500000,'Web Services');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (17,340000,'Aplicaion Web');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (18,5600000,'Dominio Web');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (19,720000,'Automatizacion de procesos');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (20,1100000,'General Services');
INSERT INTO centro_costo(id_costo,monto,descripcion) VALUES (21,1500000,'QA Management');

INSERT INTO centro_facturacion(id_facturacion,monto,descripcion) VALUES (1,14000,'Debito');
INSERT INTO centro_facturacion(id_facturacion,monto,descripcion) VALUES (2,17000,'Credito');
INSERT INTO centro_facturacion(id_facturacion,monto,descripcion) VALUES (3,20000,'Transferencia');
INSERT INTO centro_facturacion(id_facturacion,monto,descripcion) VALUES (4,30000,'Service Ticket');

INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (1,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (2,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (3,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (4,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (5,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (6,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (7,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (8,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (9,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (10,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (11,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (12,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (13,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (14,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (15,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (16,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (17,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (18,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (19,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (20,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (21,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (22,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (23,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (24,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (25,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (26,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (27,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (28,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (29,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (30,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (31,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (32,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (33,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (34,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (35,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (36,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (37,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (38,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (39,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (40,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (41,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (42,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (43,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (44,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (45,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (46,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (47,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (48,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (49,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (50,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (51,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (52,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (53,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (54,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (55,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (56,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (57,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (58,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (59,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (60,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (61,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (62,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (63,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (64,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (65,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (66,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (67,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (68,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (69,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (70,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (71,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (72,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (73,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (74,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (75,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (76,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (77,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (78,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (79,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (80,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (81,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (82,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (83,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (84,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (85,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (86,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (87,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (88,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (89,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (90,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (91,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (92,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (93,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (94,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (95,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (96,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (97,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (98,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (99,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (100,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (101,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (102,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (103,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (104,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (105,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (106,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (107,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (108,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (109,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (110,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (111,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (112,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (113,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (114,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (115,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (116,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (117,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (118,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (119,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (120,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (121,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (122,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (123,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (124,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (125,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (126,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (127,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (128,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (129,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (130,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (131,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (132,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (133,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (134,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (135,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (136,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (137,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (138,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (139,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (140,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (141,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (142,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (143,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (144,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (145,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (146,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (147,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (148,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (149,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (150,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (151,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (152,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (153,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (154,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (155,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (156,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (157,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (158,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (159,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (160,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (161,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (162,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (163,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (164,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (165,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (166,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (167,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (168,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (169,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (170,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (171,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (172,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (173,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (174,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (175,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (176,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (177,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (178,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (179,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (180,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (181,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (182,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (183,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (184,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (185,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (186,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (187,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (188,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (189,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (190,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (191,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (192,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (193,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (194,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (195,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (196,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (197,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (198,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (199,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (200,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (201,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (202,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (203,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (204,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (205,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (206,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (207,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (208,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (209,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (210,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (211,3,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (212,1,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (213,2,3);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (214,4,7);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (215,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (216,1,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (217,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (218,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (219,2,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (220,4,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (221,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (222,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (223,3,11);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (224,2,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (225,3,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (226,3,6);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (227,3,20);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (228,1,19);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (229,2,15);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (230,4,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (231,2,17);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (232,4,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (233,1,9);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (234,1,2);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (235,2,5);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (236,3,13);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (237,3,1);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (238,1,8);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (239,2,10);
INSERT INTO cliente(id_cliente,id_facturacion,id_costo) VALUES (240,4,1);

INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (1,1,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (2,3,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (3,5,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (4,3,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (5,2,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (6,230,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (7,6,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (8,7,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (9,232,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (10,2,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (11,140,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (12,3,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (13,2,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (14,13,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (15,6,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (16,77,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (17,17,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (18,176,'Garbage Solutions');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (19,58,'Aplicacion Web');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (20,32,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (21,221,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (22,47,'Data Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (23,69,'Azure Tools');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (24,173,'AWS Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (25,10,'Google Services');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (26,36,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (27,157,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (28,131,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (29,223,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (30,240,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (31,64,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (32,71,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (33,165,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (34,34,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (35,53,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (36,133,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (37,122,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (38,148,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (39,64,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (40,179,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (41,154,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (42,35,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (43,57,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (44,38,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (45,221,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (46,147,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (47,163,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (48,213,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (49,69,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (50,72,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (51,212,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (52,142,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (53,63,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (54,71,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (55,189,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (56,32,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (57,51,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (58,135,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (59,234,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (60,44,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (61,67,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (62,170,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (63,143,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (64,232,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (65,54,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (66,123,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (67,235,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (68,41,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (69,162,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (70,78,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (71,115,'Aplicacion Mobile');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (72,230,'Mantenimiento');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (73,22,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (74,31,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (75,24,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (76,45,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (77,67,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (78,175,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (79,163,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (80,74,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (81,56,'Aplicacion Automatizada');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (82,31,'QA Tool');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (83,222,'Data Trash Optimization');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (84,144,'Automation');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (85,68,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (86,71,'Database Maintenance');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (87,65,'Web Analysis');
INSERT INTO proyectos(id_proyecto,id_cliente,desc_proyecto) VALUES (88,175,'Database Maintenance');

INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (1,1,22,1);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (2,2,23,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (3,34,41,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (4,1,24,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (5,51,22,2);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (6,64,23,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (7,32,25,4);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (8,21,34,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (9,14,21,1);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (10,21,22,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (11,32,32,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (12,15,50,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (13,56,42,2);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (14,63,1,30);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (15,36,42,4);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (16,22,23,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (17,15,32,26);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (18,26,22,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (19,38,12,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (20,11,42,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (21,73,22,20);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (22,71,31,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (23,65,12,2);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (24,56,22,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (25,43,32,17);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (26,32,11,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (27,41,42,1);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (28,32,32,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (29,23,42,13);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (30,21,12,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (31,13,22,234);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (32,11,32,32);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (33,5,22,16);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (34,56,11,75);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (35,53,42,42);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (36,62,23,17);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (37,71,32,123);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (38,62,22,32);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (39,73,12,17);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (40,61,41,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (41,73,12,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (42,81,22,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (43,85,32,2);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (44,76,22,23);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (45,63,2,42);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (46,52,3,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (47,41,1,22);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (48,32,2,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (49,23,22,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (50,11,23,134);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (51,13,21,25);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (52,11,24,212);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (53,5,22,224);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (54,36,11,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (55,43,42,145);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (56,52,23,185);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (57,61,22,112);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (58,72,32,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (59,63,22,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (60,21,21,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (61,33,22,30);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (62,21,12,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (63,45,12,231);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (64,26,12,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (65,43,22,11);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (66,2,13,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (67,1,24,1);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (68,2,21,16);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (69,3,24,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (70,31,12,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (71,3,24,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (72,21,41,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (73,15,42,13);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (74,26,42,72);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (75,33,42,4);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (76,42,43,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (77,51,42,15);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (78,62,21,211);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (79,23,22,15);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (80,31,22,32);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (81,43,22,53);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (82,51,42,53);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (83,65,42,178);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (84,26,2,74);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (85,13,2,46);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (86,2,1,88);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (87,21,2,12);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (88,32,2,231);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (89,3,2,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (90,41,2,34);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (91,3,2,56);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (92,21,2,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (93,35,1,26);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (94,16,2,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (95,43,2,47);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (96,52,3,82);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (97,41,42,29);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (98,32,12,231);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (99,23,22,54);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (100,21,1,23);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (111,42,1,21);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (112,63,22,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (113,51,32,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (114,43,22,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (115,21,42,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (116,45,12,17);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (117,86,22,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (118,23,32,41);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (119,12,21,85);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (120,41,12,12);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (121,52,42,23);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (122,33,12,54);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (123,21,12,233);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (124,13,22,154);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (125,41,24,23);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (126,75,11,26);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (127,56,22,7);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (128,63,22,4);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (129,82,32,8);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (130,51,22,29);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (131,42,21,3);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (132,13,21,5);
INSERT INTO asignacion(id_asignacion,id_proyecto,id_participante,id_cliente) VALUES (133,21,11,3);

INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (1,45000,50,1500,8,1,DATE_SUB(NOW(),INTERVAL 18 MONTH),1);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (2,35000,70,2000,11,3,DATE_SUB(NOW(),INTERVAL 9 MONTH),3);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (3,17000,45,2500,5,3,DATE_SUB(NOW(),INTERVAL 10 MONTH),5);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (4,25000,52,1700,3,6,DATE_SUB(NOW(),INTERVAL 11 MONTH),22);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (5,330000,57,2300,7,8,DATE_SUB(NOW(),INTERVAL 33 MONTH),17);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (6,12000,61,1200,6,1,DATE_SUB(NOW(),INTERVAL 26 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (7,550000,66,1550,4,4,DATE_SUB(NOW(),INTERVAL 7 MONTH),43);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (8,100000,80,3200,12,5,DATE_SUB(NOW(),INTERVAL 4 MONTH),26);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (1,46000,50,1500,8,1,DATE_SUB(NOW(),INTERVAL 3 MONTH),33);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (2,13000,50,1500,8,1,DATE_SUB(NOW(),INTERVAL 7 MONTH),41);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (5,53000,70,2000,10,5,DATE_SUB(NOW(),INTERVAL 21 MONTH),13);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (4,65000,45,2500,5,23,DATE_SUB(NOW(),INTERVAL 103 MONTH),45);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (6,215000,52,1700,6,68,DATE_SUB(NOW(),INTERVAL 11 MONTH),22);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (7,3350000,57,2300,5,78,DATE_SUB(NOW(),INTERVAL 34 MONTH),27);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (8,126000,61,1200,6,91,DATE_SUB(NOW(),INTERVAL 25 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (9,5570000,66,1550,7,144,DATE_SUB(NOW(),INTERVAL 62 MONTH),13);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (10,180000,80,3200,12,158,DATE_SUB(NOW(),INTERVAL 44 MONTH),26);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (11,412000,50,1500,8,190,DATE_SUB(NOW(),INTERVAL 11 MONTH),11);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (12,413000,50,1500,8,222,DATE_SUB(NOW(),INTERVAL 12 MONTH),11);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,23000,70,2000,10,232,DATE_SUB(NOW(),INTERVAL 13 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (65,76000,45,2500,5,240,DATE_SUB(NOW(),INTERVAL 1 MONTH),11);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (46,87000,52,1700,6,221,DATE_SUB(NOW(),INTERVAL 6 MONTH),22);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (52,140000,57,2300,10,89,DATE_SUB(NOW(),INTERVAL 37 MONTH),17);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (21,89000,61,1200,6,101,DATE_SUB(NOW(),INTERVAL 22 MONTH),44);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (56,1680000,66,1550,7,149,DATE_SUB(NOW(),INTERVAL 6 MONTH),13);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (66,340000,80,3200,12,53,DATE_SUB(NOW(),INTERVAL 45 MONTH),16);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (27,10000,50,1500,8,12,DATE_SUB(NOW(),INTERVAL 143 MONTH),12);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (81,4000,50,1500,8,67,DATE_SUB(NOW(),INTERVAL 113 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (32,54000,70,2000,10,12,DATE_SUB(NOW(),INTERVAL 94 MONTH),23);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (31,12000,45,2500,5,38,DATE_SUB(NOW(),INTERVAL 11 MONTH),50);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,65000,52,1700,6,68,DATE_SUB(NOW(),INTERVAL 15 MONTH),21);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (24,360000,57,2300,10,82,DATE_SUB(NOW(),INTERVAL 33 MONTH),47);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (17,13000,61,1200,6,120,DATE_SUB(NOW(),INTERVAL 6 MONTH),28);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (9,580000,66,1550,7,150,DATE_SUB(NOW(),INTERVAL 63 MONTH),34);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (53,120000,80,3200,12,230,DATE_SUB(NOW(),INTERVAL 55 MONTH),26);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (62,10000,50,1500,8,14,DATE_SUB(NOW(),INTERVAL 12 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (71,76000,50,1500,8,153,DATE_SUB(NOW(),INTERVAL 18 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (33,36000,70,2000,10,231,DATE_SUB(NOW(),INTERVAL 9 MONTH),31);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (31,11000,45,2500,5,25,DATE_SUB(NOW(),INTERVAL 10 MONTH),5);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (42,23000,52,1700,6,239,DATE_SUB(NOW(),INTERVAL 11 MONTH),2);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (11,350000,57,2300,10,215,DATE_SUB(NOW(),INTERVAL 33 MONTH),17);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (22,16000,61,1200,6,167,DATE_SUB(NOW(),INTERVAL 12 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (49,520000,66,1550,7,46,DATE_SUB(NOW(),INTERVAL 61 MONTH),38);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (44,110000,80,3200,12,58,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (51,44000,50,1500,8,81,DATE_SUB(NOW(),INTERVAL 6 MONTH),11);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (64,46700,50,1500,8,189,DATE_SUB(NOW(),INTERVAL 7 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (47,55500,70,2000,10,43,DATE_SUB(NOW(),INTERVAL 9 MONTH),35);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (81,66400,45,2500,5,145,DATE_SUB(NOW(),INTERVAL 10 MONTH),15);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (42,77000,52,1700,6,67,DATE_SUB(NOW(),INTERVAL 11 MONTH),24);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (54,120000,57,2300,10,189,DATE_SUB(NOW(),INTERVAL 33 MONTH),17);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (11,98000,61,1200,6,143,DATE_SUB(NOW(),INTERVAL 26 MONTH),48);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (23,900000,66,1550,7,43,DATE_SUB(NOW(),INTERVAL 6 MONTH),33);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (39,700000,80,3200,12,15,DATE_SUB(NOW(),INTERVAL 4 MONTH),36);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (42,11000,50,1500,8,189,DATE_SUB(NOW(),INTERVAL 8 MONTH),11);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (54,33000,50,1500,8,132,DATE_SUB(NOW(),INTERVAL 18 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (51,54000,70,2000,10,235,DATE_SUB(NOW(),INTERVAL 6 MONTH),35);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (73,65000,45,2500,5,134,DATE_SUB(NOW(),INTERVAL 10 MONTH),15);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (82,11000,52,1700,6,66,DATE_SUB(NOW(),INTERVAL 11 MONTH),25);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (55,980000,57,2300,10,78,DATE_SUB(NOW(),INTERVAL 33 MONTH),47);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (69,34000,61,1200,6,15,DATE_SUB(NOW(),INTERVAL 26 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (68,120000,66,1550,7,66,DATE_SUB(NOW(),INTERVAL 61 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (23,180000,80,3200,12,12,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,12000,50,1500,8,43,DATE_SUB(NOW(),INTERVAL 6 MONTH),13);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (61,43000,50,1500,8,14,DATE_SUB(NOW(),INTERVAL 5 MONTH),11);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (53,23000,70,2000,10,87,DATE_SUB(NOW(),INTERVAL 9 MONTH),34);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (62,87000,45,2500,5,100,DATE_SUB(NOW(),INTERVAL 10 MONTH),45);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (72,10000,52,1700,6,61,DATE_SUB(NOW(),INTERVAL 11 MONTH),25);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (87,340000,57,2300,10,83,DATE_SUB(NOW(),INTERVAL 5 MONTH),27);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (63,12000,61,1200,6,13,DATE_SUB(NOW(),INTERVAL 5 MONTH),48);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (77,660000,66,1550,7,46,DATE_SUB(NOW(),INTERVAL 61 MONTH),33);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (74,123000,80,3200,12,51,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (12,45600,50,1500,8,14,DATE_SUB(NOW(),INTERVAL 18 MONTH),17);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,45000,50,1500,8,12,DATE_SUB(NOW(),INTERVAL 18 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (23,35000,70,2000,10,65,DATE_SUB(NOW(),INTERVAL 9 MONTH),35);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (31,17000,45,2500,5,63,DATE_SUB(NOW(),INTERVAL 10 MONTH),45);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (41,25000,52,1700,6,87,DATE_SUB(NOW(),INTERVAL 5 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (55,330000,57,2300,10,83,DATE_SUB(NOW(),INTERVAL 5 MONTH),27);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (63,12000,61,1200,6,11,DATE_SUB(NOW(),INTERVAL 26 MONTH),48);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (71,550000,66,1550,7,44,DATE_SUB(NOW(),INTERVAL 61 MONTH),33);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (87,100000,80,3200,12,13,DATE_SUB(NOW(),INTERVAL 4 MONTH),26);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (14,46000,50,1500,8,12,DATE_SUB(NOW(),INTERVAL 3 MONTH),31);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (21,13000,50,1500,8,1,DATE_SUB(NOW(),INTERVAL 18 MONTH),12);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (53,53000,70,2000,10,3,DATE_SUB(NOW(),INTERVAL 9 MONTH),31);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (42,65000,45,2500,5,3,DATE_SUB(NOW(),INTERVAL 2 MONTH),45);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (66,215000,52,1700,6,6,DATE_SUB(NOW(),INTERVAL 7 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (75,3350000,57,2300,10,8,DATE_SUB(NOW(),INTERVAL 2 MONTH),47);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (84,126000,61,1200,6,1,DATE_SUB(NOW(),INTERVAL 26 MONTH),28);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (12,5570000,66,1550,7,4,DATE_SUB(NOW(),INTERVAL 2 MONTH),23);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (31,180000,80,3200,12,52,DATE_SUB(NOW(),INTERVAL 4 MONTH),36);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (26,412000,50,1500,8,167,DATE_SUB(NOW(),INTERVAL 18 MONTH),21);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (25,413000,50,1500,8,11,DATE_SUB(NOW(),INTERVAL 18 MONTH),41);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,23000,70,2000,10,38,DATE_SUB(NOW(),INTERVAL 9 MONTH),43);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (61,76000,45,2500,5,32,DATE_SUB(NOW(),INTERVAL 2 MONTH),15);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (43,87000,52,1700,6,61,DATE_SUB(NOW(),INTERVAL 11 MONTH),22);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (57,140000,57,2300,10,86,DATE_SUB(NOW(),INTERVAL 33 MONTH),47);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (21,89000,61,1200,6,15,DATE_SUB(NOW(),INTERVAL 2 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (52,1680000,66,1550,7,42,DATE_SUB(NOW(),INTERVAL 61 MONTH),23);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (63,340000,80,3200,12,54,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (24,10000,50,1500,8,122,DATE_SUB(NOW(),INTERVAL 18 MONTH),41);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (88,4000,50,1500,8,167,DATE_SUB(NOW(),INTERVAL 3 MONTH),12);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (35,54000,70,2000,10,211,DATE_SUB(NOW(),INTERVAL 9 MONTH),34);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (30,12000,45,2500,5,135,DATE_SUB(NOW(),INTERVAL 10 MONTH),15);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,65000,52,1700,6,67,DATE_SUB(NOW(),INTERVAL 11 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (25,360000,57,2300,10,82,DATE_SUB(NOW(),INTERVAL 8 MONTH),27);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (33,13000,61,1200,6,15,DATE_SUB(NOW(),INTERVAL 3 MONTH),48);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (23,580000,66,1550,7,41,DATE_SUB(NOW(),INTERVAL 63 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (45,120000,80,3200,12,52,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (16,10000,50,1500,8,19,DATE_SUB(NOW(),INTERVAL 18 MONTH),41);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (71,76000,50,1500,8,153,DATE_SUB(NOW(),INTERVAL 3 MONTH),41);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (33,36000,70,2000,10,32,DATE_SUB(NOW(),INTERVAL 9 MONTH),34);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (39,11000,45,2500,5,111,DATE_SUB(NOW(),INTERVAL 10 MONTH),45);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (47,23000,52,1700,6,223,DATE_SUB(NOW(),INTERVAL 11 MONTH),24);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (13,350000,57,2300,10,52,DATE_SUB(NOW(),INTERVAL 33 MONTH),27);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (26,16000,61,1200,6,132,DATE_SUB(NOW(),INTERVAL 26 MONTH),48);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (42,520000,66,1550,7,44,DATE_SUB(NOW(),INTERVAL 61 MONTH),35);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (43,110000,80,3200,12,152,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (52,44000,50,1500,8,154,DATE_SUB(NOW(),INTERVAL 3 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (65,46700,50,1500,8,176,DATE_SUB(NOW(),INTERVAL 18 MONTH),41);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (46,55500,70,2000,10,135,DATE_SUB(NOW(),INTERVAL 9 MONTH),43);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (84,66400,45,2500,5,34,DATE_SUB(NOW(),INTERVAL 10 MONTH),35);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (41,77000,52,1700,6,66,DATE_SUB(NOW(),INTERVAL 11 MONTH),12);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (53,120000,57,2300,10,87,DATE_SUB(NOW(),INTERVAL 33 MONTH),47);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (11,98000,61,1200,6,11,DATE_SUB(NOW(),INTERVAL 26 MONTH),48);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (22,900000,66,1550,7,41,DATE_SUB(NOW(),INTERVAL 61 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (35,700000,80,3200,12,56,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (4,11000,50,1500,8,11,DATE_SUB(NOW(),INTERVAL 8 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (15,33000,50,1500,8,12,DATE_SUB(NOW(),INTERVAL 8 MONTH),15);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (52,54000,70,2000,10,53,DATE_SUB(NOW(),INTERVAL 9 MONTH),43);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (74,65000,45,2500,5,31,DATE_SUB(NOW(),INTERVAL 10 MONTH),35);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (81,11000,52,1700,6,62,DATE_SUB(NOW(),INTERVAL 11 MONTH),25);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (25,980000,57,2300,10,82,DATE_SUB(NOW(),INTERVAL 33 MONTH),47);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (46,34000,61,1200,6,17,DATE_SUB(NOW(),INTERVAL 26 MONTH),28);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (16,120000,66,1550,7,225,DATE_SUB(NOW(),INTERVAL 61 MONTH),13);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (12,180000,80,3200,12,53,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (33,12000,50,1500,8,177,DATE_SUB(NOW(),INTERVAL 18 MONTH),15);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (61,43000,50,1500,8,165,DATE_SUB(NOW(),INTERVAL 18 MONTH),14);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (54,23000,70,2000,10,35,DATE_SUB(NOW(),INTERVAL 9 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (62,87000,45,2500,5,32,DATE_SUB(NOW(),INTERVAL 10 MONTH),25);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (17,10000,52,1700,6,62,DATE_SUB(NOW(),INTERVAL 11 MONTH),32);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (18,340000,57,2300,10,87,DATE_SUB(NOW(),INTERVAL 33 MONTH),27);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (63,12000,61,1200,6,145,DATE_SUB(NOW(),INTERVAL 26 MONTH),18);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (17,660000,66,1550,7,235,DATE_SUB(NOW(),INTERVAL 61 MONTH),43);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (71,123000,80,3200,12,12,DATE_SUB(NOW(),INTERVAL 4 MONTH),46);
INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (86,45600,50,1500,8,132,DATE_SUB(NOW(),INTERVAL 18 MONTH),14);


UPDATE horas_rendidas
SET fecha = DATE_FORMAT(fecha, '%Y-%m-1');


/*--------------Hour Performance per Day (DDL)----------------*/

	
DROP PROCEDURE if exists rendimiento_De_horas_day;

delimiter $$
CREATE PROCEDURE rendimiento_de_horas_day(IN proyecto1 INT, IN participante1 INT)
BEGIN
	DECLARE total_horas INT DEFAULT 0;
	DECLARE done INT DEFAULT 0;
	DECLARE project INT DEFAULT 0;
	DECLARE cursor_1 CURSOR FOR
		SELECT hr.id_proyecto
		FROM horas_rendidas hr;
	DECLARE CONTINUE handler FOR NOT FOUND SET done = TRUE;
		
	OPEN cursor_1;
		ciclo:loop
		SET done = FALSE;
		fetch cursor_1 INTO project;
		if done then
		leave ciclo;
		END if;
	
	SET total_horas = (SELECT sum(hr.horas_dia) FROM horas_rendidas hr WHERE proyecto1 = hr.id_proyecto AND participante1 = hr.id_participante );

	
END loop ciclo;

		
	if total_horas != 0 then
	
	INSERT INTO rendimiento_horas(id_proyecto,id_participante,horas_dia,horas_semanales,horas_mensuales,fecha,lapso_dias)
	VALUES (proyecto1,participante1,total_horas,0,0,NOW(),1);
	
	END if;

close cursor_1;
	
END
$$

CALL rendimiento_de_horas_day(1,1);

SELECT * FROM rendimiento_horas


/*--------------Hour Performance per Week (DDL)----------------*/


DROP PROCEDURE if exists rendimiento_de_horas_week;
delimiter $$
CREATE PROCEDURE rendimiento_de_horas_week(IN proyecto1 INT, IN participante1 INT)
BEGIN
	DECLARE total_horas INT DEFAULT 0;
	DECLARE done INT DEFAULT 0;
	DECLARE project INT DEFAULT 0;
	DECLARE cursor_1 CURSOR FOR
		SELECT hr.id_proyecto
		FROM horas_rendidas hr;
	DECLARE CONTINUE handler FOR NOT FOUND SET done = TRUE;
		
	OPEN cursor_1;
		ciclo:loop
		SET done = FALSE;
		fetch cursor_1 INTO project;
		if done then
		leave ciclo;
		END if;
	
	SET total_horas = (SELECT sum(hr.horas_semanales) FROM horas_rendidas hr WHERE proyecto1 = hr.id_proyecto AND participante1 = hr.id_participante);


END loop ciclo;

		
	if total_horas != 0 then
	
	INSERT INTO rendimiento_horas(id_proyecto,id_participante,horas_dia,horas_semanales,horas_mensuales,fecha,lapso_dias)
	VALUES (proyecto1,participante1,0,total_horas,0,NOW(),7);
	
	END if;

close cursor_1;
	
END
$$

CALL rendimiento_de_horas_week(1,1);

SELECT * FROM rendimiento_horas;


/*--------------Hour Performance per Month (DDL)----------------*/


DROP PROCEDURE if exists rendimiento_de_horas_month;
delimiter $$
CREATE PROCEDURE rendimiento_de_horas_month(IN proyecto1 INT, IN participante1 INT)
BEGIN
	DECLARE total_horas INT DEFAULT 0;
	DECLARE done INT DEFAULT 0;
	DECLARE project INT DEFAULT 0;
	DECLARE cursor_1 CURSOR FOR
		SELECT hr.id_proyecto
		FROM horas_rendidas hr;
	DECLARE CONTINUE handler FOR NOT FOUND SET done = TRUE;
		
	OPEN cursor_1;
		ciclo:loop
		SET done = FALSE;
		fetch cursor_1 INTO project;
		if done then
		leave ciclo;
		END if;
	
	SET total_horas = (SELECT sum(hr.horas_mensuales) FROM horas_rendidas hr WHERE proyecto1 = hr.id_proyecto AND participante1 = hr.id_participante );

	
END loop ciclo;

		
	if total_horas != 0 then
	
	INSERT INTO rendimiento_horas(id_proyecto,id_participante,horas_dia,horas_semanales,horas_mensuales,fecha,lapso_dias)
	VALUES (proyecto1,participante1,0,0,total_horas,NOW(),30);
	
	END if;

close cursor_1;
	
END
$$

CALL rendimiento_de_horas_month(1,1);

SELECT * FROM rendimiento_horas;


/*--------------Mensual Settlements per Rol (DDL)----------------*/


DROP PROCEDURE if EXISTS mensual_settlements;

delimiter $$
CREATE PROCEDURE mensual_settlements(IN clienteX INT, IN proyecto1 INT, IN participante1 INT, IN costo1 INT, IN facturacion1 int)
BEGIN

	DECLARE project INT DEFAULT 0;
	DECLARE precio_Desarrollador INT DEFAULT 150;
	declare precio_analista int DEFAULT 230;
	declare precio_Tester INT DEFAULT 250;
	DECLARE precio_devOps INT DEFAULT 300;
	DECLARE precio_general_Programmer INT DEFAULT 350;
	declare precio_project_Manager INT DEFAULT 500;
	declare precio_General_Manager INT DEFAULT 600;
	DECLARE precio1 INT DEFAULT 0;
	DECLARE precio2 INT DEFAULT 0;
	DECLARE precio3 INT DEFAULT 0;
	DECLARE precio4 INT DEFAULT 0;
	DECLARE precio5 INT DEFAULT 0;
	DECLARE precio6 INT DEFAULT 0;
	DECLARE precio7 INT DEFAULT 0;
	DECLARE total1 INT DEFAULT 0;
	DECLARE total2 INT DEFAULT 0;
	DECLARE total_horas INT DEFAULT 0;
	DECLARE done INT DEFAULT 0;
	DECLARE cursor_1 CURSOR FOR 
		SELECT hr.id_proyecto
		FROM horas_rendidas hr;
	DECLARE CONTINUE handler FOR NOT FOUND SET done = TRUE;

	
	OPEN cursor_1;
		ciclo:loop
		SET done = FALSE;
		fetch cursor_1 INTO project;
		if done then
		leave ciclo;
		END if;
		
	SET total_horas = (SELECT SUM(hr.horas) FROM horas_rendidas hr 
	WHERE proyecto1 = hr.id_proyecto AND participante1 = hr.id_participante AND clienteX = hr.id_cliente);
	
	SET precio1 = precio_Desarrollador * total_horas;
	SET precio2 = precio_analista * total_horas;
	SET precio3 = precio_tester * total_horas;
	SET precio4 = precio_devops * total_horas;
	SET precio5 = precio_general_programmer * total_horas;
	SET precio6 = precio_project_manager * total_horas;
	SET precio7 = precio_general_manager * total_horas;
	
	SET total1 = precio1 + precio2 + precio3 + precio4+ precio5 + precio6 + precio7;
	
end loop ciclo;

	SET total1 = (select c.monto FROM centro_costo c WHERE costo1 = c.id_costo) + total1;
	
	SET total2 = (SELECT f.monto FROM centro_facturacion f WHERE facturacion1 = f.id_facturacion) + total1;
	
	if total_horas != 0 then
	
	INSERT INTO liquidacion(id_cliente,id_proyecto,id_participante,fecha,cant_de_horas,total,desarrollador,analista,tester,devops,GENERAL_programmer,project_manager,general_manager)
	VALUES(clienteX,proyecto1,participante1,NOW(),total_horas,total1,precio1,precio2,precio3,precio4,precio5,precio6,precio7);
	
	end if;
	
close cursor_1;

END
$$	
	
CALL mensual_settlements(3,2,3,1,1);

SELECT * FROM liquidacion;


/*--------------Modification Registry of Hours (DDL)----------------*/


DROP TRIGGER if EXISTS nuevos_proyecto;

delimiter $$
CREATE TRIGGER nuevos_proyecto
AFTER INSERT ON horas_rendidas
FOR EACH ROW
BEGIN
	INSERT INTO auditoria(id_cliente,id_proyecto,id_participante,fecha,horas,usuario_modificacion)
	values(NEW.id_cliente,NEW.id_proyecto,NEW.id_participante,NOW(),new.horas,CURRENT_USER());
END
$$

INSERT INTO horas_rendidas(id_proyecto,horas,horas_semanales,horas_mensuales,horas_dia,id_cliente,fecha,id_participante)
VALUES (2,35000,70,2000,10,3,DATE_SUB(NOW(),INTERVAL 9 MONTH),3);

SELECT * FROM auditoria;


/*--------------Modification Registry of Project Prices Inflation (DDL)----------------*/


DROP trigger if exists modificaciones_de_horas;

delimiter $$
CREATE trigger modificaciones_de_horas
AFTER UPDATE ON centro_costo
FOR EACH ROW
BEGIN
	INSERT INTO modificacion_costos(id_costo,monto,nuevo_monto,descripcion,usuario_modificacion,fecha)
	VALUES(OLD.id_costo,OLD.monto,NEW.monto,OLD.descripcion,CURRENT_USER(),now());
END
$$


UPDATE centro_costo
SET monto = NULL
WHERE id_costo = 4;

UPDATE centro_costo
SET monto = 3200000
WHERE id_costo < 7 AND EXISTS (
	SELECT *
	FROM centro_costo cc, cliente c
	WHERE cc.id_costo = c.id_costo
	)
AND monto IS NULL;

SELECT * FROM modificacion_costos;


/*--------------Maintenance, Security and Users Creation (DCL)----------------*/


CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
GRANT SELECT ON Rendimiento_proyectos.* TO USER1;

CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password2';
GRANT UPDATE ON Rendimiento_proyectos.* TO USER2;
GRANT INSERT ON Rendimiento_proyectos.* TO USER2;

CREATE USER 'user3'@'localhost' IDENTIFIED BY 'password3';
GRANT INSERT ON Rendimiento_proyectos.* TO USER3;
GRANT SELECT ON Rendimiento_proyectos.* TO USER3;

CREATE USER 'user4'@'localhost' IDENTIFIED BY 'password4';
GRANT SELECT ON Rendimiento_proyectos.* TO USER4;
GRANT INSERT ON Rendimiento_proyectos.* TO USER4;
GRANT DELETE ON Rendimiento_proyectos.* TO USER4;

SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';
SHOW GRANTS FOR 'user3'@'localhost';
SHOW GRANTS FOR 'user4'@'localhost';


/*-----------------------------------------------------------------------*/


SELECT * FROM cliente c
INNER JOIN proyectos p ON c.id_cliente = p.id_proyecto
INNER JOIN centro_costo cc ON c.id_costo = cc.id_costo;
INNER JOIN centro_facturacion cf ON cf.id_facturacion = c.id_facturacion
