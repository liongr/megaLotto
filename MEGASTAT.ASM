
INCLUDE	koina.inc

code4	segment	public

	assume	cs:code4

basikes_stat	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	word ptr pinomad[23952],0
	je	kokos
	@POP
	retf
kokos:	mov	byte ptr strbuf,0
	@NAIOXI	34,6,strbuf,mbastat,mbastat1
	jnc	okit1
	@POP
	retf
okit1:	mov	cs:poses_nik,12
	call	do_stat
	jc	outhe
	mov	ax,end_pointer
	add	ax,73
	mov	user_pointer,ax
	call	bale_tel_nik
	call	apo0eos0
	call	far ptr bale_index
outhe:	@POP
	retf
basikes_stat	endp

do_stat	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	cs:ar_sires,1600
	@OPEN_HANDLE	nikitries,I_READ
	mov	cs:handle_ar,ax
	@CHANGESEGM	ds,PINMNHMHL
	@READ_MEM	cs:handle_ar,0,65520
	@CLOSE_HANDLE	cs:handle_ar
	xor	di,di
ziou:	cmp	byte ptr [di],0
	je	telosr
	add	di,6
	jmp	ziou
telosr:	mov	ax,cs:poses_nik
	mov	cx,6
	mul	cx
	cmp	di,ax
	jae	max54
	@MBELL
	@POP
	stc
	ret
max54:	mov	cs:telos_nik,di
	sub	di,ax
	mov	cx,cs:poses_nik
	xor	si,si
	xor	bx,bx
zats:	push	cx
	mov	cx,6
zits:	mov	bl,byte ptr [di]
	inc	cs:ar_sires[1500][bx]
	mov	cs:ar_sires[si][bx],1
	inc	di
	loop	zits
	pop	cx
	add	si,50
	loop	zats
	@POP
	clc
	ret
poses_nik	dw	0
ar_sires	db	32 dup(50 dup(0))
bufar		db	50 dup(0)
ar_apo		dw	0
ar_eos		dw	0
ar_posa		dw	0
handle_ar	dw	0
telos_nik	dw	0
buffer		db	255 dup(0)
do_stat	endp

bale_tel_nik	proc	near
	@PUSH
	@CHANGESEGM	ds,PINMNHMHL
	mov	di,cs:telos_nik
	sub	di,6
	@ZEROBBUF	cs:bufar,50
	mov	cx,6
	mov	si,0
balt1:	mov	al,byte ptr [di]
	mov	cs:bufar[si],al
	inc	si
	inc	di
	loop	balt1
	mov	cs:ar_posa,6
	mov	cs:ar_apo,0
	mov	cs:ar_eos,2
	call	do_bas_stat
	@POP
	ret
bale_tel_nik	endp

apo0eos0	proc	near
	@PUSH
	mov	cx,cs:poses_nik
	@ZEROBBUF	cs:bufar,50
	xor	si,si
allir:	push	cx
	mov	dx,cx
	mov	cx,49
	mov	bx,1
allor:	cmp	cs:ar_sires[1500][bx],dl
	jne	allar
	mov	cs:bufar[si],bl
	inc	si
allar:	inc	bx
	loop	allor
	cmp	dx,4
	jae	kitr2
	jmp	isno0
kitr2:	cmp	dx,4
	ja	kitr
	jmp	isno0
kitr1:	@ZEROBBUF	cs:bufar,50
	xor	si,si
kitr:	pop	cx
	loop	allir


	mov	cx,49
	mov	bx,1
	xor	si,si
dallor:	cmp	cs:ar_sires[1500][bx],0
	jne	dallar
	mov	cs:bufar[si],bl
	inc	si
dallar:	inc	bx
	loop	dallor
	cmp	si,0
	je	ousti
	mov	cs:ar_apo,0
	mov	cs:ar_eos,3
	call	do_bas_stat
	
ousti:	@POP
	ret

isno0:	cmp	dx,4
	jae	apo00
	cmp	dx,2
	jae	apo01

	mov	cs:ar_apo,1
	mov	cs:ar_eos,3
	jmp	apopos

