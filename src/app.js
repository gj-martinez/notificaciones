import express from 'express';
import authRoutes from './routers/auth.routes.js';
import usuariosRoutes from './routers/usuarios.routes.js';
import tagsRoutes from './routers/tags.routes.js';
import mensajesRoutes from './routers/mensajes.routes.js';

const app = express();
//middlewares
app.use(express.json())


app.get("/", (req, res) => {
    res.json({
      message: "Bienvenidos a Notificaciones API",
      author: "Gonzalo Martinez",
    });
  });


app.use(authRoutes)
app.use(usuariosRoutes)
app.use(tagsRoutes)
app.use(mensajesRoutes)



export default app;