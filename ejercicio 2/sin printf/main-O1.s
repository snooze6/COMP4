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
.LC1:
	.string	"Tiempo necesario: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$600, %edx
	jmp	.L3
.L4:
	subl	$1, %eax
	jne	.L4
	subl	$1, %edx
	je	.L5
.L3:
	movl	$600, %eax
	jmp	.L4
.L5:
	movl	$0, %esi
	movl	$inicio, %edi
	call	gettimeofday
	movl	$600, %ecx
	jmp	.L6
.L10:
	movl	$600, %eax
.L7:
	subl	$1, %eax
	jne	.L7
	subl	$1, %edx
	jne	.L10
	subl	$1, %ecx
	je	.L9
.L6:
	movl	$600, %edx
	jmp	.L10
.L9:
	movl	$0, %esi
	movl	$final, %edi
	call	gettimeofday
	movq	final+8(%rip), %rax
	subq	inicio+8(%rip), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC0(%rip), %xmm0
	movq	final(%rip), %rax
	subq	inicio(%rip), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, tiempo(%rip)
	movl	$.LC1, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
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
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
