import { validate } from "class-validator";
import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { Usuario } from "../entity/Usuario";

// Conseguir una lista de usuarios
export const getUsers = async (req: Request, res: Response): Promise<Response> => {
  const users = await getRepository(Usuario).find();
  return res.json(users);
};
// Conseguir a un usuario en específico
export const getUser = async (req: Request, res: Response): Promise<Response> => {
  const results = await getRepository(Usuario).findOne(req.params.id_usuario);
  return res.json(results);
};
// Crear un usuario 
export const postUser = async (req: Request, res: Response): Promise<Response> => {
  const newUser = getRepository(Usuario).create(req.body);
  const results = await getRepository(Usuario).save(newUser);
  return res.json(results);
};
// Actualizar a un usuario por Id
export const putUser = async (req: Request, res: Response): Promise<Response> => {
  const user = await getRepository(Usuario).findOne(req.params.id);
  if (user) 
  {
    getRepository(Usuario).merge(user, req.body);
    const results = await getRepository(Usuario).save(user);
    return res.json(results);
  }
  return res.status(404).json({msg: 'Usuario no encontrado'});
};
// Eliminar a un usuario
export const deleteUser = async (req: Request, res: Response): Promise<Response> => {
  const results = await getRepository(Usuario).delete(req.params.id);
  return res.json(results);
};
  // NO TERMINADO
export const loginUser = async (req: Request, res: Response): Promise<Response> => {
  const userValidator = getRepository(Usuario);
  const {email, password} = req.body;

  const usuario = new Usuario();
  usuario.correo   = email;
  usuario.password = password;

  const error = await validate(usuario);

  return res;
}