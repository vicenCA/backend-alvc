import {Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn} from "typeorm";
import { Noticia } from "./Noticia";

@Entity()
export class Comentario {

    @PrimaryGeneratedColumn()
    id_comentario: number;

    @Column()
    comentario: string;

    @Column()
    fecha_comentario: string;

    @Column()
    alias: number;

    @ManyToOne(type => Noticia)
    @JoinColumn()
    noticia: Noticia;
}