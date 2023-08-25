	.intel_syntax noprefix

	.section .text
	.global SUM_FRAG
SUM_FRAG:
	#update rax with addition of value at address in rbx and value in rax
	add rax, QWORD PTR [rbx]
	#move address in rbx to rdx
	mov rdx, QWORD PTR [rbx]
	#compare value at address in rbx to zero
	cmp QWORD PTR [rbx], 0
	#if value is negative jump to IS_NEG condition
	jl IS_NEG
	#if value is not neg add value to sum_positive
	add QWORD PTR [SUM_POSITIVE], rdx
	jmp IS_DONE
IS_NEG:
	#if value is negative add value to sum_negative
	add QWORD PTR [SUM_NEGATIVE], rdx
	JMP IS_DONE

IS_DONE:
	#increment rbx by 8
	add rbx, 8
	#return to calc.s loop
	ret
