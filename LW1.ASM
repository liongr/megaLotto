
INCLUDE	koina.inc
INCLUDE	klidi.inc

code	segment	public

	assume	cs:code

geniko_menu	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	call	praktor
	call	testonom
	call	testonom1
	mov	bx,4
gm0:	cmp	bx,32
	jbe	gm2
	xor	bx,bx
gm2:	@SELECTWI	0
	@INVERSE	menu1pn[bx],0,menu1pn[bx][1]
	call	word ptr menu1pn[bx][2]
	call	print_plirof
	@INVERSE	menu1pn[bx],0,menu1pn[bx][1]
	@UPPERAX
	cmp	ah,@RIGHT_ARROW
	jne	nra
	add	bx,4
	jmp	gm0
nra:	cmp	ah,@LEFT_ARROW
	jne	nla
	cmp	bx,3
	jbe	nlmin
	sub	bx,4
	jmp	gm0
nlmin:	mov	bx,32
nla:	jmp	gm0
geniko_menu	endp

menu_oroi	proc	near
	@PUSHAX
	mov	cs:_pliktro,0
	@CHANGESEGM	ds,WINDOWS
	@SELECTWI	0
	@SETWIND	woroi
	@SELECTWIND	woroi
	@WPRINTCH	22,0,"Â"
	@WPRINTCH	22,17,"Á"
	@WPRINTCH	44,0,"Â"
	@WPRINTCH	44,17,"Á"
	mov	dx,cs:_ploroi
	cmp	dl,0
	ja	skitr
	mov	dl,1
	mov	cs:_ploroi,dx
skitr:	push	dx
	jmp	mor0
mor00:	@INVERSE	cs:_cx,cs:_cy,21

scrt1:	@WAIT	6000
	jc	scri1
	call	save_screen
	jmp	scrt1
scri1:
	@INVERSE	cs:_cx,cs:_cy,21
	@CHANGESEGM	ds,DATA
	mov	cursx1,48
	mov	cursy1,14
	@CHANGESEGM	ds,WINDOWS
	cmp	ah,@HOME
	jne	nhom
	jmp	ohome
nhom:	cmp	ah,@END
	jne	nend
	jmp	oend
nend:	cmp	ah,@FUNC1
	jne	nff1
	call	far ptr gentaj
	call	print_pezo
nff1:	cmp	ah,@FUNC2
	jne	nff2
	call	far ptr pane_oro
	jmp	denex2
nff2:	cmp	ah,@FUNC9
	jne	nff3
	call	zeroflags
	call	metrhmasthlvn
	jmp	denex2
nff3:	cmp	ah,@FUNC3
	jne	nff4
	call	far ptr pane_omad
	jmp	denex2
nff4:	cmp	al," "
	jne	nspace
	jmp	space
nspace:	push	dx
	call	pl_elex
	jnc	mor1
	pop	dx
	@UPPERAX
	jmp	mort
mor1:	cmp	dx,0
	jne	mor0
	mov	ah,cs:_cy
	mov	al,cs:_cx
	push	ds
	push	cs
	pop	ds
	@TAKECURSWORD	cs:_pliktro,ax
	mov	al,cs:_pliktro
	pop	ds
	pop	dx
	jmp	mort
mor0:	pop	ax
	xor	ax,ax
	cmp	dl,0
	ja	mor04
	mov	al,0
	mov	ah,@LEFT_ARROW
	jmp	istaf
mor04:	cmp	dl,3
	jbe	mor03
	mov	al,0
	mov	ah,@RIGHT_ARROW
	jmp	istaf
mor03:	mov	cs:_ploroi,dx
	mov	al,dl
	dec	ax
	mov	cl,22
	mul	cl
	inc	ax
mor3:	mov	cs:_cx,al
	cmp	dh,16		;
	jbe	mor4
	mov	dh,16		;
mor4:	mov	cs:_cy,dh
	jmp	mor00
mort:	mov	cs:_pliktro,al
	jmp	mort1
istaf:	mov	cs:_pliktro,al
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	woroi
	@CHANGESEGM	ds,DATA
	@POPAX
	ret
mort1:	@CHANGESEGM	ds,DATA
	mov	bx,0
moro0:	cmp	oroipin[bx],0
	jne	kokir
	jmp	morot
kokir:	cmp	byte ptr oroipin[bx],al
	je	moro
	add	bx,5
	jmp	moro0
moro:	mov	al,cs:_cx
	mov	ah,cs:_cy
	cmp	cs:_pliktro,0
	je	kitsa
	mov	si,end_pointer
	mov	user_pointer,si
kitsa:	call	far ptr endias
	call	print_plirof
	mov	cs:_cx,al
	mov	cs:_cy,ah
denex2:	@CHANGESEGM	ds,DATA
	mov	al,pios_oros
	cmp	al,0
	je	denexi
	jmp	mort1
denexi:	@CHANGESEGM	ds,WINDOWS
	@SELECTWIND	woroi
	jmp	mor00
morot:	@CHANGESEGM	ds,DATA
	cmp	pios_oros,0
	je	denex1
	mov	pios_oros,0
	jmp	denex2
denex1:	@CHANGESEGM	ds,WINDOWS
	jmp	mor00
ohome:	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	user_pointer,0
	mov	al,es:[0]
	mov	pios_oros,al
	jmp	denex2
oend:	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	si,end_pointer
nort2:	cmp	byte ptr es:[si],254
	jne	norrt
	cmp	byte ptr es:[si+1],254
	jne	norrt
	sub	si,4
	jmp	nort1
norrt:	cmp	si,0
	je	nort1
	dec	si
	jmp	nort2
nort1:	mov	user_pointer,si
	mov	al,es:[si]
	mov	pios_oros,al
	jmp	denex2
space:	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	si,user_pointer
sort2:	cmp	byte ptr es:[si],254
	jne	sorrt
	cmp	byte ptr es:[si+1],254
	jne	sorrt
	sub	si,4
	jmp	sort1
sorrt:	cmp	si,0
	je	sort1
	dec	si
	jmp	sort2
sort1:	mov	user_pointer,si
	mov	al,es:[si]
	mov	pios_oros,al
	jmp	denex2
_cx	db	0
_cy	db	0
_pliktro db	0,0
_ploroi	dw	0101h
menu_oroi	endp

zeroflags	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	metatrop,0
	mov	statistikh,0
	mov	metrdlt,0
	mov	metrhma,0
	mov	aaxb,0
	mov	apla,0
	mov	pinakas,0
	mov	dialogh,0
	mov	diaaxb,0
	mov	pou_xani,0
	mov	mnhmo,0
	@POP
	ret
zeroflags	endp

save_screen	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETPOPUP	wsaves

	@STARTRND
list8:	mov	cx,50

list5:	push	cx
	xor	dx,dx
	@RND
	mov	ah,0
	shl	al,1
	mov	cx,10
	xor	dx,dx
	div	cx
	mov	bx,ax
	mov	al,cs:malaky[bx]
	cmp	al,21
	ja	list7
	mov	wsaves1[@WIN_Y],al
	@RND
	mov	ah,0
	shl	al,1
	mov	cx,10
	xor	dx,dx
	div	cx
	mov	bx,ax
	mov	al,cs:malakx[bx]
	cmp	al,70
	ja	list7
	mov	wsaves1[@WIN_X],al
	@RND
	mov	wsaves1[@WIN_ATR],al
	@SETWIND	wsaves1

list7:	pop	cx
	@WAIT	4
	jc	list6
	loop	list5

	@CLSWIND	wsaves
	jmp	list8

list6:	@ENDRND
list9:	@DELWIND	wsaves
	@POP
	ret
malakx	db	5,10,15,20,25,30,35,40,45,50,55,60,65,64
	db	6,11,16,21,26,31,36,41,46,51,56,61,66,68
	db	7,12,17,22,27,32,37,42,47,52,57,62,67,69
	db	8,13,18,23,28,33,38,43,49
malaky	db	5,10,15,20,6,11,16,12,7,12,17,19,5,10
	db	5,10,15,20,6,11,16,10,7,12,17,19,5,10
	db	5,10,15,20,6,11,16,9,7,12,17,19,5,10
	db	5,10,15,20,6,11,16,7,7
save_screen	endp

pane_oro proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	call	far ptr gentaj
	@TAKEWIND
	push	ax
	@SETWIND	wpanoros
	@SELECTWIND	wpanoros
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf," ",4
	@WINPUTNUMBER	24,3,strbuf
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wpanoros
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	pios_oros,0
	@ATOI	strbuf
	cmp	ax,0
	jne	axn0
	jmp	telor
axn0:	mov	cx,ax
	xor	si,si
	xor	dx,dx
	xor	di,di
allor:	mov	al,es:[si]
	cmp	al,0
	jne	nend1
	mov	si,di
	jmp	endor
nend1:	loop	allor1
	jmp	endor
allor1:	mov	dl,es:[si+3]
	mov	di,si
	add	si,dx
	jmp	allor
endor:	mov	user_pointer,si
	mov	al,es:[si]
	mov	pios_oros,al
	mov	cs:_pliktro,0
telor:	pop	dx
	@SELECTWI	dl
	@POP
	retf
pane_oro endp

pane_omad proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	call	far ptr gentaj
	@TAKEWIND
	push	ax
	@SETWIND	wpanomad
	@SELECTWIND	wpanomad
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf," ",3
	@WINPUTNUMBER	24,3,strbuf
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wpanomad
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	pios_oros,0
	@ATOI	strbuf
	cmp	ax,0
	ja	koka
	jmp	koka1
koka:	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	mov	si,pinomad[bx+18]
	mov	user_pointer,si
	mov	al,es:[si]
	mov	pios_oros,al
	mov	cs:_pliktro,0
koka1:	pop	dx
	@SELECTWI	dl
	@POP
	retf
pane_omad endp

pane_deltio proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@TAKEWIND
	push	ax
	@SETWIND	wpandelt
	@SELECTWIND	wpandelt
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,5,piodeltio
	@WINPUTNUMBER	24,3,strbuf
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wpandelt
	@CHANGESEGM	ds,DATA
	@ATOI	strbuf
	mov	piodeltio,ax
	mov	piodeltio[2],0
	pop	dx
	@SELECTWI	dl
	@POP
	retf
pane_deltio endp

endias	proc	near
	@PUSH
	mov	cs:_pliktro,0
	@CHANGESEGM	ds,DATA
	@SELECTWI	0
	@WPRINT	0,24,moroi
	@CHANGESEGM	es,PINOROI
	mov	adress,sp
	push	bx
	@ZEROBBUF	buffer1,200
	@ZEROBBUF	buffer2,200
	mov	si,user_pointer
	mov	bx,si
	add	bx,5
	xor	di,di
	xor	cx,cx
	mov	cl,es:[si+3]
	cmp	cx,0
	jne	isn00
	mov	ax,end_oros
	inc	ax
	mov	user_oros,ax
	jmp	is00
isn00:	sub	cx,3
jan13:	cmp	si,bx
	jne	bal62
	mov	ax,word ptr es:[si+1]
	mov	user_oros,ax
	add	si,3
bal62:	mov	al,es:[si]
	mov	buffer1[di],al
	inc	si
	inc	di
	loop	jan13
is00:	pop	bx
	push	cs
	mov	ax,offset cs:return
	push	ax
	les	si,dword ptr oroipin[bx][1]
	push	es
	push	si
	retf					;call far
return:	call	print_plirof
	@POP
	retf
endias	endp

menu_omadop	proc	near
	@PUSHAX
omstart:

scrt2:	@WAIT	6000
	jc	scri2
	call	save_screen
	jmp	scrt2

scri2:
	cmp	al,@ENTER
	je	om000
	cmp	ah,@DOWN_ARROW
	je	om000
	cmp	ah,@PG_DOWN
	je	om000
	@POPAX
	ret
om000:	mov	cs:omadagain,sp
	@CHANGESEGM	ds,DATA
	call	far ptr gentaj
	call	pos_omd
	call	insomad
	call	print_plirof
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	womades
	jmp	omstart
omadagain	dw	0
menu_omadop	endp

pos_omd	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	omades,0
	mov	cx,999
	mov	si,24
tom12:	cmp	pinomad[si],0
	je	tom22
	inc	omades
tom22:	add	si,24
	loop	tom12
	@POP
	ret
pos_omd	endp

omadop	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ITOAB	strbuf,3,sys_stat
	@WPRINT	26,1,strbuf
	@WPRINTCH	29,1,"."
	@ITOAB	strbuf,2,sys_stat[1]
	cmp	strbuf," "
	jne	aser1
	mov	strbuf,"0"
aser1:	@WPRINT	30,1,strbuf
	mov	cs:omy1,5
	mov	cx,cs:_ccx
	mov	bx,cs:_bbx
omad2:	cmp	pinomad[bx],0
	jne	omad0
	jmp	omad1
omad0:	mov	ax,1000
	sub	ax,cx
	@ITOA	strbuf,3
	@WPRINT	3,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx]
	@WPRINT	16,cs:omy1,strbuf
	cmp	bx,0
	jne	nypoxr
	jmp	ypoxr
nypoxr:	cmp	pinomad[bx+2],9999
	jne	skra1
	mov	strbuf," "
	mov	strbuf[1],""
	mov	strbuf[2]," "
	mov	strbuf[3],0
	jmp	skra2
skra1:	@ITOA	strbuf,2,pinomad[bx+2]
skra2:	@WPRINT	10,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+4]
	@WPRINT	23,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+6]
	@WPRINT	29,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+8]
	@WPRINT	35,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+10]
	@WPRINT	41,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+12]
	@WPRINT	49,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+14]
	@WPRINT	56,cs:omy1,strbuf
	@ITOA	strbuf,4,pinomad[bx+16]
	@WPRINT	62,cs:omy1,strbuf
ypoxr:	@ITOAB	strbuf,3,pinomad[bx+22]
	@WPRINT	67,cs:omy1,strbuf
	@WPRINTCH	70,cs:omy1,"."
	@ITOAB	strbuf,2,pinomad[bx+23]
	cmp	strbuf," "
	jne	asere
	mov	strbuf,"0"
asere:	@WPRINT	71,cs:omy1,strbuf
	inc	cs:omy1
	cmp	cs:omy1,19
	jbe	omad1
	jmp	ojis
omad1:	add	bx,24
	loop	omad222
ojis:	mov	cs:_cccx,cx
	mov	cs:_bbbx,bx
	xor	ax,ax
	mov	al,cs:omy1
	dec	ax
	mov	cs:maxy,ax
	@POP
	ret
maxy	dw	0
_ccx	dw	0
_bbx	dw	0
_cccx	dw	0
_bbbx	dw	0
omy1	db	0
omy	db	0
omad222: jmp	omad2
omadop	endp

insomad	proc	near
	@PUSH
	mov	cs:exomad,0
	@CHANGESEGM	ds,DATA
apoarxi:
	mov	cs:_cccx,999
	mov	cs:_bbbx,0
istart:
	mov	cx,cs:_cccx
	cmp	cx,0
	jne	iexi1
	jmp	apoarxi
iexi1:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	womades
	@SETWIND	womades
	@SELECTWI	0
	@WPRINT	0,24,wom0
	@SELECTWIND	womades
	@WPRINT	33,0,wom1
	@WPRINT	2,20,wom2
	@WPRINTCH	17,0,"Â"
	@WPRINTCH	0,2,"Ã"
	@WPRINTCH	0,4,"Ã"
	@WPRINTCH	73,2,"´"
	@WPRINTCH	73,4,"´"
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,plhroi
	@WPRINT	11,1,strbuf
	mov	bx,cs:_bbbx
	mov	cs:_ccx,cx
	mov	cs:_bbx,bx
	call	omadop
iomst:	mov	cs:omy,5
	mov	cx,cs:_ccx
	mov	bx,cs:_bbx
iomad2:	cmp	pinomad[bx],0
	jne	iomad0
	jmp	iomad1
