import { IsEmail, isEmail, Max, max, Min } from "class-validator";
import {Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn, ManyToMany, JoinTable} from "typeorm";
import { Noticia } from "./Noticia";
import { Tipo_usuario } from "./Tipo_usuario";

@Entity()
export class Usuario {

    @PrimaryGeneratedColumn()
    id_usuario: number;

    @Column()
    @Max(45)
    @Min(2)
    nombre_usuario: string;

    @Column()
    @Max(30)
    @Min(6)
    password: string;

    @Column()
    apellido_paterno: string;

    @Column({nullable: true})
    apellido_materno: string;

    @Column()
    vigencia: string;

    @Column()
    @IsEmail()
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