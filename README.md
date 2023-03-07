# Practica-2-Microcontroladores
Practica 2 Microcontroladores.

Integrantes:
ROBERTO GUEVARA MALDONADO 2213064649
JOSE EDUARDO CAMPUZANO CORONA 214303033 
MIGUEL ZEFERINO LÓPEZ 2143030328


En el archivo practica2micro.s se desarrollo el codigo para llevar a cabo la practica, partimos de un codigo en lenguaje C el 
cual declaraba un arreglo vacio de 10 espacios y una funcion llamada 'media' la cual se encargaba de sumar los 10 valores del 
arreglo y dividirlos entre 10. Nosotros nos encargamos de modificar el programa tal que con llamadas al sistema, usando 
los marcos de las funciones (Comentadas en el archivo .S) y utilizando la metodologia "Carga, modifica y almacena" se le 
pidieran al usuario esos 10 valores del arreglo y se fueran almacenando con una estructura 'for'; el programa llama a la 
funcion 'media' la cual usa la direccion base de los valores del arreglo y lleva a cabo su procedimiento. Por ultimo, se 
almacena el valor de retorno de la funcion 'media' y se imprime usando etiquetas en memoria de tipo ascii.


Nosotros para compilar esta funcion en terminal linux lo compilamos y ejecutamos con los siguientes comandos:
arm-as practica2micro.s -o practica2micro.o
arm-gcc practica2micro.o -o practica2micro.elf -static
arm-run practica2micro.elf

![](https://i.imgur.com/lIGfHgD.png)

![](https://i.imgur.com/k8azwJz.png)

![](https://i.imgur.com/Fmq8BIL.png)

![](https://i.imgur.com/E11gD1I.png)

Como se muesta en estas tablas de referencia se debe asignar un valor especifico a lo que queramos hacer al regsiistro r7 para configurar los perifericos del sistema; en este caso para llevar a cabo la practica solo se usaron los valores de 3 y 4 en r7 para leer los valores del usuario y imprimir en consola respectivamente. 



