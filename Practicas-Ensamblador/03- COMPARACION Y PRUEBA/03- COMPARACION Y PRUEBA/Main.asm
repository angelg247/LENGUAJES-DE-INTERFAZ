; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs 
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparacion y prueba
; Descripción: Programa que muestra la activacion de las EFLAGS


INCLUDE Irvine32.inc

.code 
;CONDICION 1: ZERO FLAGS
main PROC 
mov EBX , 1
cmp ebx, 1 ;Comparar valores iguales para activar ZF
call dumpRegs 

mov EAX, 01h
cmp EAX, EBX
call dumpRegs

mov cl, 1111111b
cmp cl, cl ; comparar variables iguales para activar ZF
call dumpRegs

; CONDICION 2 : SING FLAG
mov Eax, 0
mov EBX, 0

mov al, -5
mov bl, 1
cmp al, bl ; Resultado negativo activa SF
call dumpRegs

; CONDICION 3 : CARRY FLAG
mov EAX, 0
mov EBX, 0

mov al, 255
add al, 1 ; =256 se activa desbordamiento CF

call dumpRegs

; CASO 4 : OVERFLOW FLAG 
mov EAX,0
mov EBX, 0

mov al, -128
mov bl, 1 ; Desbordamiento con signo activa OF

cmp al, bl
call dumpRegs


; CASO 5 : TEST

mov EAX, 0
mov EAX, 5 ; 00000101b
test EAX, 1
call dumpRegs

mov EAX, 0
mov al, 10000000b
test al, al
call dumpRegs


main ENDP

END main