iomad0:
xixi00:	cmp	bx,0
	jne	ommms
	jmp	ypox1
ommms:	mov	cs:exomad,1
	cmp	pinomad[bx+2],9999
	jne	xix001
	jmp	xixi10
xix001:	@ITOA	strbuf,2,pinomad[bx+2]
	@WINPUTNUMBER	10,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+2],ax
	call	omadop
	pop	ax
xix002:	@UPPERAX
	cmp	ax,0
	je	xixi10
	cmp	ah,@UP_ARROW
	jne	xixi01
	jmp	up_ar
xixi01:	call	extra_omad
	jnc	xixi0a
	call	omadop
	jmp	xixi00
xixi0a:	cmp	al,"T"
	jne	xix01
	jmp	theend
xix01:	cmp	ah,@DOWN_ARROW
	jne	xixi02
	jmp	dn_ar
xixi02:	cmp	ah,@PG_DOWN
	jne	xixi03
	jmp	pg_dn
xixi03:	cmp	ah,@LEFT_ARROW
	jne	xixi10
	jmp	xixi00
xixi10:	@ITOA	strbuf,4,pinomad[bx+4]
	@WINPUTNUMBER	23,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+4],ax
	call	omadop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	xixi20
	cmp	ah,@UP_ARROW
	jne	xixi11
	jmp	up_ar
xixi11:	call	extra_omad
	jnc	xixi1a
	call	omadop
	jmp	xixi10
xixi1a:	cmp	al,"T"
	jne	xix11
	jmp	theend
xix11:	cmp	ah,@DOWN_ARROW
	jne	xixi12
	jmp	dn_ar
xixi12:	cmp	ah,@PG_DOWN
	jne	xixi13
	jmp	pg_dn
xixi13:	cmp	ah,@LEFT_ARROW
	jne	xixi20
	jmp	xixi00
xixi20:	@ITOA	strbuf,4,pinomad[bx+6]
	@WINPUTNUMBER	29,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+6],ax
	call	omadop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	xixi30
	cmp	ah,@UP_ARROW
	jne	xixi21
	jmp	up_ar
xixi21:	call	extra_omad
	jnc	xixi2a
	call	omadop
	jmp	xixi20
xixi2a:	cmp	al,"T"
	jne	xix21
	jmp	theend
xix21:	cmp	ah,@DOWN_ARROW
	jne	xixi22
	jmp	dn_ar
xixi22:	cmp	ah,@PG_DOWN
	jne	xixi23
	jmp	pg_dn
xixi23:	cmp	ah,@LEFT_ARROW
	jne	xixi30
	jmp	xixi10
xixi30:	@ITOA	strbuf,4,pinomad[bx+8]
	@WINPUTNUMBER	35,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+8],ax
	call	omadop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	xixi40
	cmp	ah,@UP_ARROW
	jne	xixi31
	jmp	up_ar
xixi31:	call	extra_omad
	jnc	xixi3a
	call	omadop
	jmp	xixi30
xixi3a:	cmp	al,"T"
	jne	xix31
	jmp	theend
xix31:	cmp	ah,@DOWN_ARROW
	jne	xixi32
	jmp	dn_ar
xixi32:	cmp	ah,@PG_DOWN
	jne	xixi33
	jmp	pg_dn
xixi33:	cmp	ah,@LEFT_ARROW
	jne	xixi40
	jmp	xixi20
xixi40:	@ITOA	strbuf,4,pinomad[bx+10]
	@WINPUTNUMBER	41,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+10],ax
	call	omadop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	xixi50
	cmp	ah,@UP_ARROW
	jne	xixi41
	jmp	up_ar
xixi41:	call	extra_omad
	jnc	xixi4a
	call	omadop
	jmp	xixi40
xixi4a:	cmp	al,"T"
	jne	xix41
	jmp	theend
xix41:	cmp	ah,@DOWN_ARROW
	jne	xixi42
	jmp	dn_ar
xixi42:	cmp	ah,@PG_DOWN
	jne	xixi43
	jmp	pg_dn
xixi43:	cmp	ah,@LEFT_ARROW
	jne	xixi50
	jmp	xixi30
xixi50:
xixi60:	@ITOA	strbuf,4,pinomad[bx+14]
	@WINPUTNUMBER	56,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+14],ax
	call	omadop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	xixi70
	cmp	ah,@UP_ARROW
	jne	xixi61
	jmp	up_ar
xixi61:	call	extra_omad
	jnc	xixi5a
	call	omadop
	jmp	xixi50
xixi5a:	cmp	al,"T"
	jne	xix61
	jmp	theend
xix61:	cmp	ah,@DOWN_ARROW
	jne	xixi62
	jmp	dn_ar
xixi62:	cmp	ah,@PG_DOWN
	jne	xixi63
	jmp	pg_dn
xixi63:	cmp	ah,@LEFT_ARROW
	jne	xixi70
	jmp	xixi40
xixi70:	@ITOA	strbuf,4,pinomad[bx+16]
	@WINPUTNUMBER	62,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinomad[bx+16],ax
	call	omadop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	xixi80
	cmp	ah,@UP_ARROW
	jne	xixi71
	jmp	up_ar
xixi71:	call	extra_omad
	jnc	xixi7a
	call	omadop
	jmp	xixi70
xixi7a:	cmp	al,"T"
	jne	xix71
	jmp	theend
xix71:	cmp	ah,@DOWN_ARROW
	jne	xixi72
	jmp	dn_ar
xixi72:	cmp	ah,@PG_DOWN
	jne	xixi73
	jmp	pg_dn
xixi73:	cmp	ah,@LEFT_ARROW
	jne	xixi80
	jmp	xixi60
xixi80:	mov	ax,cs:maxy
	cmp	cs:omy,al
	jb	ypox1
	jmp	iomst
ypox1:	inc	cs:omy
iomad1:	add	bx,24
	loop	iomad222
theend:	cmp	cs:exomad,1
	je	okomad
nokom:

scrt3:	@WAIT	6000
	jc	scri3
	call	save_screen
	jmp	scrt3
scri3:
	@UPPERAX
	cmp	al,"T"
	je	okomad
	call	extra_omad
	jmp	nokom
okomad:	@POP
	ret
iomad222: jmp	iomad2
up_ar:	cmp	cs:omy,5
	jbe	xixi90
	dec	cs:omy
skrat:	sub	bx,24
	inc	cx
	cmp	pinomad[bx],0
	jne	xixi90
	jmp	skrat
xixi90:	jmp	xixi00
dn_ar:	mov	ax,cs:maxy
	cmp	cs:omy,al
	jae	xixi91
	jmp	ypox1
xixi91:	jmp	iomst
pg_dn:	jmp	istart
exomad	dw	0
insomad	endp

input_omad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	ax,1
	ja	kraj
	jmp	endod
kraj:	mov	si,ax
	@TAKEWIND
	push	ax
	mov	ax,si
	mov	cs:user_omad,ax
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	winputom
	@SELECTWIND	winputom
	@CHANGESEGM	ds,DATA
	call	input_omadp
	cmp	bx,0
	jne	inp18
	
	jmp	inp19
inp18:	@ITOA	strbuf1,4,pinomad[bx+4]
	@WINPUTNUMBER	23,3,strbuf1,pltaf
	push	ax
	@ATOI	strbuf1
	mov	pinomad[bx+4],ax
	pop	ax
	cmp	al,"T"
	je	isk01
	call	input_omadp
	@ITOA	strbuf1,4,pinomad[bx+6]
	@WINPUTNUMBER	29,3,strbuf1,pltaf
	push	ax
	@ATOI	strbuf1
	mov	pinomad[bx+6],ax
	pop	ax
	cmp	al,"T"
isk01:	je	isk02
	call	input_omadp
	@ITOA	strbuf1,4,pinomad[bx+8]
	@WINPUTNUMBER	35,3,strbuf1,pltaf
	push	ax
	@ATOI	strbuf1
	mov	pinomad[bx+8],ax
	pop	ax
	cmp	al,"T"
isk02:	je	isk03
	call	input_omadp
	@ITOA	strbuf1,4,pinomad[bx+10]
	@WINPUTNUMBER	41,3,strbuf1,pltaf
	push	ax
	@ATOI	strbuf1
	mov	pinomad[bx+10],ax
	pop	ax
	cmp	al,"T"
isk03:	je	isk04
	call	input_omadp
	@ITOA	strbuf1,4,pinomad[bx+14]
	@WINPUTNUMBER	56,3,strbuf1,pltaf
	push	ax
	@ATOI	strbuf1
	mov	pinomad[bx+14],ax
	pop	ax
	cmp	al,"T"
isk04:	je	isk05
	call	input_omadp
	@ITOA	strbuf1,4,pinomad[bx+16]
	@WINPUTNUMBER	62,3,strbuf1,pltaf
	push	ax
	@ATOI	strbuf1
	mov	pinomad[bx+16],ax
	pop	ax
	cmp	al,"T"
isk05:	je	isk06
	call	input_omadp
	jmp	inp18
isk06:
inp19:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	winputom
	pop	dx
	@SELECTWI	dl
endod:	@POP
	retf
user_omad	dw	0
input_omad	endp

input_omadp	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	ax,cs:user_omad
	@ITOA	strbuf1,3
	@WPRINT	3,3,strbuf1
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	@ITOA	strbuf1,4,pinomad[bx]
	@WPRINT	16,3,strbuf1
	cmp	pinomad[bx+2],9999
	jne	ikra1
	mov	strbuf1," "
	mov	strbuf1[1],""
	mov	strbuf1[2]," "
	mov	strbuf1[3],0
	jmp	ikra2
ikra1:	@ITOA	strbuf1,2,pinomad[bx+2]
ikra2:	@WPRINT	10,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+4]
	@WPRINT	23,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+6]
	@WPRINT	29,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+8]
	@WPRINT	35,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+10]
	@WPRINT	41,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+12]
	@WPRINT	49,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+14]
	@WPRINT	56,3,strbuf1
	@ITOA	strbuf1,4,pinomad[bx+16]
	@WPRINT	62,3,strbuf1
	@POP
	ret
input_omadp	endp

take_omad proc	near
	@PUSH
	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	mov	cx,999
	mov	si,0
taj03:	mov	pinomad[si],0
	add	si,24
	loop	taj03

	xor	si,si
taj01:	cmp	byte ptr es:[si],0
	je	ejik
	mov	ax,word ptr es:[si+1]
	cmp	ax,0
	je	ratsa
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	inc	pinomad[bx]
ratsa:	xor	cx,cx
	mov	cl,es:[si+3]
	add	si,cx
	jmp	taj01

ejik: 	mov	cx,999
	mov	si,0
taj031:	cmp	pinomad[si],0
	jne	taj032
	mov	pinomad[si+2],0
	mov	pinomad[si+4],0
	mov	pinomad[si+6],9999
	mov	pinomad[si+8],0
	mov	pinomad[si+10],9999
	mov	pinomad[si+12],0
	mov	pinomad[si+14],0
	mov	pinomad[si+16],9999
	mov	pinomad[si+18],0
	mov	pinomad[si+20],0
	mov	pinomad[si+22],0
taj032:	add	si,24
	loop	taj031
	@POP
	ret
take_omad endp

extra_omad	proc	near
	@PUSH
	mov	dx,ax
	@TAKEWIND
	push	ax
	mov	ax,dx
	cmp	ah,@FUNC1
	jne	nof1
	call	stat_omad
	call	omadop
	jmp	extra9
nof1:	cmp	ah,@CTRL_F9
	jne	noclf1
	call	stat_omadfor5
	call	omadop
	jmp	extra9
noclf1:	cmp	al,"A"
	jne	noaaa
;**********************************
IFNDEF	@DEMO
;**********************************
	call	antigrafi
;**********************************
ENDIF
;**********************************
	jmp	extra9
noaaa:	cmp	al,"S"
	jne	nosss
	call	sbisimo
	jmp	extra9
nosss:	cmp	al,"L"
	jne	nolll
	call	allagi
	jmp	extra9
nolll:	cmp	al,"O"
	jne	noooo
	call	oria_basikon
	jmp	extra9
noooo:	jmp	extra8
extra9:	pop	dx
	@SELECTWI	dl
	call	far ptr gentaj
	call	pos_omd
	@POP
	stc
	ret

extra8:	pop	ax
	@POP
	clc
	ret
extra_omad	endp

stat_omadfor5	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	statfor5,1
	call	stat_omad
	mov	statfor5,0
	@POP
	ret
stat_omadfor5	endp

stat_omad	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	mov	wstat1[5],07h
	@SETWIND	wstat1
	mov	wstat1[5],70h
	@CHANGESEGM	ds,DATA
	mov	st_omad,1
	mov	ax,pinomad
	mov	cs:_p00,ax
	mov	ax,pinomad[18]
	mov	cs:_p18,ax
	mov	cx,999
	mov	si,offset pinomad
	add	si,24
stom1:	mov	word ptr [si+22],0
	cmp	word ptr [si],0
	je	stom2
	mov	ypoxromad,si
	mov	omades,1
	mov	pinomad,0
	mov	aplesprot,0
	mov	yperom,0
	mov	statistikh,1
	call	far ptr lgenitr
	jnc	statt
	jmp	statof
statt:	call	apod_omad
stom2:	add	si,24
	loop	stom1
;*********************************** ypoxreotikoi
	mov	ax,cs:_p00
	mov	pinomad,ax
	mov	ax,cs:_p18
	mov	pinomad[18],ax
	mov	plhroi,0
	mov	omades,0
	mov	aplesprot,0
	mov	yperom,0
	mov	statistikh,1
	call	far ptr lgenitr
	jnc	statt1
	jmp	statof
statt1:	mov	si,offset pinomad
	call	apod_omad
;********************************** systhma
	call	far ptr gentaj
	mov	plhroi,0
	mov	statistikh,1
	call	far ptr lgenitr
	jnc	statt2
	jmp	statof
statt2:	mov	si,offset sys_stat
	sub	si,22
	call	apod_omad
denexei1:
	mov	ax,cs:_p00
	mov	pinomad,ax
	mov	ax,cs:_p18
	mov	pinomad[18],ax
	mov	st_omad,0
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wstat1
	@MBELL
	@POP
	ret
statof:	@CHANGESEGM	ds,DATA
	mov	ax,cs:_p00
	mov	pinomad,ax
	mov	ax,cs:_p18
	mov	pinomad[18],ax
	mov	cx,999
	mov	si,offset pinomad
srats:	add	si,24
	mov	word ptr [si+22],0
	loop	srats
	mov	st_omad,0
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wstat1
	@MBELL
	@POP
	ret
_p18	dw	0
_p00	dw	0
stat_omad	endp

apod_omad	proc
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	ax,sthles
	mov	cx,100
	mul	cx
	mov	cx,statstil
	cmp	cx,0
	jne	no00
	jmp	skara
no00:	div	cx
	mov	byte ptr [si+22],al
	mov	ax,dx
	mov	bx,10
	mul	bx
	div	cx
	mul	bx
	mov	di,ax
	mov	ax,dx
	mul	bx
	div	cx
	add	ax,di
	mov	byte ptr [si+23],al
skara:	@POP
	ret
apod_omad	endp

antigrafi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wantigr
	@SELECTWIND	wantigr	
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf," ",3
	@FILLSTR	strbuf[10]," ",3
antig0:	@WINPUTNUMBER	22,3,strbuf,pltaf
	push	ax
	pushf
	@ATOI	strbuf
	mov	temp1,ax
	popf
	pop	ax
	jc	antig9
	@WINPUTNUMBER	22,4,strbuf[10],pltaf
	push	ax
	pushf
	@ATOI	strbuf[10]
	mov	temp2,ax
	popf
	pop	ax
	jc	antig9
	jmp	antig0
antig9:	@UPPERAX
	cmp	al,@ESCAPE
	je	antnot
	cmp	temp1,0
	je	antnot
	cmp	temp2,0
	je	antnot
	call	do_antigr
	jc	antnot
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wantigr
	mov	sp,cs:omadagain
	jmp	om000
