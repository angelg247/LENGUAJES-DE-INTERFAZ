; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs 
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6. Decremento e incremento
; Descripción: Programa que valida un PIN con 3 intentos, usando la instrucción DEC 
; para bloquear el acceso al llegar a cero

INCLUDE Irvine32.inc

.data
	msgPIN BYTE "Ingrese el PIN: ", 0
	msgIntentos BYTE "Intentos restantes: ", 0
	msgError BYTE "PIN incorrecto.", 0
	msgAcceso BYTE "Acesso permitido.", 0
	msgBloqueo BYTE "Autodestruccion comenzada...", 0

	pinCorrecto = 1234
.code
main PROC
	mov ebx, 3 ; NUMERO DE INTENTOS PARA INGRESAR 

intentar:
	mov edx, OFFSET msgPIN ; Guardar la direccion de la variable 
	call WriteString
	call ReadInt ;leer numero ingresado 

	cmp eax, pinCorrecto ;comparar el valor de entrada con pinCorrecto
	je acceso ; si son iguales salta a acceso

	mov edx, OFFSET msgError 
	call WriteString 
	call crlf

	dec ebx ; Restar 1 al contador ebx

	jz bloqueado ; si llega a cero salta a bloqueo

	mov edx, OFFSET msgIntentos
	call WriteString

	mov eax, ebx
	call WriteDec
	call Crlf

	jmp intentar ; Repetir ciclo para pedir el PIN



acceso:
	mov edx, OFFSET msgAcceso
	call WriteString
	call crlf
	jmp fin

bloqueado: 
	mov edx, OFFSET msgBloqueo
	call WriteString
	call crlf
	jmp fin

fin:
	exit
main ENDP

END main