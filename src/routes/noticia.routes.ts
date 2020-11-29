import { Router } from 'express';
import { deleteNoticia, 
        getNoticia, 
        getNoticias, 
        postNoticia, 
        putNoticia } 
from '../controllers/noticia.controllers';


const router = Router();

//buscar noticias o noticia específico
router.get('/noticias', getNoticias);
router.get('/noticias/:id', getNoticia);
//crear noticia
router.post('/noticias', postNoticia);
//actualizar noticia
router.put('/noticias/:id', putNoticia);
//eliminar noticia
router.delete('/noticias/:id', deleteNoticia);

export default router;