	.intel_syntax noprefix

	.section .text

	.global OR_FRAG

OR_FRAG:
	#update rax with or of rax and value at address in rbx
	or rax, QWORD PTR [rbx]
	#increment rbx by 8
	add rbx, 8
	#return to calc.s loop
	ret
