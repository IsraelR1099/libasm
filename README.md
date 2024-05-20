# Estructura de un programa en ensamblador
Un programa ensamblador con sintaxis NASM consta de 3 secciones principales:
1. **section .data**: En esta sección se declaran las variables que se utilizarán en el programa.
2. **section .bss**: En esta sección se declaran las variables que se utilizarán en el programa pero que no se inicializarán.
3. **section .text**: En esta sección se escribe el código del programa.

## Directivas
Las directivas son instrucciones que se utilizan para definir las secciones del programa, las variables, las constantes, etc.

### Definición de constantes
Una constante es un valor que no puede ser modificado por ninguna instrucción del programa. La declaración de una constante se puede hacer en cualquier parte del programa, pero es recomendable hacerlo en la sección .data. Para definir una constante se utiliza la directiva **equ**.

```nasm
tamanio equ 5
Servicio equ 80h
mensaje equ 'Hola'
```

### Definición de variables
La declaración de variables en un programa se puede incluir en la sección .data o .bss.
Las variables de la sección .data se definen utilizando las siguientes directivas:
- **db**: Define una variable de tipo byte, 8 bits.
- **dw**: Define una variable de tipo word, 2 bytes = 16 bits.
- **dd**: Define una variable de tipo double word, 2 palabras = 4 bytes = 32 bits.
- **dq**: Define una variable de tipo quad word, 4 palabras = 8 bytes = 64 bits.

**Ejemplo:**
```nasm
section .data
    var1 db 10
    var2 dw 100
    var3 dd 1000
    var4 dq 10000
```

Los valores numéricos se consideran por defecto en decimal, pero también se puede indicar que se trata de un valor decimal finalizando el número con una letra d.
```nasm
	var1 db 42 ; 42 en decimal
	var2 db 42d ; mismo valor
```

Los valores hexadecimales han de empezar por 0x, 0h o $, o deben finalizar con una h.
```nasm
	var1 db 0x2A ; 42 en decimal
	var2 db 2Ah ; mismo valor
```

Los caracteres y las cadenas de caracteres han de escribirse entre comillas simples (''), dobles ("") o comillas abiertas (``):
```nasm
	var1 db 'A' ; 65 en decimal
	var2 db "A" ; mismo valor
	var3 db `A` ; mismo valor
```

Las cadenas de caracteres se definen de la misma manera:
```nasm
	cadena db 'Hola'
	cadena2 db "Hola"
	cadena3 db `Hola`
```
Si la cadena se define entre commillas abiertas (``), también se admiten algunas secuencias de escape iniciadas con: \:
- \n: Salto de línea.
- \t: Tabulador.
- \": Comilla doble.
- \': Comilla simple.
- \\: Barra invertida.
```nasm
	cadena db `Hola\n`
```
**Vectores**
Los vectores se definen con un nombre de variable e indicando los valores que forman el vector:
```nasm
	vector db 1, 2, 3, 4, 5
	vector2 db 'a', 'b', 'c', 'd', 'e'
	vector3 dw 1000, 2000, 3000, 4000, 5000
```

### Definición de otros elementos
- **extern**: Se utiliza para declarar una variable o función que se encuentra definido en otro archivo.
- **global**: Permite hacer visible un símbolo definido en un archivo para otros archivos, de esta manera nos podemos referir a este símbolo desde otro archivo usando la directiva **extern**. Un uso especial para la directiva **global** es para definir el punto de entrada de un programa.

### Tipos de operandos en x86_64
**Operandos fuente y destino**
El operando fuente especifica un valor, un registro o una dirección de memoria
donde hemos de ir para buscar un dato que necesitamos para ejecutar la
instrucción.
El operando destino especifica un registro o una dirección de memoria donde
hemos de guardar el dato que hemos obtenido al ejecutar la instrucción. Por
ejemplo:
```nasm
	push rax ; operando fuente, el valor del registro rax se almacena en el
				;stack.
	pop rax ; operando destino, el valor del stack se almacena en el registro
			; rax.
	inc rax ; la instrucción inc realiza la operación rax = rax + 1.
	mov rax, rbx ; es igual a rax = rbx.
	add rax, 4 ; esta instrucción lleva a cabo la operación rax = rax + 4.
```
### Tipos de instrucciones
1. Instrucciones de transferencia de datos:
	* **mov destino, fuente:** mueve un dato desde un origen a un destino.
	* **push fuente:** mueve el dato de fuente a la cima del stack.
	* **pop destino:** mueve el dato de la cima del stack al destino.
	* **xchg destino, fuente:** intercambia el contenido de los operandos.
2. Instrucciones aritméticas y de comparación:
	* **add destino,fuente:** suma aritmética de los dos operandos.
	* **adc destino, fuente:** suma aritmética considerando el bit de transporte.
	* **sub destino, fuente:** resta de dos operandos.
	* **subb destino, fuente:** resta considerando el bit de transporte.
	* **inc destino:** incrementa el destino en una unidad.
	* **dec destino:** decrementa el destino en una unidad.
	* **mul fuente:** multiplicación entera sin signo.
	* **imul fuente:** multiplicación entera con signo.
	* **div fuente:** división entera sin signo.
	* **idiv fuente:** división entera con signo.
	* **neg destino:** negación aritmética en complemento a 2.
	* **cmp destino, fuente:** compara los dos operandos, hace una resta sin guardar el resultado.