antnot:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wantigr
	@POP
	ret
antigrafi	endp

do_antigr	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	ax,temp1
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	cmp	pinomad[bx],0
	jne	ant07
	jmp	antejo
ant07:	mov	ax,temp2
	dec	ax
	mov	cx,24
	mul	cx
	mov	si,ax
	cmp	pinomad[si],0
	jne	ant05
	push	bx
	mov	cx,12
ant04:	mov	ax,pinomad[bx]
	mov	pinomad[si],ax
	add	bx,2
	add	si,2
	loop	ant04
	pop	bx
ant05:	mov	cx,pinomad[bx]
	mov	si,pinomad[bx+18]
	mov	bx,end_pointer
	cmp	bx,65000
	jbe	ant02
	jmp	antejo
	
ant02:	push	cx
	xor	cx,cx
	mov	cl,es:[si+3]
	mov	di,bx

ant01:	mov	al,es:[si]
	mov	es:[bx],al
	inc	si
	inc	bx
	loop	ant01
	mov	ax,temp2
	mov	word ptr es:[di+1],ax
	pop	cx
	cmp	bx,65000
	ja	anttel
	loop	ant02
anttel:	mov	end_pointer,bx
	@POP
	clc
	ret
antejo:	@POP
	stc
	ret
do_antigr	endp

allagi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	walagi
	@SELECTWIND	walagi
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf," ",3
	@FILLSTR	strbuf[10]," ",3
alag0:	@WINPUTNUMBER	22,3,strbuf,pltaf
	push	ax
	pushf
	@ATOI	strbuf
	mov	temp1,ax
	popf
	pop	ax
	jc	alag9
	@WINPUTNUMBER	22,4,strbuf[10],pltaf
	push	ax
	pushf
	@ATOI	strbuf[10]
	mov	temp2,ax
	popf
	pop	ax
	jc	alag9
	jmp	alag0
alag9:	@UPPERAX
	cmp	al,@ESCAPE
	je	allnot
	cmp	temp1,0
	je	allnot
	cmp	temp2,0
	je	allnot
	call	do_allagi
	jc	allnot
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	walagi
	mov	sp,cs:omadagain
	jmp	om000
allnot:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	walagi
	@POP
	ret
allagi	endp

do_allagi	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	ax,temp1
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	cmp	pinomad[bx],0
	jne	all07
	jmp	alltel
all07:	mov	ax,temp2
	dec	ax
	mov	cx,24
	mul	cx
	mov	si,ax
	cmp	pinomad[si],0
	jne	all05
	push	bx
	mov	cx,12
all04:	mov	ax,pinomad[bx]
	mov	pinomad[si],ax
	add	bx,2
	add	si,2
	loop	all04
	pop	bx
all05:	mov	cx,pinomad[bx]
	mov	si,pinomad[bx+18]
	
all02:	xor	dx,dx
	mov	dl,es:[si+3]
	mov	ax,temp2
	mov	word ptr es:[si+1],ax
	add	si,dx
	loop	all02
	@POP
	clc
	ret
alltel:	@POP
	stc
	ret
do_allagi	endp

sbisimo	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wsbisom
	@SELECTWIND	wsbisom
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf," ",3
sbis0:	@WINPUTNUMBER	24,5,strbuf,pltaf
	push	ax
	pushf
	@ATOI	strbuf
	mov	temp1,ax
	popf
	pop	ax
	jc	sbis9
	jmp	sbis0
sbis9:	@UPPERAX
	cmp	al,@ESCAPE
	je	sbisnot
	cmp	temp1,0
	je	sbisnot
	call	do_sbisimo
	jc	sbisnot
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wsbisom
	mov	sp,cs:omadagain
	jmp	om000
sbisnot:
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wsbisom
	@POP
	ret
sbisimo	endp

do_sbisimo	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	ax,temp1
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	cmp	pinomad[bx],0
	jne	sbi07i
	jmp	sbitel
sbi07i:	mov	si,pinomad[bx+18]
	mov	cx,999
	sub	cx,temp1
	cmp	cx,999
	ja	sbi06
	cmp	cx,0
	je	sbi06
sbi07:	add	bx,24
	mov	dx,pinomad[bx+18]
	cmp	dx,0
	jne	sbi05
	loop	sbi07
sbi06:	mov	dx,end_pointer
sbi05:	mov	cx,dx
	mov	di,cx
	sub	cx,si

sbi02:	mov	al,es:[di]
	mov	es:[si],al
	inc	si
	inc	di
	cmp	di,end_pointer
	jbe	sbi02
	sub	end_pointer,cx
	inc	cx
	mov	bx,end_pointer
sbi08:	mov	byte ptr es:[bx],0
	inc	bx
	loop	sbi08
	@POP
	clc
	ret
sbitel:	@POP
	stc
	ret
do_sbisimo	endp

oria_basikon	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wallor
	@SELECTWIND	wallor
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf," ",3
	@ZEROBBUF	strbuf[5],50
	mov	strbuf[5]," "
	mov	strbuf[10]," "
	mov	strbuf[15]," "
	mov	strbuf[20]," "
orijan:	@WINPUTNUMBER	25,4,strbuf,pltaf
	jc	orit1
	@WINPUTNUMBER	25,6,strbuf[5],pltaf
orit1:	jc	orit2
	@WINPUTNUMBER	25,7,strbuf[10],pltaf
orit2:	jc	orit3
	@WINPUTNUMBER	25,8,strbuf[15],pltaf
orit3:	jc	orit4
	@WINPUTNUMBER	25,9,strbuf[20],pltaf
orit4:	jc	orit5
	jmp	orijan
orit5:	@UPPERAX
	cmp	al,@ESCAPE
	je	orioj
	@ATOI	strbuf
	mov	temp1,ax
	cmp	strbuf[5]," "
	jne	zit1
	mov	strbuf[5],"9"
zit1:	@ATOI	strbuf[5]
	mov	temp2,ax
	cmp	strbuf[10]," "
	jne	zit2
	mov	strbuf[10],"9"
zit2:	@ATOI	strbuf[10]
	mov	temp3,ax
	cmp	strbuf[15]," "
	jne	zit3
	mov	strbuf[15],"9"
zit3:	@ATOI	strbuf[15]
	mov	temp4,ax
	cmp	strbuf[20]," "
	jne	zit4
	mov	strbuf[20],"9"
zit4:	@ATOI	strbuf[20]
	mov	temp5,ax
	cmp	temp1,0
	je	orioj
	call	do_oriabas
orioj:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wallor
	@POP
	ret
oria_basikon	endp

do_oriabas	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	ax,temp1
	dec	ax
	mov	cx,24
	mul	cx
	mov	bx,ax
	cmp	pinomad[bx],0
	jne	ori07
	jmp	oritel
ori07:	mov	si,pinomad[bx+18]
	mov	cx,pinomad[bx]

oriep:	xor	dx,dx
	mov	dl,es:[si+3]
	cmp	byte ptr es:[si],"W"
	jne	orial
	mov	ax,temp2
	cmp	ax,9
	je	kit10
	mov	es:[si+69],al
kit10:	mov	ax,temp3
	cmp	ax,9
	je	kit11
	mov	es:[si+70],al
kit11:	mov	ax,temp4
	cmp	ax,9
	je	kit12
	mov	es:[si+71],al
kit12:	mov	ax,temp5
	cmp	ax,9
	je	kit13
	mov	es:[si+72],al
kit13:
orial:	add	si,dx
	loop	oriep
oritel:	@POP
	ret
do_oriabas	endp

menu_yperomad	proc	near
	@PUSHAX
ypstart:

scrt4:	@WAIT	6000
	jc	scri4
	call	save_screen
	jmp	scrt4
scri4:
	cmp	al,@ENTER
	je	yp000
	cmp	ah,@DOWN_ARROW
	je	yp000
	@POPAX
	ret
yp000:	@CHANGESEGM	ds,DATA
	call	far ptr gentaj
	cmp	yperom,0
	jne	skrits
	jmp	ypstart
skrits:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wyperomad
	@SELECTWIND	wyperomad
	@WPRINTCH	0,2,"Ã"
	@WPRINTCH	40,2,"´"
	@WPRINTCH	12,0,"Â"
	@WPRINTCH	12,18,"Á"
	@WPRINTCH	21,0,"Â"
	@WPRINTCH	21,18,"Á"
	@WPRINTCH	27,0,"Â"
	@WPRINTCH	27,18,"Á"
	@WPRINTCH	33,0,"Â"
	@WPRINTCH	33,18,"Á"
	call	yperop
	call	ins_yper
	@DELWIND	wyperomad
	jmp	ypstart
menu_yperomad	endp

yperop	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cs:omy1,3
	mov	cx,cs:_ccx
	mov	bx,cs:_bbx
omad21:	cmp	pinyper[bx],0
	jne	omad01
	jmp	omad11
omad01:	mov	ax,100
	sub	ax,cx
	@ITOA	strbuf,3
	@WPRINT	4,cs:omy1,strbuf
	@ITOA	strbuf,3,pinyper[bx]
	@WPRINT	15,cs:omy1,strbuf
	@ITOA	strbuf,3,pinyper[bx+2]
	@WPRINT	23,cs:omy1,strbuf
	@ITOA	strbuf,3,pinyper[bx+4]
	@WPRINT	29,cs:omy1,strbuf
	inc	cs:omy1
	cmp	cs:omy1,17
	jbe	omad11
	jmp	yojis
omad11:	add	bx,10
	loop	omad211
yojis:	mov	cs:_cccx,cx
	mov	cs:_bbbx,bx
	xor	ax,ax
	mov	al,cs:omy1
	dec	ax
	mov	cs:maxy,ax
	@POP
	ret
omad211: jmp	omad21
yperop	endp

ins_yper	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
yparxi:	mov	cs:_cccx,99
	mov	cs:_bbbx,0
ystart:	mov	cx,cs:_cccx
	cmp	cx,0
	jne	yexi1
	jmp	yparxi
yexi1:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wyperomad
	@SETWIND	wyperomad
	@SELECTWIND	wyperomad
	@WPRINTCH	0,2,"Ã"
	@WPRINTCH	40,2,"´"
	@WPRINTCH	12,0,"Â"
	@WPRINTCH	12,18,"Á"
	@WPRINTCH	21,0,"Â"
	@WPRINTCH	21,18,"Á"
	@WPRINTCH	27,0,"Â"
	@WPRINTCH	27,18,"Á"
	@WPRINTCH	33,0,"Â"
	@WPRINTCH	33,18,"Á"
	@CHANGESEGM	ds,DATA
	mov	bx,cs:_bbbx
	mov	cs:_ccx,cx
	mov	cs:_bbx,bx
	call	yperop

ypst:	mov	cs:omy,3
	mov	cx,cs:_ccx
	mov	bx,cs:_bbx

imad21:	cmp	pinyper[bx],0
	jne	iomd01
	jmp	imad11
iomd01:	@ITOA	strbuf,3,pinyper[bx+2]
	@WINPUTNUMBER	23,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinyper[bx+2],ax
	call	yperop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	qixi50
	cmp	ah,@UP_ARROW
	jne	qixi41
	jmp	yup_ar
qixi41:	cmp	al,"T"
	jne	qix41
	jmp	ythend
qix41:	cmp	ah,@DOWN_ARROW
	jne	qixi42
	jmp	ydn_ar
qixi42:	cmp	ah,@PG_DOWN
	jne	qixi43
	jmp	ypg_dn
qixi43:	cmp	ah,@LEFT_ARROW
	jne	qixi50
	jmp	iomd01
qixi50:	@ITOA	strbuf,3,pinyper[bx+4]
	@WINPUTNUMBER	29,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	pinyper[bx+4],ax
	call	yperop
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	qixi50
	cmp	ah,@UP_ARROW
	jne	qixi51
	jmp	yup_ar
qixi51:	cmp	al,"T"
	jne	qix51
	jmp	ythend
qix51:	cmp	ah,@DOWN_ARROW
	jne	qixi52
	jmp	ydn_ar
qixi52:	cmp	ah,@PG_DOWN
	jne	qixi53
	jmp	ypg_dn
qixi53:	cmp	ah,@LEFT_ARROW
	jne	qixi60
	jmp	qixi50
qixi60:	mov	ax,cs:maxy
	cmp	cs:omy,al
	jb	yper1
	jmp	ypst
yper1:	inc	cs:omy
imad11: add	bx,10
	loop	imad211
ythend:	@POP
	ret
imad211: jmp	imad21
yup_ar:	cmp	cs:omy,3
	jbe	qixi90
	dec	cs:omy
srti:	sub	bx,10
	inc	cx
	cmp	pinyper[bx],0
	jne	qixi90
	jmp	srti
qixi90:	jmp	iomd01
ydn_ar:	mov	ax,cs:maxy
	cmp	cs:omy,al
	jae	qixi91
	jmp	yper1
qixi91:	jmp	ypst
ypg_dn:	jmp	ystart
ins_yper	endp

take_yper proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,99
	mov	si,0
taj13:	mov	pinyper[si],0
	add	si,10
	loop	taj13
	mov	cx,999
	mov	si,2
taj11:	push	cx
	mov	ax,pinomad[si]
	cmp	ax,0
	je	ekik1
	dec	ax
	mov	cx,10
	mul	cx
	mov	bx,ax
	inc	pinyper[bx]
ekik1:	pop	cx
	add	si,24
	loop	taj11
	mov	cx,99
	mov	si,0
taj131:	cmp	pinyper[si],0
	jne	taj132
	mov	pinyper[si+2],0
	mov	pinyper[si+4],0
taj132:	add	si,10
	loop	taj131
	@POP
	ret
take_yper endp

menu_protasi	proc	near
	@PUSHAX
prstart:

scrt5:	@WAIT	6000
	jc	scri5
	call	save_screen
	jmp	scrt5
scri5:
	cmp	al,@ENTER
	je	pr000
	cmp	ah,@DOWN_ARROW
	je	pr000
	@POPAX
	ret
pr000:	@CHANGESEGM	ds,DATA
	call	far ptr gentaj
	call	pos_omdp
	cmp	omades,0
	jne	doit0
	jmp	prstart
doit0:	call	menu_apli_protasi
	jmp	prstart
	@POP
	ret
menu_protasi	endp

menu_apli_protasi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wapliprot
	@SELECTWIND	wapliprot
	@WPRINTCH	4,21,"Á"
	@WPRINTCH	18,21,"Á"
	@WPRINTCH	36,21,"Á"
	@WPRINTCH	0,2,"Ã"
	@WPRINTCH	43,2,"´"
	@WPRINTCH	0,5,"Ã"
	@WPRINTCH	43,5,"´"
	@CHANGESEGM	ds,DATA
aplist:	call	tajapli
	mov	cx,15
	mov	bx,0
	mov	cs:omy,6
	call	menuapli
apli0:	@ITOA	strbuf,3,apliprot[bx]
	@WINPUTNUMBER	10,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	apliprot[bx],ax
	call	menuapli
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	aixi50
	cmp	ah,@UP_ARROW
	jne	aixi41
	jmp	aup_ar
aixi41:	cmp	al,"T"
	jne	aix41
	jmp	athend
aix41:	cmp	ah,@DOWN_ARROW
	jne	aixi42
	jmp	adn_ar
aixi42:	cmp	ah,@LEFT_ARROW
	jne	aixi50
	jmp	apli0
aixi50:	@ITOA	strbuf,3,apliprot[bx+2]
	@WINPUTNUMBER	25,cs:omy,strbuf,plomad
	push	ax
	@ATOI	strbuf
	mov	apliprot[bx+2],ax
	call	menuapli
	pop	ax
	@UPPERAX
	cmp	ax,0
	je	aixi60
	cmp	ah,@UP_ARROW
	jne	aixi51
	jmp	aup_ar
