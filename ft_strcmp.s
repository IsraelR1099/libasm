section	.text
global ft_strcmp

ft_strcmp:
	xor rax, rax	; clear rax
	xor rbx, rbx	; clear rbx
	compare_loop:
		mov al, byte [rdi]
		mov bl, byte [rsi]
		cmp al, bl	; compare byte of s1 and s2
		jne end_compare	; if not equal, end compare
		cmp al, 0	; if equal, check if null terminator
		je end_compare	; if null terminator, end compare
		inc rdi		; increment s1
		inc rsi		; increment s2
		jmp compare_loop	; loop back to compare
end_compare:
	sub rax, rbx	; subtract s1 from s2
	ret
