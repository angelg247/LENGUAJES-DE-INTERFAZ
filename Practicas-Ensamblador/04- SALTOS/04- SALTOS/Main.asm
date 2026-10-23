; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs 
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4. saltos
; Descripción: Programa que muestra el uso de jmp para omitir parte del codigo

INCLUDE Irvine32.inc
.code
main PROC
    mov eax, 5

    jmp continuar ; salta a continuar directamente
    mov eax, 10 

    continuar: 
    call DumpRegs                ;desplega los registros en consola

    exit 
main ENDP

END main