3. Instrucciones lógicas y de desplazamiento:
	* **and destino, fuente:** operación AND lógica.
	* **or destino, fuente:** operación OR lógica.
	* **xor destino, fuente:** operación XOR lógica.
	* **not destino:** negación lógica bit a bit.
	* **sal destino, fuente:** desplazamiento aritmético/lógico a la izquierda.
	* **sar destino, fuente:** desplazamiento aritmético a la derecha.
	* **shr destino, fuente:** desplazamiento lógico a la derecha.
	* **rol destino, fuente:** rotación lógica a la izquierda.
	* **ror destino, fuente:** rotación lógica a la derecha.
	* **jmp etiqueta:** salta a la etiqueta.
	* **loop etiqueta:** decrementa el registro rcx y salta si rcx es diferente de cero.
	* **call etiqueta:** llamada a subrutina.
	* **ret:** retorno de subrutina.
	* **iret:** retorno de rutina (RSI).
	* **int servicio:** llamada al sistema operativo.
## Subrutinas y paso de parámetros:
Una subrutina en ensamblador es equivalente a una función en C.
### Definición de Subrutinas en ensamblador
Una subrutina es un conjunto de instrucciones que inician su ejecución en un
punto de código identificado con una etiqueta y finaliza la ejecución con un
ret. Para llamar a la subrutina se utiliza la instrucción call y se indica la
etiqueta.
```nasm
	call etiqueta
```
```nasm
	;
	; Instrucciones de la subrutina
	;
	ret
```
### Paso de parámetros y retorno de resultados
Para pasar parámetros a una subrutina hay dos formas de hacerlo: mediante
registros o con el stack.
1. Paso de parámetros y retorno por medio de registros
	* Debemos asignar el valor que queramos a un registro antes de hacer call,
	  la subrutina tendrá en el registro escogido el parámetro.
		```nasm
			mov rbx, 5
			call etiqueta ; En rax tendremos el valor 5
		```
	* Para el retorno de una subrutina, hacemos lo mismo, se asigna un registro
	  que utilizaremos para almacenar el valor de retorno.

## Llamadas a subrutinas y paso de parámetros desde C
Para poder utilizar una función escrita en ensamblador desde C, debemos tener presente lo siguiente:
1. La función escrita en ensamblador debe tener la directiva global.
2. Si la función en ensamblador recibe parámetros, habrá que actualizar los registros del stack:
	```nasm
	func1:
		push rbp ; Almacenar el registro rbp en el stack.
		mov rbp, rsp ; Asignar el valor de rsp a rbp.
		;
		;
		mov rsp, rbp ; Restaurar el valor de rsp.
		pop rbp ; Restaurar el valor de rbp.
	```
### Paso de parámetros y retorno de resultados
En 64 bits, los primeros 6 parámetros se pasan en los registros rdi, rsi, rdx, rcx, r8 y r9. Si hay más de 6 parámetros, se pasan por el stack. El valor de retorno se pasa siempre por el registro rax.
Ejemplo:
```nasm
section .text
global suma, producto, factorial

suma:
		; 2 parametros: rdi y rsi sin variables locales
	mov rax, rdi
	add rax, rsi
	ret	; retorno de resultador usando rax

producto:
		; 2 parametros: rdi y rsi sin variables locales
	mov rax, rdi
	imul rax, rsi ; rax = rdi * rsi
	ret	; retorno de resultador usando rax

factorial:
		; 1 parametro: rdi sin variables locales
	push rdi ; rdi es modificada por la subrutina
	mov rax, 1 ; rax tendra el resultado
	while:
		imul rax, rdi
		dec rdi
		cmp rdi, 1 ; se hace la comparación
		jg while ; Si se cumplen las condiciones, se salta a la etiqueta while
			; en rax esta el resultado
	pop rdi ; se restaura el valor de rdi
	ret
```
### LLamada a las funciones desde C
Para utilizar funciones ensamblador dentro de un programa en C, las definimos en el programa pero sin implentarlas, solo se incluye la cabezera de la función. En las declaraciones de las funciones se indica el nombre de la función y los tipos de dato de cada parámetro y el tipo de dato que retorna la función. Se tiene que indicar delante de cada función que es una función externa utilizando la palabra reservada **extern**. Siguiendo el ejemplo anterior, el archivo en C sería:
```c
#include <stdio.h>
extern int suma(int a, int b);
extern int producto(int a, int b);
extern int factorial(int a);

int main(){
	int a = 5, b = 10;
	printf("La suma de %d + %d = %d\n", a, b, suma(a, b));
	printf("El producto de %d * %d = %d\n", a, b, producto(a, b));
	printf("El factorial de %d = %d\n", a, factorial(a));
	return 0;
}
```
