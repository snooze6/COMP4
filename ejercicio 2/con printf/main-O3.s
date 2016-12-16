	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	producto
	.type	producto, @function
producto:
.LFB11:
	.cfi_startproc
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rdi)
	ret
	.cfi_endproc
.LFE11:
	.size	producto, .-producto
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Bla: %f"
.LC6:
	.string	"\nTiempo necesario: %lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$4320016, %rsp
	.cfi_def_cfa_offset 4320048
	leaq	16(%rsp), %rbp
	leaq	1440016(%rsp), %rsi
	movdqa	.LC1(%rip), %xmm5
	movq	%rbp, %rcx
	movapd	.LC2(%rip), %xmm3
	movapd	.LC3(%rip), %xmm2
	movdqa	.LC0(%rip), %xmm6
.L3:
	movl	%edx, 12(%rsp)
	movdqa	%xmm6, %xmm1
	movd	12(%rsp), %xmm4
	xorl	%eax, %eax
	pshufd	$0, %xmm4, %xmm4
	.p2align 4,,10
	.p2align 3
.L4:
	cvtdq2pd	%xmm1, %xmm9
	movapd	%xmm9, %xmm10
	pshufd	$238, %xmm1, %xmm8
	movdqa	%xmm4, %xmm0
	addpd	%xmm3, %xmm10
	paddd	%xmm1, %xmm0
	cvtdq2pd	%xmm8, %xmm8
	cvtdq2pd	%xmm0, %xmm7
	pshufd	$238, %xmm0, %xmm0
	addpd	%xmm2, %xmm9
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm10, %xmm7
	movapd	%xmm8, %xmm10
	addpd	%xmm2, %xmm8
	addpd	%xmm3, %xmm10
	divpd	%xmm10, %xmm0
	cvtpd2ps	%xmm7, %xmm7
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm7
	movdqa	%xmm4, %xmm0
	movaps	%xmm7, (%rcx,%rax)
	psubd	%xmm1, %xmm0
	cvtdq2pd	%xmm0, %xmm7
	pshufd	$238, %xmm0, %xmm0
	paddd	%xmm5, %xmm1
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm9, %xmm7
	divpd	%xmm8, %xmm0
	cvtpd2ps	%xmm7, %xmm7
	cvtpd2ps	%xmm0, %xmm0
	movlhps	%xmm0, %xmm7
	movaps	%xmm7, (%rsi,%rax)
	addq	$16, %rax
	cmpq	$2400, %rax
	jne	.L4
	addl	$1, %edx
	addq	$2400, %rcx
	addq	$2400, %rsi
	cmpl	$600, %edx
	jne	.L3
	xorl	%esi, %esi
	movl	$inicio, %edi
	leaq	2880016(%rsp), %rbx
	call	gettimeofday
	leaq	1440016(%rsp), %r8
	movq	%rbx, %r9
	leaq	2400(%r8), %r10
.L6:
	leaq	1440016(%rsp), %rsi
	movq	%r9, %rdi
	.p2align 4,,10
	.p2align 3
.L10:
	pxor	%xmm1, %xmm1
	leaq	1440000(%rsi), %rcx
	movq	%rsi, %rax
	movq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L7:
	movss	(%rdx), %xmm0
	addq	$2400, %rax
	addq	$4, %rdx
	shufps	$0, %xmm0, %xmm0
	mulps	-2400(%rax), %xmm0
	cmpq	%rcx, %rax
	addps	%xmm0, %xmm1
	jne	.L7
	addq	$16, %rsi
	addq	$16, %rdi
	movaps	%xmm1, -16(%rdi)
	cmpq	%r10, %rsi
	jne	.L10
	addq	$2400, %rbp
	addq	$2400, %r9
	cmpq	%r8, %rbp
	jne	.L6
	leaq	4320016(%rsp), %r12
	xorl	%esi, %esi
	movl	$final, %edi
	call	gettimeofday
.L11:
	leaq	2400(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L12:
	pxor	%xmm0, %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	addq	$4, %rbx
	cvtss2sd	-4(%rbx), %xmm0
	call	printf
	cmpq	%rbx, %rbp
	jne	.L12
	cmpq	%rbp, %r12
	movq	%rbp, %rbx
	jne	.L11
	movq	final+8(%rip), %rax
	subq	inicio+8(%rip), %rax
	movl	$.LC6, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	final(%rip), %rax
	subq	inicio(%rip), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	call	printf
	addq	$4320016, %rsp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.comm	tiempo,8,8
	.comm	final,16,16
	.comm	inicio,16,16
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC2:
	.long	2576980378
	.long	1072798105
	.long	2576980378
	.long	1072798105
	.align 16
.LC3:
	.long	3435973837
	.long	1073794252
	.long	3435973837
	.long	1073794252
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
