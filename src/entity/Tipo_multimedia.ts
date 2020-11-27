import {Entity, PrimaryGeneratedColumn, Column} from "typeorm";

@Entity()
export class Tipo_multimedia {

    @PrimaryGeneratedColumn()
    id_tipo_multimedia: number;

    @Column()
    nombre_tipo_multimedia: string;
}