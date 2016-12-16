	.file	"mein.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"resultado= %e\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %eax
	movsd	.LC0(%rip), %xmm1
.L2:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, res(,%rax,8)
	addq	$1, %rax
	cmpq	$10000, %rax
	jne	.L2
	movl	$res, %eax
	movl	$res+80000, %ecx
	movsd	.LC1(%rip), %xmm3
	movsd	.LC2(%rip), %xmm5
	movsd	.LC0(%rip), %xmm4
	jmp	.L6
.L10:
	movapd	%xmm2, %xmm0
	subsd	%xmm5, %xmm0
.L5:
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rax
	cmpq	%rcx, %rax
	je	.L12
.L6:
	movq	%rax, %rdx
	movsd	(%rax), %xmm2
	ucomisd	%xmm2, %xmm3
	jbe	.L10
	movapd	%xmm2, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm4, %xmm1
	movapd	%xmm1, %xmm0
	jmp	.L5
.L12:
	movsd	res+79992(%rip), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.comm	res,80000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	3539053052
	.long	1061184077
	.align 8
.LC1:
	.long	0
	.long	1097011920
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
