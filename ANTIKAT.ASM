
INCLUDE	koina.inc

CODE3	segment	public

	assume	cs:code3

etoima_sys	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cs:handle_etoima,0
	mov	epistrofi,sp
	call	etoima_menu
	@POP
	retf
etoima_sys	endp

etoima_menu	proc	near
	@PUSH
janat12:
	call	far ptr clrmet
	mov	cs:palia,0
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmetoima
janat:	cmp	cs:handle_etoima,0
	je	fiji
	@CLOSE_HANDLE	cs:handle_etoima
fiji:	@WAITL
	cmp	al,"1"
	je	neos
	cmp	al,"2"
	je	palios
	cmp	al,"6"
	je	sbise
	cmp	al,27
	je	njain
no$$:	cmp	al,"0"
	jne	janat
njain:	@DELWIND	wmetoima
	@POP
	ret
sbise:	@DELWIND	wmetoima
	call	sbisimo
	jmp	janat12
neos:	@DELWIND	wmetoima
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	etoima_plr,50
	@CHANGESEGM	ds,WINDOWS
	call	etoima_load
	jc	fige
	call	find_plr
	jc	fige
	call	ins_etoima_plr
	jc	fige
	call	far ptr clrmet
	call	antikat
fige:	jmp	janat12
palios:	mov	cs:palia,1
	@DELWIND	wmetoima
	@CHANGESEGM	ds,DATA
	call	in_disket
	jnc	patat
	jmp	skata2
patat:	@FILLSTR	etoima_name," ",8
	@DISKDIR	etoima_name,etoima_diri,etoima
	@ENDCHAR	etoima_name,8
	lea	bx,etoima_name
	call	addetii
	cmp	etoima_name,"."
	je	skata2
	@OPEN_HANDLE	etoima_disk,I_READ
	mov	cs:handle,ax
	@READ_HANDLE	cs:handle,etoima_plr,50
	@READ_HANDLE	cs:handle,etoima_disk,22
	@CLOSE_HANDLE	cs:handle
	@TESTFILE	etoima_disk
	jnc	yparxi
	@MBELL
	jmp	janat12
yparxi:	call	find_plr
	jc	skata2
	call	ins_etoima_plr
skata2:	jmp	janat12
etoima_menu	endp

sbisimo	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	filedisk,strbuf1,10
	@STRCOPY	etoima_diri,strbuf1[15],2
	call	in_disket
	jnc	allod
	jmp	nodel
allod:	@SELECT_DRIVE	etoima_diri
	@DISKDIR	filename,etoima_diri,mdelsys
	@STRCOPY	filename,mdelm[19],8
	mov	bx,offset filename
	call	addetii
	cmp	filename,"."
	je	nodel
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,mdelsys,strbuf,mdelm
	jnc	dkit1
	cmp	ax,0
	je	allod
	jmp	nodel
dkit1:	mov	ax,offset filedisk
	call	delfilet
	jmp	allod
nodel:	@STRCOPY	strbuf1,filedisk,10
	@STRCOPY	strbuf1[15],directory,2
	@POP
	ret
sbisimo	endp

delfilet	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@GETDTA
	@FINDFIRSTFILE	ax,0
	jc	errer
	cmp	ax,18
	je	errer
	mov	ax,es
	mov	ds,ax
	mov	dx,bx
	add	dx,30
	@DELETE_FILE
errer:	@POP
	ret
delfilet	endp

etoima_load	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	call	in_disket
	jc	skata
	call	far ptr for_infet
	@FILLSTR	etoima_name," ",8
	@DISKDIR	etoima_name,etoima_dir,etoima
	@ENDCHAR	etoima_name,8
	lea	bx,etoima_name
	call	addeti
	cmp	etoima_name,"."
	je	skata
	@POP
	clc
	ret
skata:	@POP
	stc
	ret
etoima_load	endp

antikat	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	call	far ptr opendlts
	call	far ptr opendlt
;;	mov	ax,lptstart
;;	mov	lptnum,ax
;;;	call	far ptr innames
	@CLRPLBUF
	call	far ptr ektipit
	call	far ptr closedlt
	cmp	cs:handle_etoima,0
	je	kitrin
	@CLOSE_HANDLE	cs:handle_etoima
	mov	cs:handle_etoima,0
kitrin:	@POP
	ret
antikat	endp

ektipit	proc	far
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	epistrofi,sp
	@CHANGESEGM	es,EAXB

;*************************** PLHRES
	mov	cx,49
	xor	bx,bx