aixi51:	cmp	al,"T"
	jne	aix51
	jmp	athend
aix51:	cmp	ah,@DOWN_ARROW
	jne	aixi52
	jmp	adn_ar
aixi52:	cmp	ah,@LEFT_ARROW
	jne	aixi60
	jmp	apli0
aixi60:	inc	cs:omy
	add	bx,8
	loop	apli00
	jmp	aplist
athend:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wapliprot
	@POP
	ret
apli00:	jmp	apli0
adn_ar:	jmp	aixi60
aup_ar:	cmp	cs:omy,6
	jbe	axi91
	inc	cx
	dec	cs:omy
	sub	bx,8
	jmp	apli0
axi91:	jmp	aplist
menu_apli_protasi	endp

menuapli proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,15
	mov	bx,0
	mov	cs:omy1,6
papli0:	@ITOA	strbuf,3,apliprot[bx]
	@WPRINT	10,cs:omy1,strbuf
	@ITOA	strbuf,3,apliprot[bx+2]
	@WPRINT	25,cs:omy1,strbuf
	inc	cs:omy1
	add	bx,8
	loop	papli0
	@POP
	ret
menuapli	endp

tajapli	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,15
	mov	bx,0
taja2:	cmp	apliprot[bx],0
	jne	taja0
	mov	apliprot[bx+2],0
taja0:	cmp	apliprot[bx+2],0
	jne	taja1
	mov	apliprot[bx],0
taja1:	add	bx,8
	loop	taja2

	mov	cx,999
	mov	si,0
	mov	di,0
	mov	ypoxromad[di],0
	mov	di,2
	mov	ax,1
atiom1:	cmp	pinomad[si],0
	je	atiom2
	cmp	pinomad[si+2],9999
	je	atiom3
	cmp	pinomad[si+2],0
	jne	atiom2
atiom3:	mov	ypoxromad[di],ax
	add	di,2
atiom2:	add	si,24
	inc	ax
	loop	atiom1

	mov	ax,di
	shr	ax,1
	mov	omades,ax
	mov	cx,15
	mov	bx,0
taja4:	cmp	apliprot[bx],0
	je	taja3
	push	cx
	xor	dx,dx
	mov	ax,apliprot[bx]
taja8:	mov	cx,omades
	mov	si,0
taja6:	cmp	ax,ypoxromad[si]
	jne	taja5
	jmp	taja7
taja5:	add	si,2
	loop	taja6
	mov	apliprot[bx],0
	mov	apliprot[bx+2],0
	jmp	taja9
taja7:	inc	dx
	cmp	dx,2
	jae	taja9
	mov	ax,apliprot[bx+2]
	jmp	taja8
taja9:	pop	cx
taja3:	add	bx,8
	loop	taja4

	mov	cx,15
taja14:	push	cx
	mov	cx,15
	mov	bx,0
	mov	si,0
taja15:	cmp	apliprot[bx],0
	jne	taja10
	mov	si,bx
	jmp	taja11
taja10:	mov	dh,0
	cmp	bx,si
	je	taja12
	mov	ax,apliprot[bx]
	mov	apliprot[si],ax
	mov	apliprot[bx],0
	mov	ax,apliprot[bx+2]
	mov	apliprot[si+2],ax
	mov	apliprot[bx+2],0
	mov	ax,apliprot[bx+2]
	mov	apliprot[si+4],ax
	mov	apliprot[bx+4],0
	mov	ax,apliprot[bx+6]
	mov	apliprot[si+6],ax
	mov	apliprot[bx+6],0
taja12:	add	si,8
taja11:	add	bx,8
	loop	taja15
	pop	cx
	loop	taja14

	mov	cx,999
	mov	bx,0
taja23:	cmp	pinomad[bx+2],9999
	jne	taja22
	mov	pinomad[bx+2],0
taja22:	add	bx,24
	loop	taja23

	mov	cx,16
	mov	bx,0
taja21:	mov	ax,apliprot[bx]
	cmp	ax,0
	je	taja20
	push	cx
	dec	ax
	mov	cx,24
	mul	cx
	mov	si,ax
	mov	pinomad[si+2],9999

	mov	ax,apliprot[bx+2]
	dec	ax
	mov	cx,24
	mul	cx
	mov	si,ax
	mov	pinomad[si+2],9999
	pop	cx
taja20:	add	bx,8
	loop	taja21

	mov	cx,15
	mov	si,0
	mov	aplesprot,0
taja31:	cmp	apliprot[si],0
	je	taja30
	inc	aplesprot
	add	si,8
	loop	taja31
taja30:	@POP
	ret
tajapli	endp

pos_omdp proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	omades,0
	mov	cx,999
	mov	si,24
astom1:	cmp	pinomad[si],0
	je	astom2
	cmp	pinomad[si+2],9999
	je	astom3
	cmp	pinomad[si+2],0
	jne	astom2
astom3:	inc	omades
astom2:	add	si,24
	loop	astom1
	@POP
	ret
pos_omdp endp

menu_epejerg	proc	near
	@PUSHAX
	call	print_plirof
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wepej
	@SELECTWIND	wepej
	jmp	pidass
emprss:	@CHANGESEGM	ds,WINDOWS
	@SELECTWIND	wepej
	@INVERSE	cs:_cx,cs:_cy,27
pidass:	@CHANGESEGM	ds,DATA
	@WPRINT	19,8,meisagf,@FLASH
	@WPRINT	19,9,mejagf,@FLASH
	call	zeroflags
	@CHANGESEGM	ds,WINDOWS
	@SELECTWIND	wepej
	mov	dx,cs:_plepej
	cmp	dl,0
	jne	dl00
	mov	dl,1
	mov	cs:_plepej,dx
dl00:	push	dx
	jmp	empr0
empr00:	@INVERSE	cs:_cx,cs:_cy,27

scrt7:	@WAIT	6000
	jc	scri7
	call	save_screen
	jmp	scrt7
scri7:
	@INVERSE	cs:_cx,cs:_cy,27
	push	dx
	call	pl_elex
	jc	laos
	jmp	empr1
laos:	pop	dx
	@UPPERAX
	cmp	ah,@DEL
	jne	nodel
	@CHANGESEGM	ds,DATA
	cmp	cs:_cy,8
	je	cy888
	cmp	cs:_cy,9
	je	cy999
	jmp	nodel
cy888:	@FILLSTR	meisagf," ",8
	@INVERSE	cs:_cx,cs:_cy,27
	jmp	emprss
cy999:	@FILLSTR	mejagf," ",8
	@INVERSE	cs:_cx,cs:_cy,27
	jmp	emprss
nodel:	cmp	al,"9"
	ja	empr6
	cmp	al,"1"
	jb	empr6
	mov	cs:_cy,al
	sub	cs:_cy,48
empr6:	@INVERSE	cs:_cx,cs:_cy,27
	cmp	al,"1"
	jne	empr01
	call	metrhmasthlvn
	jmp	emprss
empr01:	cmp	al,"2"
	jne	empr02
	call	metrhmadeltivn
	jmp	emprss
empr02:	cmp	al,"3"
	jne	empr03
	call	pinakasariumvn
	jmp	emprss
empr03:	cmp	al,"4"
	jne	empr04
	call	ektipdeltivn
	jmp	emprss
empr04:	cmp	al,"5"
	jne	empr05
	call	sthlesouonh
	jmp	emprss
empr05:	cmp	al,"6"
	jne	empr06
	call	dialogistl
	jmp	emprss
empr06:	cmp	al,"7"
	jne	empr07
	call	dialogidlt
	jmp	emprss
empr07:
;******************************************
IFNDEF	@DEMO
;******************************************
	cmp	al,"8"
	jne	empr08
	call	arx_eisag
	jmp	emprss
empr08:	cmp	al,"9"
	jne	empr09
	call	arx_ejag
;******************************************
ENDIF
;******************************************
empr09:	jmp	emprss
empr1:	cmp	dx,0
	jne	empr0
	mov	ah,cs:_cy
	mov	al,cs:_cx
	add	al,3
	push	ds
	push	cs
	pop	ds
	@TAKECURSWORD	cs:_pliktro,ax
	mov	al,cs:_pliktro
	pop	ds
	pop	dx
	jmp	empr6
empr0:	pop	ax
	cmp	dl,0
	ja	emp001
	mov	al,0
	mov	ah,@LEFT_ARROW
	jmp	emprt
emp001:	cmp	dl,2
	jb	emp002
	mov	al,0
	mov	ah,@RIGHT_ARROW
	jmp	emprt
emp002:	mov	cs:_plepej,dx
	xor	ax,ax
	mov	cs:_cx,1
	cmp	dh,9
	jbe	empr4
	mov	dh,9
empr4:	mov	cs:_cy,dh
	jmp	empr00
emprt:	@DELWIND	wepej
	@POPAX
	ret
_plepej	dw	0101h
menu_epejerg	endp

metrhmasthlvn	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetrstl
	@SELECTWIND	wmetrstl
	@CHANGESEGM	ds,DATA
	call	autosave
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn000
	cmp	meisagf," "
	je	mn000
	jmp	mn001
mn000:	cmp	plhroi,0
	je	mst10
mn001:	mov	metrhma,1
	call	praktscr
	call	far ptr lgenitr
mst10:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmetrstl
	call	print_plirof
	@POP
	ret
metrhmasthlvn	endp

ektiposi_stl_xarti	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetrstl
	@SELECTWIND	wmetrstl
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,code1
	call	autosave
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	xmn000
	cmp	meisagf," "
	je	xmn000
	jmp	xmn001
xmn000:	cmp	plhroi,0
	je	xmst10
xmn001:
;-----------------------------------------------------
	mov	ax,offset lptnames
	mov	lpt_number,ax
	mov	es:print_stack_stl,sp
;-----------------------------------------------------
	mov	sel,0
	mov	ax,0
	call	far ptr PCLorEPSON
	@LPRINTSTR	prn_reset,lpt_number,es:print_stack_stl
	@LPRINTSTR	prn_set_conden,lpt_number,es:print_stack_stl
;-----------------------------------------------------
	mov	metrhma,10
	call	praktscr
	call	far ptr lgenitr
xmst10:	@LPRINTSTR	prn_formfeed,lpt_number,es:print_stack_stl
	@LPRINT_STOP
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmetrstl
	call	print_plirof
	@POP
	ret
ektiposi_stl_xarti	endp

proepilogi_ektipoti	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wektipselect
	@CHANGESEGM	ds,DATA
	@PLHKTRO
	cmp	al,"1"
	jne	proep1
	mov	pcl_prn,0
	jmp	proep9
proep1:	cmp	al,"2"
	jne	proep2
	mov	pcl_prn,0
	jmp	proep9
	
proep2:	cmp	al,"3"
	jne	proep9
	mov	pcl_prn,1
	jmp	proep9
	
proep9:	call	save_inf
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wektipselect
	@CHANGESEGM	ds,DATA
	@POP
	ret
proepilogi_ektipoti	endp

metrhmadeltivn	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetrdlt
	@SELECTWIND	wmetrdlt
	@CHANGESEGM	ds,DATA
	call	autosave
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn010
	cmp	meisagf," "
	je	mn010
	jmp	mn011
mn010:	cmp	plhroi,0
	je	mdlt10
mn011:	mov	aaxb,1
	mov	metrdlt,1
	call	praktscr
	call	far ptr lgenitr
mdlt10:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmetrdlt
	call	print_plirof
	@POP
	ret
metrhmadeltivn	endp

pinakasariumvn	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wpinakas
	@SELECTWIND	wpinakas
	@CHANGESEGM	ds,DATA
	call	autosave
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn020
	cmp	meisagf," "
	je	mn020
	jmp	mn021
mn020:	cmp	plhroi,0
	je	pin10
mn021:	mov	pinakas,1
	call	far ptr lgenitr
pin10:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wpinakas
	call	print_plirof
	@POP
	ret
pinakasariumvn	endp

ektipdeltivn	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	call	far ptr opendlts
	call	far ptr opendlt
	call	autosave
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn030
	cmp	meisagf," "
	je	mn030
	jmp	mn031
mn030:	cmp	plhroi,0
	je	ekt10
mn031:	mov	aaxb,1

	mov	ax,offset lptnames
	mov	lpt_number,ax

	mov	protapo,0
	mov	protevs,0
	call	far ptr innames
	@CLRPLBUF
	call	far ptr lgenitr
ekt10:	call	far ptr closedlt
	@SELECTWI	0
	call	print_plirof
	@POP
	ret
ektipdeltivn	endp

for_proto	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	deltia[2],0
	je	mikra
	@POP
	retf
mikra:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wproto
	@SELECTWIND	wproto
	@CHANGESEGM	ds,DATA
protj3:	@FILLSTR	strbuf," ",4
	@WINPUTNUMBER	22,4,strbuf
	pushf
	@ATOI	strbuf
	mov	protapo,ax
	popf
	jc	proterr
	@FILLSTR	strbuf," ",4
	@WINPUTNUMBER	22,5,strbuf
	pushf
	@ATOI	strbuf
	mov	protevs,ax
	popf
	jc	proterr
	jmp	isos
proterr:
	mov	protapo,0
	mov	protevs,0
	mov	protodrx,0
	mov	protodrx[2],0
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wproto
	@POP
	stc
	retf
isos:	@CHANGESEGM	ds,DATA
	@ZEROBBUF	protop,10
	mov	cs:_protox,6
janapr:	@CURSW	cs:_protox,9
	@UPPERAX
	cmp	ah,@LEFT_ARROW
	jne	prl
	jmp	prleft
prl:	cmp	ah,@RIGHT_ARROW
	jne	prr
	jmp	prright
prr:	cmp	al,"T"
	jne	prt
	jmp	prtaf
prt:	cmp	al,@ESCAPE
	jne	pre
	jmp	proterr
pre:	cmp	al,13
	je	prsel
	cmp	al," "
	jne	prsp
prsel:	jmp	prselect
prsp:	@MBELL
	jmp	janapr
prleft:	cmp	cs:_protox,6
	jbe	lefno
	sub	cs:_protox,4
lefno:	jmp	janapr
prright: cmp	cs:_protox,41
	jae	lefno
	add	cs:_protox,4
	jmp	janapr

prselect:
	@PUSH
	mov	cx,10
	xor	bx,bx
ispr01:	cmp	protop[bx],0
	je	ispr00
	mov	ax,bx
	mov	cx,4
	mul	cl
	add	ax,5
	@INVERSE	al,8,3
	@INVERSE	al,9,3
	@INVERSE	al,10,3
ispr00:	inc	bx
	loop	ispr01
	@ZEROBBUF	protop,10
	@POP

	xor	ax,ax
	mov	al,cs:_protox
	sub	ax,6
	mov	cx,4
	xor	dx,dx
	div	cx
	mov	bx,ax
	mov	al,protop[bx]
	not	al
	and	al,1
	mov	protop[bx],al
	dec	cs:_protox
	@INVERSE	cs:_protox,8,3
	@INVERSE	cs:_protox,9,3
	@INVERSE	cs:_protox,10,3
	inc	cs:_protox
	
	jmp	janapr
;------------------------------------------------>>>
prtaf:	mov	cx,10
	xor	bx,bx
prtdfg:	cmp	protop[bx],1
	je	exoprt
	inc	bx
	loop	prtdfg
	mov	proto_simio,0
	jmp	nektpr9
exoprt:	mov	proto_simio,bx
	xor	ax,ax
	mov	al,cs:protoposa[bx]
	mov	bx,timhp
	xor	cx,cx
	xor	dx,dx
	call	far ptr longmul
	mov	protodrx,ax
	mov	protodrx[2],dx
;*********************************
	mov	pejeproto,0
	cmp	protevs,0
	je	nektpr9
	mov	ax,protapo
	cmp	deltia,ax
	jb	nektpr9
	mov	pejeproto,1
	dec	protevs
nektpr9:
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wproto
	@POP
	clc
	retf
