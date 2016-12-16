	.file	"main.c"
	.text
	.globl	producto
	.type	producto, @function
producto:
.LFB11:
	.cfi_startproc
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%rdi)
	ret
	.cfi_endproc
.LFE11:
	.size	producto, .-producto
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Bla: %f"
.LC5:
	.string	"\nTiempo necesario: %lf\n"
	.text
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$4320000, %rsp
	.cfi_def_cfa_offset 4320032
	leaq	2880000(%rsp), %rbx
	leaq	1440000(%rsp), %r8
	movq	%rbx, %rdi
	movl	$0, %esi
	movsd	.LC1(%rip), %xmm4
	movsd	.LC2(%rip), %xmm3
	jmp	.L3
.L4:
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	leal	(%rsi,%rax), %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movapd	%xmm1, %xmm2
	addsd	%xmm4, %xmm2
	divsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm5
	movss	%xmm5, (%rdi,%rcx)
	movl	%esi, %edx
	subl	%eax, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	addsd	%xmm3, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, (%r8,%rcx)
	addl	$1, %eax
	addq	$4, %rcx
	cmpl	$600, %eax
	jne	.L4
	addl	$1, %esi
	addq	$2400, %rdi
	addq	$2400, %r8
	cmpl	$600, %esi
	je	.L5
.L3:
	movl	$0, %ecx
	movl	$0, %eax
	jmp	.L4
.L5:
	movl	$0, %esi
	movl	$inicio, %edi
	call	gettimeofday
	leaq	2400(%rsp), %rdi
	leaq	1442400(%rsp), %r8
	jmp	.L6
.L10:
	leaq	-1440000(%rcx), %rax
	movq	%rbx, %rdx
	pxor	%xmm1, %xmm1
.L7:
	movss	(%rax), %xmm0
	mulss	(%rdx), %xmm0
	addss	%xmm0, %xmm1
	addq	$2400, %rax
	addq	$4, %rdx
	cmpq	%rcx, %rax
	jne	.L7
	movss	%xmm1, (%rsi)
	addq	$4, %rsi
	addq	$4, %rcx
	cmpq	%rdi, %rsi
	jne	.L10
	addq	$2400, %rdi
	addq	$2400, %rbx
	cmpq	%r8, %rdi
	je	.L9
.L6:
	leaq	-2400(%rdi), %rsi
	leaq	2880000(%rsp), %rcx
	jmp	.L10
.L9:
	movl	$0, %esi
	movl	$final, %edi
	call	gettimeofday
	movq	%rsp, %rbx
	leaq	1440000(%rsp), %r12
	jmp	.L11
.L12:
	cvtss2sd	(%rbx), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	addq	$4, %rbx
	cmpq	%rbx, %rbp
	jne	.L12
	movq	%rbp, %rbx
	cmpq	%r12, %rbp
	je	.L13
.L11:
	leaq	2400(%rbx), %rbp
	jmp	.L12
.L13:
	movq	final+8(%rip), %rax
	subq	inicio+8(%rip), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC4(%rip), %xmm0
	movq	final(%rip), %rax
	subq	inicio(%rip), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	addq	$4320000, %rsp
	.cfi_def_cfa_offset 32
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
