import {Mensaje} from '../models/Mensaje.js'
import {Tag} from '../models/Tag.js'

export const getMensajes = async (req, res, next) => {
    try {
        const mensajes = await Mensaje.findAll();
        res.json(mensajes)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const getMensajeLeido = async (req, res, next) => {
    try {
        const mensaje = await Mensaje.findAll({
            where: {leido: true},
        })

        if(!mensaje) {
            return res.status(404).json({message: "Mensaje no existe"})
        }

        res.json(mensaje)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}
export const getMensajeNoLeido = async (req, res, next) => {
    try {
        const mensaje = await Mensaje.findAll({
            where: {leido: false},
        })

        if(!mensaje) {
            return res.status(404).json({message: "Mensaje no existe"})
        }

        res.json(mensaje)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const createMensaje = async (req, res, next) => {
    try {
        const {descripcion, leido, suscripto, usuarioId, tagId} = req.body
        
        const newMensaje = await Mensaje.create({
            descripcion,
            leido,
            suscripto,
            usuarioId,
            tagId,
        })

        res.json(newMensaje)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
    
}

export const updateMensaje = async (req, res) => {
    try {

        const {id} = req.params
        const mensaje = await Mensaje.findByPk(id)
        
        mensaje.set(req.body)
        await mensaje.save()

        res.json(mensaje)

    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const deleteMensaje = async (req, res) => {
    try {
        const {id} = req.params
        await Mensaje.destroy({
            where: {id},
        })
        res.sendStatus(204)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const getMensajeSuscripto = async (req, res, next) => {
    try {
        const mensaje = await Mensaje.findAll({
            where: {suscripto: true},
            include: [Tag]
        })

        if(!mensaje) {
            return res.status(404).json({message: "Mensaje no existe"})
        }

        res.json(mensaje)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}