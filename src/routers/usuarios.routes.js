import { Router } from "express";
import {getUsuarios,deleteUsuarios,updateUsuarios,getUsuario } from "../controllers/usuarios.controller.js"
import { verifyToken } from "../libs/verifyToken.js"

const router =  Router();


router.get('/usuarios',getUsuarios)
router.put('/usuarios/:id',verifyToken,updateUsuarios)
router.delete('/usuarios/:id',verifyToken,deleteUsuarios)
router.get('/usuarios/:id',getUsuario)


export default router