_protox	db	0
protoposa	db	1,2,3,4,5,6,10,20,50,100
for_proto	endp

innames	proc	near
	@PUSH
	@POP
	retf
innames	endp

sthlesouonh	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wstlouon
	@SELECTWIND	wstlouon
	@CHANGESEGM	ds,DATA
	call	autosave
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn040
	cmp	meisagf," "
	je	mn040
	jmp	mn041
mn040:	cmp	plhroi,0
	je	stlu10
mn041:	mov	apla,1
	call	far ptr lgenitr
stlu10:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wstlouon
	call	print_plirof
	@POP
	ret
sthlesouonh	endp

dialogistl	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdialst
dlsta:	call	far ptr ins_nikitr
	jnc	tzo1
	jmp	dlst10
tzo1:	@CHANGESEGM	ds,DATA
	mov	cx,50
	xor	bx,bx
	xor	ax,ax
ix01:	cmp	stdial[bx],0
	je	ix00
	inc	ax
ix00:	inc	bx
	loop	ix01
	cmp	ax,5
	jb	dlsta
	call	des_pou_xani
	@CHANGESEGM	ds,WINDOWS
	@SELECTWIND	wdialst
	@CHANGESEGM	ds,DATA
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn050
	cmp	meisagf," "
	je	mn050
	jmp	mn051
mn050:	cmp	plhroi,0
	je	dlst10
mn051:	mov	dialogh,1
	call	praktscr
	call	far ptr lgenitr
dlst10:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wdialst
	call	print_plirof
	@POP
	ret
dialogistl	endp

des_pou_xani	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	plhres,6
	mov	cx,49
	mov	bx,1
	mov	si,0
kostab:	cmp	stdial[bx],0
	je	kosta
	mov	plhres[si],bl
	inc	si
kosta:	inc	bx
	loop	kostab
	cmp	si,6
	je	ejimin
	@POP
	ret
ejimin:	call	far ptr gentaj
	mov	plhroi,0
	call	print_plirof
	call	printep
	mov	pou_xani,1
	call	far ptr lgenitr
	mov	pou_xani,0
	@CHANGESEGM	es,CODE1
	mov	al,byte ptr es:pios_xani[2]
	cmp	al,0
	je	denexase
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wexase
	@SELECTWIND	wexase
	cmp	al,1
	jne	exas1
	jmp	exypox
exas1:	cmp	al,2
	jne	exas2
	jmp	exprot
exas2:	cmp	al,3
	jne	exas3
	jmp	exasom
exas3:	jmp	exyper
denexase:
	@POP
	ret
exypox:	@CHANGESEGM	ds,WINDOWS
	@WPRINT	1,3,exase1
	@CHANGESEGM	ds,DATA
	mov	ax,pinomad
	inc	ax
	call	take_pl
	add	ax,plhroi
	sub	ax,es:pios_xani
	jmp	extel
exprot:	@CHANGESEGM	ds,WINDOWS
	@WPRINT	1,3,exase2
	mov	ax,es:pios_xani
	xor	dx,dx
	mov	cx,8
	div	cx
	inc	ax
	jmp	extel
exasom:	@CHANGESEGM	ds,WINDOWS
	@WPRINT	1,3,exase3
	mov	ax,es:pios_xani
	sub	ax,offset pinomad
	mov	cx,24
	xor	dx,dx
	div	cx
	inc	ax
	jmp	extel
exyper:	@CHANGESEGM	ds,WINDOWS
	@WPRINT	1,3,exase4
	mov	ax,es:pios_xani
	sub	ax,offset pinyper
	mov	cx,10
	xor	dx,dx
	div	cx
	inc	ax	
extel:	@CHANGESEGM	ds,DATA
	@ITOA	strbuf
	@WPRINT	18,4,strbuf
	@MBELL
	@WAITL
scri16:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wexase
	@POP
	ret
des_pou_xani	endp

dialogidlt	proc	near
	@PUSH
	@changesegm	DS,windows
	mov	wdial1,96
	@SETWIND	wdial1
	mov	wdial1,32
	@SETWIND	wdial1
	@SETWIND	wdial2
	call	far ptr ins_nikitr
	jnc	tzo0
	jmp	ddlt10
tzo0:	@CHANGESEGM	ds,DATA
	call	far ptr gentaj
	call	print_plirof
	call	printep
	cmp	meisagf,0
	je	mn060
	cmp	meisagf," "
	je	mn060
	jmp	mn061
mn060:	cmp	plhroi,0
	je	ddlt10
mn061:	mov	diaaxb,1
	call	far ptr lgenitr
ddlt10:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wdial2
	mov	wdial1,96
	@DELWIND	wdial1
	call	print_plirof
	@POP
	ret
dialogidlt	endp

gentaj	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wgentaj
	@CHANGESEGM	ds,DATA
	call	tajinomisi
	call	take_pl
	call	take_omad
	call	poses_omad
	call	dieuy_omad
	call	take_yper
	call	poses_yper
	call	tajapli
	call	do_ypoxromad
	call	do_ypomad
	call	do_yperomad
	cmp	load,0
	je	noload
	call	tajload
	call	print_pezo
noload:	call	find_plir
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wgentaj
	@POP
	retf
gentaj	endp

find_plir	proc	near
	@PUSH
	@CHANGESEGM	ds,PINOROI
	@CHANGESEGM	es,DATA
	@ZEROBBUF	es:genplires,50
	xor	si,si
skits1:	cmp	byte ptr [si],"0"
	jne	terma1
	jmp	pagene
irua:	xor	cx,cx
	mov	cl,[si+3]
	add	si,cx
	jmp	skits1
terma1:	@POP
	ret
pagene:	@PUSH
	mov	cx,49
	mov	bx,20
	mov	di,0
allob:	cmp	byte ptr [si][bx],0
	je	byte0
	mov	es:genplires[di],1
byte0:	inc	bx
	inc	di
	loop	allob
	@POP
	jmp	irua
find_plir	endp

take_pl	proc	near
	@PUSH
	@CHANGESEGM	ds,PINOROI
	@CHANGESEGM	es,DATA
	xor	ax,ax
	xor	si,si
skitso:	cmp	byte ptr [si],"0"
	jne	terma
	inc	ax
	xor	cx,cx
	mov	cl,[si+3]
	add	si,cx
	jmp	skitso
terma:	mov	es:plhroi,ax
	@POP
	ret
take_pl	endp

poses_omad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	omades,0
	mov	cx,999
	mov	si,24
tom1:	cmp	pinomad[si],0
	je	tom2
	cmp	pinomad[si+2],0
	jne	tom2
	inc	omades
tom2:	add	si,24
	loop	tom1
	@POP
	ret
poses_omad	endp

dieuy_omad	proc	near
	@PUSH
	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	mov	ax,1
	xor	si,si
	mov	pinomad[18],si
skit1:	cmp	byte ptr es:[si],0
	je	oust9
	cmp	word ptr es:[si+1],ax
	jb	oust
	jne	oust1
oust2:	push	ax
	dec	ax
	mov	cx,24
	mul	cx
	add	ax,18
	mov	di,ax
	pop	ax
	mov	pinomad[di],si
	inc	ax
	jmp	oust
oust1:	mov	ax,word ptr es:[si+1]
	jmp	oust2
oust:	xor	cx,cx
	mov	cl,es:[si+3]
	add	si,cx
	jmp	skit1
oust9:	@POP
	ret
dieuy_omad	endp

poses_yper	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	yperom,0
	mov	cx,99
	mov	si,0
tt13:	cmp	pinyper[si],0
	je	tt14
	inc	yperom
tt14:	add	si,10
	loop	tt13
	@POP
	ret
poses_yper	endp

do_ypoxromad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	call	poses_omad
	mov	cx,999
	mov	si,offset pinomad
	add	si,24
	mov	di,0
itom1:	cmp	word ptr [si],0
	je	itom2
	cmp	word ptr [si+2],0
	jne	itom2
	mov	ypoxromad[di],si
	add	di,2
itom2:	add	si,24
	loop	itom1
	mov	ax,di
	shr	ax,1
	cmp	ax,omades
	je	ok
	@EXIT
ok:	@POP
	ret
do_ypoxromad	endp

do_ypomad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,99
	mov	si,offset pinyper
	mov	di,0
itt13:	cmp	word ptr [si],0
	je	itt14
	mov	ypomad[di],si
	add	di,2
itt14:	add	si,10
	loop	itt13
	@POP
	ret
do_ypomad	endp

do_yperomad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,99
	mov	di,0
	mov	ax,1
iitt15:	push	cx
	mov	si,offset pinomad
	mov	cx,999
iitt13:	cmp	word ptr [si+2],ax
	jne	iitt14
	mov	yperomad[di],si
	add	di,2
iitt14:	add	si,24
	loop	iitt13
	inc	ax
	pop	cx
	loop	iitt15
	@POP
	ret
do_yperomad	endp

tajinomisi	proc	near
	@PUSH
	call	clr_paizo
	@CHANGESEGM	ds,PINOROI
	@CHANGESEGM	es,DATA
	call	take_omad
	mov	cx,999
	mov	si,0
	mov	di,0
	mov	es:ypoxromad[di],0
	mov	di,2
	mov	ax,1
tiom1:	cmp	es:pinomad[si],0
	je	tiom2
	mov	es:ypoxromad[di],ax
	add	di,2
tiom2:	add	si,24
	inc	ax
	loop	tiom1

	mov	ax,di
	shr	ax,1
	mov	cx,ax
	xor	bx,bx
	xor	di,di
istr:	push	cx
	mov	ax,es:ypoxromad[bx]
	xor	si,si
iskit:	cmp	byte ptr [si],0
	je	iter
	cmp	word ptr [si+1],ax
	jne	iepom
	call	paizo_oro
	cmp	di,si
	jne	kanto
	xor	cx,cx
	mov	cl,[si+3]
	add	si,cx
	mov	di,si
	jmp	iskit
kanto:	call	brika
	xor	cx,cx
	mov	cl,[di+3]
	add	di,cx
	add	si,cx
	jmp	iskit
iepom:	xor	cx,cx
	mov	cl,[si+3]
	add	si,cx
	jmp	iskit
iter:	pop	cx
	add	bx,2
	loop	istr
	call	far ptr bale_index
	@POP
	ret
tajinomisi	endp

printep	proc	near
	@PUSH
	@TAKEWIND
	push	ax
	@SELECTWI	0
	@WPRINT	69,24,mepej,@FLASH
	pop	dx
	@SELECTWI	dl
	@POP
	ret
printep	endp

print_plirof	proc	near
	@PUSH
	@TAKEWIND
	push	ax
	@SELECTWI	0
	@CHANGESEGM	ds,DATA
	@WPRINT	0,24,mplhrof
	xor	bx,bx
yyuii:	cmp	filename[bx],"."
	je	yuii
	cmp	filename[bx],0
	je	yuii
	inc	bx
	jmp	yyuii
yuii:	mov	filename[bx],0
	@WPRINT	12,24,filename
	@LTOA	sthles_old,sthles_old[2],strbuf
	@WPRINT	32,24,strbuf
	call	pos_omd
	mov	ax,omades
	mov	promades,ax
	@ITOA	strbuf,3,omades
	@WPRINT	52,24,strbuf
	call	poses_omad
	@ITOA	strbuf,4,oroi_all
	@WPRINT	64,24,strbuf
	@WPRINT	69,24,manam,@FLASH
	pop	dx
	@SELECTWI	dl
	@POP
	ret
print_plirof	endp

clr_paizo	proc	near
	@PUSH
	@ZEROBBUF	cs:pezonte,5000,0
	mov	oroi_all,0
	@POP
	ret
clr_paizo	endp

paizo_oro	proc	near
	push	bx
	xor	bx,bx
	mov	bl,[si]
	shl	bx,1
	inc	word ptr cs:pezonte[bx]
	inc	es:oroi_all
	pop	bx
	ret
pezonte	db	5000 dup(0)
paizo_oro	endp

print_pezo	proc	near
	@PUSH
	@TAKEWIND
	push	ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wpezo
	@SELECTWIND	wpezo
	@WPRINTCH	22,0,"Â"
	@WPRINTCH	22,17,"Á"
	@WPRINTCH	44,0,"Â"
	@WPRINTCH	44,17,"Á"
	@CHANGESEGM	ds,DATA
	cmp	word ptr cs:pezonte["0"*2],0
	je	is001
	@INVERSE	1,1,21
is001:	@ITOA	strbuf,4,cs:pezonte["0"*2]
	@WPRINT	17,1,strbuf
	cmp	word ptr cs:pezonte["W"*2],0
	je	is002
	@INVERSE	1,2,21
is002:	@ITOA	strbuf,4,cs:pezonte["W"*2]
	@WPRINT	17,2,strbuf
	cmp	word ptr cs:pezonte["S"*2],0
	je	is003
	@INVERSE	1,3,21
is003:	@ITOA	strbuf,4,cs:pezonte["S"*2]
	@WPRINT	17,3,strbuf
	cmp	word ptr cs:pezonte["D"*2],0
	je	is004
	@INVERSE	1,4,21
is004:	@ITOA	strbuf,4,cs:pezonte["D"*2]
	@WPRINT	17,4,strbuf
	cmp	word ptr cs:pezonte["A"*2],0
	je	is005
	@INVERSE	1,5,21
is005:	@ITOA	strbuf,4,cs:pezonte["A"*2]
	@WPRINT	17,5,strbuf
	cmp	word ptr cs:pezonte["C"*2],0
	je	is006
	@INVERSE	1,6,21
is006:	@ITOA	strbuf,4,cs:pezonte["C"*2]
	@WPRINT	17,6,strbuf
	cmp	word ptr cs:pezonte["V"*2],0
	je	is007
	@INVERSE	1,7,21
is007:	@ITOA	strbuf,4,cs:pezonte["V"*2]
	@WPRINT	17,7,strbuf
	cmp	word ptr cs:pezonte["B"*2],0
	je	is008
	@INVERSE	1,8,21
is008:	@ITOA	strbuf,4,cs:pezonte["B"*2]
	@WPRINT	17,8,strbuf
	cmp	word ptr cs:pezonte["1"*2],0
	je	is009
	@INVERSE	1,9,21
is009:	@ITOA	strbuf,4,cs:pezonte["1"*2]
	@WPRINT	17,9,strbuf
	cmp	word ptr cs:pezonte["8"*2],0
	je	is010
	@INVERSE	1,10,21
is010:	@ITOA	strbuf,4,cs:pezonte["8"*2]
	@WPRINT	17,10,strbuf
	cmp	word ptr cs:pezonte["6"*2],0
	je	is011
	@INVERSE	1,11,21
is011:	@ITOA	strbuf,4,cs:pezonte["6"*2]
	@WPRINT	17,11,strbuf
	cmp	word ptr cs:pezonte["!"*2],0
	je	is012
	@INVERSE	1,12,21
is012:	@ITOA	strbuf,4,cs:pezonte["!"*2]
	@WPRINT	17,12,strbuf
	cmp	word ptr cs:pezonte["$"*2],0
	je	is013
	@INVERSE	1,13,21
is013:	@ITOA	strbuf,4,cs:pezonte["$"*2]
	@WPRINT	17,13,strbuf
	cmp	word ptr cs:pezonte["&"*2],0
	je	is014
	@INVERSE	1,14,21
is014:	@ITOA	strbuf,4,cs:pezonte["&"*2]
	@WPRINT	17,14,strbuf
	cmp	word ptr cs:pezonte["L"*2],0
	je	is015
	@INVERSE	23,1,21
is015:	@ITOA	strbuf,4,cs:pezonte["L"*2]
	@WPRINT	39,1,strbuf
	cmp	word ptr cs:pezonte["K"*2],0
	je	is016
	@INVERSE	23,2,21
is016:	@ITOA	strbuf,4,cs:pezonte["K"*2]
	@WPRINT	39,2,strbuf
	cmp	word ptr cs:pezonte["J"*2],0
	je	is017
	@INVERSE	23,3,21
