section	.text
global ft_strcpy

ft_strcpy:
	; Save destination pointer for the return value
	mov rax, rdi	; rdi is the pointer to the destination string char *dest
copy_loop:
	; Load byte from source
	cmp byte [rsi], 0	; Check if we reached the end of the string
	je end_copy		; If we did, jump to the end of the function
	mov dl, byte [rsi]	; Load the byte from the source string
	mov byte [rdi], dl	; Store the byte in the destination string
	inc rsi		; Move the source pointer to the next character
	inc rdi		; Move the destination pointer to the next character
	jmp copy_loop	; Repeat the loop
end_copy:
	mov byte [rdi], 0	; Null-terminate the destination string
ret

