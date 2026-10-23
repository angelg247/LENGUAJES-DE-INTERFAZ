; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13. String y Hexadecimal
; Descripción: Conversion de un valor numerico a una cadena hexadecimal usando la pila


INCLUDE Irvine32.inc

.data
    valor DWORD 12AB34CDh
    bufferHex BYTE 9 DUP(0) 

.code
main PROC
    mov eax, valor
    mov ecx, 8

PushCiclo:
    mov ebx, eax
    and ebx, 0Fh            

  
    cmp bl, 9 ;convertir caracteres a ASCII
    jbe EsNumero
    add bl, 7

EsNumero:
    add bl, '0'

    push ebx                ; Guardar el caracter en la pila 
    shr eax, 4              ; Desplazar 4 bits a la derecha para el siguiente digito
    loop PushCiclo

    lea edi, bufferHex      ; Edi apunta al inicio del buffer 
    mov ecx, 8

PopCiclo:
    pop ebx                 ; Sacar el caracter de la pila
    mov [edi], bl           
    inc edi                 ;incrementar edi a la siguiente posicion
    loop PopCiclo

    mov BYTE PTR [edi], 0

    ;Imprimir resultado en consola
    mov edx, OFFSET bufferHex
    call WriteString
    call Crlf

    exit
main ENDP
END main