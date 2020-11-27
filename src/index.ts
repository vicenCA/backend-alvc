import express from 'express';
import morgan from 'morgan';
import cors from 'cors'
import {createConnection} from 'typeorm'

import chalk = require('chalk');
import userRoutes from './routes/usuario.routes';
import categoryRoutes from './routes/categoria.routes';
import NoticiaRoutes from "./routes/noticia.routes";

const app = express();
createConnection().then(() => {
    console.log(chalk.green('Conexión Establecida con la Base de Datos.'));
}).catch(error => console.log(chalk.red(error)));

// Middlewares
app.use(cors());
app.use(express.json());
app.use(morgan('dev'));

// Routes
app.use(userRoutes);
app.use(categoryRoutes);
app.use(NoticiaRoutes);

// Listen
app.listen(3000);
console.log(chalk.yellow('Servidor conectado en el puerto: ',3000));