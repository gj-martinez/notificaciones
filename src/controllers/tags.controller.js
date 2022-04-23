import {Tag} from '../models/Tag.js'

export const getTags = async (req, res, next) => {
    try {
        const tags = await Tag.findAll();
        res.json(tags)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const getTag = async (req, res, next) => {
    try {
        const {id} = req.params
        const tag = await Tag.findOne({
            where: {id: id},
        })

        if(!tag) {
            return res.status(404).json({message: "Tag no existe"})
        }

        res.json(tag)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const createTag = async (req, res, next) => {
    try {
        const {nombre, descripcion, inicio, final} = req.body

        const newTag = await Tag.create({
            nombre,
            descripcion,
            inicio,
            final
        })

        res.json(newTag)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
    
}

export const updateTag = async (req, res) => {
    try {
        const {id} = req.params
        const tag = await Tag.findByPk(id)
        
        tag.set(req.body)
        await tag.save()

        res.json(tag)

    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}

export const deleteTag = async (req, res) => {
    try {
        const {id} = req.params
        await Tag.destroy({
            where: {id},
        })
        res.sendStatus(204)
    } catch (error) {
        return res.status(500).json({message: error.message})
    }
}
