;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

INCLUDE Irvine32.inc


.data
tmArchivo DWORD 100000 
NumBloques DWORD 125
tmBloque DWORD 512
tmGrupo DWORD 1024

bytesDescargados DWORD ?   
bytesPendientes DWORD ?
porcentaje DWORD ?
residuo DWORD ?
grupos DWORD ?

msgDescargados BYTE "Bytes descargados: ", 0
msgPendientes BYTE "Bytes pendientes: ", 0
msgPorcentaje BYTE "Porcentaje de avance: ", 0
msgGrupos BYTE "Grupos completos de 1024 bytes: ", 0
msgResiduo BYTE "Residuo: ", 0
msgPorcentajeFinal BYTE "%", 0
buffer BYTE 11 DUP(0)

.code
main PROC
    ; Calcula los bytes descargados multiplicando bloques por su tamaño
    mov eax, NumBloques
    mul tmBloque       
    mov bytesDescargados, eax

    mov eax, tmArchivo
    sub eax, bytesDescargados
    mov bytesPendientes, eax

    ; calcula el porcentaje multiplicando por 100 y dividiendo entre el total
    mov eax, bytesDescargados
    mov ebx, 100
    mul ebx             ; EDX:EAX = bytesDescargados * 100
    div tmArchivo       ; Cociente en EAX (porcentaje)
    mov porcentaje, eax

    xor edx, edx
    mov eax, bytesDescargados
    div tmGrupo         
    mov grupos, eax
    mov residuo, edx

    ; imprime los bytes descargados
    mov edx, OFFSET msgDescargados
    call WriteString
    mov eax, bytesDescargados
    mov esi, OFFSET buffer
    call convertirDecimal ; Convierte el valor numerico a cadena ASCII
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; Imprime los bytes pendientes
    mov edx, OFFSET msgPendientes
    call WriteString
    mov eax, bytesPendientes
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; Imprime el porcentaje de avance
    mov edx, OFFSET msgPorcentaje
    call WriteString
    mov eax, porcentaje
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    mov edx, OFFSET msgPorcentajeFinal
    call WriteString
    call Crlf

    ; Imprime el número de grupos completos
    mov edx, OFFSET msgGrupos
    call WriteString
    mov eax, grupos
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; Imprime el residuo
    mov edx, OFFSET msgResiduo
    call WriteString
    mov eax, residuo
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP

convertirDecimal PROC USES ebx ecx edx edi
    mov edi, esi        ; Copia la direccion del buffer a EDI 
    mov ebx, 10        
    xor ecx, ecx        ; Inicializa el contador 0
    cmp eax, 0
    jne dividirNumero

    mov BYTE PTR [edi], '0' ; Si el numero es 0, escribe 0 directamente
    inc edi
    jmp terminarCadena

dividirNumero:
    xor edx, edx
    div ebx             ; Divide EAX entre 10; residuo en EDX, cociente en EAX
    push edx            ; Guarda el digito en la pila 
    inc ecx             ; Incrementa el contador de digitos
    test eax, eax
    jnz dividirNumero   ; Repite hasta que el cociente sea 0

escribirDigitos:
    pop edx             ; Extrae el digito de la pila
    add dl, '0'         ; Convierte el valor numerico a su caracter en ASCII 
    mov BYTE PTR [edi], dl 
    inc edi
    loop escribirDigitos

terminarCadena:
    mov BYTE PTR [edi], 0 
    ret
convertirDecimal ENDP

END main