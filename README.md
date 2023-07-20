# dockerizecodeigniter
Proyecto inicial de prueba. 
Incluimos un Dockerfile e instrucciones para poner en marcha un contenedor para desarrollo con Codeigniter
Funcionamiento:

Es importante la estrcutura de carpetas para que funcionen los fiheros:

1.- Descargar Codeigniter y descomprimirlo en una carpeta llamada codei
   Codeigniter 4.3.6: https://github.com/CodeIgniter4/framework/releases/tag/v4.3.6

Descarga: https://github.com/codeigniter4/framework/archive/refs/tags/v4.3.6.tar.gz 

Descomprimir: tar -zxvf v4.3.6.tar.gz 

Nombrar carpeta: mv v4.3.6 codei 

	
2 (Opcional) Modificar ficheros Codeigniter

Fichero .env
	
3.- Crear la imagen

docker build -t codeiimagen .

4.- Puesta en marcha del contenedor

docker run --rm -d -p 8080:80 -v ${PWD}:/var/www --name codeicontainer codeiimagen

(Realizamos un bind-mout para que los cambios en los resarrollos en el directorio "codei" se visualicen en la aplicación web)
