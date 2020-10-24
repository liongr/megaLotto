
INCLUDE	mylib.inc
INCLUDE	keys.inc
INCLUDE	snaioxi.inc

mcode	segment	public

	assume	cs:mcode,ds:mcode

sigoura_no	proc	near
	@PUSH
	push	di
	push	ds
	push	cs
	pop	ds
	mov	w_naioxi[1],al
	mov	w_naioxi[2],ah
	@SETWIND	w_naioxi
	@SELECTWIND	w_naioxi
	pop	ds
	cmp	si,0
	je	sd0
	@WPRINTSI	3,0,@FLASH
sd0:	pop	di
	mov	si,di
	cmp	si,0
	je	sd1
	call	midle
	@WPRINTSI	al,2
sd1:	mov	si,bx
	cmp	si,0
	je	sd2
	call	midle
	@WPRINTSI	al,3
sd2:	mov	cs:_cx,9
	push	cs
	pop	ds
sig00:	cmp	cs:_cx,9
	jae	sig01
	mov	cs:_cx,9
sig01:	cmp	cs:_cx,25
	jbe	sig02
	mov	cs:_cx,9
sig02:	@INVERSE	cs:_cx,5,7
	@WAITL
	@INVERSE	cs:_cx,5,7
	@UPPERAX
	cmp	ah,@RIGHT_ARROW
	jne	signr
	add	cs:_cx,8
	jmp	sig00
signr:	cmp	ah,@LEFT_ARROW
	jne	signl
	sub	cs:_cx,8
	jmp	sig00
signl:	cmp	al,"N"
	jne	signn
	jmp	sigok
signn:	cmp	al,"O"
	jne	signo
	jmp	signok
signo:	cmp	al,@ESCAPE
	je	sigak1
	cmp	al,"A"
	jne	signa
sigak1:	jmp	sigak
signa:	cmp	al,@ENTER
	jne	signe
	cmp	cs:_cx,17
	je	signok
	cmp	cs:_cx,25
	je	sigak
sigok:	@DELWIND	w_naioxi
	@POP
	xor	ax,ax
	clc
	retf
signok:	@DELWIND	w_naioxi
	@POP
	xor	ax,ax
	stc
	retf
sigak:	@DELWIND	w_naioxi
	@POP
	xor	ax,ax
	inc	ax
	stc
	retf
signe:	@MBELL
	jmp	sig00
_cx	db	0
_cy	db	0
w_naioxi	db	99,34,4,40,6,70h,1
		db	0,0,0,0
		db	"          NAI     OXI    Aâìêé",0
		db	0
sigoura_no	endp

midle	proc	near
	push	si
	push	dx
	call	far ptr strlen
	mov	dx,40
	sub	dx,ax
	mov	ax,dx
	shr	ax,1
	inc	ax
	pop	dx
	pop	si
	ret
midle	endp

mcode	ends
	end
