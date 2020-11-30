import {Entity, PrimaryGeneratedColumn, Column} from "typeorm";

@Entity()
export class Tipo_usuario {

    @PrimaryGeneratedColumn()
    id_tipo_usuario: number;

    @Column()
    nombre_tipo_usuario: string;
}

/*
--------------------------------------
|***********CATEGORIA****************|
--------------------------------------
| id_categoria | nombre_categoria    |
--------------------------------------
| 1            | administrador       |
| 2            | periodista          |
| 3            | registrado          |
--------------------------------------
*/