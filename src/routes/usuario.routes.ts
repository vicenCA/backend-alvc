import { Router } from 'express';
import { getUser,
         getUsers, 
         postUser, 
         putUser, 
         deleteUser } 
from '../controllers/usuario.controller';

const router = Router();

//buscar usuarios o usuario específico
router.get('/usuarios', getUsers);
router.get('/usuarios/:id', getUser);
//crear usuario
router.post('/usuarios', postUser);
//actualizar usuario
router.put('/usuarios/:id', putUser);
//eliminar usuario
router.delete('/usuarios/:id', deleteUser);

export default router;