apo01:	mov	cs:ar_apo,0
	mov	cs:ar_eos,2
	jmp	apopos

apo00:	mov	cs:ar_apo,0
	mov	cs:ar_eos,1

apopos:	mov	cs:ar_posa,si
	call	do_bas_stat
	jmp	kitr1
apo0eos0	endp

do_bas_stat proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	bx,end_pointer
	cmp	bx,65000
	jbe	xoraist
	@POP
	ret
xoraist:
	mov	byte ptr es:[bx],"W"
	mov	byte ptr es:[bx+3],73
	mov	ax,offset CODE1:bas3
	mov	word ptr es:[bx+8],ax
	mov	ax,offset CODE1:bas2
	mov	word ptr es:[bx+10],ax
	mov	ax,offset CODE1:bas1
	mov	word ptr es:[bx+12],ax
	mov	byte ptr es:[bx+4],254
	mov	byte ptr es:[bx+5],254
	mov	word ptr es:[bx+1],999
	mov	ax,cs:ar_apo
	mov	es:[bx+69],al
	mov	ax,cs:ar_eos
	mov	es:[bx+70],al
	mov	byte ptr es:[bx+71],1
	mov	byte ptr es:[bx+72],6
	mov	di,bx
	add	di,19
	mov	si,0
	mov	ax,2
	xor	bx,bx
	mov	cx,cs:ar_posa
skatast:
	mov	bl,cs:bufar[si]
	mov	es:[bx][di],al
	inc	si
	inc	ax
	loop	skatast
	add	end_pointer,73
	@POP
	ret
do_bas_stat	endp

ariumosires	proc	near
	@PUSH
	@TAKEWIND
	push	ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	warsira
	@SELECTWIND	warsira
	@CHANGESEGM	ds,DATA
	mov	temp1,1
	mov	temp2,12
	mov	temp3,9
janar:	@ITOA	strbuf,2,temp1
	@WPRINT	22,4,strbuf
	@ITOA	strbuf,2,temp2
	@WPRINT	22,5,strbuf
	@ITOA	strbuf,2,temp3
	@WPRINT	22,6,strbuf
	
	@ITOA	strbuf,2,temp1
	@WINPUTNUMBER	22,4,strbuf,pltaf
	pushf
	@ATOI	strbuf,temp1
	popf
	jc	prous1

	@ITOA	strbuf,2,temp2
	@WINPUTNUMBER	22,5,strbuf,pltaf
	pushf
	@ATOI	strbuf,temp2
	popf
prous1:	jc	prous2

	@ITOA	strbuf,2,temp3
	@WINPUTNUMBER	22,6,strbuf,pltaf
	pushf
	@ATOI	strbuf,temp3
	popf
prous2:	jc	prous0
	jmp	janar

prous0:	@UPPERAX
	cmp	al,"T"
	je	okre
	jmp	oustre

okre:	cmp	temp1,0
	je	oustre

	cmp	temp2,12
	je	okre1

	cmp	temp2,18
	je	okre1
	mov	temp2,18

okre1:	cmp	temp3,20
	jbe	okre2
	mov	temp3,20

okre2:	cmp	temp3,5
	jae	okre3
	mov	temp3,5

okre3:	call	find_sires
	jc	oustre
	call	far ptr gentaj
	jmp	kores

oustre:	@BELL
kores:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	warsira
outre:	pop	dx
	@SELECTWI	dl
	@POP
	retf
ariumosires	endp

find_sires	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	ax,temp3
	mov	cs:poses_nik,ax
	call	do_stat
	jnc	oksnex
	@POP
	stc
	ret
oksnex:	mov	ax,temp2
	mov	cs:ar_posa,ax
	xor	dx,dx
	mov	cx,6
	div	cx
	mov	temp2,ax

	mov	cx,50
	xor	bx,bx
arsir1:	mov	al,ar_sires[1500][bx]
	mov	ar_sires[1550][bx],al
	inc	bx
	loop	arsir1

	@STARTRND

	mov	cx,temp1
