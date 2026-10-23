; Materia: Lenguajes de Interfaz
; Alumno: José Ángel Grande Espinoza
; Horario: 8:00 - 9:00 hrs
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 7. Validacion de formato
; Descripción: validacion de que una cadena ingresada cumpla con el formato exacto de tres letras mayusculas, un guion y tres digitos

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa el codigo : ", 0
    msg_valido BYTE "Formato valido. La cadena cumple todas las reglas.", 13, 10, 0

    ; Mensajes de error específicos para cada validación
    err_longitud BYTE "Formato invalido: La longitud no es igual a 7.", 13, 10, 0
    err_letras   BYTE "Formato invalido: Las posiciones 0-2 no son letras mayusculas (A-Z).", 13, 10, 0
    err_guion    BYTE "Formato invalido: Falta el separador '-' en la posicion 3.", 13, 10, 0
    err_digitos  BYTE "Formato invalido: Las posiciones 4-6 no son digitos (0-9).", 13, 10, 0

    buffer BYTE 20 DUP(0)
    bytesLeidos DWORD ?

.code
main PROC
    ; Leer la cadena del usuario
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString
    mov bytesLeidos, eax    ; Guarda la cantidad de caracteres leídos

    ; PASO 1: Validar Longitud
    cmp eax, 7
    jne error_longitud      ; Si la longitud no es 7, salta a error
    mov esi, OFFSET buffer  ; Apunta al inicio de la cadena para recorrerla

    ; PASO 2: Validar Letras 
    mov ecx, 3
validar_letras:
    mov al, [esi]
    cmp al, 'A'
    jb error_letras         ; Menor que A
    cmp al, 'Z'
    ja error_letras         ; Mayor que Z 
    inc esi
    loop validar_letras

    ; PASO 3: Validar Separador - 
    mov al, [esi]
    cmp al, '-'
    jne error_guion         ; Si el carácter no es un guion, salta al error
    inc esi

    ; PASO 4: Validar Dígitos 
    mov ecx, 3
validar_digitos:
    mov al, [esi]
    cmp al, '0'
    jb error_digitos        ; Menor que 0 
    cmp al, '9'
    ja error_digitos        ; Mayor que 9
    inc esi
    loop validar_digitos

    ;cumple con todo
    mov edx, OFFSET msg_valido
    call WriteString
    jmp fin

    ; BLOQUE DE ERRORES
error_longitud:
    mov edx, OFFSET err_longitud
    call WriteString
    jmp fin

error_letras:
    mov edx, OFFSET err_letras
    call WriteString
    jmp fin

error_guion:
    mov edx, OFFSET err_guion
    call WriteString
    jmp fin

error_digitos:
    mov edx, OFFSET err_digitos
    call WriteString

fin:
    exit
main ENDP
END main