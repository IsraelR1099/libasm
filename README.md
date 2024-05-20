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
1. Instrucciones de transferencia de datos.
⋅⋅* mov destino, fuente: mueve un dato desde un origen a un destino.
⋅⋅* push fuente: mueve el dato de fuente a la cima del stack.
⋅⋅* pop destino: mueve el dato de la cima del stack al destino.
⋅⋅* xchg destino, fuente: intercambia el contenido de los operandos.
