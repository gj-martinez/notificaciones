import { Router } from "express";
import {createMensaje,getMensajes, getMensajeLeido, getMensajeNoLeido,updateMensaje,deleteMensaje,getMensajeSuscripto } from "../controllers/mensajes.controller.js"

import { verifyToken } from "../libs/verifyToken.js"
const router =  Router();


router.get('/mensajes',getMensajes)
router.post('/mensajes',verifyToken,createMensaje)
router.put('/mensajes/:id',verifyToken,updateMensaje)
router.delete('/mensajes/:id',verifyToken,deleteMensaje)
router.get('/mensajes/leidos',getMensajeLeido)
router.get('/mensajes/noLeidos',getMensajeNoLeido)
router.get('/mensajes/suscripto',getMensajeSuscripto)


export default router