is017:	@ITOA	strbuf,4,cs:pezonte["J"*2]
	@WPRINT	39,3,strbuf
	cmp	word ptr cs:pezonte["H"*2],0
	je	is018
	@INVERSE	23,4,21
is018:	@ITOA	strbuf,4,cs:pezonte["H"*2]
	@WPRINT	39,4,strbuf
	cmp	word ptr cs:pezonte["G"*2],0
	je	is019
	@INVERSE	23,5,21
is019:	@ITOA	strbuf,4,cs:pezonte["G"*2]
	@WPRINT	39,5,strbuf
	cmp	word ptr cs:pezonte["Y"*2],0
	je	is020
	@INVERSE	23,6,21
is020:	@ITOA	strbuf,4,cs:pezonte["Y"*2]
	@WPRINT	39,6,strbuf
	cmp	word ptr cs:pezonte["O"*2],0
	je	is021
	@INVERSE	23,7,21
is021:	@ITOA	strbuf,4,cs:pezonte["O"*2]
	@WPRINT	39,7,strbuf
	cmp	word ptr cs:pezonte["I"*2],0
	je	is022
	@INVERSE	23,8,21
is022:	@ITOA	strbuf,4,cs:pezonte["I"*2]
	@WPRINT	39,8,strbuf
	cmp	word ptr cs:pezonte["2"*2],0
	je	is023
	@INVERSE	23,9,21
is023:	@ITOA	strbuf,4,cs:pezonte["2"*2]
	@WPRINT	39,9,strbuf
	cmp	word ptr cs:pezonte["4"*2],0
	je	is024
	@INVERSE	23,10,21
is024:	@ITOA	strbuf,4,cs:pezonte["4"*2]
	@WPRINT	39,10,strbuf
	cmp	word ptr cs:pezonte["7"*2],0
	je	is025
	@INVERSE	23,11,21
is025:	@ITOA	strbuf,4,cs:pezonte["7"*2]
	@WPRINT	39,11,strbuf
	cmp	word ptr cs:pezonte["@"*2],0
	je	is026
	@INVERSE	23,12,21
is026:	@ITOA	strbuf,4,cs:pezonte["@"*2]
	@WPRINT	39,12,strbuf
	cmp	word ptr cs:pezonte["%"*2],0
	je	is027
	@INVERSE	23,13,21
is027:	@ITOA	strbuf,4,cs:pezonte["%"*2]
	@WPRINT	39,13,strbuf
	cmp	word ptr cs:pezonte["*"*2],0
	je	is028
	@INVERSE	23,14,21
is028:	@ITOA	strbuf,4,cs:pezonte["*"*2]
	@WPRINT	39,14,strbuf
	cmp	word ptr cs:pezonte["M"*2],0
	je	is029
	@INVERSE	45,1,21
is029:	@ITOA	strbuf,4,cs:pezonte["M"*2]
	@WPRINT	61,1,strbuf
	cmp	word ptr cs:pezonte["N"*2],0
	je	is030
	@INVERSE	45,2,21
is030:	@ITOA	strbuf,4,cs:pezonte["N"*2]
	@WPRINT	61,2,strbuf
	cmp	word ptr cs:pezonte["Z"*2],0
	je	is031
	@INVERSE	45,3,21
is031:	@ITOA	strbuf,4,cs:pezonte["Z"*2]
	@WPRINT	61,3,strbuf
	cmp	word ptr cs:pezonte["U"*2],0
	je	is032
	@INVERSE	45,4,21
is032:	@ITOA	strbuf,4,cs:pezonte["U"*2]
	@WPRINT	61,4,strbuf
	cmp	word ptr cs:pezonte["E"*2],0
	je	is033
	@INVERSE	45,5,21
is033:	@ITOA	strbuf,4,cs:pezonte["E"*2]
	@WPRINT	61,5,strbuf
	cmp	word ptr cs:pezonte["R"*2],0
	je	is034
	@INVERSE	45,6,21
is034:	@ITOA	strbuf,4,cs:pezonte["R"*2]
	@WPRINT	61,6,strbuf
	cmp	word ptr cs:pezonte["Q"*2],0
	je	is035
	@INVERSE	45,7,21
is035:	@ITOA	strbuf,4,cs:pezonte["Q"*2]
	@WPRINT	61,7,strbuf
	cmp	word ptr cs:pezonte["F"*2],0
	je	is036
	@INVERSE	45,8,21
is036:	@ITOA	strbuf,4,cs:pezonte["F"*2]
	@WPRINT	61,8,strbuf
	cmp	word ptr cs:pezonte["3"*2],0
	je	is037
	@INVERSE	45,9,21
is037:	@ITOA	strbuf,4,cs:pezonte["3"*2]
	@WPRINT	61,9,strbuf
	cmp	word ptr cs:pezonte["5"*2],0
	je	is038
	@INVERSE	45,10,21
is038:	@ITOA	strbuf,4,cs:pezonte["5"*2]
	@WPRINT	61,10,strbuf
	cmp	word ptr cs:pezonte[")"*2],0
	je	is0381
	@INVERSE	45,11,21
is0381:	@ITOA	strbuf,4,cs:pezonte[")"*2]
	@WPRINT	61,11,strbuf
	cmp	word ptr cs:pezonte["#"*2],0
	je	is039
	@INVERSE	45,12,21
is039:	@ITOA	strbuf,4,cs:pezonte["#"*2]
	@WPRINT	61,12,strbuf
	cmp	word ptr cs:pezonte["^"*2],0
	je	is040
	@INVERSE	45,13,21
is040:	@ITOA	strbuf,4,cs:pezonte["^"*2]
	@WPRINT	61,13,strbuf
	cmp	word ptr cs:pezonte["("*2],0
	je	is041
	@INVERSE	45,14,21
is041:	@ITOA	strbuf,4,cs:pezonte["("*2]
	@WPRINT	61,14,strbuf
	cmp	word ptr cs:pezonte["<"*2],0
	je	is042
	@INVERSE	23,15,21
is042:	@ITOA	strbuf,4,cs:pezonte["<"*2]
	@WPRINT	39,15,strbuf
	cmp	word ptr cs:pezonte[">"*2],0
	je	is043
	@INVERSE	1,15,21
is043:	@ITOA	strbuf,4,cs:pezonte[124]	;">"*2
	@WPRINT	17,15,strbuf

	cmp	word ptr cs:pezonte["|"*2],0
	je	is061
	@INVERSE	1,16,21
is061:	@ITOA	strbuf,4,cs:pezonte["|"*2]
	@WPRINT	17,16,strbuf

	cmp	word ptr cs:pezonte["_"*2],0
	je	is062
	@INVERSE	23,16,21
is062:	@ITOA	strbuf,4,cs:pezonte["_"*2]
	@WPRINT	39,16,strbuf

	cmp	word ptr cs:pezonte["~"*2],0
	je	is063
	@INVERSE	45,15,21
is063:	@ITOA	strbuf,4,cs:pezonte["~"*2]
	@WPRINT	61,15,strbuf

	cmp	word ptr cs:pezonte[":"*2],0
	je	is044
	@INVERSE	45,16,21
is044:	call	print_plirof

scrt14:	@WAIT	6000
	jc	scri14
	call	save_screen
	jmp	scrt14
scri14:
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wpezo
	pop	dx
	@SELECTWI	dl
	@POP
	ret
print_pezo	endp

brika	proc	near
	@PUSH
	push	si
	xor	cx,cx
	xor	bx,bx
	mov	cl,[si+3]
ibr01:	mov	al,[si]
	mov	es:strbuf[bx],al
	inc	bx
	inc	si
	loop	ibr01

	pop	bx
	dec	bx
	dec	si
ibr02:	mov	al,[bx]
	mov	[si],al
	cmp	bx,di
	jbe	ibr04
	dec	bx
	dec	si
	jmp	ibr02

ibr04:	xor	cx,cx
	xor	bx,bx
	mov	cl,es:strbuf[3]
ibr03:	mov	al,es:strbuf[bx]
	mov	[di],al
	inc	bx
	inc	di
	loop	ibr03
	@POP
	ret
brika	endp

menu_metablhta	proc	near
	@PUSHAX
mtstart:

scrt8:	@WAIT	6000
	jc	scri8
	call	save_screen
	jmp	scrt8
scri8:
	cmp	al,@ENTER
	je	mt000
	cmp	ah,@DOWN_ARROW
	je	mt000
	@POPAX
	ret
mt000:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetabl
	@SELECTWIND	wmetabl
	@CHANGESEGM	ds,DATA
	mov	ax,filtra
	dec	ax
	@ITOA	strbuf,3
	@WPRINT	19,11,strbuf
	cmp	metabl,0
	jne	met01
	mov	cs:_cy,2
	jmp	metst
met01:	mov	ax,7
	sub	al,idosmet
	mov	cs:_cy,al
metst:	@INVERSE	1,cs:_cy,28

scrt9:	@WAIT	6000
	jc	scri9
	call	save_screen
	jmp	scrt9
scri9:
	@INVERSE	1,cs:_cy,28
	@UPPERAX
	cmp	al,"T"
	jne	nrf
	jmp	metend
nrf:	cmp	al,"F"
	je	nnoof
	jmp	nof
nnoof:	@INVERSE	1,cs:_cy,28
	mov	ax,filtra
	dec	ax
	@ITOA	strbuf,3
	@WINPUTNUMBER	19,11,strbuf,pltaf
	push	ax
	@ATOI	strbuf
	cmp	ax,0
	ja	nxf
	mov	ax,1
nxf:	cmp	ax,999
	jbe	nef
	mov	ax,999
nef:	@ITOA	strbuf,3
	@WPRINT	19,11,strbuf
	inc	ax
	mov	filtra,ax
	pop	ax
	cmp	al,"T"
	je	metend
	@INVERSE	1,cs:_cy,28
	jmp	metst
nof:	cmp	al,"6"
	jbe	nif
	jmp	metst
nif:	cmp	al,"1"
	jae	naf
	jmp	metst
naf:	sub	al,48
	mov	dx,8
	sub	dl,al
	mov	cs:_cy,dl
	jmp	metst
metend:	cmp	cs:_cy,2
	je	metplr
	mov	metabl,1
	xor	ax,ax
	mov	al,cs:_cy
	mov	dx,7
	sub	dx,ax
	mov	idosmet,dl
	jmp	metbl
metplr:	mov	metabl,0
metbl:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmetabl
	jmp	mtstart
menu_metablhta	endp

menu_arxia	proc	near
	@PUSHAX
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	warxeia
	@SELECTWIND	warxeia
	jmp	pidarx
amprss:	call	print_plirof
	@CHANGESEGM	ds,WINDOWS
	@SELECTWIND	warxeia
	@INVERSE	cs:_cx,cs:_cy,28
pidarx:	mov	dx,cs:_plarxia
	cmp	dl,0
	ja	dl00a
	mov	dl,1
	mov	cs:_plarxia,dx
dl00a:	push	dx
	jmp	ampr0
ampr00:	@INVERSE	cs:_cx,cs:_cy,28

scrt10:	@WAIT	6000
	jc	scri10
	call	save_screen
	jmp	scrt10
scri10:
	@INVERSE	cs:_cx,cs:_cy,28
	push	dx
	call	pl_elex
	jc	amprr1
	jmp	ampr1
amprr1:	pop	dx
	@UPPERAX
	mov	cs:_cy,al
	sub	cs:_cy,48
ampr6:	@INVERSE	cs:_cx,cs:_cy,28
	cmp	al,"1"
	jne	no001
	call	savesys
	jmp	amprss
no001:	cmp	al,"2"
	jne	no002
	call	loadsys				;;REM LOAD
	jmp	amprss
no002:	cmp	al,"3"
	jne	no003
	call	addsys				;;REM ADD
no003:	cmp	al,"4"
	jne	no004
	call	in_disk
	jmp	amprss
no004:	cmp	al,"5"
	jne	no005
	call	autosave
	call	clrsys1
	jmp	amprss
no005:	cmp	al,"6"
	jne	no006
	call	deletef
	jmp	amprss
no006:	cmp	al,"7"
	jne	no007
	call	deletes
	jmp	amprss
no007:	cmp	al,"8"
	jne	no008
	call	autosave
	call	end_lotto
no008:	jmp	amprss
ampr1:	cmp	dx,0
	jne	ampr0
	mov	ah,cs:_cy
	mov	al,cs:_cx
	add	al,3
	push	ds
	push	cs
	pop	ds
	@TAKECURSWORD	cs:_pliktro,ax
	mov	al,cs:_pliktro
	pop	ds
	pop	dx
	jmp	ampr6
ampr0:	pop	ax
	cmp	dl,0
	ja	amp01
	mov	al,0
	mov	ah,@LEFT_ARROW
	jmp	amprt
amp01:	cmp	dl,2
	jb	amp02
	mov	al,0
	mov	ah,@RIGHT_ARROW
	jmp	amprt
amp02:	mov	cs:_plarxia,dx
	xor	ax,ax
	mov	cs:_cx,1
	cmp	dh,8
	jbe	ampr4
	mov	dh,8
ampr4:	mov	cs:_cy,dh
	jmp	ampr00
amprt:	@DELWIND	warxeia
	@POPAX
	ret
_plarxia dw	0101h
menu_arxia	endp

menu_diafora	proc	near
	@PUSHAX
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdiafor
	@SELECTWIND	wdiafor
	jmp	didarx
damprss: @CHANGESEGM	ds,WINDOWS
	@SELECTWIND	wdiafor
	@INVERSE	cs:_cx,cs:_cy,30
didarx:	mov	dx,cs:_pldiafor
	cmp	dl,0
	ja	ddl00a
	mov	dl,1
	mov	cs:_pldiafor,dx
ddl00a:	push	dx
	jmp	dampr0
dampr00: @INVERSE	cs:_cx,cs:_cy,30

scrt11:	@WAIT	6000
	jc	scri11
	call	save_screen
	jmp	scrt11
scri11:
	@INVERSE	cs:_cx,cs:_cy,30
	push	dx
	call	pl_elex
	jc	damprr1
	jmp	dampr1
damprr1: pop	dx
	@UPPERAX
	mov	cs:_cy,al
	sub	cs:_cy,48
dampr6:	@INVERSE	cs:_cx,cs:_cy,30
	cmp	al,"1"
	jne	dno001
	call	autosave
;**********************************
IFNDEF	@DEMO
;**********************************
	call	metatr_basikon
;**********************************
ENDIF
;**********************************
	jmp	damprss
dno001:	cmp	al,"4"
	jne	dno002
	call	autosave
	call	addfile
	jmp	damprss
dno002:	cmp	al,"5"
	jne	dno003
	@CHANGESEGM	ds,DATA
	cmp	end_pointer,0
	jne	exisys
	jmp	damprss
exisys:	call	print_plirof
	call	far ptr gentaj
	call	far ptr ekt_oron
	jmp	damprss
dno003:	cmp	al,"2"
	jne	dno004
	call	take_omad
	call	far ptr basikes_stat
	jmp	damprss
dno004:	cmp	al,"3"
	jne	dno005
	@CHANGESEGM	ds,DATA
	cmp	meisagf,0
	je	ariu1
	cmp	meisagf," "
	je	ariu1
	jmp	damprss
ariu1:	call	autosave
	call	far ptr ariumosires
	jmp	damprss
dno005:	cmp	al,"6"
	jne	dno006
	call	set_timi_stilis
	jmp	damprss
dno006:	cmp	al,"7"
	jne	dno007
	call	ektiposi_stl_xarti
	jmp	damprss
dno007:	cmp	al,"8"
	jne	dno008
	call	proepilogi_ektipoti
dno008:	jmp	damprss
dampr1:	cmp	dx,0
	jne	dampr0
	mov	ah,cs:_cy
	mov	al,cs:_cx
	add	al,3
	push	ds
	push	cs
	pop	ds
	@TAKECURSWORD	cs:_pliktro,ax
	mov	al,cs:_pliktro
	pop	ds
	pop	dx
	jmp	dampr6
