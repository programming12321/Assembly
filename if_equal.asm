section .data
    x dq ### NUMBER ###

    mensaje db "x is ### NUMBER ###", 10
    mensaje_len equ $ - mensaje

section .text
    global _start

_start:
    ; if x == ### NUMBER ###
    mov rax, [x]
    cmp rax, 10
    jne .fin

    ; print("x is ### NUMBER ###")
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje
    mov rdx, mensaje_len
    syscall

.fin:
    ; exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall
