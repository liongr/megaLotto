
INCLUDE	koina.inc

code	segment	public

	assume	cs:code

metatr_basikon	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	meisagf," "
	jne	met01
met02:	@POP
	ret
met01:	cmp	meisagf,0
	je	met02
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetatr
	@SELECTWIND	wmetatr
	@CHANGESEGM	ds,DATA
	mov	temp11,0
	mov	temp11[2],0
	mov	temp12,999
	mov	temp1,999
	mov	temp2,0
	mov	temp3,6
	mov	temp4,1
	mov	temp5,6
	@ITOA	strbuf[5],1,temp2
	@ITOA	strbuf[10],1,temp3
	@ITOA	strbuf[15],1,temp4
	@ITOA	strbuf[20],1,temp5
	@FILLSTR	strbuf1," ",10
	@ITOA	strbuf[50],3,temp12
	@ITOA	strbuf,3,temp1
orijan:	@WPRINT	25,5,strbuf[50]
	@WPRINT	25,8,strbuf
	@WPRINT	25,10,strbuf[5]
	@WPRINT	25,11,strbuf[10]
	@WPRINT	25,12,strbuf[15]
	@WPRINT	25,13,strbuf[20]
	@WINPUTNUMBER	25,4,strbuf1,pltaf
	jc	orit11
	@WINPUTNUMBER	25,5,strbuf[50],pltaf
	pushf
	push	ax
	@ATOI	strbuf[50]
	mov	temp12,ax
	pop	ax
	popf
orit11:	jc	orit12
	@WINPUTNUMBER	25,8,strbuf,pltaf
	pushf
	push	ax
	@ATOI	strbuf
	mov	temp1,ax
	pop	ax
	popf
orit12:	jc	orit1
	@WINPUTNUMBER	25,10,strbuf[5],pltaf
	pushf
	push	ax
	cmp	strbuf[5]," "
	jne	kit1
	mov	strbuf[5],"0"
kit1:	@ATOI	strbuf[5]
	mov	temp2,ax
	pop	ax
	popf
orit1:	jc	orit2
	@WINPUTNUMBER	25,11,strbuf[10],pltaf
	pushf
	push	ax
	cmp	strbuf[10]," "
	jne	kit2
	mov	strbuf[10],"6"
kit2:	@ATOI	strbuf[10]
	mov	temp3,ax
	pop	ax
	popf
orit2:	jc	orit3
	@WINPUTNUMBER	25,12,strbuf[15],pltaf
	pushf
	push	ax
	cmp	strbuf[15]," "
	jne	kit3
	mov	strbuf[15],"1"
kit3:	@ATOI	strbuf[15]
	mov	temp4,ax
	pop	ax
	popf
orit3:	jc	orit4
	@WINPUTNUMBER	25,13,strbuf[20],pltaf
	pushf
	push	ax
	cmp	strbuf[20]," "
	jne	kit4
	mov	strbuf[20],"6"
kit4:	@ATOI	strbuf[20]
	mov	temp5,ax
	pop	ax
	popf
orit4:	jc	orit5
	jmp	orijan
orit5:	@UPPERAX
	cmp	al,@ESCAPE
	je	orioj
	@ATOL	strbuf1
	mov	temp11,ax
	mov	temp11[2],dx
	@LTOA	temp11,temp11[2],strbuf1
	cmp	temp1,0
	je	orioj
	mov	ax,end_pointer
	add	ax,73
	mov	user_pointer,ax
	mov	statstil,0
	mov	statstil[2],0
	mov	temp12[2],0
	mov	metatrop,1
	call	far ptr lgenitr
	@CHANGESEGM	es,CODE1
	cmp	es:handle_load,0
	je	iszer
	@CLOSE_HANDLE	es:handle_load
iszer:	call	far ptr bale_index
orioj:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmetatr
	@POP
	ret
metatr_basikon	endp

do_metatrop	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@INCL	statstil
	mov	ax,temp11[2]
	cmp	statstil[2],ax
	ja	domet1
	jb	domet3
	mov	ax,temp11
	cmp	statstil,ax
	jae	domet1
domet3:	@POP
	retf
domet1:	inc	temp12[2]
	mov	ax,temp12
	cmp	temp12[2],ax
	jbe	domet2
	mov	sp,epistrofi
	@POP
	retf
domet2:	@CHANGESEGM	es,PINOROI
	mov	bx,end_pointer
	cmp	bx,65000
	jbe	xorai
	mov	sp,epistrofi
	@POP
	retf
xorai:	mov	byte ptr es:[bx],"W"
	mov	byte ptr es:[bx+3],73
	mov	ax,offset CODE1:bas3
	mov	word ptr es:[bx+8],ax
	mov	ax,offset CODE1:bas2
	mov	word ptr es:[bx+10],ax
	mov	ax,offset CODE1:bas1
	mov	word ptr es:[bx+12],ax
	mov	byte ptr es:[bx+4],254
	mov	byte ptr es:[bx+5],254
	mov	ax,temp1
	mov	word ptr es:[bx+1],ax
	mov	ax,temp2
	mov	es:[bx+69],al
	mov	ax,temp3
	mov	es:[bx+70],al
	mov	ax,temp4
	mov	es:[bx+71],al
	mov	ax,temp5
	mov	es:[bx+72],al
	mov	di,bx
	add	di,19
	mov	si,0
	mov	ax,2
	xor	bx,bx
	mov	cx,6
skata:	mov	bl,plhres[si]
	mov	es:[bx][di],al
	inc	si
	inc	ax
	loop	skata
	add	end_pointer,73
	@POP
	retf
do_metatrop	endp

code	ends
	end
