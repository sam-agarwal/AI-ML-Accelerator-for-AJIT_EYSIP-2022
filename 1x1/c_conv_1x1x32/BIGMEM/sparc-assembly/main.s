	.file	"main.c"
	.section	".text"
	.align 4
	.global enable_serial
	.type	enable_serial, #function
	.proc	020
enable_serial:
	mov	7, %o0
	or	%o7, %g0, %g1
	call	__ajit_write_serial_control_register__, 0
	 or	%g1, %g0, %o7
	.size	enable_serial, .-enable_serial
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"%d "
	.align 8
.LC1:
	.asciz	"\n"
	.section	".text"
	.align 4
	.global print_matrix
	.type	print_matrix, #function
	.proc	020
print_matrix:
	save	%sp, -96, %sp
	mov	0, %l0
	cmp	%i1, 0
	ble	.L14
	 mov	0, %l1
	sethi	%hi(.LC0), %i3
	sethi	%hi(.LC1), %l2
	add	%i2, -1, %l3
	or	%i3, %lo(.LC0), %i3
	or	%l2, %lo(.LC1), %l2
	cmp	%i2, 0
.L12:
	ble	.L6
	 nop
	sll	%l1, 2, %i5
	mov	0, %i4
	add	%i0, %i5, %i5
.L5:
	ld	[%i5], %o1
	call	ee_printf, 0
	 mov	%i3, %o0
	add	%i4, 1, %i4
	cmp	%i4, %i2
	bne	.L5
	 add	%i5, 4, %i5
	add	%l1, 1, %l1
	add	%l1, %l3, %l1
.L6:
	call	ee_printf, 0
	 mov	%l2, %o0
	add	%l0, 1, %l0
	cmp	%l0, %i1
	bne	.L12
	 cmp	%i2, 0
.L14:
	jmp	%i7+8
	 restore
	.size	print_matrix, .-print_matrix
	.section	.rodata.str1.8
	.align 8
.LC2:
	.asciz	"main: start_time=%d, end_time=%d, elapsed=%d\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	020
main:
	save	%sp, -184, %sp
	sethi	%hi(img), %i5
	or	%i5, %lo(img), %i5
	mov	%i5, %g3
	mov	0, %g1
.L17:
	add	%g1, 1, %g2
	stb	%g2, [%g3+%g1]
	cmp	%g2, 64
	bne	.L17
	 mov	%g2, %g1
	add	%g3, 64, %g3
	sethi	%hi(img+4096), %g1
	or	%g1, %lo(img+4096), %g1
	cmp	%g3, %g1
	bne,a	.L17
	 mov	0, %g1
	call	ajit_barebones_clock, 0
	 nop
	sethi	%hi(kernel), %g2
	or	%g2, %lo(kernel), %g1
	ldub	[%g2+%lo(kernel)], %g2
	ldub	[%g1+1], %g3
	ldub	[%g1+3], %o2
	ldub	[%g1+4], %o3
	ldub	[%g1+5], %l0
	ldub	[%g1+6], %i1
	st	%o0, [%fp-76]
	st	%g2, [%fp-12]
	ldub	[%g1+2], %o0
	ldub	[%g1+7], %g2
	st	%g3, [%fp-8]
	st	%o0, [%fp-16]
	ldub	[%g1+8], %g3
	ldub	[%g1+9], %o0
	st	%o2, [%fp-20]
	st	%o3, [%fp-24]
	ldub	[%g1+10], %o2
	ldub	[%g1+11], %o3
	st	%l0, [%fp-28]
	st	%i1, [%fp-32]
	ldub	[%g1+12], %l0
	ldub	[%g1+13], %i1
	st	%g2, [%fp-36]
	ldub	[%g1+14], %g2
	ldub	[%g1+15], %g1
	st	%g3, [%fp-40]
	st	%o2, [%fp-48]
	st	%g1, [%fp-68]
	st	%o0, [%fp-44]
	st	%o3, [%fp-52]
	st	%l0, [%fp-56]
	st	%i1, [%fp-60]
	st	%g2, [%fp-64]
	sethi	%hi(img+192), %g1
	or	%g1, %lo(img+192), %g1
	sethi	%hi(res), %g3
	st	%g1, [%fp-72]
	or	%g3, %lo(res), %o5
	mov	-189, %g1
	ld	[%fp-72], %o2
	sub	%g1, %i5, %g1
	st	%g1, [%fp-80]
.L20:
	ld	[%fp-80], %o0
	sethi	%hi(img), %o3
	add	%o0, %o2, %g1
	or	%o3, %lo(img), %o3
	ldub	[%o2], %o1
	ldub	[%o2+1], %i5
	ldub	[%o2+2], %g4
	ldub	[%o2-64], %l1
	ldub	[%o2-63], %o7
	ldub	[%o2-62], %i2
	ldub	[%o2-128], %l4
	ldub	[%o2-127], %i0
	ldub	[%o2-126], %i3
	ldub	[%o2-192], %l7
	ldub	[%o2-191], %g3
	ldub	[%o2-190], %i4
	add	%o3, %g1, %g1
	b	.L19
	 mov	0, %g2
.L21:
	mov	%o4, %i4
	ldub	[%fp-1], %i3
	ldub	[%fp-2], %i2
