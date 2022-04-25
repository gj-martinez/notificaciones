CREATE TABLE IF NOT EXISTS Usuarios (
    id integer AUTO_INCREMENT  PRIMARY KEY ,
    nombre varchar(255),
    usuario varchar(255),
    password varchar(255),
    createdAT datetime,
    updateAT datetime
);

CREATE TABLE IF NOT EXISTS Tags (
    id integer PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(255),
    descripcion varchar(255),
    inicio datetime,
    final datetime,
    createdAT datetime,
    updateAT datetime

);

CREATE TABLE IF NOT EXISTS Mensajes (
    id integer PRIMARY KEY AUTO_INCREMENT,
    descripcion varchar(255),
    leido BOOLEAN DEFAULT FALSE,
    suscripto BOOLEAN DEFAULT FALSE,
    createdAT datetime,
    updateAT datetime,
    
    usuarioId INTEGER REFERENCES Usuarios(id),
    tagId INTEGER REFERENCES Tags(id)
);
-- list al tables
\dt

-- list all data in usuarios table
SELECT * FROM Usuarios;

-- INSERT TEST DATA FOR usuarios
INSERT INTO Usuarios(nombre, usuario, password, createdAT, updateAT)
    VALUES ('federico', 'federico', 'federico22', '2022-04-12','2012-05-12');

INSERT INTO Usuarios(nombre, usuario, password, createdAT, updateAT)
    VALUES ('jose', 'jose', 'jose22', '2022-04-12','2012-05-12');


INSERT INTO Usuarios(nombre, usuario, password, createdAT, updateAT)
    VALUES ('luciano', 'luciano', 'luciano22', '2022-04-12','2012-05-12');


-- list all data in tags table
SELECT * FROM Tags;

-- INSERT TEST DATA FOR tags
INSERT INTO Tags(nombre,descripcion, inicio,final, createdAT, updateAT)
    VALUES ('download Vuejs', 'tutorial para descargar Vuejs', '2022-04-12','2022-05-12', '2022-04-12','2012-05-12');

INSERT INTO Tags(nombre,descripcion, inicio,final, createdAT, updateAT)
    VALUES ('Download Flutter', 'tutorial para descargar Flutter', '2022-04-12','2022-05-12', '2022-04-12','2012-05-12');

INSERT INTO Tags(nombre,descripcion, inicio,final, createdAT, updateAT)
    VALUES ('download UI', 'tutorial para descargar UI', '2022-04-12','2022-04-12', '2022-05-12','2012-05-12');


-- list all data in mensajes table
SELECT * FROM Mensajes;

-- INSERT TEST DATA FOR mensajes

INSERT INTO Mensajes(descripcion, leido,suscripto, createdAT, updateAT, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, true, '2022-04-12', '2022-04-12', 1,1);

INSERT INTO Mensajes(descripcion, leido,suscripto, createdAT, updateAT, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, false, '2022-04-12', '2022-04-12', 1,2);

INSERT INTO Mensajes(descripcion, leido,suscripto, createdAT, updateAT, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', false, false, '2022-04-12', '2022-04-12', 2,3);
