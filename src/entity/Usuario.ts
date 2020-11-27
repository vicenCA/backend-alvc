import {Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn, ManyToMany, JoinTable} from "typeorm";
import { Noticia } from "./Noticia";
import { Tipo_usuario } from "./Tipo_usuario";

@Entity()
export class Usuario {

    @PrimaryGeneratedColumn()
    id_usuario: number;

    @Column()
    nombre_usuario: string;

    @Column()
    password: string;

    @Column()
    apellido_paterno: string;

    @Column({nullable: true})
    apellido_materno: string;

    @Column()
    vigencia: string;

    @Column()
    correo: string;
    
    @Column()
    telefono: number;

    @OneToOne(type => Tipo_usuario)
    @JoinColumn()
    tipo_usuario: Tipo_usuario;

    @ManyToMany(type => Noticia, noticia => noticia.usuarios, {
        cascade: ["insert", "update"]
    })
    @JoinTable()
    noticias: Noticia[];
}