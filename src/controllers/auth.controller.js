import bcryptjs from 'bcryptjs'
import jwt from 'jsonwebtoken'
import {promisify} from 'util'

import {Usuario} from '../models/Usuario.js'


export const login = async (req, res, next) => {
    try {
        const {usuario, password} = req.body

        if(!usuario || !password) {
            res.json({message: "Ingrese usuario y constraseña"})
        }else{

            const user = await Usuario.findOne({
                where: {usuario},
            })
    
            if(!user || !(await bcryptjs.compare(password, user.password))) {
                return res.status(404).json({message: "Usuario no existe", token: null})
            }else{
                const id = user.id
                const token = jwt.sign({id:id}, process.env.JWT_SECRETO,{
                    expiresIn: process.env.JWT_TIEMPO_EXPIRA
                })
    
                res.json({message:"Login correcto", token})
            }
        }
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const register = async (req, res, next) => {
    try {
        const {nombre, usuario, password} = req.body
        const pass = await bcryptjs.hash(password, 8)
        
        const newUsuario = await Usuario.create({
            nombre,
            usuario,
            password: pass
        })

        res.json(newUsuario)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
    
}

export const logout = async (req, res, next) => {
    res.status(200).send({ token: null });
}