.L19:
	and	%g4, 0xff, %o3
	st	%o3, [%fp-84]
	ld	[%fp-12], %o3
	and	%l7, 0xff, %l7
	smul	%l7, %o3, %l7
	ld	[%fp-8], %o3
	and	%g3, 0xff, %l5
	smul	%l5, %o3, %l5
	ld	[%o5+%g2], %o3
	add	%l7, %o3, %l7
	ld	[%fp-16], %o3
	and	%i4, 0xff, %l6
	smul	%l6, %o3, %l6
	ld	[%fp-20], %o3
	add	%l7, %l5, %l7
	ldub	[%g1], %o4
	and	%o4, 0xff, %l5
	smul	%l5, %o3, %l5
	ld	[%fp-24], %o3
	and	%l4, 0xff, %l4
	smul	%l4, %o3, %l4
	ld	[%fp-28], %o3
	and	%i0, 0xff, %l3
	smul	%l3, %o3, %l3
	ld	[%fp-32], %o3
	add	%l7, %l6, %l6
	and	%i3, 0xff, %l2
	smul	%l2, %o3, %l2
	ld	[%fp-36], %o3
	ldub	[%g1+64], %l0
	add	%l6, %l5, %l5
	stb	%l0, [%fp-1]
	ldub	[%fp-1], %l6
	smul	%l6, %o3, %l6
	ld	[%fp-40], %o3
	and	%o7, 0xff, %l0
	add	%l5, %l4, %l4
	and	%l1, 0xff, %l1
	add	%l4, %l3, %l3
	smul	%l1, %o3, %l1
	add	%l3, %l2, %l2
	ld	[%fp-44], %o3
	add	%l2, %l6, %l2
	smul	%l0, %o3, %l0
	add	%l2, %l1, %l1
	add	%l1, %l0, %l0
	ld	[%fp-48], %o3
	and	%i2, 0xff, %o0
	smul	%o0, %o3, %o0
	add	%l0, %o0, %o0
	ld	[%fp-52], %l0
	ldub	[%g1+128], %i1
	stb	%i1, [%fp-2]
	ldub	[%fp-2], %l3
	smul	%l3, %l0, %l3
	ld	[%fp-60], %l0
	add	%o0, %l3, %o0
	and	%i5, 0xff, %o2
	ld	[%fp-56], %o3
	smul	%o2, %l0, %o2
	and	%o1, 0xff, %o1
	ld	[%fp-64], %l0
	smul	%o1, %o3, %o1
	add	%o0, %o1, %o1
	ld	[%fp-84], %o0
	ldub	[%g1+192], %i1
	smul	%o0, %l0, %o3
	add	%o1, %o2, %o2
	and	%i1, 0xff, %l0
	add	%o2, %o3, %o3
	ld	[%fp-68], %o0
	smul	%l0, %o0, %l0
	add	%o3, %l0, %o3
	st	%o3, [%o5+%g2]
	mov	%i5, %o1
	add	%g2, 4, %g2
	mov	%g4, %i5
	mov	%o7, %l1
	mov	%i0, %l4
	mov	%g3, %l7
	mov	%i2, %o7
	mov	%i3, %i0
	add	%g1, 1, %g1
	mov	%i4, %g3
	cmp	%g2, 244
	bne	.L21
	 mov	%i1, %g4
	ld	[%fp-72], %o2
	add	%o2, 64, %o2
	st	%o2, [%fp-72]
	sethi	%hi(img+4096), %o3
	or	%o3, %lo(img+4096), %o3
	cmp	%o2, %o3
	bne	.L20
	 add	%o5, 244, %o5
	call	ajit_barebones_clock, 0
	 sethi	%hi(res), %l0
	ld	[%fp-76], %o1
	mov	%o0, %o2
	sub	%o0, %o1, %o3
	sethi	%hi(.LC2), %o0
	or	%l0, %lo(res), %i0
	or	%o0, %lo(.LC2), %o0
	call	ee_printf, 0
	 mov	61, %i1
	call	print_matrix, 0
	 restore %g0, 61, %o2
	.size	main, .-main
	.section	".text"
	.align 4
	.global print_matrix_u8
	.type	print_matrix_u8, #function
	.proc	020
print_matrix_u8:
	save	%sp, -96, %sp
	mov	0, %l0
	cmp	%i1, 0
	ble	.L38
	 mov	0, %l1
	sethi	%hi(.LC0), %i3
	sethi	%hi(.LC1), %l2
	add	%i2, -1, %l3
	or	%i3, %lo(.LC0), %i3
	or	%l2, %lo(.LC1), %l2
	mov	0, %i5
.L36:
	cmp	%i2, 0
	ble	.L28
	 add	%i0, %l1, %i4
	ldub	[%i4+%i5], %o1
.L35:
	call	ee_printf, 0
	 mov	%i3, %o0
	add	%i5, 1, %i5
	cmp	%i5, %i2
	bne,a	.L35
	 ldub	[%i4+%i5], %o1
	add	%l1, 1, %l1
	add	%l1, %l3, %l1
.L28:
	call	ee_printf, 0
	 mov	%l2, %o0
	add	%l0, 1, %l0
	cmp	%l0, %i1
	bne	.L36
	 mov	0, %i5
.L38:
	jmp	%i7+8
	 restore
	.size	print_matrix_u8, .-print_matrix_u8
	.global kernel
	.section	".data"
	.align 8
	.type	kernel, #object
	.size	kernel, 16
kernel:
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.common	img,4096,8
	.global res
	.section	".bss"
	.align 8
	.type	res, #object
	.size	res, 14884
res:
	.skip	14884
	.ident	"GCC: (Buildroot 2014.08-g538713e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