dampr0:	pop	ax
	cmp	dl,0
	ja	damp01
	mov	al,0
	mov	ah,@LEFT_ARROW
	jmp	damprt
damp01:	cmp	dl,2
	jb	damp02
	mov	al,0
	mov	ah,@RIGHT_ARROW
	jmp	damprt
damp02:	mov	cs:_pldiafor,dx
	xor	ax,ax
	mov	cs:_cx,1
	cmp	dh,8
	jbe	dampr4
	mov	dh,8
dampr4:	mov	cs:_cy,dh
	jmp	dampr00
damprt:	@DELWIND	wdiafor
	@POPAX
	ret
_pldiafor dw	0101h
menu_diafora	endp

set_timi_stilis	proc	near
	@PUSH
	@TAKEWIND
	push	ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wtimes
	@SELECTWIND	wtimes
	@CHANGESEGM	ds,DATA
	mov	ax,timh
	@ITOA	strbuf,4
	@WINPUTNUMBER	25,4,strbuf
	@ATOI	strbuf
	mov	timh,ax
	mov	ax,timhp
	@ITOA	strbuf,4
	@WINPUTNUMBER	25,5,strbuf
	@ATOI	strbuf
	mov	timhp,ax
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wtimes
	pop	ax
	@SELECTWI	al
	call	save_inf
	@POP
	ret
set_timi_stilis	endp

lotto_diaf	proc	near
	@PUSHAX
	@CHANGESEGM	ds,DATA
	@FILLSTR	strbuf,"±",80
	@WPRINT	0,24,strbuf
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wlotto
	@SELECTWIND	wlotto
	jmp	lidarx
lamprss: @CHANGESEGM	ds,WINDOWS
	@SELECTWIND	wlotto
	@INVERSE	cs:_cx,cs:_cy,30
lidarx:	mov	dx,cs:_pllotto
	cmp	dl,0
	ja	ldl00a
	mov	dl,1
	mov	cs:_pllotto,dx
ldl00a:	push	dx
	jmp	lampr0
lampr00: @INVERSE	cs:_cx,cs:_cy,30

scrt12:	@WAIT	6000
	jc	scri12
	call	save_screen
	jmp	scrt12
scri12:
	@INVERSE	cs:_cx,cs:_cy,30
	push	dx
	call	pl_elex
	jc	lamprr1
	jmp	lampr1
lamprr1: pop	dx
	@UPPERAX
	mov	cs:_cy,al
	sub	cs:_cy,48
lampr6:	@INVERSE	cs:_cx,cs:_cy,30
	cmp	al,"1"
	jne	lno001
	call	ins_nea
	jmp	lamprss
lno001:	cmp	al,"2"
	jne	lno002
	call	autosave
	call	anapt_58
	jmp	lamprss
lno002:	cmp	al,"3"
	jne	lno003
	call	autosave
	call	anaptrnd
	jmp	lamprss
lno003:	cmp	al,"4"
	jne	lno004
	call	autosave
	call	far ptr etoima_sys
	call	far ptr gentaj
	jmp	lamprss
lno004:	cmp	al,"5"
	jne	lno005
;	call
	jmp	lamprss
lno005:	cmp	al,"6"
	jne	lno006
;	call
	jmp	lamprss
lno006:	cmp	al,"7"
	jne	lno007
;	call
	jmp	lamprss
lno007:	cmp	al,"8"
	jne	lno008
;	call
lno008:	jmp	lamprss
lampr1:	cmp	dx,0
	jne	lampr0
	mov	ah,cs:_cy
	mov	al,cs:_cx
	add	al,3
	push	ds
	push	cs
	pop	ds
	@TAKECURSWORD	cs:_pliktro,ax
	mov	al,cs:_pliktro
	pop	ds
	pop	dx
	jmp	lampr6
lampr0:	pop	ax
	cmp	dl,0
	ja	lamp01
	mov	al,0
	mov	ah,@LEFT_ARROW
	jmp	lamprt
lamp01:	cmp	dl,2
	jb	lamp02
	mov	al,0
	mov	ah,@RIGHT_ARROW
	jmp	lamprt
lamp02:	mov	cs:_pllotto,dx
	xor	ax,ax
	mov	cs:_cx,1
	cmp	dh,4
	jbe	lampr4
	mov	dh,4
lampr4:	mov	cs:_cy,dh
	jmp	lampr00
lamprt:	@DELWIND	wlotto
	@POPAX
	ret
_pllotto dw	0101h
lotto_diaf	endp

anapt_58 proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wse58
janapl:	@CHANGESEGM	ds,WINDOWS
	@SELECTWIND	wse58
	@CHANGESEGM	ds,DATA
	mov	metrdlt,0
	mov	ana58,1
	xor	ax,ax
	mov	al,idos58
	sub	ax,5
	@ITOA	strbuf,1
	@WPRINT	22,2,strbuf

scrt13:	@WAIT	6000
	jc	scri13
	call	save_screen
	jmp	scrt13
scri13:
	cmp	al,@ESCAPE
	jne	no000
	mov	ana58,0
	call	far ptr gentaj
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wse58
	@POP
	ret
no000:	cmp	al,"0"
	jne	n030
	@CHANGESEGM	ds,DATA
	mov	plhuos58,0
	mov	idos58,10
	@ZEROBBUF	plhres58,49
	jmp	janapl
n030:	cmp	al,"4"
	je	ektit
	cmp	al,"3"
	je	anapit
	cmp	al,"2"
	je	metit
	cmp	al,"1"
	je	esplir
	jmp	janapl
metit:	@CHANGESEGM	ds,DATA
	xor	ax,ax
	mov	al,idos58
	sub	ax,5
	@ITOA	strbuf,1
	@WINPUTNUMBER	22,2,strbuf,pltaf
	@ATOI	strbuf
	cmp	ax,6
	jae	metit
	cmp	ax,1
	jb	metit
	add	ax,5
	mov	idos58,al
	jmp	janapl
esplir:	call	plir58
	jmp	janapl
anapit:	@CHANGESEGM	ds,DATA
	cmp	plhuos58,14
	jb	skatr
	call	dlt58
	jmp	janapl
ektit:	@CHANGESEGM	ds,DATA
	cmp	plhuos58,14
	jb	skatr
	call	far ptr opendlts
	call	far ptr opendlt
;;	mov	ax,lptstart
;;	mov	lptnum,ax

	mov	ax,offset lptnames
	mov	lpt_number,ax

	call	far ptr innames
	@CLRPLBUF
	call	far ptr se58
	call	far ptr closedlt
skatr:	jmp	janapl
	@POP
	ret
anapt_58 endp

dlt58	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetrdlt
	@SELECTWIND	wmetrdlt
	@CHANGESEGM	ds,DATA
	mov	metrdlt,1
	call	far ptr se58
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmetrdlt
	@POP
	ret
dlt58	endp

plir58	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	genplires,50
	@STRCOPY	stdial,buffer2,50
	@ZEROBBUF	stdial,50
	mov	cx,plhuos58
	cmp	cx,0
	je	skati
	xor	bx,bx
	xor	si,si
ealt1:	mov	bl,plhres58[si]
	mov	stdial[bx],1
	inc	si
	loop	ealt1
skati:	call	far ptr ins_nikitr
	mov	plhuos58,0
	mov	cx,49
	mov	bx,1
	mov	si,0
	mov	ax,1
ealt:	cmp	stdial[bx],0
	je	in00
	mov	plhres58[si],al
	inc	si
	inc	plhuos58
in00:	inc	bx
	inc	ax
	loop	ealt
	@STRCOPY	buffer2,stdial,50
	@POP
	ret
plir58	endp

ins_nea	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@TESTFILE	nikitries
	jnc	nskit
	call	create_nik
nskit:	@ZEROBBUF	genplires,50
	@FILLSTR	stdial,0,50
	call	far ptr ins_nikitr
	mov	cx,49
	mov	bx,1
	xor	si,si
	xor	dx,dx
	mov	ax,1
nealt:	cmp	stdial[bx],0
	je	nin00
	mov	strbuf[si],al
	inc	si
	inc	dx
nin00:	inc	bx
	inc	ax
	loop	nealt
	cmp	dx,6
	je	ok66
skatq:	call	far ptr gentaj
	@MBELL
	@POP
	ret
ok66:	mov	temp1,0
	mov	temp1[2],0
	@OPEN_HANDLE	nikitries,I_RW
	jc	skatq
	mov	cs:handle,ax
	@CHANGESEGM	ds,PINMNHMHL
	@CHANGESEGM	es,DATA
rednxt:	@READ_MEM	cs:handle,0,6
	cmp	byte ptr ds:[1],0
	je	isnea
	add	es:temp1,6
	adc	es:temp1[2],0
	jmp	rednxt
isnea:	@MOVEFP	cs:handle,es:temp1[2],es:temp1,I_BEG
	mov	cx,6
	xor	bx,bx
isnxt:	mov	al,es:strbuf[bx]
	mov	[bx],al
	inc	bx
	loop	isnxt
	mov	cx,6
isn0l:	mov	byte ptr [bx],0
	inc	bx
	loop	isn0l
	@WRITE_MEM	cs:handle,0,12
	@CLOSEHANDLE	cs:handle
	call	far ptr gentaj
	@POP
	ret
handle	dw	0
ins_nea	endp

create_nik	proc	near
	@PUSH
	@CREATE_HANDLE	nikitries,0
	mov	cs:handle,ax
	@CHANGESEGM	ds,PINMNHMHL
	@CHANGESEGM	es,DATA
	mov	cx,12
	xor	bx,bx
crnik1:	mov	byte ptr [bx],0
	inc	bx
	loop	crnik1
	@WRITE_MEM	cs:handle,0,65520
	@CLOSE_HANDLE	cs:handle
	@POP
	ret
create_nik	endp

anaptrnd proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	filename,strbuf1,20
	mov	filename[0],"T"
	mov	filename[1],"“"
	mov	filename[2],"•"
	mov	filename[3],"†"
	mov	filename[4],0
	call	far ptr opendlts
	call	far ptr opendlt
;;	mov	ax,lptstart
;;	mov	lptnum,ax

	mov	ax,offset lptnames
	mov	lpt_number,ax

	call	far ptr innames
	@CLRPLBUF
	call	far ptr anapt_rnd
	call	far ptr closedlt
	@STRCOPY	strbuf1,filename,20
	@POP
	ret
anaptrnd endp

opendlt	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	mov	wdeltio[@WIN_INDEX],51
	mov	wdeltio[@WIN_Y],2
	@SETWIND	wdeltio
	@SELECTWIND	wdeltio
	@WPRINTCH	43,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	43,6,"Á",wdeltio[@WIN_ATR]
	@WPRINTCH	47,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	47,6,"Á",wdeltio[@WIN_ATR]
	mov	wdeltio[@WIN_INDEX],52
	mov	wdeltio[@WIN_Y],9
	@SETWIND	wdeltio
	@SELECTWIND	wdeltio
	@WPRINTCH	43,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	43,6,"Á",wdeltio[@WIN_ATR]
	@WPRINTCH	47,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	47,6,"Á",wdeltio[@WIN_ATR]
	mov	wdeltio[@WIN_INDEX],53
	mov	wdeltio[@WIN_Y],16
	@SETWIND	wdeltio
	@SELECTWIND	wdeltio
	@WPRINTCH	43,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	43,6,"Á",wdeltio[@WIN_ATR]
	@WPRINTCH	47,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	47,6,"Á",wdeltio[@WIN_ATR]
	@POP
	retf
opendlt	endp

opendlts proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdelti
	@SETWIND	wdltpl
	mov	wdeltio[@WIN_INDEX],61
	mov	wdeltio[@WIN_Y],2
	@SETWIND	wdeltio
	@SELECTWIND	wdeltio
	@WPRINTCH	43,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	43,6,"Á",wdeltio[@WIN_ATR]
	@WPRINTCH	47,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	47,6,"Á",wdeltio[@WIN_ATR]
	mov	wdeltio[@WIN_INDEX],62
	mov	wdeltio[@WIN_Y],9
	@SETWIND	wdeltio
	@SELECTWIND	wdeltio
	@WPRINTCH	43,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	43,6,"Á",wdeltio[@WIN_ATR]
	@WPRINTCH	47,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	47,6,"Á",wdeltio[@WIN_ATR]
	mov	wdeltio[@WIN_INDEX],63
	mov	wdeltio[@WIN_Y],16
	@SETWIND	wdeltio
	@SELECTWIND	wdeltio
	@WPRINTCH	43,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	43,6,"Á",wdeltio[@WIN_ATR]
	@WPRINTCH	47,0,"Â",wdeltio[@WIN_ATR]
	@WPRINTCH	47,6,"Á",wdeltio[@WIN_ATR]
	@POP
	retf
opendlts endp

closedlt proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@DELWINDI	61
	@DELWINDI	62
	@DELWINDI	63
	@DELWIND	wdelti
	@DELWIND	wdltpl
	@POP
	retf
closedlt endp

clrsys1	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	end_pointer,0
	je	ekit2
	@NAIOXI	34,6,mclrs,mejod1,mejod2
	jnc	ekit1
	cmp	ax,0
	je	ekit2
	@POP
	ret
ekit1:	call	savesys
	jc	ekit3
ekit2:	call	clrsys
ekit3:	@POP
	ret
clrsys1	endp

clrsys	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	genplires,50
	mov	protapo,0
	mov	protevs,0
	mov	kiros,@VERSION	;THIS VERSION
	mov	sthles_old,0
	mov	sthles_old[2],0
	mov	plhroi,0
	mov	oroi_all,0
	@FILLSTR	meisagf,0,9
	@FILLSTR	mejagf," ",8
	mov	filename,0
	@ZEROBBUF	sinuprot,816
	@ZEROWBUF	apliprot,64
	@ZEROWBUF	pinomad,12000
 	mov	cx,999
	mov	si,0
clr999:	mov	pinomad[si+6],9999
	mov	pinomad[si+10],9999
	mov	pinomad[si+16],9999
	add	si,24
	loop	clr999
	@ZEROWBUF	pinyper,1000
	@FILLSTR	fileold," ",8
	mov	filtra,101
	mov	metabl,0
	mov	idosmet,0
	mov	end_pointer,0
	mov	end_pointer[2],0
	mov	user_pointer,0
	mov	user_pointer[2],0
	mov	end_oros,0
	mov	user_oros,0
	@CHANGESEGM	ds,PINOROI
	@ZEROBBUF	pinor,65535
	call	print_plirof
	@POP
	ret
clrsys	endp

ins_nikitr	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wnikitr
	@SELECTWIND	wnikitr
	call	far ptr setboxes
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	buffer1,200
	mov	cx,49
	mov	bx,1
insna:	mov	al,stdial[bx]
	mov	buffer1[bx][16],al
	inc	bx
	loop	insna
	mov	sdial,1
	call	far ptr setinverseb
	call	far ptr editor_basikhs
	pushf
	mov	sdial,0
	popf
	jc	insnt
	mov	cx,49
	mov	bx,1
insnb:	mov	al,buffer1[bx][16]
	mov	stdial[bx],al
	inc	bx
	loop	insnb
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wnikitr
	call	save_inf
	@POP
	clc
	retf
insnt:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wnikitr
	@POP
	stc
	retf
ins_nikitr	endp

ektipotis	proc	near
;***************************************
IFDEF	@PAIKTIS
	retf
ENDIF
;***************************************
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@TAKEWIND
	push	ax
	@SETWIND	wektip
	@SELECTWIND	wektip
	@CHANGESEGM	ds,DATA
	mov	bx,offset ektip_lot
	mov	di,bx
	call	riumisi1_ektip

	mov	ax,[bx]		;ektipotes
	@ITOA	strbuf,1
	@WINPUTNUMBER	20,3,strbuf
	@ATOI	strbuf
	cmp	ax,3
	ja	rium0
	cmp	ax,0
	je	rium0
	mov	[bx],ax
