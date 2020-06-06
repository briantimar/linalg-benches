	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function timediff
LCPI0_0:
	.quad	4517329193108106637     ## double 9.9999999999999995E-7
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_timediff
	.p2align	4, 0x90
_timediff:                              ## @timediff
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -32(%rbp)
	movl	%ecx, -24(%rbp)
	movq	-16(%rbp), %rax
	subq	-32(%rbp), %rax
	cvtsi2sd	%rax, %xmm1
	movl	-8(%rbp), %ecx
	subl	-24(%rbp), %ecx
	cvtsi2sd	%ecx, %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_addv                   ## -- Begin function addv
	.p2align	4, 0x90
_addv:                                  ## @addv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	-20(%rbp), %eax
	cltd
	movl	$4, %ecx
	idivl	%ecx
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	shll	$2, %eax
	movl	%eax, -32(%rbp)
	movl	$0, -24(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
# -24 holds the integer increment. -32 is the size rounded to block size 4
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	LBB1_4
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	# move 4 32-fp elements into the xmm0 register
	movaps	(%rax,%rcx,4), %xmm0    
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	# add a chunk of 4 from the other vector
	addps	(%rax,%rcx,4), %xmm0
	# finally move that chunk back to mem
	movaps	%xmm0, (%rax,%rcx,4)
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	-24(%rbp), %eax
	# make sure to move in steps of 4
	addl	$4, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB1_1
LBB1_4:
	jmp	LBB1_5
LBB1_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB1_8
## %bb.6:                               ##   in Loop: Header=BB1_5 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	addss	(%rax,%rcx,4), %xmm0
	movss	%xmm0, (%rax,%rcx,4)
## %bb.7:                               ##   in Loop: Header=BB1_5 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB1_5
LBB1_8:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function fillarray
LCPI2_0:
	.quad	4611686018427387904     ## double 2
LCPI2_1:
	.quad	4602678819172646912     ## double 0.5
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI2_2:
	.long	1325400064              ## float 2.14748365E+9
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fillarray
	.p2align	4, 0x90
_fillarray:                             ## @fillarray
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movss	%xmm0, -16(%rbp)
	movl	$0, -20(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	LBB2_4
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	callq	_rand
	movsd	LCPI2_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movsd	LCPI2_1(%rip), %xmm1    ## xmm1 = mem[0],zero
	movss	LCPI2_2(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	cvtsi2ss	%eax, %xmm3
	divss	%xmm2, %xmm3
	cvtss2sd	%xmm3, %xmm2
	subsd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	movss	-16(%rbp), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	mulsd	%xmm0, %xmm2
	cvtsd2ss	%xmm2, %xmm0
	movss	%xmm0, -24(%rbp)
	movss	-24(%rbp), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movss	%xmm0, (%rcx,%rdx,4)
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB2_1
LBB2_4:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_benchmark              ## -- Begin function benchmark
	.p2align	4, 0x90
_benchmark:                             ## @benchmark
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	xorl	%eax, %eax
	movl	%eax, %r8d
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	leaq	-56(%rbp), %rdi
	movq	%r8, %rsi
	callq	_gettimeofday
	movl	$0, -76(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-76(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	LBB3_4
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movl	-28(%rbp), %edx
	callq	_addv
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	LBB3_1
LBB3_4:
	xorl	%eax, %eax
	movl	%eax, %esi
	leaq	-72(%rbp), %rdi
	callq	_gettimeofday
	movq	-72(%rbp), %rdi
	movl	-64(%rbp), %esi
	movq	-56(%rbp), %rdx
	movl	-48(%rbp), %ecx
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	callq	_timediff
	cvtsi2ssl	-4(%rbp), %xmm1
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function main
LCPI4_0:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movss	LCPI4_0(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movss	%xmm0, -32(%rbp)
	cmpl	$4, -8(%rbp)
	je	LBB4_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	leaq	L_.str(%rip), %rsi
	xorl	%ecx, %ecx
                                        ## kill: def $cl killed $cl killed $ecx
	movb	%cl, %al
	callq	_fprintf
	movl	$1, %edi
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	callq	_exit
LBB4_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_atoi
	movl	%eax, -24(%rbp)
	cmpl	$0, %eax
	jle	LBB4_4
## %bb.3:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	callq	_atoi
	movl	%eax, -28(%rbp)
	cmpl	$0, %eax
	jg	LBB4_5
LBB4_4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.1(%rip), %rsi
	xorl	%ecx, %ecx
                                        ## kill: def $cl killed $cl killed $ecx
	movb	%cl, %al
	callq	_fprintf
	movl	$1, %edi
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	callq	_exit
LBB4_5:
	movslq	-24(%rbp), %rax
	shlq	$2, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	%rax, -56(%rbp)
	movslq	-24(%rbp), %rax
	shlq	$2, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rdi
	movl	-24(%rbp), %esi
	movss	-32(%rbp), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	callq	_fillarray
	movq	-64(%rbp), %rdi
	movl	-24(%rbp), %esi
	movss	-32(%rbp), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	callq	_fillarray
	movl	-28(%rbp), %edi
	movq	-56(%rbp), %rsi
	movq	-64(%rbp), %rdx
	movl	-24(%rbp), %ecx
	callq	_benchmark
	movsd	%xmm0, -40(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	_fopen
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdi
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %ecx
	movsd	-40(%rbp), %xmm0        ## xmm0 = mem[0],zero
	leaq	L_.str.3(%rip), %rsi
	movb	$1, %al
	callq	_fprintf
	movq	-72(%rbp), %rdi
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	callq	_fclose
	movq	-56(%rbp), %rdi
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	callq	_free
	movq	-64(%rbp), %rdi
	callq	_free
	xorl	%edi, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"usage: %s size nsamp outfile\n"

L_.str.1:                               ## @.str.1
	.asciz	"invalid args"

L_.str.2:                               ## @.str.2
	.asciz	"a"

L_.str.3:                               ## @.str.3
	.asciz	"%d %d %.8e\n"


.subsections_via_symbols
