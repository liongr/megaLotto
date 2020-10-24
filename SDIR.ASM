
INCLUDE	mylib.inc
INCLUDE	keys.inc
INCLUDE	sdir.inc

MCODE	segment	public

	assume	cs:MCODE,ds:MCODE,es:MCODE

diskdir	proc	near
	@PUSH
	@CHANGESEGM	es,MCODE
	mov	cs:_bx,bx
	xor	di,di
kasi2:	mov	dl,[si]
	cmp	dl,0
	je	kasi1
	mov	cs:_ldir[di],dl
	inc	si
	inc	di
	jmp	kasi2
kasi1:	mov	cs:_ldir[di],0
	mov	cs:_print,0
	mov	di,0
	cmp	ax,0
	je	kasi3
	mov	si,ax
kasi4:	mov	al,[si]
	mov	cs:_print[di],al
	cmp	al,0
	je	kasi3
	inc	si
	inc	di
	jmp	kasi4
kasi3:	push	cs
	pop	ds
	@SETWIND	_wdir
	@SELECTWIND	_wdir
	@WPRINT	1,1,_print,@FLASH
	mov	cx,15
	mov	bx,0
df1:	mov	_filename[bx]," "
	inc	bx
	loop	df1
	call	_dir1
	cmp	_filename,0
	jne	lodit
lod2:	@DELWIND	_wdir
	mov	ax,offset plirof
	mov	cs:_plirof,ax
	@POP
	call	_f2f
	stc
	retf
lodit:	@DELWIND	_wdir
	mov	ax,offset plirof
	mov	cs:_plirof,ax
	@POP
	call	_f2f
	clc
	retf
diskdir	endp

find_plirof	proc	near
	@PUSHAX
	mov	ah,cs:_dry
	mov	al,cs:_drx
	inc	al
	@TAKECURSWORD	_filename,ax
	pushf
	cmp	_filename,0
	je	kiss
	popf
	mov	ax,cs:_plirof
	call	ax
	pushf
	@SELECTWIND	_wdir
kiss:	mov	_filename,0
	popf
	@POPAX
	ret
_plirof	dw	offset plirof
find_plirof	endp

set_plirof	proc	near
	mov	cs:_plirof,ax
	retf
set_plirof	endp

plirof	proc	near
	clc
	ret
plirof	endp

_f2f	proc	near
	@PUSH
	mov	bx,cs:_bx
	mov	di,0
_f1:	mov	al,cs:_filename[di]
	mov	[bx],al
	cmp	al,0
	je	_ft
	inc	bx
	inc	di
	loop	_f1
_ft:	@POP
	ret
_f2f	endp

_dir1	proc	near
	mov	_filename,0
	mov	cs:_drx,2
dir92:	mov	es:is_error,0
	@SETDIRWIND	_wdir,_ldir,0
	pushf
	cmp	es:is_error,0
	je	sddd
	jmp	dir99
sddd:	popf
dir91:	pushf
	call	_dirpl
	jc	dir99
	popf
	jc	dir91
dirw:	mov	es:is_error,0
	@SETDIRWIND	_wdir,_ldir,1
	pushf
	cmp	es:is_error,0
	je	ddds
	jmp	dir99
ddds:	call	_dirpl
	jc	dir99
	popf
	jnc	dirw
	jmp	dir92
dir99:	pop	ax
	ret
_dir1	endp

_dirpl	proc	near
	mov	cs:_dry,3
	mov	_strbuf," "
	mov	_strbuf[1],0
dirw2:	@INVERSE	cs:_drx,cs:_dry,10
	call	find_plirof
	jc	dirw0
dirw1:	@WAIT	100
	jnc	dirw1
dirw0:	@UPPERAX
	cmp	al,0
	je	dirp1
	cmp	al,13
	je	dirpt
	cmp	al,27
	je	dirpt1
	cmp	al,"T"
	je	dirpt1
	jmp	dirw1
dirpt:	@INVERSE	cs:_drx,cs:_dry,10
	mov	ah,cs:_dry
	mov	al,cs:_drx
	inc	al
	@TAKECURSWORD	_filename,ax
dirpt1:	stc
	ret
dirp1:	cmp	ah,@PG_DOWN
	jne	dirp11
	@INVERSE	cs:_drx,cs:_dry,10
	clc
	ret
dirp11:	cmp	ah,@UP_ARROW
	jne	dp01
	@INVERSE	cs:_drx,cs:_dry,10
	cmp	cs:_dry,3
	jbe	dd01
	dec	cs:_dry
dd01:	jmp	dirw2
dp01:	cmp	ah,@DOWN_ARROW
	jne	dp02
	@INVERSE	cs:_drx,cs:_dry,10
	cmp	cs:_dry,15
	jae	dd02
	inc	cs:_dry
	mov	ah,cs:_dry
	mov	al,cs:_drx
	inc	al
	@TAKECURSWORD	_filename,ax
	cmp	_filename,0
	jne	dd021
	dec	cs:_dry
	jmp	dd02
dd021:	mov	_filename,0
	jmp	dirw2
dd02:	clc
	ret
dp02:	cmp	ah,@LEFT_ARROW
	jne	dp03
	@INVERSE	cs:_drx,cs:_dry,10
	cmp	cs:_drx,2
	jbe	dd03
	sub	cs:_drx,10
dd03:	jmp	dirw2
dp03:	cmp	ah,@RIGHT_ARROW
	jne	dp04
	@INVERSE	cs:_drx,cs:_dry,10
	cmp	cs:_drx,18
	jae	dd04
	add	cs:_drx,10
dd04:	jmp	dirw2
dp04:	jmp	dirw1
_drx	db	0
_dry	db	0
_wdir	db	99,41,4,32,17,70h,1
	db	16 dup(0)
	db	0
_ldir	db	40 dup(0)
_strbuf	db	10 dup(0)
_filename db	12 dup(0)
_print	db	32 dup(0)
_bx	dw	0
_dirpl	endp

MCODE	ends

	end
