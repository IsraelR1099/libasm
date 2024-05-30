section	.text
global ft_strlen

ft_strlen:
	xor rax, rax		; Initialize the length counter to 0 (rax == 0)
	mov	rbx, rdi	; const char *s argument on rbx
	whileLoop:
		cmp BYTE [rbx], 0	; Compare the byte at rbx with null
		je endWhile		; (jump equel) If it's null, we're done
		inc rbx			; Otherwise, move to the next byte
		inc rax			; And increment the counter
		jmp whileLoop		; And repeat the loop

endWhile:
	ret				; Return the length in rax
