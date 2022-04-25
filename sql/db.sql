CREATE TABLE IF NOT EXISTS Usuarios (
    id integer AUTO_INCREMENT ,
    nombre varchar(255),
    usuario varchar(255),
    password varchar(255),
    createdAt DATETIME NOT NULL, 
    updatedAt DATETIME NOT NULL, 
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Tags (
    id integer AUTO_INCREMENT,
    nombre varchar(255),
    descripcion varchar(255),
    inicio datetime,
    final datetime,
    createdAt DATETIME NOT NULL, 
    updatedAt DATETIME NOT NULL, 
    PRIMARY KEY (id)

);

CREATE TABLE IF NOT EXISTS Mensajes (
    id integer AUTO_INCREMENT,
    descripcion varchar(15000),
    leido BOOLEAN DEFAULT FALSE,
    suscripto BOOLEAN DEFAULT FALSE,
    createdAt DATETIME NOT NULL, 
    updatedAt DATETIME NOT NULL, 
    UsuarioId INTEGER, 
    TagId INTEGER, 

    PRIMARY KEY (id),
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios (id), 
    FOREIGN KEY (TagId) REFERENCES Tags (id)
);



-- INSERT TEST DATA FOR usuarios
INSERT INTO Usuarios(nombre, usuario, password,createdAt ,updatedAt)
    VALUES ('federico', 'federico', 'federico22','2022-04-12','2022-04-12');

INSERT INTO Usuarios(nombre, usuario, password,createdAt ,updatedAt)
    VALUES ('jose', 'jose', 'jose22','2022-04-12','2022-04-12');


INSERT INTO Usuarios(nombre, usuario, password,createdAt ,updatedAt)
    VALUES ('luciano', 'luciano', 'luciano22','2022-04-12','2022-04-12');


-- INSERT TEST DATA FOR tags
INSERT INTO Tags(nombre,descripcion, inicio,final,createdAt ,updatedAt)
    VALUES ('download Vuejs', 'tutorial para descargar Vuejs', '2022-04-12','2022-05-12','2022-04-12','2022-04-12');

INSERT INTO Tags(nombre,descripcion, inicio,final,createdAt ,updatedAt)
    VALUES ('Download Flutter', 'tutorial para descargar Flutter', '2022-04-12','2022-05-12','2022-04-12','2022-04-12');

INSERT INTO Tags(nombre,descripcion, inicio,final,createdAt ,updatedAt)
    VALUES ('download UI', 'tutorial para descargar UI', '2022-04-12','2022-04-12','2022-04-12','2022-04-12');



-- INSERT TEST DATA FOR mensajes

INSERT INTO Mensajes(descripcion, leido,suscripto, createdAt ,updatedAt,usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, true,'2022-04-12','2022-04-12', 1,1);

INSERT INTO Mensajes(descripcion, leido,suscripto, createdAt ,updatedAt, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, false,'2022-04-12','2022-04-12', 1,2);

INSERT INTO Mensajes(descripcion, leido,suscripto,createdAt,updatedAt,usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', false, false,'2022-04-12','2022-04-12', 2,3);
