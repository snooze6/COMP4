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
.LC3:
	.string	"Bla: %f"
.LC5:
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
	xorl	%esi, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$4320000, %rsp
	.cfi_def_cfa_offset 4320032
	leaq	1440000(%rsp), %r8
	movsd	.LC1(%rip), %xmm4
	movsd	.LC2(%rip), %xmm3
	movq	%rsp, %rbx
	movq	%rsp, %rdi
.L3:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm1, %xmm1
	leal	(%rsi,%rax), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm5, %xmm5
	cvtsi2sd	%eax, %xmm1
	pxor	%xmm6, %xmm6
	cvtsi2sd	%edx, %xmm0
	movl	%esi, %edx
	subl	%eax, %edx
	addl	$1, %eax
	movapd	%xmm1, %xmm2
	addsd	%xmm3, %xmm1
	addsd	%xmm4, %xmm2
	divsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movss	%xmm5, (%rdi,%rcx)
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, (%r8,%rcx)
	addq	$4, %rcx
	cmpl	$600, %eax
	jne	.L4
	addl	$1, %esi
	addq	$2400, %rdi
	addq	$2400, %r8
	cmpl	$600, %esi
	jne	.L3
	movl	$inicio, %edi
	xorl	%esi, %esi
	call	gettimeofday
	pxor	%xmm2, %xmm2
	leaq	2882400(%rsp), %rdi
	leaq	4322400(%rsp), %r9
	leaq	2880000(%rsp), %r8
.L6:
	leaq	-2400(%rdi), %rsi
	movq	%r8, %rcx
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	-1440000(%rcx), %rax
	movaps	%xmm2, %xmm1
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L7:
	movss	(%rax), %xmm0
	addq	$2400, %rax
	addq	$4, %rdx
	mulss	-4(%rdx), %xmm0
	cmpq	%rcx, %rax
	addss	%xmm0, %xmm1
	jne	.L7
	movss	%xmm1, (%rsi)
	addq	$4, %rsi
	leaq	4(%rax), %rcx
	cmpq	%rdi, %rsi
	jne	.L10
	leaq	2400(%rsi), %rdi
	addq	$2400, %rbx
	cmpq	%r9, %rdi
	jne	.L6
	leaq	2880000(%rsp), %rbx
	leaq	4320000(%rsp), %r12
	xorl	%esi, %esi
	movl	$final, %edi
	call	gettimeofday
.L11:
	leaq	2400(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L12:
	pxor	%xmm0, %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	addq	$4, %rbx
	cvtss2sd	-4(%rbx), %xmm0
	call	printf
	cmpq	%rbx, %rbp
	jne	.L12
	cmpq	%r12, %rbp
	movq	%rbp, %rbx
	jne	.L11
	movq	final+8(%rip), %rax
	subq	inicio+8(%rip), %rax
	movl	$.LC5, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	final(%rip), %rax
	subq	inicio(%rip), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	call	printf
	addq	$4320000, %rsp
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
