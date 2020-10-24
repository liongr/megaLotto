
INCLUDE	mylib.inc
INCLUDE	koina.inc

CODE1	segment	public
	
	assume	cs:CODE1,ds:PINOROI,es:DATA

bar3	proc	near
	xor	ax,ax
	lea	si,es:deltio
	mov	al,es:[si]
	inc	si
	add	al,es:[si]
	inc	si
	add	al,es:[si]
	mov	[di],al
	cmp	ax,word ptr [di][4]
	ja	bar31
	add	ax,es:maxbar
	cmp	ax,word ptr [di][2]
	jb	bar31
	add	di,6
	clc
	ret
bar31:	mov	ax,6
	stc
	ret
bar3	endp

bar2	proc	near
	xor	ax,ax
	mov	al,[di]
	lea	si,es:deltio[3]
	add	al,es:[si]
	inc	si
	add	al,es:[si]
	mov	[di][1],al
	cmp	ax,word ptr [di][4]
	ja	bar21
	add	ax,es:maxbar[2]
	cmp	ax,word ptr [di][2]
	jb	bar21
	add	di,6
	clc
	ret
bar21:	mov	ax,6
	stc
	ret
bar2	endp

bar1	proc	near
	xor	ax,ax
	xor	dx,dx
	mov	al,[di][1]
	mov	dl,es:deltio[5]
	add	ax,dx
	cmp	ax,word ptr [di][4]
	ja	bar11
	cmp	ax,word ptr [di][2]
	jb	bar11
	add	di,6
	clc
	ret
bar11:	mov	ax,6
	stc
	ret
bar1	endp

enal3	proc	near
	xor	dx,dx
	mov	al,es:deltio
	and	al,1
	mov	ah,es:deltio[1]
	and	ah,1
	cmp	al,ah
	je	enal10
	inc	dx
enal10:	mov	al,es:deltio[2]
	and	al,1
	cmp	al,ah
	je	enal20
	inc	dx
enal20:	mov	[di],dl
	cmp	dl,[di][3]
	ja	enal30
	add	dx,3
	cmp	dl,[di][2]
	jb	enal30
	add	di,4
	clc
	ret
enal30:	mov	ax,4
	stc
	ret
enal3	endp

enal2	proc	near
	xor	dx,dx
	mov	dl,[di]
	mov	al,es:deltio[2]
	and	al,1
	mov	ah,es:deltio[3]
	and	ah,1
	cmp	al,ah
	je	enal12
	inc	dx
enal12:	mov	al,es:deltio[4]
	and	al,1
	cmp	al,ah
	je	enal22
	inc	dx
enal22:	mov	[di][1],dl
	cmp	dl,[di][3]
	ja	enal32
	inc	dx
	cmp	dl,[di][2]
	jb	enal32
	add	di,4
	clc
	ret
enal32:	mov	ax,4
	stc
	ret
enal2	endp

enal1	proc	near
	xor	dx,dx
	mov	dl,[di][1]
	mov	al,es:deltio[4]
	and	al,1
	mov	ah,es:deltio[5]
	and	ah,1
	cmp	al,ah
	je	enal11
	inc	dx
enal11:	add	es:emfanisi,dx
	cmp	dl,[di][3]
	ja	enal31
	cmp	dl,[di][2]
	jb	enal31
	add	di,4
	clc
	ret
enal31:	mov	ax,4
	stc
	ret
enal1	endp

tapo3	proc	near
	mov	al,es:deltio
	mov	ah,es:deltio[1]
	mov	dh,ah
	sub	dh,al
	mov	[di],dh
	mov	al,es:deltio[2]
	sub	al,ah
	mov	[di][1],al
	add	di,15
	clc
	ret
tapo23:	mov	ax,15
	stc
	ret
tapo3	endp

tapo2	proc	near
	mov	al,es:deltio[2]
	mov	ah,es:deltio[3]
	mov	dh,ah
	sub	dh,al
	mov	[di][2],dh
	mov	al,es:deltio[4]
	sub	al,ah
	mov	[di][3],al
	add	di,15
	clc
	ret
tapo22:	mov	ax,15
	stc
	ret
tapo2	endp

tapo1	proc	near
	mov	ah,es:deltio[4]
	mov	al,es:deltio[5]
	sub	al,ah
	mov	[di][4],al
	mov	cx,5
	xor	bx,bx
tapo10:	mov	al,[di][bx]
	mov	cs:ptapo[bx],al
	inc	bx
	loop	tapo10
	mov	cx,5
	mov	bx,13
tapo13:	push	di
	push	cx
	xor	si,si
	xor	ax,ax
	mov	cx,5
tapo12:	cmp	al,cs:ptapo[si]
	jae	tapo11
	mov	al,cs:ptapo[si]
	mov	di,si
tapo11:	inc	si
	loop	tapo12
	pop	cx
	mov	cs:ptapo[di],0
	pop	di
	cmp	al,[di][bx]
	jb	tapo24
	cmp	al,[di][bx][1]
	ja	tapo24
	sub	bx,2
	loop	tapo13
	add	di,15
	clc
	ret
tapo24:	mov	ax,15
	stc
	ret
ptapo	db	5 dup(0)
tapo1	endp

ulh3	proc	near
	xor	bx,bx
	mov	bl,es:deltio
	mov	al,es:plhg[bx]
	mov	bl,al
	cmp	byte ptr [di][bx],1
	jne	ulig31
	mov	bl,es:deltio[1]
	mov	al,es:plhg[bx]
	mov	bl,al
	cmp	byte ptr [di][bx][10],1
	jne	ulig31
	mov	bl,es:deltio[2]
	mov	al,es:plhg[bx]
	mov	bl,al
	cmp	byte ptr [di][bx][20],1
	jne	ulig31
	mov	byte ptr [di][60],0
	add	di,62
	clc
	ret
ulig31:	mov	byte ptr [di][60],255
	mov	byte ptr [di][61],255
	mov	ax,62
	stc
	ret
ulh3	endp

ulh2	proc	near
	cmp	byte ptr [di][60],255
	je	ulig21
	xor	bx,bx
	mov	bl,es:deltio[3]
	mov	al,es:plhg[bx]
	mov	bl,al
	cmp	byte ptr [di][bx][30],1
	jne	ulig21
	mov	bl,es:deltio[4]
	mov	al,es:plhg[bx]
	mov	bl,al
	cmp	byte ptr [di][bx][40],1
	jne	ulig21
	mov	byte ptr [di][61],0
	add	di,62
	clc
	ret
ulig21:	mov	byte ptr [di][61],255
	mov	ax,62
	stc
	ret
ulh2	endp

ulh1	proc	near
	cmp	byte ptr [di][61],255
	je	ulig11
	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	mov	bl,al
	cmp	byte ptr [bx][di][50],1
	jne	ulig11
	add	di,62
	clc
	ret
ulig11:	mov	ax,62
	stc
	ret
ulh1	endp

tay3	proc	near
	mov	cx,9
	xor	bx,bx
	xor	ax,ax
ase:	mov	[bx][di],al
	inc	bx
	loop	ase
	mov	cx,3
	xor	bx,bx
tay33:	mov	al,es:deltio[bx]
	push	bx
	mov	si,ax
	mov	bl,es:ptay[si]
	inc	byte ptr [bx][di]
	pop	bx
	inc	bx
	loop	tay33
	mov	si,di
	mov	bx,di
	add	bx,27
	mov	cx,9
tay35:	mov	al,[si]
	cmp	al,[bx][1]
	ja	tay34
	add	al,3
	cmp	al,[bx]
	jb	tay34
	inc	si
	inc	bx
	inc	bx
	loop	tay35
	add	di,45
	clc
	ret
tay34:	mov	ax,45
	stc
	ret
tay3	endp

tay2	proc	near
	push	di
	mov	cx,9
	mov	bx,cx
llt8:	mov	al,[di]
	mov	[bx][di],al
	inc	di
	loop	llt8
	pop	di
	xor	ax,ax
	mov	cx,2
	mov	bx,3
tay23:	mov	al,es:deltio[bx]
	push	bx
	mov	si,ax
	mov	bl,es:ptay[si]
	add	bx,9
	inc	byte ptr [bx][di]
	pop	bx
	inc	bx
	loop	tay23
	mov	si,di
	add	si,9
	mov	bx,di
	add	bx,27
	mov	cx,9
tay352:	mov	al,[si]
	cmp	al,[bx][1]
	ja	tay342
	inc	al
	cmp	al,[bx]
	jb	tay342
	inc	si
	inc	bx
	inc	bx
	loop	tay352
	add	di,45
	clc
	ret
tay342:	mov	ax,45
	stc
	ret
tay2	endp

tay1	proc	near
	push	di
	mov	cx,9
	add	di,cx
	mov	bx,cx
llt81:	mov	al,[di]
	mov	[bx][di],al
	inc	di
	loop	llt81
	pop	di
	xor	ax,ax
	xor	bx,bx
	mov	al,es:deltio[5]
	mov	si,ax
	mov	bl,es:ptay[si]
	add	bx,18
	inc	byte ptr [bx][di]
	mov	si,di
	add	si,18
	mov	bx,si
	mov	cx,9
	add	bx,cx
tay351:	mov	al,[si]
	cmp	al,[bx][1]
	ja	tay341
	cmp	al,[bx]
	jb	tay341
	inc	si
	inc	bx
	inc	bx
	loop	tay351
	add	di,45
	clc
	ret
tay341:	mov	ax,45
	stc
	ret
tay1	endp

ajv3	proc	near
	xor	dx,dx
	mov	al,es:deltio[1]
	mov	dl,al
	mov	ah,es:deltio
	sub	dl,ah
	mov	ah,es:deltio[2]
	sub	ah,al
	cmp	dl,ah
	jne	ajv31
	inc	dh
ajv31:	mov	[di],dh
	cmp	dh,[di][3]
	ja	ajv32
	add	di,4
	clc
	ret
ajv32:	mov	ax,4
	stc
	ret
ajv3	endp

ajv2	proc	near
	mov	dh,[di]
	mov	al,es:deltio[2]
	mov	dl,al
	mov	ah,es:deltio[1]
	sub	dl,ah
	mov	ah,es:deltio[3]
	sub	ah,al
	cmp	dl,ah
	jne	ajv21
	inc	dh
ajv21:	mov	ah,es:deltio[3]
	mov	dl,ah
	mov	al,es:deltio[2]
	sub	dl,al
	mov	al,es:deltio[4]
	sub	al,ah
	cmp	dl,al
	jne	ajv23
	inc	dh
ajv23:	mov	[di][1],dh
	cmp	dh,[di][3]
	ja	ajv22
	inc	dh
	cmp	dh,[di][2]
	jb	ajv22
	add	di,4
	clc
	ret
ajv22:	mov	ax,4
	stc
	ret
ajv2	endp

ajv1	proc	near
	mov	dh,[di][1]
	mov	al,es:deltio[4]
	mov	dl,al
	mov	ah,es:deltio[3]
	sub	dl,ah
	mov	ah,es:deltio[5]
	sub	ah,al
	cmp	dl,ah
	jne	ajv11
	inc	dh
ajv11:	xor	ax,ax
	mov	al,dh
	add	es:emfanisi,ax
	cmp	dh,[di][3]
	ja	ajv12
	cmp	dh,[di][2]
	jb	ajv12
	add	di,4
	clc
	ret
ajv12:	mov	ax,4
	stc
	ret
ajv1	endp

sym3	proc	near
	xor	dx,dx
	mov	[di][51],dl
	mov	[di][52],dl
	mov	[di][53],dl
	mov	[di][54],dl
	mov	[di][55],dl
	xor	bx,bx
	mov	bl,es:deltio
	mov	al,[di][bx]
	cmp	al,es:deltio[1]
	ja	sym31
	jb	sym32
	inc	dx
	mov	byte ptr [di][52],1
	mov	byte ptr [di][51],1
	jmp	sym33
sym31:	cmp	al,es:deltio[2]
	jb	sym32
	ja	sym39
	inc	dx
	mov	byte ptr [di][53],1
	mov	byte ptr [di][51],1
	jmp	sym33
sym32:	mov	byte ptr [di][51],1
sym39:	mov	bl,es:deltio[1]
	mov	al,[di][bx]
	cmp	al,es:deltio[2]
	jb	sym35
	ja	sym33
	inc	dx
	mov	byte ptr [di][53],1
sym35:	mov	byte ptr [di][52],1
sym33:	mov	[di],dl
	cmp	dl,[di][57]
	ja	sym34
	add	dl,3
	cmp	dl,[di][56]
	jb	sym34
	add	di,58
	clc
	ret
sym34:	mov	ax,58
	stc
	ret
sym3	endp

sym2	proc	near
	xor	bx,bx
	xor	dx,dx
	mov	dl,[di]
	cmp	byte ptr [di][51],1
	je	sym21
	mov	bl,es:deltio
	mov	al,[bx][di]
	cmp	al,es:deltio[3]
	ja	sym212
	jb	sym21
	inc	dx
	jmp	sym21
sym212:	cmp	al,es:deltio[4]
	jne	sym21
	inc	dx
sym21:	cmp	byte ptr [di][52],1
	je	sym22
	mov	bl,es:deltio[1]
	mov	al,[bx][di]
	cmp	al,es:deltio[3]
	ja	sym222
	jb	sym22
	inc	dx
	jmp	sym22
sym222:	cmp	al,es:deltio[4]
	jne	sym22
	inc	dx
