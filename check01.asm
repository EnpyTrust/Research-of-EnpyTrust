 5f0:	nop
 5f4:	stp	x29, x30, [sp, #-16]!
 5f8:	mov	x29, sp
 5fc:	bl	6f4 <call_weak_fn>
 600:	ldp	x29, x30, [sp], #16
 604:	ret

Disassembly of section .plt:

 610:	stp	x16, x30, [sp, #-16]!
 614:	adrp	x16, 1f000 <__FRAME_END__+0x1e5f8>
 618:	ldr	x17, [x16, #4088]
 61c:	add	x16, x16, #0xff8
 620:	br	x17
 624:	nop
 628:	nop
 62c:	nop

 630:	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 634:	ldr	x17, [x16]
 638:	add	x16, x16, #0x0
 63c:	br	x17

 640:	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 644:	ldr	x17, [x16, #8]
 648:	add	x16, x16, #0x8
 64c:	br	x17

 650:	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 654:	ldr	x17, [x16, #16]
 658:	add	x16, x16, #0x10
 65c:	br	x17

 660:	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 664:	ldr	x17, [x16, #24]
 668:	add	x16, x16, #0x18
 66c:	br	x17

 670:	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 674:	ldr	x17, [x16, #32]
 678:	add	x16, x16, #0x20
 67c:	br	x17

 680:	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 684:	ldr	x17, [x16, #40]
 688:	add	x16, x16, #0x28
 68c:	br	x17

Disassembly of section .text:

 6c0:	nop
 6c4:	mov	x29, #0x0                   	// #0
 6c8:	mov	x30, #0x0                   	// #0
 6cc:	mov	x5, x0
 6d0:	ldr	x1, [sp]
 6d4:	add	x2, sp, #0x8
 6d8:	mov	x6, sp
 6dc:	adrp	x0, 1f000 <__FRAME_END__+0x1e5f8>
 6e0:	ldr	x0, [x0, #4056]
 6e4:	mov	x3, #0x0                   	// #0
 6e8:	mov	x4, #0x0                   	// #0
 6ec:	bl	630 <__libc_start_main@plt>
 6f0:	bl	670 <abort@plt>

 6f4:	adrp	x0, 1f000 <__FRAME_END__+0x1e5f8>
 6f8:	ldr	x0, [x0, #4048]
 6fc:	cbz	x0, 704 <call_weak_fn+0x10>
 700:	b	660 <__gmon_start__@plt>
 704:	ret
 708:	nop
 70c:	nop

 710:	adrp	x0, 20000 <__libc_start_main@GLIBC_2.34>
 714:	add	x0, x0, #0x40
 718:	adrp	x1, 20000 <__libc_start_main@GLIBC_2.34>
 71c:	add	x1, x1, #0x40
 720:	cmp	x1, x0
 724:	b.eq	73c <deregister_tm_clones+0x2c>  // b.none
 728:	adrp	x1, 1f000 <__FRAME_END__+0x1e5f8>
 72c:	ldr	x1, [x1, #4032]
 730:	cbz	x1, 73c <deregister_tm_clones+0x2c>
 734:	mov	x16, x1
 738:	br	x16
 73c:	ret

 740:	adrp	x0, 20000 <__libc_start_main@GLIBC_2.34>
 744:	add	x0, x0, #0x40
 748:	adrp	x1, 20000 <__libc_start_main@GLIBC_2.34>
 74c:	add	x1, x1, #0x40
 750:	sub	x1, x1, x0
 754:	lsr	x2, x1, #63
 758:	add	x1, x2, x1, asr #3
 75c:	asr	x1, x1, #1
 760:	cbz	x1, 778 <register_tm_clones+0x38>
 764:	adrp	x2, 1f000 <__FRAME_END__+0x1e5f8>
 768:	ldr	x2, [x2, #4064]
 76c:	cbz	x2, 778 <register_tm_clones+0x38>
 770:	mov	x16, x2
 774:	br	x16
 778:	ret
 77c:	nop

 780:	stp	x29, x30, [sp, #-32]!
 784:	mov	x29, sp
 788:	str	x19, [sp, #16]
 78c:	adrp	x19, 20000 <__libc_start_main@GLIBC_2.34>
 790:	ldrb	w0, [x19, #64]
 794:	cbnz	w0, 7bc <__do_global_dtors_aux+0x3c>
 798:	adrp	x0, 1f000 <__FRAME_END__+0x1e5f8>
 79c:	ldr	x0, [x0, #4040]
 7a0:	cbz	x0, 7b0 <__do_global_dtors_aux+0x30>
 7a4:	adrp	x0, 20000 <__libc_start_main@GLIBC_2.34>
 7a8:	ldr	x0, [x0, #56]
 7ac:	bl	640 <__cxa_finalize@plt>
 7b0:	bl	710 <deregister_tm_clones>
 7b4:	mov	w0, #0x1                   	// #1
 7b8:	strb	w0, [x19, #64]
 7bc:	ldr	x19, [sp, #16]
 7c0:	ldp	x29, x30, [sp], #32
 7c4:	ret
 7c8:	nop
 7cc:	nop

 7d0:	b	740 <register_tm_clones>

 7d4:	stp	x29, x30, [sp, #-32]!
 7d8:	mov	x29, sp
 7dc:	adrp	x0, 0 <__abi_tag-0x278>
 7e0:	add	x0, x0, #0x870
 7e4:	bl	650 <system@plt>
 7e8:	str	w0, [sp, #28]
 7ec:	ldr	w0, [sp, #28]
 7f0:	cmp	w0, #0x0
 7f4:	b.eq	80c <main+0x38>  // b.none
 7f8:	adrp	x0, 0 <__abi_tag-0x278>
 7fc:	add	x0, x0, #0x898
 800:	bl	680 <puts@plt>
 804:	mov	w0, #0x1                   	// #1
 808:	b	84c <main+0x78>
 80c:	adrp	x0, 0 <__abi_tag-0x278>
 810:	add	x0, x0, #0x8c0
 814:	bl	650 <system@plt>
 818:	str	w0, [sp, #24]
 81c:	ldr	w0, [sp, #24]
 820:	cmp	w0, #0x0
 824:	b.eq	83c <main+0x68>  // b.none
 828:	adrp	x0, 0 <__abi_tag-0x278>
 82c:	add	x0, x0, #0x8e0
 830:	bl	680 <puts@plt>
 834:	mov	w0, #0x1                   	// #1
 838:	b	84c <main+0x78>
 83c:	adrp	x0, 0 <__abi_tag-0x278>
 840:	add	x0, x0, #0x900
 844:	bl	680 <puts@plt>
 848:	mov	w0, #0x0                   	// #0
 84c:	ldp	x29, x30, [sp], #32
 850:	ret

Disassembly of section .fini:

 854:	nop
 858:	stp	x29, x30, [sp, #-16]!
 85c:	mov	x29, sp
 860:	ldp	x29, x30, [sp], #16
 864:	ret
