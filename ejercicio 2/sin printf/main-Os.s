	.file	"main.c"
	.text
	.globl	producto
	.type	producto, @function
producto:
.LFB0:
	.cfi_startproc
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rdi)
	ret
	.cfi_endproc
.LFE0:
	.size	producto, .-producto
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Tiempo necesario: %lf\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	movl	$inicio, %edi
	call	gettimeofday
	xorl	%esi, %esi
	movl	$final, %edi
	call	gettimeofday
	movq	final+8(%rip), %rax
	subq	inicio+8(%rip), %rax
	movl	$.LC1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	final(%rip), %rax
	subq	inicio(%rip), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	call	printf
	xorl	%eax, %eax
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.comm	tiempo,8,8
	.comm	final,16,16
	.comm	inicio,16,16
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