ektpl0:	mov	al,etoima_plr[bx]
	cmp	al,0
	je	telekt
	mov	es:xarti[bx],al
	inc	bx
	loop	ektpl0
telekt:	mov	xarti1,bx
	call	far ptr diala2
;*************************** 

	call	open_etoima
epomst9:
	mov	cx,3
	xor	di,di
epomst:	push	cx
	call	in_stl
	cmp	etoima_stl,0
	je	telstl1
	mov	cx,6
	xor	bx,bx
	xor	si,si
ekt10:	mov	bl,etoima_stl[si]
	dec	bx
	mov	al,etoima_plr[bx]
	mov	es:xarti[di],al
	inc	si
	inc	di
	loop	ekt10
	mov	es:xarti[di],0
	inc	di
	pop	cx
	loop	epomst
	mov	sthl,3
	sub	sthl,cx
	mov	ax,sthl
	mov	cx,6
	mul	cx
	add	ax,sthl
	dec	ax
	mov	xarti1,ax
	@INCL	deltia
	call	far ptr diala2
	jmp	epomst9
telstl1:
	cmp	cx,3
	je	telstl2
	pop	cx
	mov	sthl,3
	sub	sthl,cx
	mov	ax,sthl
	mov	cx,6
	mul	cx
	add	ax,sthl
	dec	ax
	mov	xarti1,ax
	@INCL	deltia
	call	far ptr diala2
	jmp	telstl3
telstl2:
	pop	cx
telstl3:
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wpattaf
	@MBELL
koko:	@MBELL
	@WAITL
	@UPPERAX
	cmp	al,"T"
	jne	koko
	@DELWIND	wpattaf
	@POP
	retf
ektipit	endp

find_plr proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	strbuf,50
	call	open_etoima
krit2:	call	in_stl
	cmp	etoima_stl,0
	je	telos1
	@INCL	sthles
	mov	cx,6
	xor	bx,bx
	xor	di,di
krit1:	mov	bl,etoima_stl[di]
	mov	strbuf[bx],1
	inc	di
	loop	krit1
	jmp	krit2
telos1:	@CLOSE_HANDLE	cs:handle_etoima
	mov	cs:handle_etoima,0
	mov	cx,49
	mov	bx,49
	mov	etoima_pliuos,49
krit3:	cmp	strbuf[bx],0
	je	keno1
	jmp	tel18
keno1:	dec	etoima_pliuos
	dec	bx
	loop	krit3
	@POP
	stc
	ret
tel18:	@POP
	clc
	ret
find_plr endp

ins_etoima_plr	proc	near
	@PUSH
	@CHANGESEGM	es,MCODE
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wetoima
	@SELECTWIND	wetoima
	@CHANGESEGM	ds,DATA
	mov	cx,8
	mov	bx,0
kits:	mov	al,etoima_name[bx]
	cmp	al,"."
	je	kota
	cmp	al,0
	je	kota
	mov	strbuf[bx],al
	inc	bx
	loop	kits
kota:	mov	strbuf[bx],0
	@WPRINT	12,1,strbuf
	@LTOA	sthles,sthles[2],strbuf
	@WPRINT	32,1,strbuf
	mov	ax,etoima_pliuos
	@ITOA	strbuf,2
	@WPRINT	60,1,strbuf
kakar:	call	ins_et_plr
	jnc	klano
	@POP
	stc
	ret
klano:	@ZEROBBUF	genplires,50

	mov	cx,49
	xor	si,si
	xor	bx,bx
klini:	mov	bl,etoima_plr[si]
	mov	genplires[bx-1],1
	inc	si
	loop	klini

	cmp	cs:palia,1
	jne	isneo
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdetoima
jana11:	@PLHKTRO
	cmp	al,"2"
	je	kokor
	cmp	al,"1"
	je	kokir
	cmp	al,27
	jne	jana11
	@DELWIND	wdetoima
	@POP
	stc
	ret
kokir:	@DELWIND	wdetoima
	call	dialet
	@POP
	clc
	ret
kokor:	@DELWIND	wdetoima
	call	far ptr clrmet
	call	antikat
	@POP
	clc
	ret
;********************************* NEO
	@CHANGESEGM	ds,DATA
isneo:	@STRCOPY	filename,strbuf1,8
okit28:	call	in_namea
	cmp	filename,"."
	jne	okit8
	@STRCOPY	strbuf1,filename,8
	@POP
	stc
	ret
