;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

INCLUDE Irvine32.inc

.code
main PROC

 ; 0 - Encendido
 ; 1 - Alarma
 ; 2 - Conectado
 ; Estado Inicial: 00000101b


 ; 1 - AND : EXTRAER EL ESTADO DE ENCENDIDO
 mov eax, 0
 mov ebx, 0
 mov al, 00000101b
 mov bl, al
 and bl, 00000111b     

 call dumpRegs
 nop

 ; 2 - OR: ENCENDER LA ALARMA
 mov al, 00000101b
 or al, 00000010b      ; Activa el bit 1 = Alarma

 call dumpRegs
 nop

 ; 3 - XOR: DESCONECTAR Y CONECTAR COMPUTADOR
 mov al, 00000101b
 xor al, 00000100b     ; Invierte el estado del bit 2 = Conectado
 call dumpRegs
 nop

 ; 4 - NOT: DEVOLVER ESTADOS
 mov al, 00000101b
 not al                ; Niega  los bits invierte el estado de cada indicador
 call dumpRegs
 nop

 ; 5 - TEST: EVALUAR ALARMA Y REALIZAR SALTO
 mov al, 00000101b     
 test al, 00000010b    
 jz alarma_apagada     ; Si el resultado es cero , la alarma esta apagada

 mov ebx, 1
 jmp continuar_test

 alarma_apagada:
 mov ebx, 0            ; la alarma no está activa

 continuar_test:
 call dumpRegs         ; Mostrar resultado en los registros

exit
main ENDP

END main