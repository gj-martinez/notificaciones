import { Router } from "express";
import {getTags,createTag,updateTag,deleteTag,getTag } from "../controllers/tags.controller.js"
import { verifyToken } from "../libs/verifyToken.js"

const router =  Router();


router.get('/tags',getTags)
router.post('/tags',verifyToken,createTag)
router.put('/tags/:id',verifyToken,updateTag)
router.delete('/tags/:id',verifyToken,deleteTag)
router.get('/tags/:id',getTag)


export default router