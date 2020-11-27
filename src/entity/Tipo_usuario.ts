import {Entity, PrimaryGeneratedColumn, Column} from "typeorm";

@Entity()
export class Tipo_usuario {

    @PrimaryGeneratedColumn()
    id_tipo_usuario: number;

    @Column()
    nombre_tipo_usuario: string;
}