sym22:	cmp	byte ptr [di][53],1
	je	sym23
	mov	bl,es:deltio[2]
	mov	al,[bx][di]
	cmp	al,es:deltio[3]
	ja	sym232
	jb	sym23
	inc	dx
	jmp	sym23
sym232:	cmp	al,es:deltio[4]
	jne	sym23
	inc	dx
sym23:	mov	bl,es:deltio[3]
	mov	al,[bx][di]
	cmp	al,es:deltio[4]
	jne	sym24
	inc	dx
sym24:	mov	[di][50],dl
	cmp	dl,[di][57]
	ja	sym342
	inc	dl
	cmp	dl,[di][56]
	jb	sym342
	add	di,58
	clc
	ret
sym342:	mov	ax,58
	stc
	ret
sym2	endp

sym1	proc	near
	xor	bx,bx
	xor	dx,dx
	mov	dl,[di][50]
	mov	bl,es:deltio[5]
	mov	al,[di][bx]
	mov	cx,5
	xor	si,si
sym12:	cmp	al,es:deltio[si]
	jne	sym11
	inc	dx
	jmp	sym13
sym11:	inc	si
	loop	sym12
sym13:	add	es:emfanisi,dx
	cmp	dl,[di][57]
	ja	sym341
	cmp	dl,[di][56]
	jb	sym341
	add	di,58
	clc
	ret
sym341:	mov	ax,58
	stc
	ret
sym1	endp

eyr3	proc	near
	mov	al,es:deltio
	add	al,[di][1]
	sub	al,3
	cmp	al,es:deltio[1]
	jbe	eyr31
	inc	al
	cmp	al,es:deltio[2]
	jbe	eyr31
	add	di,2
	clc
	ret
eyr31:	mov	ax,2
	stc
	ret
eyr3	endp

eyr2	proc	near
	mov	al,es:deltio
	add	al,[di][1]
	sub	al,1
	cmp	al,es:deltio[3]
	jbe	eyr32
	inc	al
	cmp	al,es:deltio[4]
	jbe	eyr32
	add	di,2
	clc
	ret
eyr32:	mov	ax,2
	stc
	ret
eyr2	endp

eyr1	proc	near
	xor	ax,ax
	mov	al,es:deltio[5]
	sub	al,es:deltio
	add	es:emfanisi,ax
	cmp	al,[di]
	jb	eyr33
	cmp	al,[di][1]
	ja	eyr33
	add	di,2
	clc
	ret
eyr33:	mov	ax,2
	stc
	ret
eyr1	endp

mzu3	proc	near
	lea	bx,es:deltio
	mov	ah,[di]
	cmp	ah,0
	je	mzu31
	mov	al,es:[bx]
	xor	al,ah
	and	al,1
	jnz	mzu33
mzu31:	inc	bx
	mov	ah,[di][1]
	cmp	ah,0
	je	mzu32
	mov	al,es:[bx]
	xor	al,ah
	and	al,1
	jnz	mzu33
mzu32:	inc	bx
	mov	ah,[di][2]
	cmp	ah,0
	je	mzu34
	mov	al,es:[bx]
	xor	al,ah
	and	al,1
	jnz	mzu33
mzu34:	mov	byte ptr [di][6],0
	add	di,8
	clc
	ret
mzu33:	mov	byte ptr [di][6],255
	mov	ax,8
	stc
	ret
mzu3	endp

mzu2	proc	near
	cmp	byte ptr [di][6],255
	jne	ttm
	jmp	mzu23
ttm:	lea	bx,es:deltio[3]
	mov	ah,[di][3]
	cmp	ah,0
	je	mzu21
	mov	al,es:[bx]
	xor	al,ah
	and	al,1
	jnz	mzu23
mzu21:	inc	bx
	mov	ah,[di][4]
	cmp	ah,0
	je	mzu24
	mov	al,es:[bx]
	xor	al,ah
	and	al,1
	jnz	mzu23
mzu24:	mov	byte ptr [di][7],0
	add	di,8
	clc
	ret
mzu23:	mov	byte ptr [di][7],255
	mov	ax,8
	stc
	ret
mzu2	endp

mzu1	proc	near
	cmp	byte ptr [di][7],255
	jne	hht
	jmp	mzu13
hht:	mov	ah,[di][5]
	cmp	ah,0
	je	mzu14
	mov	al,es:deltio[5]
	xor	al,ah
	and	al,1
	jnz	mzu13
mzu14:	add	di,8
	clc
	ret
mzu13:	mov	ax,8
	stc
	ret
mzu1	endp

par3	proc	near
	xor	ax,ax
	lea	bx,es:deltio[2]
	mov	cx,3
par31:	mov	al,es:[bx]
	and	al,1
	ror	ax,1
	dec	bx
	loop	par31
	mov	[di],ah
	cmp	byte ptr [di][2],3
	ja	par34
	mov	cx,4
	sub	cl,[di][2]
par33:	mov	al,ah
	and	al,[di][3]
	cmp	al,[di][4]
	je	par32
	sal	ah,1
	loop	par33
par34:	add	di,5
	clc
	ret
par32:	mov	byte ptr [di],255
	mov	byte ptr [di][1],255
	add	di,5
	clc
	ret
par3	endp

par2	proc	near
	cmp	byte ptr [di],255
	je	par23
	xor	ax,ax
	lea	bx,es:deltio[4]
	mov	cx,2
par22:	mov	al,es:[bx]
	and	al,1
	ror	ax,1
	dec	bx
	loop	par22
	shr	ah,1
	shr	ah,1
	shr	ah,1
	or	ah,[di]
	mov	[di][1],ah
	cmp	byte ptr [di][2],5
	ja	par23
	mov	cx,6
	sub	cl,[di][2]
par24:	mov	al,ah
	and	al,[di][3]
	cmp	al,[di][4]
	je	par25
	sal	ah,1
	loop	par24
par23:	add	di,5
	clc
	ret
par25:	mov	byte ptr [di][1],255
	add	di,5
	clc
	ret
par2	endp

par1	proc	near
	cmp	byte ptr [di][1],255
	je	par15
	cmp	byte ptr [di][2],0
	je	par15 
	xor	ax,ax
	mov	al,es:deltio[5]
	and	al,1
	ror	ax,1
	shr	ah,1
	shr	ah,1
	shr	ah,1
	shr	ah,1
	shr	ah,1
	or	ah,[di][1]
	mov	cx,7
	sub	cl,[di][2]
par14:	mov	al,ah
	and	al,[di][3]
	cmp	al,[di][4]
	je	par15
	sal	ah,1
	loop	par14
	mov	ax,5
	stc
	ret
par15:	add	di,5
	clc
	ret
par1	endp

syen3	proc	near
	lea	bx,es:deltio[2]
	xor	ax,ax
	mov	cx,3
syen31:	mov	ah,es:[bx]
	and	ah,1
	shr	ax,1
	dec	bx
	loop	syen31
	mov	cl,5
	shr	ax,cl
	xchg	bx,ax
	mov	al,es:psyen[bx]
	cmp	al,[di][1]
	ja	syen32
	add	di,2
	clc
	ret
syen32:	mov	ax,2
	stc
	ret
syen3	endp

syen2	proc	near
	lea	bx,es:deltio[4]
	xor	ax,ax
	mov	cx,5
syen21:	mov	ah,es:[bx]
	and	ah,1
	shr	ax,1
	dec	bx
	loop	syen21
	mov	cl,3
	shr	ax,cl
	xchg	bx,ax
	mov	al,es:psyen[bx][8]
	cmp	al,[di][1]
	ja	syen22
	add	al,1
	cmp	al,[di]
	jb	syen22
	add	di,2
	clc
	ret
syen22:	mov	ax,2
	stc
	ret
syen2	endp

syen1	proc	near
	lea	bx,es:deltio[5]
	xor	ax,ax
	mov	cx,6
syen11:	mov	ah,es:[bx]
	and	ah,1
	shr	ax,1
	dec	bx
	loop	syen11
	mov	cl,2
	shr	ax,cl
	xchg	bx,ax
	mov	al,es:psyen[bx][40]
	mov	ah,0
	add	es:emfanisi,ax
	cmp	al,[di][1]
	ja	syen12
	cmp	al,[di]
	jb	syen12
	add	di,2
	clc
	ret
syen12:	mov	ax,2
	stc
	ret
syen1	endp

dias3	proc	near
	lea	bx,es:deltio
	mov	byte ptr [di],0
	mov	al,es:[bx]
	cmp	al,[di][2]
	jb	dias31
	cmp	al,[di][3]
	ja	dias31
	mov	al,es:[bx][1]
	cmp	al,[di][4]
	jb	dias31
	cmp	al,[di][5]
	ja	dias31
	mov	al,es:[bx][2]
	cmp	al,[di][6]
	jb	dias31
	cmp	al,[di][7]
	ja	dias31
	add	di,14
	clc
	ret
dias31:	mov	byte ptr [di],255
	mov	ax,14
	stc
	ret
dias3	endp

dias2	proc	near
	cmp	byte ptr [di],255
	je	dias21
	mov	byte ptr [di][1],0
	lea	bx,es:deltio[3]
	mov	al,es:[bx]
	cmp	al,[di][8]
	jb	dias21
	cmp	al,[di][9]
	ja	dias21
	mov	al,es:[bx][1]
	cmp	al,[di][10]
	jb	dias21
	cmp	al,[di][11]
	ja	dias21
	add	di,14
	clc
	ret
dias21:	mov	byte ptr [di][1],255
	mov	ax,14
	stc
	ret
dias2	endp

dias1	proc	near
	cmp	byte ptr [di][1],255
	je	dias11
	mov	al,es:deltio[5]
	cmp	al,[di][12]
	jb	dias11
	cmp	al,[di][13]
	ja	dias11
	add	di,14
	clc
	ret
dias11:	mov	ax,14
	stc
	ret
dias1	endp

symz3	proc	near
	add	di,3
	clc
	ret
symz3	endp

symz2	proc	near
	lea	bx,es:deltio
	xor	dx,dx
	mov	al,es:[bx][1]
	and	al,1
	mov	ah,es:[bx][4]
	and	ah,1
	xor	al,ah
	jnz	symz21
	inc	dx
symz21:	mov	al,es:[bx][2]
	and	al,1
	mov	ah,es:[bx][3]
	and	ah,1
	xor	al,ah
	jnz	symz22
	inc	dx
symz22:	mov	[di],dl
	cmp	dl,[di][2]
	ja	symz23
	inc	dl
	cmp	dl,[di][1]
	jb	symz23
	add	di,3
	clc
	ret
symz23:	mov	ax,3
	stc
	ret
symz2	endp

symz1	proc	near
	lea	bx,es:deltio
	xor	dx,dx
	mov	dl,[di]
	mov	al,es:[bx]
	and	al,1
	mov	ah,es:[bx][5]
	and	ah,1
	xor	al,ah
	jnz	symz11
	inc	dx
symz11:	add	es:emfanisi,dx
	cmp	dl,[di][2]
	ja	symz13
	cmp	dl,[di][1]
	jb	symz13
	add	di,3
	clc
	ret
symz13:	mov	ax,3
	stc
	ret
symz1	endp

osa3	proc	near
	xor	ax,ax
	xor	cl,cl
	xor	bx,bx
	mov	bl,es:deltio
	mov	al,es:psyn[bx]
	inc	al
	mov	bl,es:deltio[1]
	mov	dl,es:psyn[bx]
	cmp	al,dl
	jne	osa31
	inc	cl
	jmp	osa32
osa31:	mov	ah,1
osa32:	inc	dl
	mov	bl,es:deltio[2]
	cmp	dl,es:psyn[bx]
	jne	osa33

	cmp	ah,0
	je	osa35
	mov	ah,0
	inc	cl
	jmp	osa35

osa33:	mov	ah,1
osa35:	mov	[di],ah
	mov	[di][1],cl
	add	di,6
	clc
	ret
osa3	endp

osa2	proc	near
	xor	bx,bx
	mov	ah,[di]
	mov	cl,[di][1]
	mov	bl,es:deltio[2]
	mov	al,es:psyn[bx]
	inc	al
	mov	bl,es:deltio[3]
	mov	dl,es:psyn[bx]
	cmp	al,dl
	jne	osa36

	cmp	ah,0
	je	osa38
	mov	ah,0
	inc	cl
	jmp	osa38

osa36:	mov	ah,1
osa38:	inc	dl
	mov	bl,es:deltio[4]
	cmp	dl,es:psyn[bx]
	jne	osa39

	cmp	ah,0
	je	osa41
	mov	ah,0
	inc	cl
	jmp	osa41

osa39:	mov	ah,1
osa41:	mov	[di][2],ah
	mov	[di][3],cl
	cmp	cl,[di][5]
	ja	osa42
	inc	cl
	cmp	cl,[di][4]
	jb	osa42
	add	di,6
	clc
	ret
osa42:	mov	ax,6
	stc
	ret
osa2	endp

osa1	proc	near
	xor	bx,bx
	xor	cx,cx
	mov	ah,[di][2]
	mov	cl,[di][3]

	mov	bl,es:deltio[4]
	mov	al,es:psyn[bx]
	inc	al
	mov	bl,es:deltio[5]
	cmp	al,es:psyn[bx]
	jne	osa13

	cmp	ah,0
	je	osa13
	inc	cx
