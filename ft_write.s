extern __errno_location


section .text
global ft_write

ft_write:
	mov rax, 1	; syscall number
	mov rdi, rdi	; file descriptor
	mov rsi, rsi	; buffer
	mov rdx, rdx	; buffer size
	syscall		; call kernel

	; Check for error
	cmp rax, 0	; check for error
	jge no_error	; no error
	;	neg rax		; if rax < 0, make it positive (errno is positive)
	; mov rcx, rax	; save errno
	push rax
	call __errno_location	; get errno location
	pop QWORD [rax]
	; mov [rax], rcx	; store errno
	mov rax, -1	; return -1
	ret		; return

no_error:
	ret		; return
