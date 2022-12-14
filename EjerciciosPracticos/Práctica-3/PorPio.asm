PA EQU 30H ; ESTADO DE LAS LLAVES
PB EQU 31H ; DATOS  DE LAS LUCES
CA EQU 32H
CB EQU 33H

org 1000h
MENSAJE DB "ADRIAN EL CAPO "
FIN     DB ?

org 2000h
 ;-----------------------------------------
 ;1) CONFIGURACION DEL PIO
 MOV AL, 11111101B  ;CONFIGURAMOS PA A APRTIR DE CA 
 OUT CA, AL ; EL STROBE EN 0 "SALIDA" EL BUSY EN 1 "ENTRADA"
 
 MOV AL, 0 ; TODOS DE SALIDA
 OUT CB, AL
 ; FIN DE LA CONFIGURACION DEL PIO
 ; LA CONFIGURACION DE IMPRESION CON PIO VA A SER SIEMPRE IGUAL
 ;------------------------------------------
 
 ;------------------------------------------------
 ;2)RECORREMOS EL STRING
 MOV BX, OFFSET MENSAJE
 POLL: IN AL, PA
       AND AL, 00000001B
       JNZ POLL ; MIENTRAS NO ESTE LIBRE SIGO CONSULTANDO
      
       ; LA IMPRESORA ESTA LIBRE ENTONCES
       MOV AL, [BX]
       OUT PB, AL  ; 
     
       ; MANDO EL STROBE EN 1    
       IN AL, PA  ; TOMAMOS EL ESTADO
       OR AL, 00000010B   ; FUERZO EL STROB A UNO
       OUT PA, AL ; LOMANDAMOS AL PUERTO
 
       ; MANDO EL STROBE EN 0
       IN AL, PA  ; TOMAMOS EL ESTADO
       AND  AL, 11111101B   ; FUERZO EL STROB A CERO FD = 1111 1101
       OUT PA, AL ; LOMANDAMOS AL PUERTO
       
       INC BX
       CMP BX, OFFSET FIN ; SINO TERMINO SIGO
       JNZ POLL
       INT 0
end