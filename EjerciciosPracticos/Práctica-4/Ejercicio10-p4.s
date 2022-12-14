; 10) Escribir un programa que cuente la cantidad de veces que un 
;   determinado caracter aparece en una cadena de texto. Observar
;   cómo se almacenan en memoria los códigos ASCII de los caracteres 
;   (código de la letra “a” es 61H). Utilizar la instrucción lbu
;   (load byte unsigned) para cargar códigos en registros. 
;    La inicialización de los datos es la siguiente: .data
;   cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
;   car: .asciiz "d" ; caracter buscado
;   cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.
.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.
.code

daddi r4, r4, 0  ; inicializo en cero
daddi r5, r5, 16 ; inicializo en 16
daddi r1, r0, cadena; copio  la direccion de cadena en r1
ld r2, car(r0) ; caracter a  buscar
ld r3, cant(r0); contador de repeticiones
dadd r4, r1, r0 ; copio la direccion de inicio de la cadena
loop: lbu r6, 0(r4) ; saco de la cadena el primer caracter
daddi r4, r4, 1  ; incremento para obtener el siguiente elemento 
daddi r5, r5, -1 ; decremento la longitud del string
beq r6, r2, suma  ; si son iguales
beqz r5, fin  ; si es cero salta a fin
j loop
suma: daddi r3, r3, 1
beqz r5, fin  ; si es cero salta a fin; tambien se podria preguntar
j loop        ; si el ultimo caracter sacado es cero
nop
fin: halt
; bnez ; si no es cero "0"
; bnqz ; si es cero "0"nbvnvn