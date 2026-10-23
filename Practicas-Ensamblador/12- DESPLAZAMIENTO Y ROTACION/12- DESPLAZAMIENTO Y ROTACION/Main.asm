; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 12. Desplazamiento y rotacion
; Descripción: Programa que muestra el desplazamiento y rotacion de bits 

INCLUDE Irvine32.inc


.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA 
	mov al, 00100000b   
	shl al, 1           ; Desplaza todos los bits un lugar a la izquierda

	call WriteBin       ; Muestra el valor en binario en consola
	call DumpRegs       
	

	; 2 - SHR : DESPLAZAR UNA POSICION A LA DERECHA 
	mov al, 00001101b
	shr al, 1           ; Desplaza un bit a la derecha

	call WriteBin
	call DumpRegs

	; 3 - SAR : CONSERVAR EL SIGNO
	mov al, -8
	sar al, 1           ; Desplaza a la derecha manteniene el bit mas significativo

	call WriteBin
	call DumpRegs
	
	; 4 - SAR : CON OPERACIONES NO EXACTAS 
	mov al, -9
	sar al, 1           

	call WriteBin
	call DumpRegs
	
	; 5 - CONTEO DESPLAZAR 2 BITS: HACIA LA IZQUIERDA
	mov al, 00001111b
	shl al, 2           ; Desplaza 2 posiciones

	call WriteBin
	call DumpRegs

	; 6 - DESPLAZAR 2 BITS HACIA LA DERECHA UTILIZANDO CL
	mov al, 00001111b
	mov cl, 2          
	shr al, cl          ; desplaza los bits de AL segun el valor de CL

	call WriteBin
	call DumpRegs

	; 7 - ROR, ROL, RCL, RCR 
	mov al, 10000001b
	rol al, 1           ; Rota los bits a la izquierda; el que sale por la izquierda entra por la derecha
	
	call WriteBin
	call DumpRegs

	exit

main ENDP

END main