okit8:	@TESTFILE	filedisk
	jc	okit18
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,strbuf,myparx1,myparx2
	jnc	okit18
	cmp	ax,0
	je	okit28
	@STRCOPY	strbuf1,filename,8
	@POP
	stc
	ret
okit18:	mov	es:is_error,0
	@CREATE_HANDLE	filedisk,0
	cmp	es:is_error,0
	je	part2
	jmp	errorsave
part2:	mov	cs:handle,ax
	@WRITE_HANDLE	cs:handle,etoima_plr,50
	@WRITE_HANDLE	cs:handle,etoima_disk,22
	@CLOSE_HANDLE	cs:handle
	@STRCOPY	filename,strbuf1,8
	@POP
	ret
errorsave:
	@MBELL
	@BELL
	@POP
	stc
	ret
palia	dw	0
ins_etoima_plr	endp

dialet	proc	near
	@PUSH
	call	far ptr ins_nikitr
	@CHANGESEGM	ds,WINDOWS
	mov	wdial1,96
	@SETWIND	wdial1
	mov	wdial1,32
	@SETWIND	wdial1
	mov	cs:dilx,3
	call	dialit
	mov	wdial1,96
	@DELWIND	wdial1
	@POP
	ret
dialet	endp

dialit	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	epistrofi,sp
	@ZEROWBUF	cs:sinepitx,14
	@ZEROWBUF	cs:epitx,14
	@CHANGESEGM	es,EAXB
	call	open_etoima
	mov	cs:dlt,0
depomst9:
	call	in_stl

	cmp	etoima_stl,0
	jne	sason
	jmp	dtelstl1

sason:	mov	cx,6
	xor	bx,bx
	xor	si,si
dekt10:	mov	bl,etoima_stl[si]
	dec	bx
	mov	al,etoima_plr[bx]
	mov	etoima_stl[si],al
	inc	si
	loop	dekt10

	inc	cs:dlt
	cmp	cs:dlt,4
	jb	kitos

	mov	cs:dlt,1
	@INCL	deltia
	cmp	cs:epitx[12],0
	jne	sisa
	cmp	cs:epitx[10],0
	jne	sisa
	cmp	cs:epitx[8],0
	jne	sisa
	cmp	cs:epitx[6],0
	jne	sisa
	jmp	siso
sisa:	call	ektdil
siso:	@ZEROWBUF	cs:epitx,14

kitos:	mov	cx,6
	mov	bx,0
	mov	si,0
	xor	ax,ax
alfit:	mov	bl,etoima_stl[si]
	cmp	stdial[bx],1
	jne	nofit
	inc	ax
nofit:	inc	si
	loop	alfit
	mov	di,ax
	shl	di,1
	inc	word ptr cs:epitx[di]
	inc	word ptr cs:sinepitx[di]
dd7:	jmp	depomst9
dtelstl1:
	@INCL	deltia
	cmp	cs:epitx[12],0
	jne	sisa1
	cmp	cs:epitx[10],0
	jne	sisa1
	cmp	cs:epitx[8],0
	jne	sisa1
	jmp	siso1
sisa1:	call	ektdil
siso1:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wetdil
	@SELECTWIND	wetdil
	@ITOA	strbuf,4,cs:sinepitx[12]
	@WPRINT	13,4,strbuf
	@ITOA	strbuf,4,cs:sinepitx[10]
	@WPRINT	13,5,strbuf
	@ITOA	strbuf,4,cs:sinepitx[8]
	@WPRINT	13,6,strbuf
	@ITOA	strbuf,4,cs:sinepitx[6]
	@WPRINT	13,7,strbuf
	@ITOA	strbuf,4,cs:sinepitx[4]
	@WPRINT	13,8,strbuf
	@ITOA	strbuf,4,cs:sinepitx[2]
	@WPRINT	13,9,strbuf
	@ITOA	strbuf,4,cs:sinepitx[0]
	@WPRINT	13,10,strbuf
	@SETWIND	wpattaf
	@MBELL
dkoko:	@MBELL
	@WAITL
	@UPPERAX
	cmp	al,"T"
	jne	dkoko
	@DELWIND	wetdil
	@DELWIND	wpattaf
	@POP
	ret
dlt	dw	0
epitx	dw	14 dup(0)
sinepitx dw	14 dup(0)
dialit	endp

ektdil	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@SELECTWI	32
	@LTOA	deltia,deltia[2],strbuf
	@WPRINT	2,cs:dilx,strbuf
	cmp	cs:epitx[12],0
	jne	titi1
	@WPRINTCH	14,cs:dilx,"."
	jmp	titi2