rium0:	call	riumisi1_ektip

	@INVERSE	20,4,3	;aytomato
rium1:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	rium2
	mov	ax,[bx][2]
	not	ax
	and	ax,1
	mov	[bx][2],ax
	jmp	rium1

rium2:	@INVERSE	20,4,3

	mov	ax,[bx][4]	;anamoni
	@ITOA	strbuf,3
	@WINPUTNUMBER	20,5,strbuf
	@ATOI	strbuf
	mov	[bx][4],ax
	call	riumisi1_ektip
;---------------------------------------------------
	push	bx
	mov	cx,6
	add	bx,6
	mov	cs:_yyt,8

kakas:	mov	ax,[bx]
	@ITOA	strbuf,4
	@WINPUTNUMBER	22,cs:_yyt,strbuf
	@ATOI	strbuf
	mov	[bx],ax

	call	riumisi1_ektip

	mov	ax,[bx][2]
	@ITOA	strbuf,4
	@WINPUTNUMBER	28,cs:_yyt,strbuf
	@ATOI	strbuf
	mov	[bx][2],ax

	call	riumisi1_ektip

	mov	ax,[bx][4]
	@ITOA	strbuf,4
	@WINPUTNUMBER	34,cs:_yyt,strbuf
	@ATOI	strbuf
	mov	[bx][4],ax

	call	riumisi1_ektip
	
	add	bx,6
	inc	cs:_yyt
	loop	kakas99
	jmp	kakas2
kakas99:
	jmp	kakas
_yyt	db	0
kakas2:	pop	bx

;------------------------------------------------
	@INVERSE	22,14,3
rium3:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	rium4
	mov	ax,[bx][42]
	not	ax
	and	ax,1
	mov	[bx][42],ax
	jmp	rium3

rium4:	@INVERSE	22,14,3

	@INVERSE	28,14,3
rium5:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	rium6
	mov	ax,[bx][44]
	not	ax
	and	ax,1
	mov	[bx][44],ax
	jmp	rium5

rium6:	@INVERSE	28,14,3

	@INVERSE	34,14,3
rium7:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	rium8
	mov	ax,[bx][46]
	not	ax
	and	ax,1
	mov	[bx][46],ax
	jmp	rium7

rium8:	@INVERSE	34,14,3
	call	riumisi1_ektip

	@INVERSE	22,15,3
riym3:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	riym4
	mov	ax,[bx][48]
	not	ax
	and	ax,1
	mov	[bx][48],ax
	jmp	riym3

riym4:	@INVERSE	22,15,3

	@INVERSE	28,15,3
riym5:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	riym6
	mov	ax,[bx][50]
	not	ax
	and	ax,1
	mov	[bx][50],ax
	jmp	riym5

riym6:	@INVERSE	28,15,3

	@INVERSE	34,15,3
riym7:	call	riumisi1_ektip
	@WAITL
	cmp	al,13
	je	riym8
	mov	ax,[bx][52]
	not	ax
	and	ax,1
	mov	[bx][52],ax
	jmp	riym7

riym8:	@INVERSE	34,15,3
	call	riumisi1_ektip

	mov	ax,[bx][54]	;character 1
	@ITOA	strbuf,3
	@WINPUTNUMBER	22,16,strbuf
	@ATOI	strbuf
	mov	[bx][54],ax
	call	riumisi1_ektip

	mov	ax,[bx][56]	;character 2
	@ITOA	strbuf,3
	@WINPUTNUMBER	28,16,strbuf
	@ATOI	strbuf
	mov	[bx][56],ax

	call	riumisi1_ektip
	mov	ax,[bx][58]	;character 3
	@ITOA	strbuf,3
	@WINPUTNUMBER	34,16,strbuf
	@ATOI	strbuf
	mov	[bx][58],ax

	call	riumisi1_ektip
	mov	ax,[bx][60]	;tipos ekt 1
	@ITOA	strbuf,1
	@WINPUTNUMBER	24,17,strbuf
	@ATOI	strbuf
	mov	[bx][60],ax

riu21:	call	riumisi1_ektip
	mov	ax,[bx][62]	;tipos ekt 2
	@ITOA	strbuf,1
	@WINPUTNUMBER	30,17,strbuf
	@ATOI	strbuf
	mov	[bx][62],ax

riu22:	call	riumisi1_ektip
	mov	ax,[bx][64]	;tipos ekt 3
	@ITOA	strbuf,1
	@WINPUTNUMBER	36,17,strbuf
	@ATOI	strbuf
	mov	[bx][64],ax

riu23:	call	riumisi1_ektip
	mov	ax,[bx][66]	;1
	@ITOA	strbuf,1
	@WINPUTNUMBER	24,19,strbuf
	@ATOI	strbuf
	mov	[bx][66],ax

	call	riumisi1_ektip
	mov	ax,[bx][68]	; 2
	@ITOA	strbuf,1
	@WINPUTNUMBER	30,19,strbuf
	@ATOI	strbuf
	mov	[bx][68],ax

	call	riumisi1_ektip
	mov	ax,[bx][70]	; 3
	@ITOA	strbuf,1
	@WINPUTNUMBER	36,19,strbuf
	@ATOI	strbuf
	mov	[bx][70],ax

	call	riumisi1_ektip
	mov	ax,[bx][72]	;1
	@ITOA	strbuf,1
	@WINPUTNUMBER	24,20,strbuf
	@ATOI	strbuf
	mov	[bx][72],ax

	call	riumisi1_ektip
	mov	ax,[bx][74]	; 2
	@ITOA	strbuf,1
	@WINPUTNUMBER	30,20,strbuf
	@ATOI	strbuf
	mov	[bx][74],ax

	call	riumisi1_ektip
	mov	ax,[bx][76]	; 3
	@ITOA	strbuf,1
	@WINPUTNUMBER	36,20,strbuf
	@ATOI	strbuf
	mov	[bx][76],ax

	call	riumisi1_ektip
	mov	ax,[bx][78]	;1
	@ITOA	strbuf,3
	@WINPUTNUMBER	22,21,strbuf
	@ATOI	strbuf
	mov	[bx][78],ax

	call	riumisi1_ektip
	mov	ax,[bx][80]	; 2
	@ITOA	strbuf,3
	@WINPUTNUMBER	28,21,strbuf
	@ATOI	strbuf
	mov	[bx][80],ax

	call	riumisi1_ektip
	mov	ax,[bx][82]	; 3
	@ITOA	strbuf,3
	@WINPUTNUMBER	34,21,strbuf
	@ATOI	strbuf
	mov	[bx][82],ax

	call	riumisi1_ektip

	mov	ax,pcl_prn[0]	;1
	@ITOA	strbuf,1
	@WINPUTNUMBER	24,22,strbuf
	@ATOI	strbuf
	mov	pcl_prn[0],ax

	call	riumisi1_ektip
	mov	ax,pcl_prn[2]	; 2
	@ITOA	strbuf,1
	@WINPUTNUMBER	30,22,strbuf
	@ATOI	strbuf
	mov	pcl_prn[2],ax

	call	riumisi1_ektip
	mov	ax,pcl_prn[4]	; 3
	@ITOA	strbuf,1
	@WINPUTNUMBER	36,22,strbuf
	@ATOI	strbuf
	mov	pcl_prn[4],ax

	call	riumisi1_ektip
	call	save_inf
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wektip
	pop	ax
	@SELECTWI	al
	@POP
	retf
ektipotis	endp

riumisi1_ektip	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA

	@PUSH
	mov	cx,6
nstrui:	cmp	word ptr [di][66],0
	jne	nxtriu
	mov	word ptr [di][66],1
nxtriu:	add	di,2
	loop	nstrui
	@POP

	mov	ax,[di]		;ektipotes
	@ITOA	strbuf,1
	@WPRINT	20,3,strbuf

	mov	ax,[di][2]	;aytomato
	call	nai_oxi
	@WPRINT	20,4,strbuf

	mov	ax,[di][4]	;anamoni
	@ITOA	strbuf,3
	@WPRINT	20,5,strbuf

;---------------------------------------------------
	push	di
	mov	cx,6
	add	di,6
	mov	cs:_yy,8

tkakas:	mov	ax,[di]
	@ITOA	strbuf,4
	@WPRINT	22,cs:_yy,strbuf

	mov	ax,[di][2]
	@ITOA	strbuf,4
	@WPRINT	28,cs:_yy,strbuf

	mov	ax,[di][4]
	@ITOA	strbuf,4
	@WPRINT	34,cs:_yy,strbuf
	
	add	di,6
	inc	cs:_yy
	loop	tkakas99
	jmp	tkakas2
tkakas99:
	jmp	tkakas
_yy	db	0
tkakas2: pop	di

;------------------------------------------------
	mov	ax,[di][42]	;emfasi 1
	call	nai_oxi
	@WPRINT	22,14,strbuf
	mov	ax,[di][44]	;emfasi 2
	call	nai_oxi
	@WPRINT	28,14,strbuf
	mov	ax,[di][46]	;emfasi 3
	call	nai_oxi
	@WPRINT	34,14,strbuf

	mov	ax,[di][48]	;2h ektip 1
	call	nai_oxi
	@WPRINT	22,15,strbuf
	mov	ax,[di][50]	;2h ektip 2
	call	nai_oxi
	@WPRINT	28,15,strbuf
	mov	ax,[di][52]	;2h ektip 3
	call	nai_oxi
	@WPRINT	34,15,strbuf

	mov	ax,[di][54]	;character 1
	@ITOA	strbuf,3
	@WPRINT	22,16,strbuf
	mov	ax,[di][56]	;character 2
	@ITOA	strbuf,3
	@WPRINT	28,16,strbuf
	mov	ax,[di][58]	;character 3
	@ITOA	strbuf,3
	@WPRINT	34,16,strbuf

	mov	ax,[di][60]	;tipos ektip 1
	@ITOA	strbuf,1
	@WPRINT	24,17,strbuf
	mov	ax,[di][62]	;tipos ektip 2
	@ITOA	strbuf,1
	@WPRINT	30,17,strbuf
	mov	ax,[di][64]	;tipos ektip 3
	@ITOA	strbuf,1
	@WPRINT	36,17,strbuf

	mov	ax,[di][66]	; 1
	@ITOA	strbuf,1
	@WPRINT	24,19,strbuf
	mov	ax,[di][68]	; 2
	@ITOA	strbuf,1
	@WPRINT	30,19,strbuf
	mov	ax,[di][70]	; 3
	@ITOA	strbuf,1
	@WPRINT	36,19,strbuf

	mov	ax,[di][72]	; 1
	@ITOA	strbuf,1
	@WPRINT	24,20,strbuf
	mov	ax,[di][74]	; 2
	@ITOA	strbuf,1
	@WPRINT	30,20,strbuf
	mov	ax,[di][76]	; 3
	@ITOA	strbuf,1
	@WPRINT	36,20,strbuf

	mov	ax,[di][78]	; 1
	@ITOA	strbuf,3
	@WPRINT	22,21,strbuf
	mov	ax,[di][80]	; 2
	@ITOA	strbuf,3
	@WPRINT	28,21,strbuf
	mov	ax,[di][82]	; 3
	@ITOA	strbuf,3
	@WPRINT	34,21,strbuf

	mov	ax,pcl_prn[0] 		;1
	@ITOA	strbuf,1
	@WPRINT	24,22,strbuf
	mov	ax,pcl_prn[2]		;2
	@ITOA	strbuf,1
	@WPRINT	30,22,strbuf
	mov	ax,pcl_prn[4]		;3
	@ITOA	strbuf,1
	@WPRINT	36,22,strbuf

	@POP
	ret
riumisi1_ektip	endp

nai_oxi	proc	near
	cmp	ax,0
	je	foxi
	mov	strbuf[0],"N"
	mov	strbuf[1],"A"
	mov	strbuf[2],"I"
	mov	strbuf[3],0
	ret
foxi:	mov	strbuf[0],"O"
	mov	strbuf[1],"X"
	mov	strbuf[2],"I"
	mov	strbuf[3],0
	ret
nai_oxi	endp



pl_elex	proc	near
	@PUSH
	cmp	al,0
	je	pll9
	mov	ah,0
pll9:	mov	bx,offset cs:_plpin
pll2:	cmp	word ptr cs:[bx],0
	je	pll0
	cmp	ax,cs:[bx]
	jne	pll1
	call	cs:[bx+2]
	mov	cs:_sdx,dx
	@POP
	mov	dx,cs:_sdx
	clc
	ret
pll1:	add	bx,4
	jmp	pll2
pll0:	@POP
	mov	dx,cs:_sdx
	stc
	ret
_sdx	dw	0
_plpin	db	0,@UP_ARROW
	dw	offset	up00
	db	0,@DOWN_ARROW
	dw	offset	dn00
	db	0,@RIGHT_ARROW
	dw	offset	ri00
	db	0,@LEFT_ARROW
	dw	offset	le00
	db	0,@PG_UP
	dw	offset	pu00
	db	0,@PG_DOWN
	dw	offset	pd00
	db	0,@HOME
	dw	offset	ho00
	db	0,@END
	dw	offset	en00
	db	@ENTER,0
	dw	offset	ok00
	db	0,0
up00:	dec	dh
	jnz	up01
	inc	dh
up01:	ret
dn00:	inc	dh
	ret
ri00:	inc	dl
	ret
le00:	dec	dl
	ret
pu00:	mov	dh,1
	ret
pd00:	mov	dh,26
	ret
ho00:	mov	dh,1
	mov	dl,1
	ret
en00:	mov	dl,81
	mov	dh,26
	ret
ok00:	mov	dx,0
	stc
	ret
pl_elex	endp

epist	proc	near
	@PUSH
;***************************************
klidi_epistrofi:
;***************************************
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	call	default_disk
	call	loadinf
	call	load_lpt
	mov	ax,17
	call	screen
	xor	di,di
	call	cright
	call	clrsys
	call	geniko_menu
	@BIGCURS
	@ENDPRG
	retf
epist	endp

default_disk	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	megadir,"C"
	@OPEN_HANDLE	def_disk_file,I_READ
	jc	nofi
	mov	cs:dhandle,ax
	@READ_HANDLE	cs:dhandle,megadir,1
	@CLOSE_HANDLE	cs:dhandle
nofi:	mov	al,megadir
	mov	directory,al
	mov	dirmnimi,al
	mov	eisagdisk,al
	mov	ejagdisk,al
	mov	filedisk,al
	mov	nikitries,al
	mov	inffile,al
	mov	prnfile,al
	@CHANGE_DIR	megadir
	@POP
	ret
dhandle	dw	0
default_disk	endp

load_lpt proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@OPEN_HANDLE	lptfile,I_READ
	jnc	st201
	jmp	stend2
st201:	mov	cs:handlef,ax
	xor	bx,bx
	xor	si,si
aloch:	mov	strbuf,0
	@READ_HANDLE	cs:handlef,strbuf,1
	mov	al,strbuf
	cmp	al,0
	jne	st203
	jmp	stend
st203:	cmp	al," "
	jb	stend1
	cmp	al,"~"
	ja	stend1

	jmp	nst200

stend1:	jmp	stend

nst200:	cmp	al,13
	jne	nst13
	mov	byte ptr lptnames[bx],0
	add	si,15
	cmp	si,30
	ja	stend
	mov	bx,si
	jmp	aloch

nst13:	mov	lptnames[bx],al
	inc	bx
	jmp	aloch

stend:	@CLOSE_HANDLE	cs:handlef
stend2:	@POP
	ret
handlef	dw	0
load_lpt endp	

screen	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@FILLSCR	"±",07h
	@WPRINT	0,0,menu1
	@INVERSE 0,0,80
	@POP
	ret
screen	endp

code	ends
	end
 