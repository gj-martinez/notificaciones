import {Usuario} from '../models/Usuario.js'

export const getUsuarios = async (req, res, next) => {
    try {
        const usuarios = await Usuario.findAll();
        res.json(usuarios)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const getUsuario = async (req, res, next) => {
    try {
        const {id} = req.params
        const usuario = await Usuario.findOne({
            where: {id: id},
        })

        if(!usuario) {
            return res.status(404).json({message: "Usuario no existe"})
        }

        res.json(usuario)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const createUsuario = async (req, res, next) => {
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

export const updateUsuarios = async (req, res) => {
    try {
        const {id} = req.params
        const {nombre, usuario, password} = req.body
        const pass = await bcryptjs.hash(password, 8)

        const usuarioId = await Usuario.findByPk(id)
        usuarioId.nombre = nombre,
        usuarioId.usuario = usuario,
        usuarioId.password = pass,
        await usuarioId.save()

        res.json(usuarioId)

    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const deleteUsuarios = async (req, res) => {
    try {
        const {id} = req.params
        await Usuario.destroy({
            where: {id},
        })
        res.sendStatus(204)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}
