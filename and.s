	.intel_syntax noprefix

	.section .text

	.global AND_FRAG

AND_FRAG:
	#update rax with and of rax and value at the address in rbx
	and rax, QWORD PTR [rbx]
	#increment rbx by 8
	add rbx, 8
	ret
