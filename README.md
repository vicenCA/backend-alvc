# Backend ALVC Noticiario

## Programas utilizados

- Visual Studio Code
- Workbench Mysql o XAMPP
- Insomnia REST

## Lenguaje de programación

- Typescript

## Dependencias Fundamentales

- Express
- Class-validator
- Typeorm
- Chalk
- Cors
- Morgan
- Mysql
- Reflect-metadata

Todas éstas y otras de desarrollo se encuentran en el archivo package.json.

## Configuración

Para generar la base de datos a través del backend debe ingresar los siguientes comandos:

```sh
npm install
npm run typeorm:migrate
npm run typeorm:run
```
En caso contrario de no funcionar, en la carpeta backup dentro de src, se encontrará un script, el cual contendrá la base de datos que deberá ser importada (de preferencia por Workbench).

### Puertos

Los puertos a utilizar son el predeterminado de mysql (3306) y uno para conectar al servidor el cual puede ser utilizado por Insomnia (3000).

### Permisos

Para tener una conexión con mysql, en el archivo ormconfig.json, se encuentra la configuración para establecer la conexión, el cual contendrá datos como el host, nombre de la base de datos, el usuario y la contraseña. Si quiere cambiar datos que le sean más cómodo se puede hacer, siempre y cuando no tenga problemas con la conexión.

### Levantar los servidores

```sh
npm start
npm run dev
```

Con él, estará habilitando el puerto 3000 y el 3306 para la base de datos.
Además, habrán otros comandos script solo para su desarrollo.
## Posibles Errores

El error encontrado y que pueda aparecer mientras se ejecuta el backend, es al usar migración, donde las foreign keys de categoria en noticia y el tipo de usuario en usuario no se puedan duplicar siendo que son una descomposición de una columna, lo cual la solución sería exportar la base de datos, eliminar la actual y volverla a importar sin olvidar poner el nombre del esquema que corresponda para que se descarte el error y funcione sin problemas.

Por otro lado, otro error son los archivos de migración, al levantar el servidor la terminal pueda reclamar por la migración creada, por lo tanto, borre los archivos generados después de correrlos con el comando typeorm:run.