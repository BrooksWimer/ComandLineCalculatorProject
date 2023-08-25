        .intel_syntax noprefix

	.section .data
        .global SUM_NEGATIVE
SUM_NEGATIVE:
	.quad 0

	.section .data
	.global SUM_POSITIVE
SUM_POSITIVE:
	.quad 0
	
	.section .data
RAX_VAL:
	.quad 0
	
	.section .data
MEM_VAL:
	.quad 0

	.section .text
	.global _start
_start:
	# zero out rax
	xor  rax, rax
	xor rdi, rdi
	xor rsi, rsi
	xor rdx, rdx
	#setup rbx to point to the start of the commands
	mov rbx, OFFSET[CALC_DATA_BEGIN]
	#starting the loop
loop_start:
	#check if first byte of current command is zero - if it is then exit loop and program
	cmp QWORD PTR[rbx], 0
	#jump flag that jumps if the first byte of the command is zero
	JE IS_ZERO
	#check if and command character is the current value in rbx
	cmp QWORD PTR[rbx], 38 
	#jump to is_and if equal to cooresponding and character
	JE IS_AND
	#check if or command character is the current value in rbx
	cmp QWORD PTR[rbx], 124
	#jump to is_or if equal to cooresponding or character
	JE IS_OR
	#check if sum command character is the current value in rbx
	cmp QWORD PTR[rbx], 83
	#jump to is_sum if equal to cooresponding sum character
	JE IS_SUM
	#check if upper command character is current value in rbx
	cmp QWORD PTR[rbx], 85
	JE IS_UPPER
	#check if summ array command character is current value in rbx
	cmp QWORD PTR[rbx], 'a'
	JE IS_ARRAYSUM


	#if the value is zero exit loop and program
IS_ZERO:
	#save value in rax
	add QWORD PTR[RAX_VAL], rax
	#rax = system call number of write
	mov rax, 1
	#rdi = file descriptor number of standard
	mov rdi, 1
	#memory address of rax value
	mov rsi, OFFSET[RAX_VAL]
	#number of bytes to be written
	mov rdx, 8

	syscall
	
	#rax = system call number of write
	mov rax, 1
	#rdi = file descriptor number of standard
	mov rdi, 1
	#memory address of sum_positive value
	mov rsi, OFFSET SUM_POSITIVE
	#number of bytes to be written
	mov rdx, 8

	syscall
	
	#rax = system call number of write
	mov rax, 1
	#rdi = file descriptor number of standard
	mov rdi, 1
	#memory address of SUM_NEGATIVE value
	mov rsi, OFFSET SUM_NEGATIVE
	#number of bytes to be written
	mov rdx, 8

	syscall
	
	#save address of CALC_DATA_BEGIN
	mov r9, OFFSET CALC_DATA_END
	#subtract address of calc_data_end from calc_data_begin
	mov r8, OFFSET CALC_DATA_BEGIN
	#save value in variable
	sub r9, r8
	#rax = system call number of write
	mov rax, 1
	#rdi = file descriptor number of standard
	mov rdi, 1
	#memory address of memory space value
	mov rsi, OFFSET CALC_DATA_BEGIN
	#number of bytes to be written
	mov rdx, r9

	syscall

	mov rax, 60
	mov rdi, 0
	syscall
	
	#if the value is 38 call AND_FRAG
IS_AND:
	#advance rbx to point at command argument
	add rbx, 8
	#call and function
	call AND_FRAG
	#return to top of loop
	jmp loop_start

	#if the value is 83 call SUM_FRAG
IS_SUM:
	#advance rbx to point at command argument
	add rbx, 8
	#call sum function
	call SUM_FRAG
	#return to top of loop
	jmp loop_start

	#if the value is 124 call OR_FRAG
IS_OR:
	#advance rbx to point at command argument
	add rbx, 8
	#call or function
	call OR_FRAG
	#return to top of loop
	jmp loop_start

IS_UPPER:
	add rbx, 8
	call UPPER_FRAG
	jmp loop_start

IS_ARRAYSUM:
	add rbx, 8
	call ARRAYSUM_FRAG
	jmp loop_start
