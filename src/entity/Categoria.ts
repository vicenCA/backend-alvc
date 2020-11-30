import { Column, Entity, Index, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Categoria {

    @PrimaryGeneratedColumn()
    id_categoria: number;

    @Column()
    nombre_categoria: string;
}


/*
--------------------------------------
|***********CATEGORIA****************|
--------------------------------------
| id_categoria | nombre_categoria    |
--------------------------------------
| 1            | espectaculo         |
| 2            | salud               |
| 3            | cultura             |
| 4            | nacional            |
| 5            | internacional       |
--------------------------------------
*/