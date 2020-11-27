import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { Categoria } from "../entity/Categoria";

// Todas las categorías
export const getCategories = async (req: Request, res: Response): Promise<Response> => {
  const categorias = await getRepository(Categoria).find();
  return res.json(categorias);
};
// Retorna una categoria en especifico por _id
export const getCategoryId = async (req: Request, res: Response): Promise<Response> => {
  const resultado = await getRepository(Categoria).findOne(req.params.id);
  return res.json(resultado);
};
// Crea una categoria
export const postCategory = async (req: Request, res: Response): Promise<Response> => {
  const nuevaCategoria = getRepository(Categoria).create(req.body);
  const resultado = await getRepository(Categoria).save(nuevaCategoria);
  return res.json(resultado);
};
// Eliminar una categoria
export const deleteCategory = async (req: Request, res: Response): Promise<Response> => {
  const resultado = await getRepository(Categoria).delete(req.params.id);
  return res.json(resultado);
};