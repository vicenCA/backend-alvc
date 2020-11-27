import {Entity, PrimaryGeneratedColumn, Column, JoinTable, ManyToMany, OneToOne, JoinColumn} from "typeorm";
import { Categoria } from "./Categoria";
import { Usuario } from "./Usuario";

@Entity()
export class Noticia {

    @PrimaryGeneratedColumn()
    id_noticia: number;

    @Column()
    titulo: string;

    @Column()
    estado: string;

    @Column()
    calificacion: number;

    @Column()
    visitas: number;

    @Column()
    fecha_noticia: Date;

    @Column()
    cuerpo: string;

    @ManyToMany(type => Usuario, usuario => usuario.noticias, {
        cascade: ["insert", "update"]
    })
    @JoinTable()
    usuarios: Usuario[];

    @OneToOne(type => Categoria)
    @JoinColumn()
    categoria: Categoria;
}