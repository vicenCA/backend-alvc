import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { Categoria } from "../entity/Categoria";
import { Noticia } from "../entity/Noticia";

// Conseguir lista completa de noticias
export const getNoticias = async (req: Request, res: Response): Promise<Response> => {
  const noticias = await getRepository(Noticia).find();
  return res.json(noticias);
};
// Conseguir a una noticia en especifico
export const getNoticia = async (req: Request, res: Response): Promise<Response> => {
  const resultado = await getRepository(Noticia).findOne(req.params.id);
  return res.json(resultado);
};
// Conseguir a una noticia en especifico
export const getNoticiaCategoria = async (req: Request, res: Response, cat: Categoria): Promise<Response> => {
    const resultado = await getRepository(Noticia).find();
    return res.json(resultado);
  };
// Crear un objeto noticia a partir de los datos entregados desde el front-end
export const postNoticia = async (req: Request, res: Response): Promise<Response> => {
  const nuevaNoticia = getRepository(Noticia).create(req.body); //req.body = objeto que contiene los datos enviados desde la parte del cliente
  const resultado = await getRepository(Noticia).save(nuevaNoticia);
  return res.json(resultado);
};
// Actualizar a una noticia por Id
export const putNoticia = async (req: Request, res: Response): Promise<Response> => {
  const noticia = await getRepository(Noticia).findOne(req.params.id);
  if (noticia) 
  {
    getRepository(Noticia).merge(noticia, req.body);
    const resultado = await getRepository(Noticia).save(noticia);
    return res.json(resultado);
  }
  return res.status(404).json({msg: 'Usuario no encontrado'});
};
// Eliminar una noticia
export const deleteNoticia = async (req: Request, res: Response): Promise<Response> => {
  const resultado = await getRepository(Noticia).delete(req.params.id);
  return res.json(resultado);
};