titi1:	@ITOAB	strbuf,1,cs:epitx[12]
	@WPRINT	13,cs:dilx,strbuf
	@INVERSE	1,cs:dilx,31
titi2:	cmp	epitx[10],0
	jne	titi3
	@WPRINTCH	20,cs:dilx,"."
	jmp	titi4
titi3:	@ITOAB	strbuf,2,cs:epitx[10]
	@WPRINT	19,cs:dilx,strbuf
titi4:	cmp	epitx[8],0
	jne	titi5
	@WPRINTCH	26,cs:dilx,"."
	jmp	titi6
titi5:	@ITOAB	strbuf,2,epitx[8]
	@WPRINT	25,cs:dilx,strbuf
titi6:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cmp	epitx[6],0
	jne	titi7
	@WPRINTCH	33,cs:dilx,"."
	jmp	titi8
titi7:	@ITOAB	strbuf,3,epitx[6]
	@WPRINT	31,cs:dilx,strbuf
titi8:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	inc	cs:dilx
	cmp	cs:dilx,16
	jb	dilok
	@WPRINT	1,17,mpathst,@FLASH
	@WAITL
	@UPPERAX
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdial1
	mov	cs:dilx,3
dilok:	@POP
	ret
dilx	db	0
ektdil	endp

in_namea proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wsave
	@SELECTWIND	wsave
	@CHANGESEGM	ds,DATA
	@FILLSTR	filename," ",8
	mov	filename[8],0
	@WINPUT	22,3,filename
	call	addexta
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wsave
	@POP
	ret
in_namea endp

addexta	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	bx,0
jana:	cmp	filename[bx],0
	je	endit
	cmp	filename[bx]," "
	je	endit
	inc	bx
	jmp	jana
endit:	mov	filename[bx],"."
	mov	filename[bx+1],"S"
	mov	filename[bx+2],"T"
	mov	filename[bx+3],"I"
	mov	filename[bx+4],0
	@POP
	ret
addexta	endp

in_disket proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
indl11:	@INDISK	38,9,etoima_dir
	jc	indl1
	mov	dl,al
	@TESTDRIVE	dl
	jc	indl11
	mov	etoima_dir,al
	mov	etoima_disk,al
	mov	megadir,al
	@CHANGE_DIR	megadir
indl1:	@POP
	ret
in_disket endp

addeti	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
jana1:	cmp	byte ptr [bx],0
	je	endit1
	cmp	byte ptr [bx]," "
	je	endit1
	inc	bx
	jmp	jana1
endit1:	mov	byte ptr [bx],"."
	mov	byte ptr [bx+1],"S"
	mov	byte ptr [bx+2],"T"
	mov	byte ptr [bx+3],"E"
	mov	byte ptr [bx+4],0
	@POP
	ret
addeti	endp

addetii	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
ijana1:	cmp	byte ptr [bx],0
	je	iendit1
	cmp	byte ptr [bx]," "
	je	iendit1
	inc	bx
	jmp	ijana1
iendit1: mov byte ptr [bx],"."
	mov	byte ptr [bx+1],"S"
	mov	byte ptr [bx+2],"T"
	mov	byte ptr [bx+3],"I"
	mov	byte ptr [bx+4],0
	@POP
	ret
addetii	endp

fillmnimi	proc	near
	@PUSH
	@CHANGESEGM	ds,PINMNHMHL
	mov	cx,65520
	shr	cx,1
	mov	al,50
	mov	ah,50
	xor	bx,bx
fill1:	mov	[bx],ax
	inc	bx
	inc	bx
	loop	fill1
	@POP
	ret
fillmnimi	endp

open_etoima	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	etoima_i,0
	@CHANGESEGM	es,MCODE
	mov	es:is_error,0
	@OPENHANDLE	etoima_disk,I_READ
	mov	cs:handle_etoima,ax
	@CHANGESEGM	ds,PINMNHMHL
	call	fillmnimi
	@READ_MEM_AX	cs:handle_etoima,0,65520
	jnc	lg000
	mov	bx,ax
	sub	bx,6
	cmp	byte ptr [bx],0
	je	lg002
	call	far ptr error_load
	jmp	lg002
lg000:	cmp	es:is_error,0
	je	lg002
	mov	bx,ax
	sub	bx,6
	cmp	byte ptr [bx],0
	je	lg002
	call	far ptr error_load