osa13:	add	es:emfanisi,cx
	cmp	cl,[di][5]
	ja	osa12
	cmp	cl,[di][4]
	jb	osa12
	add	di,6
	clc
	ret
osa12:	mov	ax,6
	stc
	ret
osa1	endp

osl3	proc	near
	xor	ax,ax
	xor	cx,cx
	xor	bx,bx
	mov	bl,es:deltio
	mov	al,es:plhg[bx]
	mov	bl,es:deltio[1]
	mov	dl,es:plhg[bx]
	cmp	al,dl
	jne	osl31

	inc	cl
	jmp	osl32
osl31:	mov	ah,1
osl32:	mov	bl,es:deltio[2]
	cmp	dl,es:plhg[bx]
	jne	osl33

	cmp	ah,0
	je	osl35
	mov	ah,0
	inc	cl
	jmp	osl35

osl33:	mov	ah,1
osl35:	mov	[di],ah
	mov	[di][1],cl
	add	di,6
	clc
	ret
osl3	endp

osl2	proc	near
	xor	bx,bx
	mov	ah,[di]
	mov	cl,[di][1]
	mov	bl,es:deltio[2]
	mov	al,es:plhg[bx]
	mov	bl,es:deltio[3]
	mov	dl,es:plhg[bx]
	cmp	al,dl
	jne	osl36

	cmp	ah,0
	je	osl38
	mov	ah,0
	inc	cl
	jmp	osl38

osl36:	mov	ah,1
osl38:	mov	bl,es:deltio[4]
	cmp	dl,es:plhg[bx]
	jne	osl39

	cmp	ah,0
	je	osl41
	mov	ah,0
	inc	cl
	jmp	osl41

osl39:	mov	ah,1
osl41:	mov	[di][2],ah
	mov	[di][3],cl
	cmp	cl,[di][5]
	ja	osl42
	inc	cl
	cmp	cl,[di][4]
	jb	osl42
	add	di,6
	clc
	ret
osl42:	mov	ax,6
	stc
	ret
osl2	endp

osl1	proc	near
	xor	cx,cx
	xor	bx,bx
	mov	ah,[di][2]
	mov	cl,[di][3]

	mov	bl,es:deltio[4]
	mov	al,es:plhg[bx]
	mov	bl,es:deltio[5]
	cmp	al,es:plhg[bx]
	jne	osl13

	cmp	ah,0
	je	osl13
	inc	cx
osl13:	add	es:emfanisi,cx
	cmp	cl,[di][5]
	ja	osl12
	cmp	cl,[di][4]
	jb	osl12
	add	di,6
	clc
	ret
osl12:	mov	ax,6
	stc
	ret
osl1	endp

syl3	proc near
	mov	dx,1
	xor	bx,bx
	xor	cx,cx
	mov	bl,es:deltio
	mov	ah,es:plhg[bx]
	mov	bl,es:deltio[1]
	mov	al,es:plhg[bx]
	cmp	ah,al
	jne	asyl1
	inc	dx
asyl1:	mov	bl,es:deltio[2]
	mov	ah,es:plhg[bx]
	cmp	ah,al
	jne	asyl2
	inc	dx
	jmp	asyl4
asyl2:	mov	cx,dx
	mov	dx,1
asyl4:	mov	[di],dl
	mov	[di][1],cl
	cmp	dx,cx
	jae	asyl5
	mov	dx,cx
asyl5:	cmp	dl,[di][5]
	ja	asyl3
	add	dx,3
	cmp	dl,[di][4]
	jb	asyl3
	add	di,6
	clc
	ret
asyl3:	mov	ax,6
	stc
	ret
syl3	endp

syl2	proc near
	xor	dx,dx
	xor	cx,cx
	xor	bx,bx
	mov	dl,[di]
	mov	cl,[di][1]
	mov	bl,es:deltio[2]
	mov	ah,es:plhg[bx]
	mov	bl,es:deltio[3]
	mov	al,es:plhg[bx]
	cmp	ah,al
	jne	asyl12
	inc	dx
	jmp	asyl13
asyl12:	cmp	cx,dx
	jae	asyl14
	mov	cx,dx
asyl14:	mov	dx,1
asyl13:	mov	bl,es:deltio[4]
	mov	ah,es:plhg[bx]
	cmp	ah,al
	jne	asyl22
	inc	dx
	jmp	asyl23
asyl22:	cmp	cx,dx
	jae	asyl15
	mov	cx,dx
asyl15:	mov	dx,1
asyl23:	mov	[di][2],dl
	mov	[di][3],cl
	cmp	dx,cx
	jae	asyl24
	mov	dx,cx		;mov cx,dx
asyl24:	cmp	dl,[di][5]
	ja	asyl32
	inc	dx
	cmp	dl,[di][4]
	jb	asyl32
	add	di,6
	clc
	ret
asyl32:	mov	ax,6
	stc
	ret
syl2	endp

syl1	proc near
	xor	dx,dx
	xor	bx,bx
	xor	cx,cx
	mov	dl,[di][2]
	mov	cl,[di][3]
	mov	bl,es:deltio[4]
	mov	ah,es:plhg[bx]
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	cmp	ah,al
	jne	asyl11
	inc	dx
asyl11:	cmp	dx,cx
	jae	asyl35
	mov	dx,cx
asyl35:	add	es:emfanisi,dx
	cmp	dl,[di][5]
	ja	asyl31
	cmp	dl,[di][4]
	jb	asyl31
	add	di,6
	clc
	ret
asyl31:	mov	ax,6
	stc
	ret
syl1	endp

ali3	proc	near
	xor	bx,bx
	xor	ax,ax
	mov	cx,10
ali30:	mov	[di][bx],al
	inc	bx
	loop	ali30
	mov	cx,3
	lea	si,es:deltio
ali31:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	mov	bx,ax
	inc	byte ptr [di][bx]
	inc	si
	loop	ali31
	mov	cx,10
	mov	bx,di
	mov	di,30
	xor	si,si
ali34:	mov	al,[bx][si]
	cmp	al,[bx][di][1]
	ja	ali33
	add	al,3
	cmp	al,[bx][di]
	jb	ali33
	inc	si
	add	di,2
	loop	ali34
	mov	di,bx
	add	di,50
	clc
	ret
ali33:	mov	di,bx
	mov	ax,50
	stc
	ret
ali3	endp

ali2	proc	near
	xor	bx,bx
	mov	cx,10
ali20:	mov	al,[di][bx]
	mov	[di][bx][10],al
	inc	bx
	loop	ali20
	xor	ax,ax
	mov	cx,2
	lea	si,es:deltio[3]
ali21:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	mov	bx,ax
	inc	byte ptr [di][bx][10]
	inc	si
	loop	ali21
	mov	cx,10
	mov	bx,di
	mov	di,30
	mov	si,10
ali24:	mov	al,[bx][si]
	cmp	al,[bx][di][1]
	ja	ali23
	inc	al
	cmp	al,[bx][di]
	jb	ali23
	inc	si
	add	di,2
	loop	ali24
	mov	di,bx
	add	di,50
	clc
	ret
ali23:	mov	di,bx
	mov	ax,50
	stc
	ret
ali2	endp

ali1	proc	near
	mov	bx,10
	mov	cx,10
ali10:	mov	al,[di][bx]
	mov	[di][bx][10],al
	inc	bx
	loop	ali10
	xor	ax,ax
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	mov	bx,ax
	inc	byte ptr [di][bx][20]
	mov	cx,10
	mov	bx,di
	mov	di,30
	mov	si,20
ali14:	mov	al,[bx][si]
	cmp	al,[bx][di][1]
	ja	ali13
	cmp	al,[bx][di]
	jb	ali13
	inc	si
	add	di,2
	loop	ali14
	mov	di,bx
	add	di,50
	clc
	ret
ali13:	mov	di,bx
	mov	ax,50
	stc
	ret
ali1	endp

blh3	proc	near
	xor	bx,bx
	mov	bl,es:deltio
	mov	al,es:pblhg[bx]
	mov	bl,es:deltio[1]
	add	al,es:pblhg[bx]
	mov	bl,es:deltio[2]
	add	al,es:pblhg[bx]
	mov	[di][0],al
	cmp	al,[di][3]
	ja	blig31
	add	di,4
	clc
	ret
blig31:	mov	ax,4
	stc
	ret
blh3	endp

blh2	proc	near
	mov	al,[di]
	xor	bx,bx
	mov	bl,es:deltio[3]
	add	al,es:pblhg[bx]
	mov	bl,es:deltio[4]
	add	al,es:pblhg[bx]
	mov	[di][1],al
	cmp	al,[di][3]
	ja	blig21
	add	di,4
	clc
	ret
blig21:	mov	ax,4
	stc
	ret
blh2	endp

blh1	proc	near
	xor	ax,ax
	mov	al,[di][1]
	xor	bx,bx
	mov	bl,es:deltio[5]
	add	al,es:pblhg[bx]
	add	es:emfanisi,ax
	cmp	al,[di][2]
	jb	blig11
	cmp	al,[di][3]
	ja	blig11
	add	di,4
	clc
	ret
blig11:	mov	ax,4
	stc
	ret
blh1	endp

aap3	proc	near
	lea	bx,es:deltio
	mov	al,es:[bx]
	mov	ah,es:[bx][1]
	mov	dh,ah
	sub	ah,al
	cmp	ah,[di][2]
	jb	aap31
	cmp	ah,[di][3]
	ja	aap31
	mov	ah,es:[bx][2]
	mov	dl,ah
	sub	ah,al
	cmp	ah,[di][4]
	jb	aap31
	cmp	ah,[di][5]
	ja	aap31
	sub	dl,dh
	cmp	dl,[di][12]
	jb	aap31
	cmp	dl,[di][13]
	ja	aap31
	mov	byte ptr [di],0
	add	di,32
	clc
	ret
aap31:	mov	byte ptr [di],255
	mov	ax,32
	stc
	ret
aap3	endp

aap2	proc	near
	cmp	byte ptr [di],0
	jne	aap21
	lea	bx,es:deltio
	mov	al,es:[bx]
	mov	ah,es:[bx][3]
	mov	dh,ah
	sub	ah,al
	cmp	ah,[di][6]
	jb	aap21
	cmp	ah,[di][7]
	ja	aap21
	mov	ah,es:[bx][4]
	mov	dl,ah
	sub	ah,al
	cmp	ah,[di][8]
	jb	aap21
	cmp	ah,[di][9]
	ja	aap21
	mov	al,dl
	sub	dl,dh
	cmp	dl,[di][26]
	jb	aap21
	cmp	dl,[di][27]
	ja	aap21
	mov	ah,es:[bx][1]
	mov	dl,dh
	sub	dh,ah
	cmp	dh,[di][14]
	jb	aap21
	cmp	dh,[di][15]
	ja	aap21
	mov	dh,al
	sub	al,ah
	cmp	al,[di][16]
	jb	aap21
	cmp	al,[di][17]
	ja	aap21
	mov	al,es:[bx][2]
	sub	dl,al
	cmp	dl,[di][20]
	jb	aap21
	cmp	dl,[di][21]
	ja	aap21
	sub	dh,al
	cmp	dh,[di][22]
	jb	aap21
	cmp	dh,[di][23]
	ja	aap21
	mov	byte ptr [di][1],0
	add	di,32
	clc
	ret
aap21:	mov	byte ptr [di][1],255
	mov	ax,32
	stc
	ret
aap2	endp

aap1	proc	near
	cmp	byte ptr [di][1],0
	jne	aap11
	lea	bx,es:deltio
	mov	al,es:[bx]
	mov	ah,es:[bx][5]
	mov	dh,ah
	sub	ah,al
	cmp	ah,[di][10]
	jb	aap11
	cmp	ah,[di][11]
	ja	aap11
	mov	al,es:[bx][1]
	mov	dl,dh
	sub	dl,al
	cmp	dl,[di][18]
	jb	aap11
	cmp	dl,[di][19]
	ja	aap11
	mov	al,es:[bx][2]
	mov	dl,dh
	sub	dl,al
	cmp	dl,[di][24]
	jb	aap11
	cmp	dl,[di][25]
	ja	aap11
	mov	al,es:[bx][3]
	mov	dl,dh
	sub	dl,al
	cmp	dl,[di][28]
	jb	aap11
	cmp	dl,[di][29]
	ja	aap11
	mov	al,es:[bx][4]
	sub	dh,al
	cmp	dh,[di][30]
	jb	aap11
	cmp	dh,[di][31]
	ja	aap11
	add	di,32
	clc
	ret
aap11:	mov	ax,32
	stc
	ret
aap1	endp

p103	proc	near
	mov	cx,5
	xor	ax,ax
	xor	bx,bx
p1030:	mov	[di][bx],al
	inc	bx
	loop	p1030
	lea	si,es:deltio

	mov	cx,3
