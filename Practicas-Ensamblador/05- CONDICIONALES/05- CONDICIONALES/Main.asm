;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

INCLUDE Irvine32.inc

.code
main PROC

; WHILE
    mov ebx, 1 ;iniciar contador 

cicloWhile:
    cmp ebx, 100 ; comparar contador con 100

    jg fin ; si es mayor a 100 salir del ciclo 

    mov eax, ebx ; guardar numero 
    call WriteDec ; imprimir numero
    call Crlf 

    inc ebx ;incrementa contador
    jmp cicloWhile ;regresa a la condicion 

fin:
    call Crlf 

    mov ebx, 1 

cicloDoWhile:

    mov eax, ebx ; guardar numero
    call WriteDec ; imprimir numero
    call Crlf 

    inc ebx ; incrementa el contador 
    cmp ebx, 100 ;Comparar con el limite

    jle cicloDoWhile ; si ebx es <=100 repite el ciclo

    exit 
main ENDP

END main