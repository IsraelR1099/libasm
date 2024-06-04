section	.text
global ft_strcpy

ft_strcpy:
	; Save destination pointer for the return value
	mov rax, rdi	; rdi is the pointer to the destination string char *dest
copy_loop:
	; Load byte from source
	mov al, [rsi]	; [rsi] is the value of the source pointer const char *src
	mov [rdi], al	; Store the byte to the destination
	test al, al	; Check if we reached the end of the string
	jz end_copy	; If we did, jump to the end of the function
	inc rsi		; Move the source pointer to the next character
	inc rdi		; Move the destination pointer to the next character
	jmp copy_loop	; Repeat the loop
end_copy:
	; Return the destination pointer
	ret

