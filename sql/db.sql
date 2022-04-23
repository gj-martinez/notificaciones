CREATE TABLE IF NOT EXISTS usuarios (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    nombre varchar(255),
    usuario varchar(255),
    password varchar(255),
    createdAT datetime,
    updateAT datetime
);

CREATE TABLE IF NOT EXISTS tags (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    descripcion varchar(255),
    inicio datetime,
    final datetime,
    createdAT datetime,
    updateAT datetime,

);

CREATE TABLE IF NOT EXISTS mensajes (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    descripcion varchar(255),
    leido tinyint(1),
    final tinyint(1),
    createdAT datetime,
    updateAT datetime,
    
    usuarioId INTEGER REFERENCES usuarios(id),
    tagId INTEGER REFERENCES tags(id)
);
-- list al tables
\dt

-- list all data in usuarios table
SELECT * FROM usuarios;

-- INSERT TEST DATA FOR usuarios
INSERT INTO usuarios(nombre, usuario, password, createdAT, updateAT)
    VALUES ('federico', 'federico', 'federico22', '2022-04-12','2012-05-12');

INSERT INTO usuarios(nombre, usuario, password, createdAT, updateAT)
    VALUES ('jose', 'jose', 'jose22', '2022-04-12','2012-05-12');


INSERT INTO usuarios(nombre, usuario, password, createdAT, updateAT)
    VALUES ('luciano', 'luciano', 'luciano22', '2022-04-12','2012-05-12');


-- list all data in tags table
SELECT * FROM tags;

-- INSERT TEST DATA FOR tags
INSERT INTO tags(nombre,descripcion, inicio,final, createdAT, updateAT)
    VALUES ('download Vuejs', 'tutorial para descargar Vuejs', '2022-04-12','2022-05-12', '2022-04-12','2012-05-12');

INSERT INTO tags(nombre,descripcion, inicio,final, createdAT, updateAT)
    VALUES ('Download Flutter', 'tutorial para descargar Flutter', '2022-04-12','2022-05-12', '2022-04-12','2012-05-12');

INSERT INTO tags(nombre,descripcion, inicio,final, createdAT, updateAT)
    VALUES ('download UI', 'tutorial para descargar UI', '2022-04-12','2022-04-12', '2022-05-12','2012-05-12');


-- list all data in mensajes table
SELECT * FROM mensajes;

-- INSERT TEST DATA FOR tags
INSERT INTO mensajes(descripcion, leido,suscripto, createdAT, updateAT, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, true, '2022-04-12', '2022-04-12','2012-05-12', 1,1);

INSERT INTO mensajes(descripcion, leido,suscripto, createdAT, updateAT, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', true, false, '2022-04-12', '2022-04-12','2012-05-12', 1,2);

INSERT INTO mensajes(descripcion, leido,suscripto, createdAT, updateAT, usuarioId, tagId)
    VALUES ('tenes la posibilidad de suscribirte al siguiente curso', false, false, '2022-04-12', '2022-04-12','2012-05-12', 2,3);