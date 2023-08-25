	.intel_syntax noprefix


	.section .data
length:
	.quad 0

	.section .text
	.global UPPER_FRAG
UPPER_FRAG:
	xor r10, r10
	xor rdi, rdi
	#move string value into register
	mov rdi, QWORD PTR [rbx]

loop_start:	
	#move byte value to dl
	mov dl, BYTE PTR [rdi+r10*1]
	#check if value is zero
	cmp dl, 0
	je is_done
	#check to see if value is lower case by checking if greater than 0x61
	cmp dl, 0x61
	#jump to lower case condition
	JGE is_lower
	#if it is not lowercase increment length count and restart loop
	inc r10
	jmp loop_start

	
is_lower:
	#check to see if value is a letter
	cmp dl, 0x7a
	JG not_letter
	#if it is a letter, subtract 20 to change to cooresponding upper case value
	sub dl, 0x20
	#move uppercase value into that location
	mov BYTE PTR [rdi+r10*1], dl
	#increment rbx to next value and return to top of the loop
	jmp loop_start
	
not_letter:
	jmp loop_start

is_done:
	add rax, r10
	add rbx, 8
	ret
