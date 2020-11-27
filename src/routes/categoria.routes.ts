import {Router} from 'express';
import { deleteCategory, getCategories, getCategoryId, postCategory } from '../controllers/categoria.controller';

const router = Router();

//buscar usuarios o usuario específico
router.get('/categorias', getCategories);
router.get('/categorias/:id', getCategoryId);
//crear usuario
router.post('/categorias', postCategory);
//eliminar usuario
router.delete('/categorias/:id', deleteCategory);

export default router;