p1031:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:pp10[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	p1031

	mov	cx,5
	mov	bx,4
p1033:	cmp	byte ptr [di][bx],0
	jne	p10321
	dec	bx
	loop	p1033

p10321:	cmp	byte ptr [di][bx],3
	jne	p1032
	jmp	p10322

p1035:	mov	dl,[bx][di]
	cmp	dl,0
	jne	p1034
p1032:	dec	bx
	loop	p1035

p1034:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p10383:	push	cx
	mov	cx,2
p1038:	cmp	dl,[di][bx]
	je	p1037
	inc	bx
	loop	p1038
	add	bx,4
	pop	cx
	loop	p10383

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p1037:	pop	ax
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret

p10322:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p10381:	cmp	byte ptr [di][bx],3
	jae	p10371
	add	bx,6
	loop	p10381

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p10371:	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
p103	endp

p102	proc	near
	mov	cx,5
	xor	ax,ax
	xor	bx,bx
p1020:	mov	al,[di][bx]
	mov	[di][bx][5],al
	inc	bx
	loop	p1020
	lea	si,es:deltio[3]
	mov	cx,2
p1021:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:pp10[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][5]
	inc	si
	loop	p1021

	xor	si,si
	mov	cx,5
	mov	bx,9
p1023:	cmp	byte ptr [di][bx],0
	jne	p10221
	dec	bx
	loop	p1023

p10221:	cmp	byte ptr [di][bx],5
	jne	p1022
	jmp	p10222

p1025:	mov	dl,[bx][di]
	cmp	dl,0
	je	p1022
	mov	cs:_psyn[si],dl
	inc	si
p1022:	dec	bx
	loop	p1025
	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
p10213:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
p10212:	cmp	cs:_psyn[bx],al
	jbe	p10211
	mov	al,cs:_psyn[bx]
	mov	si,bx
p10211:	inc	bx
	loop	p10212
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	p10213
	pop	di

	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p10215:	push	cx
	mov	cx,2
p10218:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	p10219
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	p10216
	xor	si,si
p10217:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	p10229
	loop	p10217
	jmp	p10216
p10229:	pop	bx
	pop	cx
p10219:	inc	bx
	loop	p10218
	add	bx,4
	pop	cx
	loop	p10215
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret
p10216:	pop	ax
	pop	ax
	pop	ax
	jmp	p10271

p10222:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p10281:	cmp	byte ptr [bx][di],5
	jae	p10271
	add	bx,6
	loop	p10281

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p10271:	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
p102	endp

p101	proc	near
	mov	cx,5
	mov	bx,5
p1010:	mov	al,[di][bx]
	mov	[di][bx][5],al
	inc	bx
	loop	p1010

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:pp10[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][10]

	xor	si,si
	mov	cx,5
	mov	bx,14

p1015:	mov	dl,[bx][di]
	cmp	dl,0
	je	p1012
	mov	cs:_psyn[si],dl
	inc	si
p1012:	dec	bx
	loop	p1015

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
p10113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
p10112:	cmp	cs:_psyn[bx],al
	jbe	p10111
	mov	al,cs:_psyn[bx]
	mov	si,bx
p10111:	inc	bx
	loop	p10112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	p10113
	pop	di

	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p10118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	p10114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	p10116
	xor	si,si
p10117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	p10129
	loop	p10117
	jmp	p10116
p10129:	pop	bx
	pop	cx
p10114:	add	bx,6
	loop	p10118
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p10116:	pop	ax
	pop	ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
_psyn	db	10 dup(0)
_psyn1	db	10 dup(0)
p101	endp

pom3	proc	near
	mov	cx,5
	xor	ax,ax
	xor	bx,bx
pom30:	mov	[di][bx],al
	inc	bx
	loop	pom30
	lea	si,es:deltio

	mov	cx,3
pom31:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppom[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	pom31

	mov	cx,5
	mov	bx,4
pom33:	cmp	byte ptr [di][bx],0
	jne	pom321
	dec	bx
	loop	pom33

pom321:	cmp	byte ptr [di][bx],3
	jne	pom32
	jmp	pom322

pom35:	mov	dl,[bx][di]
	cmp	dl,0
	jne	pom34
pom32:	dec	bx
	loop	pom35

pom34:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
pom383:	push	cx
	mov	cx,2
pom38:	cmp	dl,[di][bx]
	je	pom37
	inc	bx
	loop	pom38
	add	bx,4
	pop	cx
	loop	pom383

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

pom37:	pop	ax
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret

pom322:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
pom381:	cmp	byte ptr [di][bx],3
	jae	pom371
	add	bx,6
	loop	pom381

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

pom371:	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
pom3	endp

pom2	proc	near
	mov	cx,5
	xor	ax,ax
	xor	bx,bx
pom20:	mov	al,[di][bx]
	mov	[di][bx][5],al
	inc	bx
	loop	pom20
	lea	si,es:deltio[3]
	mov	cx,2
pom21:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppom[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][5]
	inc	si
	loop	pom21

	xor	si,si
	mov	cx,5
	mov	bx,9
pom23:	cmp	byte ptr [di][bx],0
	jne	pom221
	dec	bx
	loop	pom23

pom221:	cmp	byte ptr [di][bx],5
	jne	pom22
	jmp	pom222

pom25:	mov	dl,[bx][di]
	cmp	dl,0
	je	pom22
	mov	cs:_psyn[si],dl
	inc	si
pom22:	dec	bx
	loop	pom25
	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
pom213:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
pom212:	cmp	cs:_psyn[bx],al
	jbe	pom211
	mov	al,cs:_psyn[bx]
	mov	si,bx
pom211:	inc	bx
	loop	pom212
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	pom213
	pop	di

	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
pom215:	push	cx
	mov	cx,2
pom218:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	pom219
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	pom216
	xor	si,si
pom217:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	pom229
	loop	pom217
	jmp	pom216
pom229:	pop	bx
	pop	cx
pom219:	inc	bx
	loop	pom218
	add	bx,4
	pop	cx
	loop	pom215
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret
pom216:	pop	ax
	pop	ax
	pop	ax
	jmp	pom271

pom222:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
pom281:	cmp	byte ptr [bx][di],5
	jae	pom271
	add	bx,6
	loop	pom281

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

pom271:	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
pom2	endp

pom1	proc	near
	mov	cx,5
	mov	bx,5
pom10:	mov	al,[di][bx]
	mov	[di][bx][5],al
	inc	bx
	loop	pom10

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:ppom[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][10]

	xor	si,si
	mov	cx,5
	mov	bx,14

pom15:	mov	dl,[bx][di]
	cmp	dl,0
	je	pom12
	mov	cs:_psyn[si],dl
	inc	si
pom12:	dec	bx
	loop	pom15

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
pom113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
pom112:	cmp	cs:_psyn[bx],al
	jbe	pom111
	mov	al,cs:_psyn[bx]
	mov	si,bx
pom111:	inc	bx
	loop	pom112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	pom113
	pop	di

	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
pom118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	pom114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	pom116
	xor	si,si
pom117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	pom129
	loop	pom117
	jmp	pom116
pom129:	pop	bx
	pop	cx
pom114:	add	bx,6
	loop	pom118
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

pom116:	pop	ax
	pop	ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
pom1	endp

p123	proc	near
	mov	cx,5
	xor	ax,ax
	xor	bx,bx
p1230:	mov	[di][bx],al
	inc	bx
	loop	p1230
	lea	si,es:deltio

	mov	cx,3
p1231:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:pp12[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	p1231

	mov	cx,5
	mov	bx,4
p1233:	cmp	byte ptr [di][bx],0
	jne	p12321
	dec	bx
	loop	p1233

p12321:	cmp	byte ptr [di][bx],3
	jne	p1232
	jmp	p12322

p1235:	mov	dl,[bx][di]
	cmp	dl,0
	jne	p1234
p1232:	dec	bx
	loop	p1235

p1234:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p12383:	push	cx
	mov	cx,2
p1238:	cmp	dl,[di][bx]
	je	p1237
	inc	bx
	loop	p1238
	add	bx,4
	pop	cx
	loop	p12383

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p1237:	pop	ax
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret

p12322:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p12381:	cmp	byte ptr [di][bx],3
	jae	p12371
	add	bx,6
	loop	p12381

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p12371:	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
p123	endp

p122	proc	near
	mov	cx,5
	xor	ax,ax
	xor	bx,bx
p1220:	mov	al,[di][bx]
	mov	[di][bx][5],al
	inc	bx
	loop	p1220
	lea	si,es:deltio[3]
	mov	cx,2
p1221:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:pp12[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][5]
	inc	si
	loop	p1221

	xor	si,si
	mov	cx,5
	mov	bx,9
p1223:	cmp	byte ptr [di][bx],0
	jne	p12221
	dec	bx
	loop	p1223

p12221:	cmp	byte ptr [di][bx],5
	jne	p1222
	jmp	p12222

p1225:	mov	dl,[bx][di]
	cmp	dl,0
	je	p1222
	mov	cs:_psyn[si],dl
	inc	si
p1222:	dec	bx
	loop	p1225
	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
p12213:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
p12212:	cmp	cs:_psyn[bx],al
	jbe	p12211
	mov	al,cs:_psyn[bx]
	mov	si,bx
p12211:	inc	bx
	loop	p12212
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	p12213
	pop	di

	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p12215:	push	cx
	mov	cx,2
p12218:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	p12219
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	p12216
	xor	si,si
p12217:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	p12229
	loop	p12217
	jmp	p12216
p12229:	pop	bx
	pop	cx
p12219:	inc	bx
	loop	p12218
	add	bx,4
	pop	cx
	loop	p12215
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret
p12216:	pop	ax
	pop	ax
	pop	ax
	jmp	p12271

p12222:	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p12281:	cmp	byte ptr [bx][di],5
	jae	p12271
	add	bx,6
	loop	p12281

	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p12271:	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
p122	endp

p121	proc	near
	mov	cx,5
	mov	bx,5
p1210:	mov	al,[di][bx]
	mov	[di][bx][5],al
	inc	bx
	loop	p1210

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:pp12[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][10]

	xor	si,si
	mov	cx,5
	mov	bx,14

p1215:	mov	dl,[bx][di]
	cmp	dl,0
	je	p1212
	mov	cs:_psyn[si],dl
	inc	si
p1212:	dec	bx
	loop	p1215

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
p12113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
p12112:	cmp	cs:_psyn[bx],al
	jbe	p12111
	mov	al,cs:_psyn[bx]
	mov	si,bx
p12111:	inc	bx
	loop	p12112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	p12113
	pop	di

	xor	cx,cx
	mov	cl,[di][15]
	mov	bx,16
p12118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	p12114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	p12116
	xor	si,si
p12117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	p12129
	loop	p12117
	jmp	p12116
p12129:	pop	bx
	pop	cx
p12114:	add	bx,6
	loop	p12118
	xor	ax,ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	stc
	ret

p12116:	pop	ax
	pop	ax
	mov	al,[di][15]
	mov	cl,6
	mul	cl
	add	ax,16
	add	di,ax
	clc
	ret
p121	endp

p073	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
p0730:	mov	[di][bx],al
	inc	bx
	loop	p0730
	lea	si,es:deltio

	mov	cx,3
p0731:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:pp07[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	p0731

	mov	cx,7
	mov	bx,6
p0733:	cmp	byte ptr [di][bx],0
	jne	p07321
	dec	bx
	loop	p0733

p07321:	cmp	byte ptr [di][bx],3
	jne	p0732
	jmp	p07322

p0735:	mov	dl,[bx][di]
	cmp	dl,0
	jne	p0734
p0732:	dec	bx
	loop	p0735

p0734:	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
p07383:	push	cx
	mov	cx,2
p0738:	cmp	dl,[di][bx]
	je	p0737
	inc	bx
	loop	p0738
	add	bx,4
	pop	cx
	loop	p07383

	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

p0737:	pop	ax
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret

p07322:	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
p07381:	cmp	byte ptr [di][bx],3
	jae	p07371
	add	bx,6
	loop	p07381

	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

p07371:	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
p073	endp

p072	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
p0720:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	p0720

	lea	si,es:deltio[3]
	mov	cx,2
p0721:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:pp07[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][7]
	inc	si
	loop	p0721

	xor	si,si
	mov	cx,7
	mov	bx,13
p0723:	cmp	byte ptr [di][bx],0
	jne	p07221
	dec	bx
	loop	p0723

p07221:	cmp	byte ptr [di][bx],5
	jne	p0722
	jmp	p07222

p0725:	mov	dl,[bx][di]
	cmp	dl,0
	je	p0722
	mov	cs:_psyn[si],dl
	inc	si
p0722:	dec	bx
	loop	p0725
	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
p07213:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
p07212:	cmp	cs:_psyn[bx],al
	jbe	p07211
	mov	al,cs:_psyn[bx]
	mov	si,bx
p07211:	inc	bx
	loop	p07212
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	p07213
	pop	di

	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
p07215:	push	cx
	mov	cx,2
p07218:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	p07219
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	p07216
	xor	si,si
p07217:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	p07229
	loop	p07217
	jmp	p07216
p07229:	pop	bx
	pop	cx
p07219:	inc	bx
	loop	p07218
	add	bx,4
	pop	cx
	loop	p07215
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret
p07216:	pop	ax
	pop	ax
	pop	ax
	jmp	p07271

p07222:	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
p07281:	cmp	byte ptr [bx][di],5
	jae	p07271
	add	bx,6
	loop	p07281

	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

p07271:	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
p072	endp

p071	proc	near
	mov	cx,7
	mov	bx,7
p0710:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	p0710

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:pp07[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][14]

	xor	si,si
	mov	cx,7
	mov	bx,20

p0715:	mov	dl,[bx][di]
	cmp	dl,0
	je	p0712
	mov	cs:_psyn[si],dl
	inc	si
p0712:	dec	bx
	loop	p0715

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
p07113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
p07112:	cmp	cs:_psyn[bx],al
	jbe	p07111
	mov	al,cs:_psyn[bx]
	mov	si,bx
p07111:	inc	bx
	loop	p07112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	p07113
	pop	di

	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
p07118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	p07114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	p07116
	xor	si,si
p07117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	p07129
	loop	p07117
	jmp	p07116
p07129:	pop	bx
	pop	cx
p07114:	add	bx,6
	loop	p07118
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

p07116:	pop	ax
	pop	ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
p071	endp

pk73	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
pk730:	mov	[di][bx],al
	inc	bx
	loop	pk730
	lea	si,es:deltio

	mov	cx,3
pk731:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppk7[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	pk731
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pk73	endp

pk72	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
pk720:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	pk720

	lea	si,es:deltio[3]
	mov	cx,2
pk721:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppk7[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][7]
	inc	si
	loop	pk721

	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pk72	endp

pk71	proc	near
	mov	cx,7
	mov	bx,7
pk710:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	pk710

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:ppk7[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][14]

	xor	si,si
	mov	cx,7
	mov	bx,20

pk715:	mov	dl,[bx][di]
	cmp	dl,0
	je	pk712
	mov	cs:_psyn[si],dl
	inc	si
pk712:	dec	bx
	loop	pk715

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
pk7113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
pk7112:	cmp	cs:_psyn[bx],al
	jbe	pk7111
	mov	al,cs:_psyn[bx]
	mov	si,bx
pk7111:	inc	bx
	loop	pk7112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	pk7113
	pop	di

	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
pk7118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	pk7114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	pk7116
	xor	si,si
pk7117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	pk7129
	loop	pk7117
	jmp	pk7116
pk7129:	pop	bx
	pop	cx
pk7114:	add	bx,6
	loop	pk7118
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

pk7116:	pop	ax
	pop	ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pk71	endp

plg3	proc	near
	mov	cx,10
	xor	ax,ax
	xor	bx,bx
plg30:	mov	[di][bx],al
	inc	bx
	loop	plg30
	lea	si,es:deltio

	mov	cx,3
plg31:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:plhg[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	plg31

	mov	cx,10
	mov	bx,9
plg33:	cmp	byte ptr [di][bx],0
	je	plg321
	cmp	byte ptr [di][bx],3
	je	plg322
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
plg321:	dec	bx
	loop	plg33
	@EXIT
plg322:	xor	cx,cx
	mov	cl,[di][30]
	mov	bx,31
plg381:	cmp	byte ptr [di][bx],3
	jae	plg371
	add	bx,6
	loop	plg381
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	stc
	ret
plg371:	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
plg3	endp

plg2	proc	near
	mov	cx,10
	xor	ax,ax
	xor	bx,bx
plg20:	mov	al,[di][bx]
	mov	[di][bx][10],al
	inc	bx
	loop	plg20

	lea	si,es:deltio[3]
	mov	cx,2
plg21:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:plhg[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][10]
	inc	si
	loop	plg21

	xor	si,si
	mov	cx,10
	mov	bx,19
plg23:	cmp	byte ptr [di][bx],0
	je	plg221
	cmp	byte ptr [di][bx],5
	je	plg222
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
plg221:	dec	bx
	loop	plg23
	@EXIT

plg222:	xor	cx,cx
	mov	cl,[di][30]
	mov	bx,31
plg281:	cmp	byte ptr [bx][di],5
	jae	plg271
	add	bx,6
	loop	plg281
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	stc
	ret
plg271:	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
plg2	endp

plg1	proc	near
	mov	cx,10
	mov	bx,10
plg10:	mov	al,[di][bx]
	mov	[di][bx][10],al
	inc	bx
	loop	plg10

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:plhg[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][20]

	xor	si,si
	mov	cx,10
	mov	bx,29

plg15:	mov	dl,[bx][di]
	cmp	dl,0
	je	plg12
	mov	cs:_psyn[si],dl
	inc	si
plg12:	dec	bx
	loop	plg15

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
plg113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
plg112:	cmp	cs:_psyn[bx],al
	jbe	plg111
	mov	al,cs:_psyn[bx]
	mov	si,bx
plg111:	inc	bx
	loop	plg112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	plg113
	pop	di

	xor	cx,cx
	mov	cl,[di][30]
	mov	bx,31
plg118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	plg114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	plg116
	xor	si,si
plg117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	plg129
	loop	plg117
	jmp	plg116
plg129:	pop	bx
	pop	cx
plg114:	add	bx,6
	loop	plg118
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	stc
	ret

plg116:	pop	ax
	pop	ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
plg1	endp

pta3	proc	near
	mov	cx,10
	xor	ax,ax
	xor	bx,bx
pta30:	mov	[di][bx],al
	inc	bx
	loop	pta30
	lea	si,es:deltio

	mov	cx,3
pta31:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ptay[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	pta31

	mov	cx,10
	mov	bx,9
pta33:	cmp	byte ptr [di][bx],0
	je	pta321
	cmp	byte ptr [di][bx],3
	je	pta322
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
pta321:	dec	bx
	loop	pta33
	@EXIT
pta322:	xor	cx,cx
	mov	cl,[di][30]
	mov	bx,31
pta381:	cmp	byte ptr [di][bx],3
	jae	pta371
	add	bx,6
	loop	pta381
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	stc
	ret
pta371:	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
pta3	endp

pta2	proc	near
	mov	cx,10
	xor	ax,ax
	xor	bx,bx
pta20:	mov	al,[di][bx]
	mov	[di][bx][10],al
	inc	bx
	loop	pta20

	lea	si,es:deltio[3]
	mov	cx,2
pta21:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ptay[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][10]
	inc	si
	loop	pta21

	xor	si,si
	mov	cx,10
	mov	bx,19
pta23:	cmp	byte ptr [di][bx],0
	je	pta221
	cmp	byte ptr [di][bx],5
	je	pta222
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
pta221:	dec	bx
	loop	pta23
	@EXIT

pta222:	xor	cx,cx
	mov	cl,[di][30]
	mov	bx,31
pta281:	cmp	byte ptr [bx][di],5
	jae	pta271
	add	bx,6
	loop	pta281
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	stc
	ret
pta271:	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
pta2	endp

pta1	proc	near
	mov	cx,10
	mov	bx,10
pta10:	mov	al,[di][bx]
	mov	[di][bx][10],al
	inc	bx
	loop	pta10

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:ptay[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][20]

	xor	si,si
	mov	cx,10
	mov	bx,29

pta15:	mov	dl,[bx][di]
	cmp	dl,0
	je	pta12
	mov	cs:_psyn[si],dl
	inc	si
pta12:	dec	bx
	loop	pta15

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
pta113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
pta112:	cmp	cs:_psyn[bx],al
	jbe	pta111
	mov	al,cs:_psyn[bx]
	mov	si,bx
pta111:	inc	bx
	loop	pta112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	pta113
	pop	di

	xor	cx,cx
	mov	cl,[di][30]
	mov	bx,31
pta118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	pta114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	pta116
	xor	si,si
pta117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	pta129
	loop	pta117
	jmp	pta116
pta129:	pop	bx
	pop	cx
pta114:	add	bx,6
	loop	pta118
	xor	ax,ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	stc
	ret

pta116:	pop	ax
	pop	ax
	mov	al,[di][30]
	mov	cl,6
	mul	cl
	add	ax,31
	add	di,ax
	clc
	ret
pta1	endp

psy3	proc near
	mov	dx,1
	xor	bx,bx
	mov	si,di
	mov	bl,es:deltio
	mov	ah,es:psyn[bx]
	mov	bl,es:deltio[1]
	mov	al,es:psyn[bx]
	inc	ah
	cmp	ah,al
	jne	psy31
	inc	dx
	jmp	psy36
psy31:	mov	[si],dl
	inc	si
psy36:	mov	bl,es:deltio[2]
	mov	ah,es:psyn[bx]
	inc	al
	cmp	ah,al
	jne	psy32
	inc	dx
	jmp	psy34
psy32:	mov	[si],dl
	inc	si
	mov	dx,1
psy34:	mov	[si],dl
	mov	word ptr [di][6],si
	xor	ax,ax
	mov	al,[di][24]
	mov	cl,6
	mul	cl
	add	ax,25
	add	di,ax
	clc
	ret
psy3	endp

psy2	proc near
	mov	cx,6
	xor	bx,bx
psy20:	mov	al,[bx][di]
	mov	[bx][di][8],al
	inc	bx
	loop	psy20

	mov	si,word ptr [di][6]
	add	si,8
	xor	bx,bx
	xor	dx,dx
	mov	bl,es:deltio[2]
	mov	ah,es:psyn[bx]
	mov	bl,es:deltio[3]
	mov	al,es:psyn[bx]
	inc	ah
	cmp	ah,al
	jne	psy21
	mov	dl,[si]
	inc	dx
	jmp	psy26
psy21:	inc	si
	inc	dx
psy26:	mov	bl,es:deltio[4]
	mov	ah,es:psyn[bx]
	inc	al
	cmp	ah,al
	jne	psy22
	inc	dx
	jmp	psy24
psy22:	mov	[si],dl
	inc	si
	mov	dx,1
psy24:	mov	[si],dl
	mov	word ptr [di][14],si
	xor	ax,ax
	mov	al,[di][24]
	mov	cl,6
	mul	cl
	add	ax,25
	add	di,ax
	clc
	ret
psy2	endp

psy1	proc near
	mov	cx,6
	mov	bx,8
psy10:	mov	al,[bx][di]
	mov	[bx][di][8],al
	inc	bx
	loop	psy10

	mov	si,word ptr [di][14]
	add	si,8
	xor	bx,bx
	xor	dx,dx
	mov	bl,es:deltio[4]
	mov	ah,es:psyn[bx]
	mov	bl,es:deltio[5]
	mov	al,es:psyn[bx]
	inc	ah
	cmp	ah,al
	jne	psy11
	mov	dl,[si]
	inc	dx
	jmp	psy16
psy11:	inc	si
	inc	dx
psy16:	mov	[si],dl
	mov	ax,di
	add	ax,15
	sub	si,ax
	mov	dx,si

	push	di
	add	di,16
	mov	cx,dx
	xor	bx,bx
ps1113:	push	cx
	push	di
	mov	cx,dx
	xor	ax,ax
ps1112:	cmp	[di],al
	jbe	ps1111
	mov	al,[di]
	mov	si,di
ps1111:	inc	di
	loop	ps1112
	mov	cs:_psin[bx],al
	mov	byte ptr [si],0
	inc	bx
	pop	di
	pop	cx
	loop	ps1113
	pop	di

	xor	cx,cx
	mov	cl,[di][24]
	mov	bx,25
ps1118:	mov	al,cs:_psin
	cmp	al,[di][bx]
	jne	ps1114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	ps1116
	xor	si,si
ps1117:	inc	bx
	inc	si
	mov	al,cs:_psin[si]
	cmp	al,[di][bx]
	jne	ps1129
	loop	ps1117
	jmp	ps1116
ps1129:	pop	bx
	pop	cx
ps1114:	add	bx,6
	loop	ps1118
	xor	ax,ax
	mov	al,[di][24]
	mov	cl,6
	mul	cl
	add	ax,25
	stc
	ret

ps1116:	pop	ax
	pop	ax
	mov	al,[di][24]
	mov	cl,6
	mul	cl
	add	ax,25
	add	di,ax
	clc
	ret

_psin	db	6 dup(0)
psy1	endp

kena3	proc	near
	xor	dl,dl
	lea	bx,es:deltio
	mov	si,1
	mov	cx,2
kona80:	push	cx
	push	bx
	push	si
kona34:	mov	al,es:[bx][si]
	sub	al,es:[bx]
	cmp	al,[di][2]
	jne	kona31
	inc	dl
kona31:	inc	si
	loop	kona34
	pop	si
	pop	bx
	inc	bx
	pop	cx
	dec	cx
	cmp	cx,0
	je	tolao
	jmp	kona80
tolao:	cmp	dl,[di][4]
	ja	kona12
	add	dl,3
	cmp	dl,[di][3]
	jb	kona12
	add	di,5
	clc
	ret
kona12:	mov	ax,5
	stc
	ret
kena3	endp

kena2	proc	near
	xor	dl,dl
	lea	bx,es:deltio
	mov	si,1
	mov	cx,4
kina80:	push	cx
	push	bx
	push	si
kina34:	mov	al,es:[bx][si]
	sub	al,es:[bx]
	cmp	al,[di][2]
	jne	kina31
	inc	dl
kina31:	inc	si
	loop	kina34
	pop	si
	pop	bx
	inc	bx
	pop	cx
	dec	cx
	cmp	cx,0
	je	tilao
	jmp	kina80
tilao:	cmp	dl,[di][4]
	ja	kina12
	inc	dl
	cmp	dl,[di][3]
	jb	kina12
	add	di,5
	clc
	ret
kina12:	mov	ax,5
	stc
	ret
kena2	endp

kena1	proc	near
	xor	dl,dl
	lea	bx,es:deltio
	mov	si,1
	mov	cx,5
kena80:	push	cx
	push	bx
	push	si
kena34:	mov	al,es:[bx][si]
	sub	al,es:[bx]
	cmp	al,[di][2]
	jne	kena31
	inc	dl
kena31:	inc	si
	loop	kena34
	pop	si
	pop	bx
	inc	bx
	pop	cx
	dec	cx
	cmp	cx,0
	je	telao
	jmp	kena80
telao:	mov	dh,0
	add	es:emfanisi,dx
	cmp	dl,[di][4]
	ja	kena12
	cmp	dl,[di][3]
	jb	kena12
	add	di,5
	clc
	ret
kena12:	mov	ax,5
	stc
	ret
kena1	endp

mmmz3	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	mmmz55
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
mmmz31:	mov	al,es:[bx]
	and	al,1
	jz	mmmz32
	inc	dl
mmmz32:	inc	bx
	loop	mmmz31
	mov	[di][1],dl

mmmz38:	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
mmmz36:	mov	al,es:[bx]
	cmp	al,24
	ja	mmmz35
	inc	dh
mmmz35:	inc	bx
	loop	mmmz36
	xor	bx,bx
	mov	[di][2],dh
	mov	cl,[di][5]

mmmz37:	mov	al,[di][1]
	mov	ah,[di][2]
	cmp	al,[di][bx][6]
	ja	mmmz56
	add	al,3
	cmp	al,[di][bx][6]
	jb	mmmz56
	cmp	ah,[di][bx][7]
	ja	mmmz56
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	mmmz56
	jmp	mmmz55
mmmz56:	add	bx,2
	loop	mmmz37
	jmp	mmmz33
mmmz55:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

mmmz33:	xor	ax,ax
	mov	al,[di]
	stc
	ret
mmmz3	endp

mmmz2	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	mmmz65
	mov	dl,[di][1]
	mov	dh,[di][2]
	lea	bx,es:deltio[3]
	mov	cx,2
mmmz21:	mov	al,es:[bx]
	and	al,1
	jz	mmmz22
	inc	dl
mmmz22:	inc	bx
	loop	mmmz21
	mov	[di][3],dl

mmmz28:	lea	bx,es:deltio[3]
	mov	cx,2
mmmz26:	mov	al,es:[bx]
	cmp	al,24
	ja	mmmz25
	inc	dh
mmmz25:	inc	bx
	loop	mmmz26
	xor	cx,cx
	xor	bx,bx
	mov	[di][4],dh
	mov	cl,[di][5]

mmmz27:	mov	al,[di][3]
	mov	ah,[di][4]
	cmp	al,[di][bx][6]
	ja	mmmz66
	add	al,3
	cmp	al,[di][bx][6]
	jb	mmmz66
	cmp	ah,[di][bx][7]
	ja	mmmz66
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	mmmz66
	jmp	mmmz65
mmmz66:	add	bx,2
	loop	mmmz27
	jmp	mmmz23
mmmz65:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

mmmz23:	xor	ax,ax
	mov	al,[di]
	stc
	ret
mmmz2	endp

mmmz1	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	mmmz19
	mov	dl,[di][3]
	mov	dh,[di][4]
	lea	bx,es:deltio[5]
	push	bx
mmmz11:	mov	al,es:[bx]
	and	al,1
	jz	mmmz12
	inc	dl
mmmz12:	pop	bx
	mov	al,es:[bx]
	cmp	al,24
	ja	mmmz15
	inc	dh
mmmz15:	mov	cl,[di][5]

	xor	bx,bx
mmmz14:	cmp	dl,[di][bx][6]
	jne	mmmz18
	cmp	dh,[di][bx][7]
	jne	mmmz18
	jmp	mmmz19
mmmz18:	add	bx,2
	loop	mmmz14
	jmp	mmmz13
mmmz19:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

mmmz13:	xor	ax,ax
	mov	al,[di]
	stc
	ret

mmmz1	endp

admz3	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	admz55
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
admz31:	mov	al,es:[bx]
	and	al,1
	jz	admz32
	inc	dl
admz32:	inc	bx
	loop	admz31
	mov	[di][1],dl

admz38:	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
admz36:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	admz35
	inc	dh
admz35:	inc	si
	loop	admz36
	xor	bx,bx
	mov	[di][2],dh
	mov	cl,[di][5]

admz37:	mov	al,[di][1]
	mov	ah,[di][2]
	cmp	al,[di][bx][6]
	ja	admz56
	add	al,3
	cmp	al,[di][bx][6]
	jb	admz56
	cmp	ah,[di][bx][7]
	ja	admz56
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	admz56
	jmp	admz55
admz56:	add	bx,2
	loop	admz37
	jmp	admz33
admz55:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

admz33:	xor	ax,ax
	mov	al,[di]
	stc
	ret
admz3	endp

admz2	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	admz65
	mov	dl,[di][1]
	mov	dh,[di][2]
	lea	bx,es:deltio[3]
	mov	cx,2
admz21:	mov	al,es:[bx]
	and	al,1
	jz	admz22
	inc	dl
admz22:	inc	bx
	loop	admz21
	mov	[di][3],dl

admz28:	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
admz26:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	admz25
	inc	dh
admz25:	inc	si
	loop	admz26
	xor	cx,cx
	xor	bx,bx
	mov	[di][4],dh
	mov	cl,[di][5]

admz27:	mov	al,[di][3]
	mov	ah,[di][4]
	cmp	al,[di][bx][6]
	ja	admz66
	add	al,3
	cmp	al,[di][bx][6]
	jb	admz66
	cmp	ah,[di][bx][7]
	ja	admz66
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	admz66
	jmp	admz65
admz66:	add	bx,2
	loop	admz27
	jmp	admz23
admz65:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

admz23:	xor	ax,ax
	mov	al,[di]
	stc
	ret
admz2	endp

admz1	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	admz19
	mov	dl,[di][3]
	mov	dh,[di][4]
	mov	al,es:deltio[5]
	and	al,1
	jz	admz12
	inc	dl
admz12:	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	admz15
	inc	dh
admz15:	mov	cl,[di][5]

	xor	bx,bx
admz14:	cmp	dl,[di][bx][6]
	jne	admz18
	cmp	dh,[di][bx][7]
	jne	admz18
	jmp	admz19
admz18:	add	bx,2
	loop	admz14
	jmp	admz13
admz19:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

admz13:	xor	ax,ax
	mov	al,[di]
	stc
	ret

admz1	endp

pda3	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
pda30:	mov	[di][bx],al
	inc	bx
	loop	pda30
	lea	si,es:deltio

	mov	cx,3
pda31:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppda[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	pda31
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pda3	endp

pda2	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
pda20:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	pda20

	lea	si,es:deltio[3]
	mov	cx,2
pda21:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppda[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][7]
	inc	si
	loop	pda21

	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pda2	endp

pda1	proc	near
	mov	cx,7
	mov	bx,7
pda10:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	pda10

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:ppda[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][14]

	xor	si,si
	mov	cx,7
	mov	bx,20

pda15:	mov	dl,[bx][di]
	cmp	dl,0
	je	pda12
	mov	cs:_psyn[si],dl
	inc	si
pda12:	dec	bx
	loop	pda15

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
pda113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
pda112:	cmp	cs:_psyn[bx],al
	jbe	pda111
	mov	al,cs:_psyn[bx]
	mov	si,bx
pda111:	inc	bx
	loop	pda112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	pda113
	pop	di

	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
pda118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	pda114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	pda116
	xor	si,si
pda117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	pda129
	loop	pda117
	jmp	pda116
pda129:	pop	bx
	pop	cx
pda114:	add	bx,6
	loop	pda118
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

pda116:	pop	ax
	pop	ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pda1	endp

pdb3	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
pdb30:	mov	[di][bx],al
	inc	bx
	loop	pdb30
	lea	si,es:deltio

	mov	cx,3
pdb31:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppdb[bx]
	mov	bx,ax
	inc	byte ptr [bx][di]
	inc	si
	loop	pdb31
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pdb3	endp

pdb2	proc	near
	mov	cx,7
	xor	ax,ax
	xor	bx,bx
pdb20:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	pdb20

	lea	si,es:deltio[3]
	mov	cx,2
pdb21:	xor	ax,ax
	mov	al,es:[si]
	mov	bx,ax
	mov	al,es:ppdb[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][7]
	inc	si
	loop	pdb21

	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pdb2	endp

pdb1	proc	near
	mov	cx,7
	mov	bx,7
pdb10:	mov	al,[di][bx]
	mov	[di][bx][7],al
	inc	bx
	loop	pdb10

	xor	ax,ax
	mov	al,es:deltio[5]
	mov	bx,ax
	mov	al,es:ppdb[bx]
	mov	bx,ax
	inc	byte ptr [bx][di][14]

	xor	si,si
	mov	cx,7
	mov	bx,20

pdb15:	mov	dl,[bx][di]
	cmp	dl,0
	je	pdb12
	mov	cs:_psyn[si],dl
	inc	si
pdb12:	dec	bx
	loop	pdb15

	push	di
	mov	dx,si
	mov	cx,dx
	xor	di,di
pdb113:	push	cx
	mov	cx,dx
	xor	bx,bx
	xor	ax,ax
pdb112:	cmp	cs:_psyn[bx],al
	jbe	pdb111
	mov	al,cs:_psyn[bx]
	mov	si,bx
pdb111:	inc	bx
	loop	pdb112
	mov	cs:_psyn1[di],al
	mov	cs:_psyn[si],0
	inc	di
	pop	cx
	loop	pdb113
	pop	di

	xor	cx,cx
	mov	cl,[di][21]
	mov	bx,22
pdb118:	mov	al,cs:_psyn1
	cmp	al,[di][bx]
	jne	pdb114
	push	cx
	push	bx
	mov	cx,dx
	dec	cx
	jz	pdb116
	xor	si,si
pdb117:	inc	bx
	inc	si
	mov	al,cs:_psyn1[si]
	cmp	al,[di][bx]
	jne	pdb129
	loop	pdb117
	jmp	pdb116
pdb129:	pop	bx
	pop	cx
pdb114:	add	bx,6
	loop	pdb118
	xor	ax,ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	stc
	ret

pdb116:	pop	ax
	pop	ax
	mov	al,[di][21]
	mov	cl,6
	mul	cl
	add	ax,22
	add	di,ax
	clc
	ret
pdb1	endp

memz3	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	memz55
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
memz31:	mov	al,es:[bx]
	and	al,1
	jz	memz32
	inc	dl
memz32:	inc	bx
	loop	memz31
	mov	[di][1],dl

memz38:	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
memz36:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	memz35
	inc	dh
memz35:	inc	si
	loop	memz36
	xor	bx,bx
	mov	[di][2],dh
	mov	cl,[di][5]

memz37:	mov	al,[di][1]
	mov	ah,[di][2]
	cmp	al,[di][bx][6]
	ja	memz56
	add	al,3
	cmp	al,[di][bx][6]
	jb	memz56
	cmp	ah,[di][bx][7]
	ja	memz56
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	memz56
	jmp	memz55
memz56:	add	bx,2
	loop	memz37
	jmp	memz33
memz55:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

memz33:	xor	ax,ax
	mov	al,[di]
	stc
	ret
memz3	endp

memz2	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	memz65
	mov	dl,[di][1]
	mov	dh,[di][2]
	lea	bx,es:deltio[3]
	mov	cx,2
memz21:	mov	al,es:[bx]
	and	al,1
	jz	memz22
	inc	dl
memz22:	inc	bx
	loop	memz21
	mov	[di][3],dl

memz28:	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
memz26:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	memz25
	inc	dh
memz25:	inc	si
	loop	memz26
	xor	cx,cx
	xor	bx,bx
	mov	[di][4],dh
	mov	cl,[di][5]

memz27:	mov	al,[di][3]
	mov	ah,[di][4]
	cmp	al,[di][bx][6]
	ja	memz66
	add	al,3
	cmp	al,[di][bx][6]
	jb	memz66
	cmp	ah,[di][bx][7]
	ja	memz66
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	memz66
	jmp	memz65
memz66:	add	bx,2
	loop	memz27
	jmp	memz23
memz65:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

memz23:	xor	ax,ax
	mov	al,[di]
	stc
	ret
memz2	endp

memz1	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	memz19
	mov	dl,[di][3]
	mov	dh,[di][4]
	mov	al,es:deltio[5]
	and	al,1
	jz	memz12
	inc	dl
memz12:	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	memz15
	inc	dh
memz15:	mov	cl,[di][5]

	xor	bx,bx
memz14:	cmp	dl,[di][bx][6]
	jne	memz18
	cmp	dh,[di][bx][7]
	jne	memz18
	jmp	memz19
memz18:	add	bx,2
	loop	memz14
	jmp	memz13
memz19:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

memz13:	xor	ax,ax
	mov	al,[di]
	stc
	ret

memz1	endp

admm3	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	admm55
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
admm31:	mov	al,es:[bx]
	cmp	al,24
	ja	admm32
	inc	dl
admm32:	inc	bx
	loop	admm31
	mov	[di][1],dl

admm38:	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
admm36:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	admm35
	inc	dh
admm35:	inc	si
	loop	admm36
	xor	bx,bx
	mov	[di][2],dh
	mov	cl,[di][5]

admm37:	mov	al,[di][1]
	mov	ah,[di][2]
	cmp	al,[di][bx][6]
	ja	admm56
	add	al,3
	cmp	al,[di][bx][6]
	jb	admm56
	cmp	ah,[di][bx][7]
	ja	admm56
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	admm56
	jmp	admm55
admm56:	add	bx,2
	loop	admm37
	jmp	admm33
admm55:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

admm33:	xor	ax,ax
	mov	al,[di]
	stc
	ret
admm3	endp

admm2	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	admm65
	mov	dl,[di][1]
	mov	dh,[di][2]
	lea	bx,es:deltio[3]
	mov	cx,2
admm21:	mov	al,es:[bx]
	cmp	al,24
	ja	admm22
	inc	dl
admm22:	inc	bx
	loop	admm21
	mov	[di][3],dl

admm28:	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
admm26:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	admm25
	inc	dh
admm25:	inc	si
	loop	admm26
	xor	cx,cx
	xor	bx,bx
	mov	[di][4],dh
	mov	cl,[di][5]

admm27:	mov	al,[di][3]
	mov	ah,[di][4]
	cmp	al,[di][bx][6]
	ja	admm66
	add	al,3
	cmp	al,[di][bx][6]
	jb	admm66
	cmp	ah,[di][bx][7]
	ja	admm66
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	admm66
	jmp	admm65
admm66:	add	bx,2
	loop	admm27
	jmp	admm23
admm65:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

admm23:	xor	ax,ax
	mov	al,[di]
	stc
	ret
admm2	endp

admm1	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	admm19
	mov	dl,[di][3]
	mov	dh,[di][4]
	mov	al,es:deltio[5]
	cmp	al,24
	ja	admm12
	inc	dl
admm12:	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	admm15
	inc	dh
admm15:	mov	cl,[di][5]

	xor	bx,bx
admm14:	cmp	dl,[di][bx][6]
	jne	admm18
	cmp	dh,[di][bx][7]
	jne	admm18
	jmp	admm19
admm18:	add	bx,2
	loop	admm14
	jmp	admm13
admm19:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

admm13:	xor	ax,ax
	mov	al,[di]
	stc
	ret

admm1	endp

memm3	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	memm55
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
memm31:	mov	al,es:[bx]
	cmp	al,24
	ja	memm32
	inc	dl
memm32:	inc	bx
	loop	memm31
	mov	[di][1],dl

memm38:	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
memm36:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	memm35
	inc	dh
memm35:	inc	si
	loop	memm36
	xor	bx,bx
	mov	[di][2],dh
	mov	cl,[di][5]

memm37:	mov	al,[di][1]
	mov	ah,[di][2]
	cmp	al,[di][bx][6]
	ja	memm56
	add	al,3
	cmp	al,[di][bx][6]
	jb	memm56
	cmp	ah,[di][bx][7]
	ja	memm56
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	memm56
	jmp	memm55
memm56:	add	bx,2
	loop	memm37
	jmp	memm33
memm55:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

memm33:	xor	ax,ax
	mov	al,[di]
	stc
	ret
memm3	endp

memm2	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	memm65
	mov	dl,[di][1]
	mov	dh,[di][2]
	lea	bx,es:deltio[3]
	mov	cx,2
memm21:	mov	al,es:[bx]
	cmp	al,24
	ja	memm22
	inc	dl
memm22:	inc	bx
	loop	memm21
	mov	[di][3],dl

memm28:	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
memm26:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	memm25
	inc	dh
memm25:	inc	si
	loop	memm26
	xor	cx,cx
	xor	bx,bx
	mov	[di][4],dh
	mov	cl,[di][5]

memm27:	mov	al,[di][3]
	mov	ah,[di][4]
	cmp	al,[di][bx][6]
	ja	memm66
	add	al,3
	cmp	al,[di][bx][6]
	jb	memm66
	cmp	ah,[di][bx][7]
	ja	memm66
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	memm66
	jmp	memm65
memm66:	add	bx,2
	loop	memm27
	jmp	memm23
memm65:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

memm23:	xor	ax,ax
	mov	al,[di]
	stc
	ret
memm2	endp

memm1	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	memm19
	mov	dl,[di][3]
	mov	dh,[di][4]
	mov	al,es:deltio[5]
	cmp	al,24
	ja	memm12
	inc	dl
memm12:	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	memm15
	inc	dh
memm15:	mov	cl,[di][5]

	xor	bx,bx
memm14:	cmp	dl,[di][bx][6]
	jne	memm18
	cmp	dh,[di][bx][7]
	jne	memm18
	jmp	memm19
memm18:	add	bx,2
	loop	memm14
	jmp	memm13
memm19:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

memm13:	xor	ax,ax
	mov	al,[di]
	stc
	ret

memm1	endp

mead3	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	mead55
	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
mead31:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	mead32
	inc	dl
mead32:	inc	si
	loop	mead31
	mov	[di][1],dl

mead38:	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
mead36:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	mead35
	inc	dh
mead35:	inc	si
	loop	mead36
	xor	bx,bx
	mov	[di][2],dh
	mov	cl,[di][5]

mead37:	mov	al,[di][1]
	mov	ah,[di][2]
	cmp	al,[di][bx][6]
	ja	mead56
	add	al,3
	cmp	al,[di][bx][6]
	jb	mead56
	cmp	ah,[di][bx][7]
	ja	mead56
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	mead56
	jmp	mead55
mead56:	add	bx,2
	loop	mead37
	jmp	mead33
mead55:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

mead33:	xor	ax,ax
	mov	al,[di]
	stc
	ret
mead3	endp

mead2	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	mead65
	mov	dl,[di][1]
	mov	dh,[di][2]
	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
mead21:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	mead22
	inc	dl
mead22:	inc	si
	loop	mead21
	mov	[di][3],dl

mead28:	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
mead26:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	mead25
	inc	dh
mead25:	inc	si
	loop	mead26
	xor	cx,cx
	xor	bx,bx
	mov	[di][4],dh
	mov	cl,[di][5]

mead27:	mov	al,[di][3]
	mov	ah,[di][4]
	cmp	al,[di][bx][6]
	ja	mead66
	add	al,3
	cmp	al,[di][bx][6]
	jb	mead66
	cmp	ah,[di][bx][7]
	ja	mead66
	add	ah,3
	cmp	ah,[di][bx][7]
	jb	mead66
	jmp	mead65
mead66:	add	bx,2
	loop	mead27
	jmp	mead23
mead65:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

mead23:	xor	ax,ax
	mov	al,[di]
	stc
	ret
mead2	endp

mead1	proc	near
	mov	al,[di][5]
	cmp	al,0
	jz	mead19
	mov	dl,[di][3]
	mov	dh,[di][4]
	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	mead12
	inc	dl
mead12:	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:ppme[bx]
	cmp	al,0
	je	mead15
	inc	dh
mead15:	mov	cl,[di][5]

	xor	bx,bx
mead14:	cmp	dl,[di][bx][6]
	jne	mead18
	cmp	dh,[di][bx][7]
	jne	mead18
	jmp	mead19
mead18:	add	bx,2
	loop	mead14
	jmp	mead13
mead19:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret

mead13:	xor	ax,ax
	mov	al,[di]
	stc
	ret

mead1	endp

mm3	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	mm34
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
mm32:	mov	al,es:[bx]
	cmp	al,24
	ja	mm31
	inc	dl
mm31:	inc	bx
	loop	mm32
	mov	[di][1],dl
	mov	dh,dl
	add	dh,3
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
mm35:	cmp	dl,[di][bx][4]
	ja	mm33
	cmp	dh,[di][bx][4]
	jb	mm33
	jmp	mm34
mm33:	inc	bx
	loop	mm35

	xor	ax,ax
	mov	al,[di]
	stc
	ret

mm34:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
mm3	endp

mm2	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	mm24
	xor	dx,dx
	mov	dl,[di][1]
	lea	bx,es:deltio[3]
	mov	cx,2
mm22:	mov	al,es:[bx]
	cmp	al,24
	ja	mm21
	inc	dl
mm21:	inc	bx
	loop	mm22
	mov	[di][2],dl
	mov	dh,dl
	add	dh,1
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
mm25:	cmp	dl,[di][bx][4]
	ja	mm23
	cmp	dh,[di][bx][4]
	jb	mm23
	jmp	mm24
mm23:	inc	bx
	loop	mm25

	xor	ax,ax
	mov	al,[di]
	stc
	ret

mm24:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
mm2	endp

mm1	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	mm14
	xor	dx,dx
	mov	dl,[di][2]
	mov	al,es:deltio[5]
	cmp	al,24
	ja	mm11
	inc	dl
mm11:	inc	bx
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
mm15:	cmp	dl,[di][bx][4]
	jne	mm13
	jmp	mm14
mm13:	inc	bx
	loop	mm15

	xor	ax,ax
	mov	al,[di]
	stc
	ret

mm14:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
mm1	endp

me3	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	me34
	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
me32:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,1
	jne	me31
	inc	dl
me31:	inc	si
	loop	me32
	mov	[di][1],dl
	mov	dh,dl
	add	dh,3
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
me35:	cmp	dl,[di][bx][4]
	ja	me33
	cmp	dh,[di][bx][4]
	jb	me33
	jmp	me34
me33:	inc	bx
	loop	me35

	xor	ax,ax
	mov	al,[di]
	stc
	ret

me34:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
me3	endp

me2	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	me24
	xor	dx,dx
	mov	dl,[di][1]
	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
me22:	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	cmp	al,1
	jne	me21
	inc	dl
me21:	inc	si
	loop	me22
	mov	[di][2],dl
	mov	dh,dl
	add	dh,1
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
me25:	cmp	dl,[di][bx][4]
	ja	me23
	cmp	dh,[di][bx][4]
	jb	me23
	jmp	me24
me23:	inc	bx
	loop	me25

	xor	ax,ax
	mov	al,[di]
	stc
	ret

me24:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
me2	endp

me1	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	me14
	xor	dx,dx
	mov	dl,[di][2]
	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:ppme[bx]
	cmp	al,1
	jne	me11
	inc	dl
me11:	inc	bx
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
me15:	cmp	dl,[di][bx][4]
	jne	me13
	jmp	me14
me13:	inc	bx
	loop	me15

	xor	ax,ax
	mov	al,[di]
	stc
	ret

me14:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
me1	endp

ad3	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	ad34
	xor	dx,dx
	lea	si,es:deltio
	mov	cx,3
	xor	bx,bx
ad32:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	ad31
	inc	dl
ad31:	inc	si
	loop	ad32
	mov	[di][1],dl
	mov	dh,dl
	add	dh,3
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
ad35:	cmp	dl,[di][bx][4]
	ja	ad33
	cmp	dh,[di][bx][4]
	jb	ad33
	jmp	ad34
ad33:	inc	bx
	loop	ad35

	xor	ax,ax
	mov	al,[di]
	stc
	ret

ad34:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
ad3	endp

ad2	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	ad24
	xor	dx,dx
	mov	dl,[di][1]
	lea	si,es:deltio[3]
	mov	cx,2
	xor	bx,bx
ad22:	mov	bl,es:[si]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	ad21
	inc	dl
ad21:	inc	si
	loop	ad22
	mov	[di][2],dl
	mov	dh,dl
	add	dh,1
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
ad25:	cmp	dl,[di][bx][4]
	ja	ad23
	cmp	dh,[di][bx][4]
	jb	ad23
	jmp	ad24
ad23:	inc	bx
	loop	ad25

	xor	ax,ax
	mov	al,[di]
	stc
	ret

ad24:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
ad2	endp

ad1	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	ad14
	xor	dx,dx
	mov	dl,[di][2]
	xor	bx,bx
	mov	bl,es:deltio[5]
	mov	al,es:plhg[bx]
	cmp	al,4
	ja	ad11
	inc	dl
ad11:	inc	bx
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
ad15:	cmp	dl,[di][bx][4]
	jne	ad13
	jmp	ad14
ad13:	inc	bx
	loop	ad15

	xor	ax,ax
	mov	al,[di]
	stc
	ret

ad14:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
ad1	endp

mz3	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	mz34
	xor	dx,dx
	lea	bx,es:deltio
	mov	cx,3
mz32:	mov	al,es:[bx]
	and	al,1
	jz	mz31
	inc	dl
mz31:	inc	bx
	loop	mz32
	mov	[di][1],dl
	mov	dh,dl
	add	dh,3
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
mz35:	cmp	dl,[di][bx][4]
	ja	mz33
	cmp	dh,[di][bx][4]
	jb	mz33
	jmp	mz34
mz33:	inc	bx
	loop	mz35

	xor	ax,ax
	mov	al,[di]
	stc
	ret

mz34:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
mz3	endp

mz2	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	mz24
	xor	dx,dx
	mov	dl,[di][1]
	lea	bx,es:deltio[3]
	mov	cx,2
mz22:	mov	al,es:[bx]
	and	al,1
	jz	mz21
	inc	dl
mz21:	inc	bx
	loop	mz22
	mov	[di][2],dl
	mov	dh,dl
	add	dh,1
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
mz25:	cmp	dl,[di][bx][4]
	ja	mz23
	cmp	dh,[di][bx][4]
	jb	mz23
	jmp	mz24
mz23:	inc	bx
	loop	mz25

	xor	ax,ax
	mov	al,[di]
	stc
	ret

mz24:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
mz2	endp

mz1	proc	near
	mov	al,[di][3]
	cmp	al,0
	jz	mz14
	xor	dx,dx
	mov	dl,[di][2]
	mov	al,es:deltio[5]
	and	al,1
	jz	mz11
	inc	dl
mz11:	inc	bx
	xor	cx,cx
	mov	cl,[di][3]
	xor	bx,bx
mz15:	cmp	dl,[di][bx][4]
	jne	mz13
	jmp	mz14
mz13:	inc	bx
	loop	mz15

	xor	ax,ax
	mov	al,[di]
	stc
	ret

mz14:	xor	ax,ax
	mov	al,[di]
	add	di,ax
	clc
	ret
mz1	endp

bas3	proc	near
	xor	ax,ax
	mov	cx,3
	lea	si,es:deltio
	xor	bx,bx
b2:	mov	bl,es:[si]
	cmp	byte ptr [bx][di][5],0
	je	b1
	inc	ax
b1:	inc	si
	loop	b2
	mov	[di],al
	cmp	al,[di][56]
	ja	b3
	add	ax,3
	cmp	al,[di][55]
	jb	b3

	mov	dx,1
	xor	bx,bx
	xor	cx,cx
	mov	bl,es:deltio
	mov	ah,[di][bx][5]
	mov	bl,es:deltio[1]
	mov	al,[di][bx][5]
	inc	ah
	cmp	ah,al
	jne	asyn1
	inc	dx
asyn1:	mov	bl,es:deltio[2]
	mov	ah,[di][bx][5]
	inc	al
	cmp	ah,al
	jne	asyn2
	inc	dx
	jmp	asyn4
asyn2:	mov	cx,dx
	mov	dx,1
asyn4:	mov	[di][2],dl
	mov	[di][3],cl
	cmp	dx,cx
	jae	asyn5
	mov	dx,cx
asyn5:	cmp	dl,[di][58]
	ja	b3
	add	dx,3
	cmp	dl,[di][57]
	jb	b3
	add	di,59
	clc
	ret
b3:	mov	ax,59
	stc
	ret
bas3	endp

bas2	proc	near
	xor	ax,ax
	mov	al,[di]
	mov	cx,2
	lea	si,es:deltio[3]
	xor	bx,bx
b22:	mov	bl,es:[si]
	cmp	byte ptr [bx][di][5],0
	je	b12
	inc	ax
b12:	inc	si
	loop	b22
	mov	[di][1],al
	cmp	al,[di][56]
	ja	b32
	inc	ax
	cmp	al,[di][55]
	jb	b32
	xor	dx,dx
	xor	cx,cx
	xor	bx,bx
	mov	dl,[di][2]
	mov	cl,[di][3]
	mov	bl,es:deltio[2]
	mov	ah,[di][bx][5]
	mov	bl,es:deltio[3]
	mov	al,[di][bx][5]
	inc	ah
	cmp	ah,al
	jne	asyn12
	inc	dx
	jmp	asyn13
asyn12:	cmp	cx,dx
	jae	asyn14
	mov	cx,dx
asyn14:	mov	dx,1
asyn13:	mov	bl,es:deltio[4]
	mov	ah,[di][bx][5]
	inc	al
	cmp	ah,al
	jne	asyn22
	inc	dx
	jmp	asyn23
asyn22:	cmp	cx,dx
	jae	asyn15
	mov	cx,dx
asyn15:	mov	dx,1
asyn23:	mov	[di][4],dl
	mov	[di][5],cl
	cmp	dx,cx
	jae	asyn24
	mov	dx,cx
asyn24:	cmp	dl,[di][58]
	ja	b32
	inc	dx
	cmp	dl,[di][57]
	jb	b32
	add	di,59
	clc
	ret
b32:	mov	ax,59
	stc
	ret
bas2	endp

bas1	proc	near
	xor	ax,ax
	mov	al,[di][1]
	xor	bx,bx
b221:	mov	bl,es:deltio[5]
	cmp	byte ptr [bx][di][5],0
	je	b121
	inc	ax
b121:	add	es:emfanisi,ax
	cmp	al,[di][56]
	ja	b321
	cmp	al,[di][55]
	jb	b321
	xor	dx,dx
	xor	bx,bx
	xor	cx,cx
	mov	dl,[di][4]
	mov	cl,[di][5]
	mov	bl,es:deltio[4]
	mov	ah,[di][bx][5]
	mov	bl,es:deltio[5]
	mov	al,[di][bx][5]
	inc	ah
	cmp	ah,al
	jne	asyn11
	inc	dx
asyn11:	cmp	dx,cx
	jae	asyn35
	mov	dx,cx
asyn35:	cmp	dl,[di][58]
	ja	b321
	cmp	dl,[di][57]
	jb	b321
	add	di,59
	clc
	ret
b321:	mov	ax,59
	stc
	ret
bas1	endp

basn3	proc	near
	xor	ax,ax
	mov	cx,3
	lea	si,es:deltio
	xor	bx,bx
bn2:	mov	bl,es:[si]
	cmp	byte ptr [bx][di][5],0
	je	bn1
	inc	ax
bn1:	inc	si
	loop	bn2
	mov	[di],al
	add	di,59
	clc
	ret
basn3	endp

basn2	proc	near
	xor	ax,ax
	mov	al,[di]
	mov	cx,2
	lea	si,es:deltio[3]
	xor	bx,bx
bn22:	mov	bl,es:[si]
	cmp	byte ptr [bx][di][5],0
	je	bn12
	inc	ax
bn12:	inc	si
	loop	bn22
	mov	[di][1],al
	add	di,59
	clc
	ret
basn2	endp

basn1	proc	near
	xor	ax,ax
	mov	al,[di][1]
	xor	bx,bx
bn221:	mov	bl,es:deltio[5]
	cmp	byte ptr [bx][di][5],0
	je	bn121
	inc	ax
bn121:	cmp	al,6
	je	bn321
	add	di,59
	clc
	ret
bn321:	mov	ax,59
	stc
	ret
basn1	endp

bar63	proc	near
	add	di,6
	clc
	ret
bar63	endp

bar62	proc	near
	add	di,6
	clc
	ret
bar62	endp

bar61	proc	near
	lea	si,es:deltio
	mov	al,es:[si][1]
	mov	ah,es:[si][4]
	add	al,ah

	cmp	al,[di][3]
	ja	b33b
	cmp	al,[di][2]
	jb	b33b
	
	mov	al,es:[si][2]
	mov	ah,es:[si][3]
	add	al,ah

	cmp	al,[di][5]
	ja	b33b
	cmp	al,[di][4]
	jb	b33b

	mov	al,es:[si]
	mov	ah,es:[si][5]
	add	al,ah

	cmp	al,[di][1]
	ja	b33b
	cmp	al,[di]
	jb	b33b
	add	di,6
	clc
	ret

b33b:	mov	ax,6
	stc
	ret
bar61 	endp

barues3	proc	near
	add	di,10
	clc
	ret
barues3	endp

barues2	proc	near
	add	di,10
	clc
	ret
barues2	endp

barues1	proc	near
	xor	ax,ax
	xor	bx,bx
	lea	si,es:deltio
	mov	cx,5
epanv:	cmp	byte ptr [di][bx],0
	je	ley
	add	al,es:[si][bx]
ley:	inc	bx
	loop	epanv
	cmp	byte ptr [di][bx],0
	je	lei
	xor	dx,dx
	mov	dl,es:[si][bx]
	add	ax,dx

lei:	cmp	ax,[di][8]
	ja	bari11
	cmp	ax,[di][6]
	jb	bari11
	add	di,10
	clc
	ret

bari11:	mov	ax,10
	stc
	ret
barues1	endp

perio3	proc	near
	add	di,2
	clc
	ret
perio3	endp

perio2	proc	near
	add	di,2
	clc
	ret
perio2	endp

perio1	proc	near
	cmp	cs:pia1[2],0
	jne	pia00
	inc	cs:period
	mov	ax,cs:period
	cmp	ax,[di]
	jbe	diaf31
	mov	cs:period,1
pia00:	add	di,2
	clc
	ret

diaf31:	mov	ax,2
	stc
	ret
period	dw	1
perio1	endp

adu3	proc	near
	lea	si,es:deltio
	xor	bx,bx
	mov	ah,[di]
	cmp	ah,0
	je	adu31
	mov	bl,es:[si]
	mov	al,es:pad[bx]
	cmp	al,ah
	jne	adu33
adu31:	inc	si
	mov	ah,[di][1]
	cmp	ah,0
	je	adu32
	mov	bl,es:[si]
	mov	al,es:pad[bx]
	cmp	al,ah
	jne	adu33
adu32:	inc	si
	mov	ah,[di][2]
	cmp	ah,0
	je	adu34
	mov	bl,es:[si]
	mov	al,es:pad[bx]
	cmp	al,ah
	jne	adu33
adu34:	mov	byte ptr [di][6],0
	add	di,8
	clc
	ret
adu33:	mov	byte ptr [di][6],255
	mov	ax,8
	stc
	ret
adu3	endp

adu2	proc	near
	xor	bx,bx
	cmp	byte ptr [di][6],255
	jne	adttm
	jmp	adu23
adttm:	lea	si,es:deltio[3]
	mov	ah,[di][3]
	cmp	ah,0
	je	adu21
	mov	bl,es:[si]
	mov	al,es:pad[bx]
	cmp	al,ah
	jne	adu23
adu21:	inc	si
	mov	ah,[di][4]
	cmp	ah,0
	je	adu24
	mov	bl,es:[si]
	mov	al,es:pad[bx]
	cmp	al,ah
	jne	adu23
adu24:	mov	byte ptr [di][7],0
	add	di,8
	clc
	ret
adu23:	mov	byte ptr [di][7],255
	mov	ax,8
	stc
	ret
adu2	endp

adu1	proc	near
	xor	bx,bx
	cmp	byte ptr [di][7],255
	jne	adhht
	jmp	adu13
adhht:	mov	ah,[di][5]
	cmp	ah,0
	je	adu14
	mov	bl,es:deltio[5]
	mov	al,es:pad[bx]
	cmp	al,ah
	jne	adu13
adu14:	add	di,8
	clc
	ret
adu13:	mov	ax,8
	stc
	ret
adu1	endp

meu3	proc	near
	lea	si,es:deltio
	xor	bx,bx
	mov	ah,[di]
	cmp	ah,0
	je	meu31
	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	inc	al
	cmp	al,ah
	jne	meu33
meu31:	inc	si
	mov	ah,[di][1]
	cmp	ah,0
	je	meu32
	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	inc	al
	cmp	al,ah
	jne	meu33
meu32:	inc	si
	mov	ah,[di][2]
	cmp	ah,0
	je	meu34
	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	inc	al
	cmp	al,ah
	jne	meu33
meu34:	mov	byte ptr [di][6],0
	add	di,8
	clc
	ret
meu33:	mov	byte ptr [di][6],255
	mov	ax,8
	stc
	ret
meu3	endp

meu2	proc	near
	xor	bx,bx
	cmp	byte ptr [di][6],255
	jne	mettm
	jmp	meu23
mettm:	lea	si,es:deltio[3]
	mov	ah,[di][3]
	cmp	ah,0
	je	meu21
	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	inc	al
	cmp	al,ah
	jne	meu23
meu21:	inc	si
	mov	ah,[di][4]
	cmp	ah,0
	je	meu24
	mov	bl,es:[si]
	mov	al,es:ppme[bx]
	inc	al
	cmp	al,ah
	jne	meu23
meu24:	mov	byte ptr [di][7],0
	add	di,8
	clc
	ret
meu23:	mov	byte ptr [di][7],255
	mov	ax,8
	stc
	ret
meu2	endp

meu1	proc	near
	xor	bx,bx
	cmp	byte ptr [di][7],255
	jne	mehht
	jmp	meu13
mehht:	mov	ah,[di][5]
	cmp	ah,0
	je	meu14
	mov	bl,es:deltio[5]
	mov	al,es:ppme[bx]
	inc	al
	cmp	al,ah
	jne	meu13
meu14:	add	di,8
	clc
	ret
meu13:	mov	ax,8
	stc
	ret
meu1	endp

enalad3	proc	near
	xor	dx,dx
	xor	bx,bx
	mov	bl,es:deltio
	mov	al,es:pad[bx]
	mov	bl,es:deltio[1]
	mov	ah,es:pad[bx]
	cmp	al,ah
	je	adenal10
	inc	dx
adenal10:
	mov	bl,es:deltio[2]
	mov	al,es:pad[bx]
	cmp	al,ah
	je	adenal20
	inc	dx
adenal20:
	mov	[di],dl
	cmp	dl,[di][3]
	ja	adenal30
	add	dx,3
	cmp	dl,[di][2]
	jb	adenal30
	add	di,4
	clc
	ret
adenal30:
	mov	ax,4
	stc
	ret
enalad3	endp

enalad2	proc	near
	xor	dx,dx
	xor	bx,bx
	mov	dl,[di]
	mov	bl,es:deltio[2]
	mov	al,es:pad[bx]
	mov	bl,es:deltio[3]
	mov	ah,es:pad[bx]
	cmp	al,ah
	je	adenal12
	inc	dx
adenal12:
	mov	bl,es:deltio[4]
	mov	al,es:pad[bx]
	cmp	al,ah
	je	adenal22
	inc	dx
adenal22:
	mov	[di][1],dl
	cmp	dl,[di][3]
	ja	adenal32
	inc	dx
	cmp	dl,[di][2]
	jb	adenal32
	add	di,4
	clc
	ret
adenal32:
	mov	ax,4
	stc
	ret
enalad2	endp

enalad1	proc	near
	xor	dx,dx
	xor	bx,bx
	mov	dl,[di][1]
	mov	bl,es:deltio[4]
	mov	al,es:pad[bx]
	mov	bl,es:deltio[5]
	mov	ah,es:pad[bx]
	cmp	al,ah
	je	adenal11
	inc	dx
adenal11:
	add	es:emfanisi,dx
	cmp	dl,[di][3]
	ja	adenal31
	cmp	dl,[di][2]
	jb	adenal31
	add	di,4
	clc
	ret
adenal31:
	mov	ax,4
	stc
	ret
enalad1	endp

code1	ends
	end
