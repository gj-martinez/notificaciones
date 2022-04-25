CREATE TABLE IF NOT EXISTS Usuarios (
    id integer AUTO_INCREMENT  PRIMARY KEY ,
    nombre varchar(255),
    usuario varchar(255),
    password varchar(255)

);

CREATE TABLE IF NOT EXISTS Tags (
    id integer PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(255),
    descripcion varchar(255),
    inicio datetime,
    final datetime


);

CREATE TABLE IF NOT EXISTS Mensajes (
    id integer PRIMARY KEY AUTO_INCREMENT,
    descripcion varchar(255),
    leido BOOLEAN DEFAULT FALSE,
    suscripto BOOLEAN DEFAULT FALSE,

    
    usuarioId INTEGER REFERENCES Usuarios(id),
    tagId INTEGER REFERENCES Tags(id)
);



-- INSERT TEST DATA FOR usuarios
INSERT INTO Usuarios(nombre, usuario, password)
    VALUES ('federico', 'federico', 'federico22');

INSERT INTO Usuarios(nombre, usuario, password)
    VALUES ('jose', 'jose', 'jose22');


INSERT INTO Usuarios(nombre, usuario, password)
    VALUES ('luciano', 'luciano', 'luciano22');


-- INSERT TEST DATA FOR tags
INSERT INTO Tags(nombre,descripcion, inicio,final)
    VALUES ('download Vuejs', 'tutorial para descargar Vuejs', '2022-04-12','2022-05-12');

INSERT INTO Tags(nombre,descripcion, inicio,final)
    VALUES ('Download Flutter', 'tutorial para descargar Flutter', '2022-04-12','2022-05-12');

INSERT INTO Tags(nombre,descripcion, inicio,final)
    VALUES ('download UI', 'tutorial para descargar UI', '2022-04-12','2022-04-12');



-- INSERT TEST DATA FOR mensajes

INSERT INTO Mensajes(descripcion, leido,suscripto, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, true, 1,1);

INSERT INTO Mensajes(descripcion, leido,suscripto,  usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, false, 1,2);

INSERT INTO Mensajes(descripcion, leido,suscripto,  usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', false, false, 2,3);
