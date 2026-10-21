;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: GRANDE ESPINOZA JOSE ANGEL
;HORARIO: 8:00 - 9:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ

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