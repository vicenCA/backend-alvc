import {Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, OneToOne} from "typeorm";
import { Noticia } from "./Noticia";
import { Tipo_multimedia } from "./Tipo_multimedia";

@Entity()
export class Multimedia {

    @PrimaryGeneratedColumn()
    id_multimedia: number;

    @Column()
    nombre_multimedia: string;

    @OneToOne(type => Tipo_multimedia)
    @JoinColumn()
    tipo_multimedia: Tipo_multimedia;

    @ManyToOne(type => Noticia)
    @JoinColumn()
    noticia: Noticia;
    
}