ORG 1000H
NUM1 DW 5H
NUM2 DW 3H
	
org 3000H	
	MULT: MOV BX, SP  ; guardo elpuntero a pila
	      ADD BX, 2   ; LE SUMO 2 A BX PARA APUNTAR LA DIR DE PILA DE NUM2
	      MOV AX, [BX]; GUARDO EN AX LA DIRECCIÓN DE NUM2
	      MOV DX, BX  ; HAGO UN BACKAP DE BX DIR DE PILA + 2
	      MOV BX, AX  ; GUARDO EN BX "PUNTERO"LA DIRECCION DE NUM2
	      MOV AX, [BX]; MUEVO A AX LO QUE APUNTA BX NUM2
	      MOV BX, DX  ; RECUPERO EL PUNTERO A SP + 2
	      ADD BX, 2   ; PARA APUNTAR A NUM1
	      MOV DX, [BX]; GUARDO EN DX LA DIR DE NIM1
	      MOV BX, DX  ; GUARDO LA DIR DE NUM1 EN BX
	      MOV DX, [BX];GUARDO EN AX NUM1
	      MOV CX, 0
	 LOOP:ADD CX, DX
	      DEC AX
	      JNZ LOOP
	      RET
	     
ORG 2000H
 MOV  AX, OFFSET NUM1
 PUSH AX
 MOV AX, OFFSET NUM2
 PUSH AX
 CALL MULT
 POP AX
 POP AX
 HLT
END