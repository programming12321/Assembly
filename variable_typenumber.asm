section .data
    x dq ### number ###

section .bss
    buffer resb 32

section .text
    global _start

_start:
    mov rax, [x]
    call print_int

    mov rax, 60
    xor rdi, rdi
    syscall


print_int:
    lea rsi, [buffer + 31]
    mov byte [rsi], 10
    dec rsi

    mov rbx, 10

.convert:
    xor rdx, rdx
    div rbx
    add dl, '0'
    mov [rsi], dl
    dec rsi

    test rax, rax
    jnz .convert

    inc rsi

    ; write(1, buffer, length)
    mov rdx, buffer + 31
    sub rdx, rsi

    mov rax, 1
    mov rdi, 1
    syscall

    ret
