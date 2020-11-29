import {Router} from 'express';
import { deleteCategory, getCategories, getCategoryId, postCategory } from '../controllers/categoria.controller';

const router = Router();

//buscar categorias o categoria en especifico
router.get('/categorias', getCategories);
router.get('/categorias/:id', getCategoryId);
//crear categoria
router.post('/categorias', postCategory);
//eliminar categoria
router.delete('/categorias/:id', deleteCategory);

export default router;