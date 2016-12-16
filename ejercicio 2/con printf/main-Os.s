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
.LC3:
	.string	"Bla: %f"
.LC5:
	.string	"\nTiempo necesario: %lf\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%edx, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$4320008, %rsp
	.cfi_def_cfa_offset 4320048
	leaq	1440000(%rsp), %rsi
	movsd	.LC1(%rip), %xmm2
	movsd	.LC2(%rip), %xmm3
	movq	%rsp, %r12
	movq	%rsp, %rdi
	movq	%rsi, %r13
.L3:
	xorl	%eax, %eax
.L4:
	cvtsi2sd	%eax, %xmm1
	leal	(%rdx,%rax), %ecx
	cvtsi2sd	%ecx, %xmm0
	movl	%edx, %ecx
	subl	%eax, %ecx
	movapd	%xmm1, %xmm4
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm4
	divsd	%xmm4, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	cvtsi2sd	%ecx, %xmm0
	movss	%xmm5, (%rdi,%rax,4)
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, (%rsi,%rax,4)
	incq	%rax
	cmpq	$600, %rax
	jne	.L4
	incl	%edx
	addq	$2400, %rdi
	addq	$2400, %rsi
	cmpl	$600, %edx
	jne	.L3
	xorl	%esi, %esi
	movl	$inicio, %edi
	leaq	2880000(%rsp), %rbx
	call	gettimeofday
	leaq	4320000(%rsp), %rcx
	movq	%rbx, %rbp
.L6:
	xorl	%eax, %eax
.L10:
	xorps	%xmm0, %xmm0
	leaq	0(%r13,%rax), %rsi
	xorl	%edx, %edx
.L7:
	imulq	$2400, %rdx, %rdi
	movss	(%rsi,%rdi), %xmm1
	mulss	(%r12,%rdx,4), %xmm1
	incq	%rdx
	cmpq	$600, %rdx
	addss	%xmm1, %xmm0
	jne	.L7
	movss	%xmm0, 0(%rbp,%rax)
	addq	$4, %rax
	cmpq	$2400, %rax
	jne	.L10
	addq	$2400, %rbp
	addq	$2400, %r12
	cmpq	%rcx, %rbp
	jne	.L6
	xorl	%esi, %esi
	movl	$final, %edi
	call	gettimeofday
.L11:
	xorl	%r12d, %r12d
.L12:
	cvtss2sd	(%rbx,%r12,4), %xmm0
	movl	$.LC3, %edi
	movb	$1, %al
	incq	%r12
	call	printf
	cmpq	$600, %r12
	jne	.L12
	addq	$2400, %rbx
	cmpq	%rbp, %rbx
	jne	.L11
	movq	final+8(%rip), %rax
	subq	inicio+8(%rip), %rax
	movl	$.LC5, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	final(%rip), %rax
	subq	inicio(%rip), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	call	printf
	addq	$4320008, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
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
.LC1:
	.long	2576980378
	.long	1072798105
	.align 8
.LC2:
	.long	3435973837
	.long	1073794252
	.align 8
.LC4:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
