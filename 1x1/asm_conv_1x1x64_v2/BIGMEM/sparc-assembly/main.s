	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"enabled serial.\n"
	.section	".text"
	.align 4
	.global enable_serial
	.type	enable_serial, #function
	.proc	020
enable_serial:
	save	%sp, -96, %sp
	mov	7, %o0
	call	__ajit_write_serial_control_register__, 0
	 sethi	%hi(.LC0), %i0
	call	ee_printf, 0
	 restore %i0, %lo(.LC0), %o0
	.size	enable_serial, .-enable_serial
	.section	.rodata.str1.8
	.align 8
.LC1:
	.asciz	"%d "
	.align 8
.LC2:
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
	sethi	%hi(.LC1), %i3
	sethi	%hi(.LC2), %l2
	add	%i2, -1, %l3
	or	%i3, %lo(.LC1), %i3
	or	%l2, %lo(.LC2), %l2
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
.LC3:
	.asciz	"main: start_time=%d, end_time=%d, elapsed=%d\n"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	020
main:
	save	%sp, -96, %sp
	sethi	%hi(img), %i5
	sethi	%hi(16384), %g4
	or	%i5, %lo(img), %g3
	add	%g3, %g4, %g4
	mov	0, %g1
.L17:
	add	%g1, 1, %g2
	stb	%g2, [%g3+%g1]
	cmp	%g2, 128
	bne	.L17
	 mov	%g2, %g1
	add	%g3, 128, %g3
	cmp	%g3, %g4
	bne	.L17
	 mov	0, %g1
	call	ajit_barebones_clock, 0
	 sethi	%hi(res), %i0
	mov	16, %o1
	mov	%o0, %i4
	mov	128, %o2
	or	%i5, %lo(img), %o0
	or	%i0, %lo(res), %o4
	sethi	%hi(kernel), %o3
	call	conv, 0
	 or	%o3, %lo(kernel), %o3
	call	ajit_barebones_clock, 0
	 or	%i0, %lo(res), %i0
	mov	%i4, %o1
	mov	%o0, %o2
	sub	%o0, %i4, %o3
	sethi	%hi(.LC3), %o0
	mov	125, %i1
	or	%o0, %lo(.LC3), %o0
	call	ee_printf, 0
	 mov	125, %i2
	call	print_matrix, 0
	 restore
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
	ble	.L34
	 mov	0, %l1
	sethi	%hi(.LC1), %i3
	sethi	%hi(.LC2), %l2
	add	%i2, -1, %l3
	or	%i3, %lo(.LC1), %i3
	or	%l2, %lo(.LC2), %l2
	mov	0, %i5
.L32:
	cmp	%i2, 0
	ble	.L24
	 add	%i0, %l1, %i4
	ldub	[%i4+%i5], %o1
.L31:
	call	ee_printf, 0
	 mov	%i3, %o0
	add	%i5, 1, %i5
	cmp	%i5, %i2
	bne,a	.L31
	 ldub	[%i4+%i5], %o1
	add	%l1, 1, %l1
	add	%l1, %l3, %l1
.L24:
	call	ee_printf, 0
	 mov	%l2, %o0
	add	%l0, 1, %l0
	cmp	%l0, %i1
	bne	.L32
	 mov	0, %i5
.L34:
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
	.common	img,16384,8
	.global res
	.section	".bss"
	.align 8
	.type	res, #object
	.size	res, 62500
res:
	.skip	62500
	.ident	"GCC: (Buildroot 2014.08-g538713e-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
