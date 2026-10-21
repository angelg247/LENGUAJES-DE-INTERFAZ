;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

INCLUDE Irvine32.inc

.data
mensaje BYTE "Escribe tu nombre:", 0
nombre BYTE 15 DUP(0)

.code
main PROC
	; 1. Mostrar mensaje de petición
	mov edx, OFFSET mensaje
	call WriteString

	; 2. Leer el nombre del usuario
	mov edx, OFFSET nombre ; copia la dirrecion de nombre a edx
	mov ecx, SIZEOF nombre  ; carga en edx 15 bytes
	call ReadString ;Lee la entrada del usuario 
	call Crlf

	; 3. Mostrar el nombre capturado
	mov edx, OFFSET nombre ;copia nuevamente la dirrecion de nombre a edx
	call WriteString  ;Imprime el texto capturado   
	call Crlf

	exit
main ENDP

END main