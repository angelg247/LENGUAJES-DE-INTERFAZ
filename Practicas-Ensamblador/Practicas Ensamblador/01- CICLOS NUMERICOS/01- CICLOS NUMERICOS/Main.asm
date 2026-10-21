;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

INCLUDE Irvine32.inc

.data
mensaje BYTE "HOLA, MUNDO!", 0

.code
main PROC
	mov ecx, 5 ; inicializa ecx en 5 que sera el valor del contador
	jecxz fin_ciclo ;cuando ecx sea igual 0 salta a fin de ciclo
	
ciclo:
	mov edx, OFFSET mensaje 
	call WriteString   ; Imprimir      
	call Crlf

	loop ciclo 

fin_ciclo:

	exit
main ENDP

END main