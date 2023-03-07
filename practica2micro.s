		/*Integrantes
		ROBERTO GUEVARA MALDONADO 2213064649
		JOSE EDUARDO CAMPUZANO CORONA 214303033 
		MIGUEL ZEFERINO LÓPEZ 2143030328
		*/

		
		.arch armv7-m
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"practica2micro.c"
	.text
	.global	sumatoria
	.bss
	.align	2
	.type	sumatoria, %object
	.size	sumatoria, 4
sumatoria:
	.space	4
	.global	arr
	.align	2
	.type	arr, %object
	.size	arr, 40

	
arr:

	.space	40    @Espacio que reservo el compilador para el arreglo de 10 valores
	.text
	.align	1
	.global	media
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	media, %function

media:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}  @Marco de la funcion MEDIA
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7]
	b	.L2
.L3:
	ldr	r2, .L5
	ldr	r3, [r7]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L5+4
	str	r3, [r2]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L2:
	ldr	r3, [r7]
	cmp	r3, #9
	ble	.L3
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r2, .L5+8
	smull	r1, r2, r2, r3
	asrs	r2, r2, #2
	asrs	r3, r3, #31
	subs	r3, r2, r3
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}  @Marco de la funcion Media
	bx	lr
.L6:
	.align	2
.L5:
	.word	arr
	.word	sumatoria
	.word	1717986919
	.size	media, .-media
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	main, %function

read:

	

main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}   @Marco de la funcion main
	
	mov r0, #0  @Declarar i = 0 para el ciclo for
	str r0, [r6] @Se almacena el valor de i
	ldr r5, =arr @Obtener direccion base del arreglo
	b F0

	F1:
		mov r0, #0 /* read system call */
    	ldr r1, =inp_str   @En r1 esta el valor que dio el usuario
  		mov r2, #4                    @Llamada al sistema para leer los valores ingresados por el usuario
    	mov r7, #3
    	swi 0

		ldr r0, [r6] @Se carga i
		str r1, [r5] @Esta intruccion guarda el valor leido en arreglo
		add r5, r5, #4  @Se le suma 4 a la direccion de memoria del arreglo
		ldr r0, [r6]
		add r0, #1   @Se incrementa i en 1
		str r0, [r6]  @Se almacena i


	F0:
		ldr r0, [r6]
		cmp r0, #10    @Comparacion para repetir el ciclo 10 veces 
		blt F1

	add	r7, sp, #0
	bl	media   @Se llama a la funcion media la cual se hizo en alto nivel y lo que hace es sumar los valores del arreglo y dividirlos para obtener la media
	mov	r3, r0 @Salida de la funcion, hay que imprimirla
	mov	r0, r3

		

	ldr r5, =num  @Carga la direccion de memoria de num en r5
	str r3, [r5]  @Guardar el resultado de 'media' en memoria


	mov r0, #1 /* write system call */
    ldr r1, =string1
    mov r2, #len1                           @Imprime 'Resultado:'
    mov r7, #4
    swi 0

	
    mov r0, #1 /* write system call */  
	ldr r1, [r5]                       @Imprime la salida de la funcion 'MEDIA'
	mov r2, #len3
    mov r7, #4
    swi 0

	mov r0, #1 /* write system call */
    ldr r1, =string2                   @Imprime un mensaje indicando el fin del programa
    mov r2, #len2
    mov r7, #4
    swi 0
    

	pop	{r7, pc}   @Marco de la funcion main

	

	
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",%progbits

	.data
    string1: .ascii "Resultado: \n"
	len1 = . - string1
	string2: .ascii "\nFin del programa \n"
	len2 = . - string2
	num: .asciz "%d"
	len3 = .-num
	inp_str: .asciz "%d"
	

