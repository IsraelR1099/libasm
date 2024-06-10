extern __errno_location

section .text
global ft_read

ft_read:
	mov rax, 0		; syscall number
	syscall

	; Check for error
	cmp rax, 0		; check for an error
	jge no_error	; no error
	neg rax				; if rax < 0, make it positive (errno is positive)
	mov rdi, rax
	call __errno_location	; get errno address
	mov [rax], rdi				; store errno
	mov rax, -1						; return -1
	ret

no_error:
	ret
