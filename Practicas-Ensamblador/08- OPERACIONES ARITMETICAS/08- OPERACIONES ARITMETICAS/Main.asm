;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

INCLUDE Irvine32.inc

.code
main PROC
	;1. OPERACIONES: ADD Y SUB

	mov eax, 50 
	mov ebx, 20

	add eax, ebx ; subar registros eax y ebx =70
	sub eax, 15 ; restar 15 a eax =50

	nop

	; 2. CF: ACARREO EN UNA SUMA SIN SIGNO

	mov eax, 0
	mov al, 255
	add al, 1 ; supera la capacidad se activa CF

	nop

	; 3. OF: CONDICION DE DESBORDAMIENTO CON SIGNO

	mov eax, 0
	mov al, 127
	add al,1 ;supera el limite con signo activa OF

	nop

	; 4. MUL: MULTIPLICACION DE VALORES DENTRO DE 32 BITS

	mov eax, 25
	mov ebx, 3

	mul ebx ; multiplicacion 25 * 3=75

	nop

	; 5. MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS

	mov eax, 65537
	mov ebx, 65537

	mul ebx; multpliacion de dos de 32 bits

	; 6. IMUL: MULTIPLICACION CON SIGNO

	mov eax, -5

	imul eax , eax, 3

	nop
	
	; 7. DIV: DIVIDIENDO SIN SIGNO

	mov eax, 125
	mov edx, 0
	mov ebx, 12

	div ebx

	; 8. IDIV: DIVISION CON SIGNO

	mov eax, -125

	cdq

	mov ebx, 12

	idiv ebx

main ENDP

END main