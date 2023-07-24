# dockerizecodeigniter
Proyecto inicial de prueba. 
Incluimos un Dockerfile e instrucciones para poner en marcha un contenedor para desarrollo con Codeigniter
Funcionamiento:

Es importante la estrcutura de carpetas para que funcionen los fiheros:

OPCIÓN 1: docker run - Esta opción permite enlazar la carpeta del código de codeigniter para actualizar cambios de forma inmediata.

1.- Descargar Codeigniter y descomprimirlo en una carpeta llamada codei
   Codeigniter 4.3.6: https://github.com/CodeIgniter4/framework/releases/tag/v4.3.6

Descarga: https://github.com/codeigniter4/framework/archive/refs/tags/v4.3.6.tar.gz 

Descomprimir: tar -zxvf v4.3.6.tar.gz 

Nombrar carpeta: mv v4.3.6 codei 

	
2.- Modificar ficheros Codeigniter

Permisos en la carpeta writeable (y sus subcarpetas)
(Opcional) Fichero .env
	
3.- Crear la imagen

docker build -t codeiimagen .

4.- Puesta en marcha del contenedor

docker run --rm -d -p 8080:80 -v ${PWD}:/var/www --name codeicontainer codeiimagen

(Realizamos un bind-mout para que los cambios en los resarrollos en el directorio "codei" se visualicen en la aplicación web)

OPCIÓN 2: docker compose - Esta opción carga una copia inicial del estado del código sin embargo proporciona acceso a la base de datos en la dirección "db"

docker compose -d up
