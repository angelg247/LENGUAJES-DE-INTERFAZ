; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 9. Push y pop
; Descripción: Uso de una pila mediante push y pop, y manejo de esta mediante call y ret

INCLUDE Irvine32.inc

.code
main PROC
	; BLOQUE 1: PUSH Y POP

	mov eax, 500

	push eax; guardar valor de eax en la pila
	nop

	mov ebx, 0

	pop ebx; extrae el valor y guarda en ebx
	
	nop

	; BLOQUE 2: ORDEN LIFO 

	mov eax, 10
	push eax 

	mov eax,20
	push eax

	nop

	mov eax,30
	push eax

	pop eax ;saca el ultimo valor eax =30
	pop ebx ;ebx = 20
	pop ecx ; ecx = 10

	nop

	; BLOQUE 3: CONSERVAR REGISTROS

	mov eax,100
	mov ebx, 200

	push eax
	push ebx

	mov eax, 999
	mov ebx, 888

	pop ebx ; Restaura ebx a 200
	pop eax ; restaura eax a 100

	; BLOQUE 4: CALL Y RET
	
	mov eax,50
	mov ebx, 666

	call aumentarDiez ;salta a AumentarDiez y guarda la direccion de la pila

	nop

	exit
aumentarDiez PROC
	nop
	push ebx

	nop

	mov ebx, 10
	add eax, ebx

	nop

	pop ebx

	nop

	ret ;retorna al flujo principal con la direccion de la pila


aumentarDiez ENDP
main ENDP

END main