; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6.1. Control de ocupacion de un estacionamiento
; Descripción: Simulacion del control de un estacionamiento con una capacidad de 20 autos

INCLUDE Irvine32.inc

.data
    msgEntrada BYTE "Ingrese cantidad de autos ",0
    msgOcupados BYTE "Espacios ocupados ",0
    msgDisponibles BYTE "Espacios disponibles ",0
    msgLleno BYTE "Estacionamiento lleno",0
    msgExceso BYTE "No hay suficientes espacios disponibles",0
    msgInvalido BYTE "Cantidad invalida",0

    capacidad = 20
    ocupados DWORD 0

.code

main PROC

ingresar:

    mov edx, OFFSET msgEntrada
    call WriteString

    call ReadInt

    cmp eax, 0
    jle invalido; si la entrada es menor o igual a 0 salta a invalido

    mov ebx, eax ; guardar la cantidad ingresada

    mov eax, ocupados
    add eax, ebx; suma autos actuales con ingresados

    cmp eax, capacidad; comparar total con la capacidad
    jg exceso; si supera el limite salta a exceso

    mov ocupados, eax ;actualizar los espacios ocupados

    mov edx, OFFSET msgOcupados
    call WriteString

    mov eax, ocupados
    call WriteDec
    call Crlf

    mov eax, ocupados
    cmp eax, capacidad ;comparar la cantidad de ocupados con la capacidad
    je lleno ; si esta lleno termina

    mov edx, OFFSET msgDisponibles
    call WriteString

    mov eax, capacidad
    sub eax, ocupados
    call WriteDec
    call Crlf
    call Crlf

    jmp ingresar


exceso:

    mov edx, OFFSET msgExceso
    call WriteString
    call Crlf
    call Crlf

    jmp ingresar


invalido:

    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf
    call Crlf

    jmp ingresar


lleno:

    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf


fin:

    exit

main ENDP

END main