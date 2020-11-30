import {Entity, PrimaryGeneratedColumn, Column, JoinTable, ManyToMany, OneToOne, JoinColumn, Index} from "typeorm";
import { Categoria } from "./Categoria";
import { Usuario } from "./Usuario";

@Entity()
export class Noticia {

    @PrimaryGeneratedColumn()
    id_noticia: number;

    @Column("varchar", { length: 256 })
    titulo: string;

    @Column()
    estado: string;

    @Column()
    calificacion: number;

    @Column()
    visitas: number;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP"})
    fecha_noticia: Date;

    @Column("varchar", { length: 512 })
    cuerpo: string;

    @ManyToMany(type => Usuario, usuario => usuario.noticias, {
    })
    @JoinTable()
    usuarios: Usuario[]; // usuarios, admin, periodista etc...

    @OneToOne(() => Categoria)
    @JoinColumn()
    @Index({unique: false})
    categoria: Categoria;
}