alliaris:
	push	cx

	mov	cx,50
	xor	bx,bx
arsir2:	mov	al,ar_sires[1550][bx]
	mov	ar_sires[1500][bx],al
	inc	bx
	loop	arsir2

	mov	cx,255
	mov	bx,0
	mov	ax,1
ik24:	mov	byte ptr cs:buffer[bx],al
	inc	ax
	cmp	ax,3
	jbe	ok23
	mov	ax,1
ok23:	inc	bx
	loop	ik24
	@WAIT	1
	@RND
	@RND
	xor	bx,bx
	mov	bl,al
	xor	ax,ax
	mov	al,cs:buffer[bx]
	mov	temp4,ax

	mov	dx,5
	mov	cx,254
	mov	bx,1
	mov	ax,1
ik24i:	mov	byte ptr cs:buffer[bx],al
	inc	ax
	cmp	ax,49
	jbe	ok23i
	mov	ax,dx
	add	dx,5
ok23i:	inc	bx
	loop	ik24i


	@WAIT	1
	xor	di,di
	mov	ax,temp2
	mov	cx,temp4
	mul	cx
	mov	cx,ax
	xor	dx,dx
fanar:	@RND
	@RND
	cmp	al,0
	je	fanar
	xor	bx,bx
	mov	bl,al
	mov	al,cs:buffer[bx]
	mov	bl,al
	cmp	cs:ar_sires[1500][bx],0
	je	sosto
	inc	dx
	cmp	dx,200
	ja	fige10
	jmp	fanar
sosto:	mov	cs:bufar[di],bl
	mov	cs:ar_sires[1500][bx],255
	xor	dx,dx
	inc	di
	loop	fanar

fige10:	@WAIT	1
	mov	ax,temp2
	mov	cx,6
	sub	cx,temp4
	mul	cx
	mov	cx,ax
	xor	dx,dx
fanar1:	@RND
	@RND
	cmp	al,0
	je	fanar1
	xor	bx,bx
	mov	bl,al
	mov	al,cs:buffer[bx]
	mov	bl,al
	cmp	cs:ar_sires[1500][bx],0
	je	err11
	cmp	cs:ar_sires[1500][bx],255
	je	err11
	jmp	sosto1
err11:	inc	dx
	cmp	dx,200
	ja	fige11
	jmp	fanar1
sosto1:	mov	cs:bufar[di],bl
	mov	cs:ar_sires[1500][bx],255
	xor	dx,dx
	inc	di
	loop	fanar1

fige11:	call	do_arsira
	pop	cx
	loop	lliar0
	
	@ENDRND
	@POP
	clc
	ret
lliar0:	jmp	alliaris
find_sires	endp

do_arsira proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	bx,end_pointer
	cmp	bx,65000
	jbe	xoraiar
	@POP
	ret
xoraiar:
	mov	byte ptr es:[bx],"0"
	mov	byte ptr es:[bx+3],73
	mov	ax,offset CODE1:basn3
	mov	word ptr es:[bx+8],ax
	mov	ax,offset CODE1:basn2
	mov	word ptr es:[bx+10],ax
	mov	ax,offset CODE1:basn1
	mov	word ptr es:[bx+12],ax
	mov	byte ptr es:[bx+4],254
	mov	byte ptr es:[bx+5],254
;	mov	word ptr es:[bx+1],999
;	mov	ax,cs:ar_apo
;	mov	es:[bx+69],al
;	mov	ax,cs:ar_eos
;	mov	es:[bx+70],al
;	mov	byte ptr es:[bx+71],1
;	mov	byte ptr es:[bx+72],6
	mov	di,bx
	add	di,19
	mov	si,0
	mov	ax,2
	xor	bx,bx
	mov	cx,cs:ar_posa
skataar:
	mov	bl,cs:bufar[si]
	mov	es:[bx][di],al
	inc	si
	inc	ax
	loop	skataar
	add	end_pointer,73
	@POP
	ret
do_arsira	endp

code4	ends
	end
