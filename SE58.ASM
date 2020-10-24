
include	koina.inc

code1	segment public

	assume	cs:code1

anapt_rnd	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	epistrofi,sp
	@CHANGESEGM	es,EAXB
	call	far ptr clrmet

	mov	cx,255
	xor	bx,bx
	mov	ax,6
nxtrnd:	mov	cs:bufrnd[bx],al
	inc	al
	cmp	al,8
	jbe	min8
	mov	ax,6
min8:	inc	bx
	loop	nxtrnd

alod:	@STARTRND
	call	rnd6
	@ENDRND
	@INCL	deltia
	call	far ptr diala2
	jmp	alod
	@POP
	retf
anapt_rnd	endp

rnd6	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	
	mov	sthl,0

	mov	cx,3
	xor	di,di
aloi:	push	cx
	@ZEROBBUF	strbuf,50

janaq:
;	@RND
;	xor	bx,bx
;	mov	bl,al
;	xor	ax,ax
;	mov	al,cs:bufrnd[bx]
;	mov	bx,ax
;	xor	dx,dx
;	mov	dl,cs:stilrnd[bx]
;	add	sthl,dx
;	cmp	ax,6
;	jb	janaq
;	cmp	ax,6
;	ja	janaq

	mov	sthl,3
	mov	cx,6
aloe:	push	cx
allo:	@RND
	mov	ah,0
elex:	cmp	ax,49
	jbe	kota
	shr	ax,1
	jmp	elex
kota:	cmp	ax,0
	ja	kokor
	jmp	allo
kokor:	mov	bx,ax
	cmp	strbuf[bx],1
	je	allo
	mov	strbuf[bx],1
	mov	es:xarti[di],al
	inc	di
kiuar:	pop	cx
	loop	aloe
	mov	es:xarti[di],0
	inc	di
	pop	cx
	loop	aloi
	dec	di
	mov	xarti1,di
	@POP
	ret
bufrnd	db	255 dup(0)
stilrnd	db	0,0,0,0,0,0,1,7,28
rnd6	endp

se58	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	epistrofi,sp
	mov	cs:kkk,0
	mov	cs:tria,0
	call	far ptr clrmet
	call	gen58
	cmp	cs:tria,0
	je	tria0
	@INCL	deltia
tria0:	call	far ptr diala2
	cmp	metrdlt,0
	je	kismi
	call	emdlt
kismi:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wpattaf
koko:	@MBELL
	@WAITL
	@UPPERAX
	cmp	al,"T"
	jne	koko
	@DELWIND	wpattaf
	@POP
	retf
se58	endp

	assume	ds:DATA

ekty	proc	near
	@PUSH
	@CHANGESEGM	es,EAXB
	mov	cx,12
	mov	si,xarti1
	mov	bx,0
	xor	ax,ax
jana:	mov	al,deltio[bx]
	mov	es:xarti[si],al
	inc	bx
	inc	si
	loop	jana
	mov	es:xarti[si],0
	inc	si
	mov	xarti1,si
	add	sthl,132
	clc
	add	sthles,132
	adc	sthles[2],0
	inc	cs:tria
	cmp	cs:tria,3
	jb	notria
	@INCL	deltia
	call	far ptr diala2
	mov	sthl,0
	mov	cs:tria,0
	mov	xarti1,0
notria:	@POP
	ret
tria	dw	0
ekty	endp

gen58	proc near
	@PUSH
	push	ds
	pop	es
	mov	si,offset plhres58
	mov	cx,12
	mov	bx,22
	mov	ax,plhuos58
	add	ax,si
a12:	mov	telos[bx],ax
	sub	bx,2
	dec	ax
	loop	a12
	mov	di,offset deltio
	cld
g12:	movsb
	push	si
g11:	movsb
	push	si
g10:	movsb
	push	si
g9:	movsb
	push	si
g8:	movsb
	push	si
g7:	movsb
	push	si

	call	gen581

	pop	si
	dec	di
	cmp	si,telos[10]
	jb	g7
	pop	si
	dec	di
	cmp	si,telos[8]
	jb	g8
	pop	si
	dec	di
	cmp	si,telos[6]
	jb	g9
	pop	si
	dec	di
	cmp	si,telos[4]
	jb	g10
	pop	si
	dec	di
	cmp	si,telos[2]
	jb	g11
	pop	si
	dec	di
	cmp	si,telos[0]
	jb	g12
	@pop
	ret
gen58	endp

gen581	proc	near
g6:	movsb
	push	si
g5:	movsb
	push	si
g4:	movsb
	push	si
g3:	movsb
	push	si
g2:	movsb
	push	si
g1:	movsb

	call	metablhto58
	jc	qq1
	call	ekty

qq1:	dec	di
	cmp	si,telos[22]
	jb	g1
	pop	si
	dec	di
	cmp	si,telos[20]
	jb	g2
	pop	si
	dec	di
	cmp	si,telos[18]
	jb	g3
	pop	si
	dec	di
	cmp	si,telos[16]
	jb	g4
	pop	si
	dec	di
	cmp	si,telos[14]
	jb	g5
	pop	si
	dec	di
	cmp	si,telos[12]
	jb	g6
	ret
gen581	endp

metablhto58	proc	near
	@PUSH
	@CHKKEYB
	jnz	opati
	jmp	opat1
opati:	@TAKEKEYB
	@UPPERAX
	cmp	al,27
	jne	opat1
	call	diakopi
opat1:	@CHANGESEGM	es,METABS
tty1:	push	di
	cmp	cs:kkk,0
	jne	nnn
	mov	cs:kkk,1
	mov	filtra1,1
	mov	ax,filtra58
	mov	cx,49
	mul	cx
	mov	cx,ax
	xor	si,si
jana1:	mov	byte ptr es:[si],0
	inc	si
	loop	jana1
	lea	si,deltio
	xor	bx,bx
	xor	di,di
	xor	cx,cx
	mov	cl,12
japa:	mov	bl,[si]
	mov	byte ptr es:[di][bx],1
	inc	si
	loop	japa
	jmp	tty
nnn:	xor	si,si
	mov	cx,filtra1
	cmp	cx,filtra58
	jne	kiki
	jmp	telas
kiki:	push	cx
	lea	di,deltio
	xor	dx,dx
	xor	bx,bx
	xor	cx,cx
	mov	cl,12
kkkl:	mov	bl,[di]
	cmp	byte ptr es:[si][bx],0
	je	den
	inc	dl
den:	inc	di
	loop	kkkl
	cmp	dl,idos58
	ja	dper
	add	si,49
	pop	cx
	loop	kiki
	inc	filtra1
	lea	di,deltio
	xor	bx,bx
	xor	cx,cx
	mov	cl,12
jano:	mov	bl,[di]
	mov	byte ptr es:[si][bx],1
	inc	di
	loop	jano
tty:	pop	di
	@POP
	clc
	ret
dper:	pop	cx
	pop	di
	@POP
	stc
	ret	
telas:	pop	di
	mov	cs:kkk,0
	jmp	tty1
kkk	dw	0
metablhto58	endp

code1	ends
	end
