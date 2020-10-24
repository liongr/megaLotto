
global	indisk:proc

@INDISK	macro	x,y,disk
	push	dx
	mov	dl,x
	mov	dh,y
	mov	al,disk
	call	far ptr indisk
	pop	dx
	endm
