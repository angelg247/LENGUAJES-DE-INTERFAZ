; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs 
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5. Condicionales
; Descripción: Programa que imprime los numeros del 1 al 100, mediante While(jg) y DoWhile(jle)

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