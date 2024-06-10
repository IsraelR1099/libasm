extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section	.text
global ft_strdup

ft_strdup:
	call ft_strlen
	push rdi
	inc	rax
	mov rdi, rax
	call malloc
	cmp rax, 0
	jz	error
	mov	rdi, rax
	pop rsi
	call ft_strcpy
	ret

error:
	neg	rax
	mov rdi, rax
	call __errno_location
	mov [rax], rdi
	mov rax, -1
	ret
