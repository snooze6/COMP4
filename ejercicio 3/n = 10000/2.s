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
	movsd	.LC0(%rip), %xmm0
.L2:
	pxor	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, res(,%rax,8)
	addq	$1, %rax
	pxor	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	mulsd	%xmm0, %xmm2
	movsd	%xmm2, res(,%rax,8)
	leaq	1(%rax), %rcx
	pxor	%xmm3, %xmm3
	cvtsi2sd	%ecx, %xmm3
	mulsd	%xmm0, %xmm3
	movsd	%xmm3, res(,%rcx,8)
	leaq	2(%rax), %rsi
	pxor	%xmm4, %xmm4
	cvtsi2sd	%esi, %xmm4
	mulsd	%xmm0, %xmm4
	movsd	%xmm4, res(,%rsi,8)
	leaq	3(%rax), %rdi
	pxor	%xmm5, %xmm5
	cvtsi2sd	%edi, %xmm5
	mulsd	%xmm0, %xmm5
	movsd	%xmm5, res(,%rdi,8)
	leaq	4(%rax), %r8
	pxor	%xmm6, %xmm6
	cvtsi2sd	%r8d, %xmm6
	mulsd	%xmm0, %xmm6
	movsd	%xmm6, res(,%r8,8)
	leaq	5(%rax), %r9
	pxor	%xmm7, %xmm7
	cvtsi2sd	%r9d, %xmm7
	mulsd	%xmm0, %xmm7
	movsd	%xmm7, res(,%r9,8)
	leaq	6(%rax), %r10
	pxor	%xmm8, %xmm8
	cvtsi2sd	%r10d, %xmm8
	mulsd	%xmm0, %xmm8
	movsd	%xmm8, res(,%r10,8)
	addq	$7, %rax
	cmpq	$10000, %rax
	jne	.L2
	movl	$res, %edx
	movl	$res+80000, %r11d
	movsd	.LC1(%rip), %xmm9
	movsd	.LC2(%rip), %xmm10
	movsd	.LC0(%rip), %xmm11
	jmp	.L6
.L31:
	movapd	%xmm12, %xmm13
	subsd	%xmm10, %xmm13
	jmp	.L5
.L42:
	movsd	res+79992(%rip), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore_state
	movapd	%xmm14, %xmm15
	mulsd	%xmm14, %xmm15
	addsd	%xmm11, %xmm15
	jmp	.L33
.L12:
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	addsd	%xmm11, %xmm1
	jmp	.L34
.L14:
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm11, %xmm3
	jmp	.L35
.L16:
	movapd	%xmm4, %xmm5
	mulsd	%xmm4, %xmm5
	addsd	%xmm11, %xmm5
	jmp	.L36
.L18:
	movapd	%xmm6, %xmm7
	mulsd	%xmm6, %xmm7
	addsd	%xmm11, %xmm7
	jmp	.L37
.L20:
	movapd	%xmm8, %xmm12
	mulsd	%xmm8, %xmm12
	addsd	%xmm11, %xmm12
	jmp	.L38
.L22:
	movapd	%xmm13, %xmm14
	mulsd	%xmm13, %xmm14
	addsd	%xmm11, %xmm14
.L39:
	addsd	%xmm13, %xmm14
	movsd	%xmm14, 48(%rcx)
	leaq	56(%rcx), %rdx
	cmpq	%r11, %rdx
	je	.L42
.L6:
	movq	%rdx, %rax
	movsd	(%rdx), %xmm12
	ucomisd	%xmm12, %xmm9
	jbe	.L31
	movapd	%xmm12, %xmm13
	mulsd	%xmm12, %xmm13
	addsd	%xmm11, %xmm13
.L5:
	addsd	%xmm12, %xmm13
	movsd	%xmm13, (%rax)
	leaq	8(%rdx), %rcx
	movsd	8(%rdx), %xmm14
	ucomisd	%xmm14, %xmm9
	ja	.L10
	movapd	%xmm14, %xmm15
	subsd	%xmm10, %xmm15
.L33:
	addsd	%xmm14, %xmm15
	movsd	%xmm15, (%rcx)
	movsd	8(%rcx), %xmm0
	ucomisd	%xmm0, %xmm9
	ja	.L12
	movapd	%xmm0, %xmm1
	subsd	%xmm10, %xmm1
.L34:
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rcx)
	movsd	16(%rcx), %xmm2
	ucomisd	%xmm2, %xmm9
	ja	.L14
	movapd	%xmm2, %xmm3
	subsd	%xmm10, %xmm3
.L35:
	addsd	%xmm2, %xmm3
	movsd	%xmm3, 16(%rcx)
	movsd	24(%rcx), %xmm4
	ucomisd	%xmm4, %xmm9
	ja	.L16
	movapd	%xmm4, %xmm5
	subsd	%xmm10, %xmm5
.L36:
	addsd	%xmm4, %xmm5
	movsd	%xmm5, 24(%rcx)
	movsd	32(%rcx), %xmm6
	ucomisd	%xmm6, %xmm9
	ja	.L18
	movapd	%xmm6, %xmm7
	subsd	%xmm10, %xmm7
.L37:
	addsd	%xmm6, %xmm7
	movsd	%xmm7, 32(%rcx)
	movsd	40(%rcx), %xmm8
	ucomisd	%xmm8, %xmm9
	ja	.L20
	movapd	%xmm8, %xmm12
	subsd	%xmm10, %xmm12
.L38:
	addsd	%xmm8, %xmm12
	movsd	%xmm12, 40(%rcx)
	movsd	48(%rcx), %xmm13
	ucomisd	%xmm13, %xmm9
	ja	.L22
	movapd	%xmm13, %xmm14
	subsd	%xmm10, %xmm14
	jmp	.L39
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
