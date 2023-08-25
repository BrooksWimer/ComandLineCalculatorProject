	.intel_syntax noprefix

	.section .text
	.global ARRAYSUM_FRAG
ARRAYSUM_FRAG:
	xor rdi, rdi
	xor rax, rax
	xor r8, r8
	#get length of array
	mov rcx, QWORD PTR[rbx]
	#save name of array
	mov rsi, QWORD PTR[rbx+8]
	
loop_start:
	#if array fully iterated through then exit
	cmp rcx, rdi
	JE done
	#save value of array
	mov r8, QWORD PTR[rsi+rdi*8]
	#send address of value to rbx
	mov QWORD PTR[rbx], r8
	call SUM_FRAG
	inc rdi
	sub rbx, 8
	jmp loop_start
done:
	#set rbx to zero
	mov QWORD PTR[rbx], rcx
	add rbx, 16
	ret
	
