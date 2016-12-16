	.file	"main.c"
	.text
	.globl	producto
	.type	producto, @function
producto:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	producto, .-producto
	.comm	inicio,16,16
	.comm	final,16,16
	.comm	tiempo,8,8
	.section	.rodata
.LC3:
	.string	"Bla: %f"
.LC5:
	.string	"\nTiempo necesario: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4320048, %rsp
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	movl	$0, -12(%rbp)
	jmp	.L4
.L5:
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-12(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm2
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	%xmm0, -1440016(%rbp,%rax,4)
	movl	-8(%rbp), %eax
	subl	-12(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sd	-12(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm2
	addsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	%xmm0, -2880016(%rbp,%rax,4)
	addl	$1, -12(%rbp)
.L4:
	cmpl	$599, -12(%rbp)
	jle	.L5
	addl	$1, -8(%rbp)
.L3:
	cmpl	$599, -8(%rbp)
	jle	.L6
	movl	$0, %esi
	movl	$inicio, %edi
	call	gettimeofday
	movl	$0, -8(%rbp)
	jmp	.L7
.L12:
	movl	$0, -12(%rbp)
	jmp	.L8
.L11:
	pxor	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L9
.L10:
	movl	-12(%rbp), %eax
	cltq
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-2880016(%rbp,%rax,4), %xmm0
	movl	-16(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movl	-1440016(%rbp,%rax,4), %eax
	leaq	-4320020(%rbp), %rdx
	movq	%rdx, %rdi
	movaps	%xmm0, %xmm1
	movl	%eax, -4320040(%rbp)
	movss	-4320040(%rbp), %xmm0
	call	producto
	movss	-4320020(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	addl	$1, -16(%rbp)
.L9:
	cmpl	$599, -16(%rbp)
	jle	.L10
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-4(%rbp), %xmm0
	movss	%xmm0, -4320016(%rbp,%rax,4)
	addl	$1, -12(%rbp)
.L8:
	cmpl	$599, -12(%rbp)
	jle	.L11
	addl	$1, -8(%rbp)
.L7:
	cmpl	$599, -8(%rbp)
	jle	.L12
	movl	$0, %esi
	movl	$final, %edi
	call	gettimeofday
	movl	$0, -8(%rbp)
	jmp	.L13
.L16:
	movl	$0, -12(%rbp)
	jmp	.L14
.L15:
	movl	-12(%rbp), %eax
	cltq
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$600, %rdx, %rdx
	addq	%rdx, %rax
	movss	-4320016(%rbp,%rax,4), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -12(%rbp)
.L14:
	cmpl	$599, -12(%rbp)
	jle	.L15
	addl	$1, -8(%rbp)
.L13:
	cmpl	$599, -8(%rbp)
	jle	.L16
	movq	final(%rip), %rdx
	movq	inicio(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	final+8(%rip), %rdx
	movq	inicio+8(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	movq	tiempo(%rip), %rax
	movq	%rax, -4320040(%rbp)
	movsd	-4320040(%rbp), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	2576980378
	.long	1072798105
	.align 8
.LC1:
	.long	3435973837
	.long	1073794252
	.align 8
.LC4:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
