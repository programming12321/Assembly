section .data
    x db ### STRING ###, 10
    xLen equ $ - x

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, x
    mov rdx, xLen
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
