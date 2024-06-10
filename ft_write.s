extern __errno_location


section .text
global ft_write

ft_write:
	mov rax, 1	; syscall number
	syscall		; call kernel

	; Check for error
	cmp rax, 0		; check for error
	jge no_error	; no error
	neg rax				; if rax < 0, make it positive (errno is positive)
	mov rdi, rax	; save errno
	call __errno_location	; get errno location
	mov [rax], rdi	; store errno
	mov rax, -1			; return -1
	ret

no_error:
	ret