lg002:	@POP
	ret
handle_etoima	dw	0
handle		dw	0
open_etoima	endp

in_stl	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINMNHMHL
	mov	es:etoima_stl,0
	mov	bx,es:etoima_i
	mov	si,0
	mov	cx,6
amnl0:	mov	al,[bx]
	xor	al,44
	mov	es:etoima_stl[si],al
	inc	bx
	inc	si
	loop	amnl0
	cmp	bx,65520
	jb	amnl1
	@CHANGESEGM	es,MCODE
	mov	es:is_error,0
	call	fillmnimi
	@READ_MEM_AX	cs:handle_etoima,0,65520
	jnc	okitl
	mov	bx,ax
	sub	bx,6
	cmp	byte ptr [bx],0
	je	wrty
	call	far ptr error_load
	jmp	amnl1
okitl:	cmp	es:is_error,0
	je	wrty
	mov	bx,ax
	sub	bx,6
	cmp	byte ptr [bx],0
	je	wrty
	call	far ptr error_load
wrty:	xor	bx,bx
amnl1:	@CHANGESEGM	es,DATA
	mov	es:etoima_i,bx
	@POP
	ret
in_stl	endp

ins_et_plr	proc	near
	@PUSH
okit9:	@CHANGESEGM	ds,WINDOWS
	mov	wplhres[4],15
	@SETWIND	wplhres
	@SELECTWIND	wplhres
	@CHANGESEGM	ds,DATA
	mov	ariumoi,1
	call	far ptr setallboxes
	mov	ariumoi,0
kit99:	mov	cs:xx,4
	mov	cs:yy,2
	mov	cx,etoima_pliuos
	mov	bx,0
	xor	ax,ax
kit13:	mov	al,etoima_plr[bx]
	@ITOA	strbuf,2
	cmp	ax,0
	jne	kit15
	@FILLSTR	strbuf," ",2
kit15:	@WPRINT	cs:xx,cs:yy,strbuf
	inc	bx
	add	cs:xx,7
	cmp	cs:xx,70
	jb	kit12
	mov	cs:xx,4
	add	cs:yy,3
kit12:	loop	kit13

	cmp	cs:palia,1
	jne	nopal
stres:	@PLHKTRO
	@UPPERAX
	cmp	al,"T"
	jne	stres
	jmp	ispal

nopal:	mov	cx,etoima_pliuos
	mov	bx,0
	mov	cs:xx,4
	mov	cs:yy,2
koker9:	xor	ax,ax
	mov	al,etoima_plr[bx]
	@ITOA	strbuf,2
	cmp	al,0
	ja	koker
	@FILLSTR	strbuf," ",2
koker:	@WINPUTNUMBER	cs:xx,cs:yy,strbuf,pletoima
	mov	cs:__ax,ax
	@ATOI	strbuf
	cmp	ax,0
	ja	kitro
	mov	ax,cs:__ax
	cmp	al,@ESCAPE
	jne	koker
	jmp	lina2
kitro:	cmp	ax,49
	ja	koker
	push	cx
	mov	cx,49
	xor	si,si
kok11:	cmp	si,bx
	je	kok13
	cmp	al,etoima_plr[si]
	jne	kok13
	pop	cx
	jmp	koker
kok13:	inc	si
	loop	kok11
	pop	cx
	mov	etoima_plr[bx],al

	mov	ax,cs:__ax
	@UPPERAX
	cmp	al,"Q"
	jne	noqqq
	@ZEROBBUF	etoima_plr,50
	jmp	kit99
noqqq:
;	cmp	al,"T"
;	jne	nottt
;	jmp	kit98

nottt:	cmp	al,@ESCAPE
	jne	lina1
	jmp	lina2
lina1:	
	inc	bx
	add	cs:xx,7
	cmp	cs:xx,70
	jb	kok12
	mov	cs:xx,4
	add	cs:yy,3
kok12:	loop	koker99

ispal:	jmp	fato

kit98:	@PUSH
	mov	cx,etoima_pliuos
	mov	bx,0
kit96:	cmp	etoima_plr[bx],0
	jne	kit97
	@POP
	jmp	nottt
koker99:
	jmp	koker9
kit97:	inc	bx
	loop	kit96
	@POP
fato:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wplhres
	@DELWIND	wetoima
	mov	wplhres[4],17
	@CHANGESEGM	ds,DATA
	cmp	cs:palia,1
	je	okit1
	mov	strbuf,0
	@NAIOXI	34,6,strbuf,etoima_mes,strbuf
	jnc	okit1
	cmp	ax,0
	jne	okit2
	jmp	okit9
