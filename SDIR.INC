MCODE	segment public
global	diskdir:proc
global	set_plirof:proc
global	_plirof:word
global	_filename:byte:12
MCODE	ends

@DISKDIR macro	filename,ldir,print
	push	bx
	push	ax
	push	si
	mov	bx,offset filename
IFB	<print>
	xor	ax,ax
ELSE
	mov	ax,offset print
ENDIF
	mov	si,offset ldir
	call	far ptr diskdir
	pop	si
	pop	ax
	pop	bx
	endm

@SETPLIROF	macro	ADDRESS
		push	ax
		mov	ax,offset ADRESS
		call	far ptr set_plirof
		pop	ax
		endm