lina2:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wplhres
	@DELWIND	wetoima
	mov	wplhres[4],17
okit2:	@POP
	stc
	ret
okit1:	@POP
	clc
	ret
xx	db	0
yy	db	0
__ax	dw	0
ins_et_plr	endp
CODE3	ends

MCODE	segment	public

	assume cs:MCODE

for_infet	proc	near
	@PUSH
	mov	ax,offset inf_eti
	mov	cs:_plirof,ax
	@POP
	retf
for_infet	endp

inf_eti	proc	near
	@PUSHAX
	@CHANGESEGM	ds,DATA

	mov	cx,8
	xor	bx,bx
infet0:	mov	al,cs:_filename[bx]
	mov	etoima_name[bx],al
	inc	bx
	loop	infet0
	mov	etoima_name[bx],0
	call	addinfo

	@FILLSTR	inf_arium," ",8
	@FILLSTR	inf_stils," ",8
	@FILLSTR	inf_plranapt," ",8
	@FILLSTR	inf_66," ",6
	@FILLSTR	inf_56," ",6
	@FILLSTR	inf_46," ",6
	@FILLSTR	inf_55," ",6
	@FILLSTR	inf_45," ",6
	@FILLSTR	inf_44," ",6

	mov	cx,8
	mov	bx,offset inf_plrf
qasan:	push	cx
	mov	al," "
	mov	cx,35
	call	far ptr fillstr
	add	bx,36
	pop	cx
	loop	qasan

	@OPEN_HANDLE	etoima_disk,I_READ
	jnc	infet2
	jmp	infet3
infet2:	mov	cs:handle_info,ax
	@READ_HANDLE	cs:handle_info,information,357
	@CLOSE_HANDLE	cs:handle_info
infet3:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	winfo
	@SELECTWIND	winfo
	@CHANGESEGM	ds,DATA

	@WPRINT	22,2,etoima_name
	@WPRINT	22,3,inf_arium
	@WPRINT	22,4,inf_stils
	@WPRINT	22,5,inf_plranapt

	@WPRINT	22,7,inf_66
	@WPRINT	22,8,inf_56
	@WPRINT	22,9,inf_46
	@WPRINT	22,10,inf_55
	@WPRINT	22,11,inf_45
	@WPRINT	22,12,inf_44

	mov	cx,8
	mov	bx,offset inf_plrf
	mov	dl,2
	mov	dh,15
	mov	ax,0
infet1:	call	far ptr windprint
	inc	dh
	add	bx,36
	loop	infet1

infet9:	@WAIT	100
	jnc	infet9
	cmp	ah,@FUNC10
	jne	nof10
	call	editinf
	jmp	infet9

nof10:	mov	filename,0
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	winfo
	@POPAX
	stc
	ret
handle_info	dw	0
inf_eti	endp

editinf	proc	near
	@PUSH
edinf0:	@WINPUT	22,3,inf_arium
	@WINPUT	22,4,inf_stils
	@WINPUT	22,5,inf_plranapt

	@WINPUT	22,7,inf_66
	@WINPUT	22,8,inf_56
	@WINPUT	22,9,inf_46
	@WINPUT	22,10,inf_55
	@WINPUT	22,11,inf_45
	@WINPUT	22,12,inf_44

	mov	cx,8
	mov	bx,offset inf_plrf
	mov	dh,15
edinf1:	mov	dl,2
	mov	ax,0
	call	far ptr windinput
	jc	edinf2
	inc	dh
	add	bx,36
	loop	edinf1
	jmp	edinf0

edinf2:	@CREATE_HANDLE	etoima_disk,0
	mov	cs:handle_info,ax
	@WRITE_HANDLE	cs:handle_info,information,357
	@CLOSE_HANDLE	cs:handle_info
	@POP
	ret
editinf	endp

addinfo	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	bx,0
janaf:	cmp	etoima_name[bx],0
	je	enditf
	cmp	etoima_name[bx]," "
	je	enditf
	inc	bx
	jmp	janaf
enditf:	mov	etoima_name[bx],"."
	mov	etoima_name[bx+1],"S"
	mov	etoima_name[bx+2],"I"
	mov	etoima_name[bx+3],"N"
	mov	etoima_name[bx+4],0
	@POP
	ret
addinfo	endp

MCODE	ends

	end
