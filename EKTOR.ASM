
INCLUDE	koina.inc

code2	segment	public

	assume	cs:code2

ekt_oron	proc	near
;*********************************************
IFNDEF	@NOEKTOROI
;*********************************************
	@PUSH
	mov	cs:code2stack_prn,sp
	@CHANGESEGM	ds,MCODE
	@PAGEL	60
	@CHANGESEGM	ds,DATA
	mov	ax,0
	call	far ptr	PCLorEPSON

	mov	ax,offset lptnames
	mov	lpt_number,ax

	@LPRINTSTR	prn_reset,lpt_number,code2stack_prn
	@LPRINTSTR	copir,lpt_number,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,lpt_number,code2stack_prn
	@LPRINTSTR	prakt_name,lpt_number,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mes1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	filename,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mes2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LTOA	sthles_old,sthles_old[2],strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	mov	ax,omades
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mes3,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,3,promades
	mov	omades,ax
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mes4,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,oroi_all
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	jmp	skit
mes1	db	"     APXEIO : ",0
mes2	db	"     ëíÜäÑë : ",0
mes3	db	"     éãÄÉÑë : ",0
mes4	db	"       éêéà : ",0
;**************************************
skit:

	@LPRINTSTR	prn_set_conden,lpt_number,code2stack_prn
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	@LPRINTSTR	grptab,lpt_number,code2stack_prn
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	mov	cs:usepoint,0
	mov	cs:promada,0
allos:	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	mov	si,cs:usepoint
	mov	al,es:[si]
	mov	bx,0
moro0:	cmp	byte ptr cs:printor[bx],0
	jne	kokir
	jmp	morot
kokir:	cmp	cs:printor[bx],al
	je	moro
	add	bx,3
	jmp	moro0
moro:	call	endias
	jc	morot
	mov	si,cs:usepoint
	xor	cx,cx
	mov	cl,es:[si+3]
	add	si,cx
	mov	cs:usepoint,si
	jmp	allos
;**************************************	YPEROMADES
morot:	@CHANGESEGM	ds,DATA
	cmp	yperom,0
	jne	exyper
	jmp	protas
exyper:	@FILLSTR	strbuf,"-",150
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@FILLSTR	strbuf," ",70
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	myper,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@FILLSTR	strbuf,"-",150
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	cx,99
	xor	bx,bx
ex18:	cmp	pinyper[bx],0
	jne	ff1
	jmp	fff
ff1:	@LPRINTCHR	9,lpt_number,code2stack_prn		;;;;TAB
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	myper1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	ax,100
	sub	ax,cx
	@ITOA	strbuf,2
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	myper2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,5,pinyper[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	myper3,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,5,pinyper[bx+2]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	myper4,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,5,pinyper[bx+4]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
fff:	add	bx,10
	loop	ex181
	jmp	protas
ex181:	jmp	ex18
myper	db	"ìèÑêéãÄÉÑë",0
myper1	db	" YèÑêéãÄÉÄ : ",0
myper2	db	"   éãÄÉÑë : ",0
myper3	db	"   Äèé : ",0
myper4	db	"   Ñóë : ",0
;************************************** PROTASEIS
protas:	@CHANGESEGM	ds,DATA
	mov	cx,15
	mov	cs:ligu0,0
	xor	bx,bx
prot15:	cmp	apliprot[bx],0
	jne	pp1
	jmp	pp2
pp1:	cmp	cs:ligu0,0
	je	pp21
	jmp	pp3
pp21:	@FILLSTR	strbuf,"-",150
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@FILLSTR	strbuf," ",70
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mprot,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@FILLSTR	strbuf,"-",150
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	cs:ligu0,1
pp3:	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mprot1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,3,apliprot[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mprot2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,3,apliprot[bx+2]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
pp2:	add	bx,8
	loop	prot151
	jmp	pr199
prot151: jmp	prot15
mprot	db	"èêéíÄëÑàë",0
mprot1	db	9," EAN èÑêÄëÑà Ü éãÄÉÄ ",0
mprot2	db	"  TOTE åÄ èÑêÄëÑà âÄà Ü éãÄÉÄ ",0
;**************************************
pr199:	@CHANGESEGM	ds,DATA
	@LPRINTSTR	prn_set_10cpi,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@LPRINTSTR	kali_tixi,lpt_number,code2stack_prn
	@LPRINTSTR	prn_formfeed,lpt_number,code2stack_prn
	@POP
;*********************************************
ENDIF
;*********************************************
	retf
promada		dw	0
lpt_number	dw	0
code2stack_prn	dw	0
ekt_oron	endp



;*********************************************
IFNDEF	@NOEKTOROI
;*********************************************

endias	proc	near
	@PUSH
	@CHKKEYB
	jnz	opati
	jmp	opat1
opati:	@TAKEKEYB
	cmp	al,27
	jne	opat1
	@PRNERROR	lpt_number,code2stack_prn
opat1:	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	push	bx
	@ZEROBBUF	buffer1,200
	mov	si,cs:usepoint
	mov	bx,si
	add	bx,5
	xor	di,di
	xor	cx,cx
	mov	cl,es:[si+3]
	cmp	cx,0
	jne	isn00
	pop	bx
	@POP
	stc
	ret
isn00:	sub	cx,3
jan13:	cmp	si,bx
	jne	bal62
	add	si,3
bal62:	mov	al,es:[si]
	mov	buffer1[di],al
	inc	si
	inc	di
	loop	jan13
is00:	pop	bx
	mov	ax,word ptr buffer1[1]
	cmp	ax,cs:promada
	je	isid
	call	foromad
isid:	call	word ptr cs:printor[bx+1]
	@POP
	clc
	ret
usepoint	dw	0
endias	endp

foromad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cs:promada,ax
	@FILLSTR	strbuf,"-",150
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	mov	ax,cs:promada
	dec	ax
	cmp	ax,0
	jne	in00
	@FILLSTR	strbuf," ",65
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	mypox,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	jmp	nxt18
in00:	mov	cx,24
	mul	cx
	mov	bx,ax
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad0,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	ax,cs:promada
	@ITOA	strbuf,3
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+4]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad3,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+6]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad4,lpt_number,code2stack_prn
	@LPRINTSTR	momad2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+8]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad3,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+10]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad5,lpt_number,code2stack_prn
	@LPRINTSTR	momad2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+14]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad3,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+16]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	cmp	pinomad[bx+2],0
	jne	nxt22
	jmp	nxt18
nxt22:	cmp	pinomad[bx+2],9999
	jne	nxt19
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad7,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	jmp	nxt18
nxt19:	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	momad6,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,4,pinomad[bx+2]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
nxt18:	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@FILLSTR	strbuf,"-",150
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
mypox	db	"ìèéïêÑóíàâéà éêéà",0
momad0	db	" OMAÉÄ : ",0
momad1	db	"   OPOI : ",0
momad2	db	"   Äèé : ",0
momad3	db	"   Ñóë : ",0
momad4	db	"   ëìåÑïéãÑåÄ",0
momad5	db	"   ÑãîÄåàëÑàë",0
momad6	db	"   YèÑêéãÄÉÄ : ",0
momad7	db	"   èêéíÄëÜ",0
foromad	endp

pr_omad_sinexom	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mosin,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[15]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[16]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_omad_sinexom	endp

pr_symet_mz	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	msymmz,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[12]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_symet_mz	endp

pr_synex_enal	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	msenal,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[11]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[12]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_synex_enal	endp

pr_evros	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mevros,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[11]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[12]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_evros	endp

pr_baros_lhg	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mblig,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[14]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_baros_lhg	endp

pr_lhg_sinex	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mlisix,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[15]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[16]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_lhg_sinex	endp

pr_omad_sin_lhg	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	momlig,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[15]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[16]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_omad_sin_lhg	endp

pr_enalag	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	menal,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[14]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_enalag	endp

pr_ajones	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	majon,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[14]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_ajones	endp

pr_baros	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mbaros,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	mov	ax,word ptr buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	ax,word ptr buffer1[15]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_baros	endp

;************************************************************************

pr_diasthmata	proc	near
	@PUSH
	mov	cx,6
	mov	bx,13
	mov	di,offset mdiast
skata2:	@CHANGESEGM	ds,CODE2
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	inc	bx
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	inc	bx
	add	di,14
	loop	skata1
	@POP
	ret
skata1:	jmp	skata2
mdiast	db	"ÉàÄëíÜãÄíÄ á1",0
	db	"           á2",0
	db	"           á3",0
	db	"           á4",0
	db	"           á5",0
	db	"           á6",0

pr_diasthmata	endp

;************************************************************************

pr_apol_apost	proc	near
	@PUSH
	mov	bx,13
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prapo1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	mov	di,offset prapo3
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	mov	cx,14
prap1:	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prapo2,lpt_number,code2stack_prn
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	inc	bx
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	add	di,4
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	loop	prap12
	@POP
	ret
prap12:	jmp	prap1
prapo1	db	"AèéäìíÑë ÄèéëíÄëÑàë 1-2",0
prapo2	db	"                    ",0
prapo3	db	"1-3",0
	db	"1-4",0
	db	"1-5",0
	db	"1-6",0
	db	"2-3",0
	db	"2-4",0
	db	"2-5",0
	db	"2-6",0
	db	"3-4",0
	db	"3-5",0
	db	"3-6",0
	db	"4-5",0
	db	"4-6",0
	db	"5-6",0
pr_apol_apost	endp

;************************************************************************

pr_taj_apost	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	mov	bx,16
	@LPRINTSTR	tajap1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	inc	bx
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	mov	cx,4
	mov	di,offset tajap3
prt03:	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	tajap2,lpt_number,code2stack_prn
	@LPRINTSTR	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	inc	bx
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	inc	bx
	add	di,3
	loop	prt031
	@POP
	ret
prt031:	jmp	prt03
tajap1	db	"íÄçàåéãÜãÑåÑë ÄèéëíÄëÑàë T1",0
tajap2	db	"                         ",0
tajap3	db	"T2",0
	db	"T3",0
	db	"T4",0
	db	"T5",0
pr_taj_apost	endp

;************************************************************************

pr_kena	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	pkena1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
no130:	xor	ax,ax
	mov	al,buffer1[13]
	dec	al
	@ITOA	strbuf,1
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTC	"]",lpt_number,code2stack_prn
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[14]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[15]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pkena1	db	"KENA [",0
pr_kena	endp

;************************************************************************

pr_mona_uesi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	monazi,lpt_number,code2stack_prn
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
mzuus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	jne	mzuue1
	mov	bl,"."
	jmp	mzuzz
mzuue1:	mov	bl,"Z"
	cmp	al,2
	je	mzuzz
	mov	bl,"M"
mzuzz:	@LPRINTC	bl,lpt_number,code2stack_prn
mzuue:	pop	cx
	inc	si
	loop	mzuus
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_mona_uesi	endp

;************************************************************************

pr_parast_mona	proc	near
	@PUSH
	call	parprin
	call	printpm
	@POP
	ret
pr_parast_mona	endp

parprin	proc	near
	@PUSH
	@STRCOPY	buffer1,buffer2,100
	@ZEROBBUF	buffer1[11],10
	xor	cx,cx
	mov	cl,buffer2[13]
	cmp	cx,0
	je	parp4
	mov	al,buffer2[15]
	mov	si,11
parp2:	rol	al,1
	jc	parp1
	mov	buffer1[si],2
	jmp	parp3
parp1:	mov	buffer1[si],1
parp3:	inc	si
	loop	parp2
parp4:	@POP
	ret
parprin	endp

printpm	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mparmon,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTC	9,lpt_number,code2stack_prn			;TAB(30)
	mov	cx,6
	mov	si,11
pmus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	je	pmue
	mov	bl,"Z"
	cmp	al,2
	je	pmzz
	mov	bl,"M"
pmzz:	@LPRINTC	bl,lpt_number,code2stack_prn
pmue:	pop	cx
	inc	si
	loop	pmus
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
printpm	endp

;************************************************************************

pr_taytar	proc	near
	@PUSH
	call	prtayt
	@POP
	ret
pr_taytar	endp

prtayt	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prtat1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	mov	bx,38
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	inc	bx
	mov	cx,8
	mov	di,offset prtat3
tay0:	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prtat2,lpt_number,code2stack_prn
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	inc	bx
	add	di,3
	loop	tay011
	@POP
	ret
tay011:	jmp	tay0
prtat1	db	"TAYTAêàáãéà í1",0
prtat2	db	"            ",0
prtat3	db	"T2",0
	db	"T3",0
	db	"T4",0
	db	"T5",0
	db	"T6",0
	db	"T7",0
	db	"T8",0
	db	"T9",0
prtayt	endp

;************************************************************************

pr_lhg_apol	proc	near
	@PUSH
	call	pralig
	@POP
	ret
pr_lhg_apol	endp

pralig	proc	near
	@PUSH
	mov	bx,41
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	pral1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	inc	bx
	mov	cx,8
	mov	di,offset pral3
pral0:	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	pral2,lpt_number,code2stack_prn
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	bx
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[bx]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	inc	bx
	add	di,3
	loop	pral011
	@POP
	ret
pral011: jmp	pral0
pral1	db	"Äèéäìíéà äÜÇéåíÑë ä1",0
pral2	db	"                  ",0
pral3	db	"ä2",0
	db	"ä3",0
	db	"ä4",0
	db	"ä5",0
	db	"ä6",0
	db	"ä7",0
	db	"ä8",0
	db	"ä9",0
	db	"ä0",0
pralig	endp

;************************************************************************

pr_lhg_uesi	proc	near
	@PUSH
	call	prligu
	@POP
	ret
pr_lhg_uesi	endp

prligu	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	ligu1,lpt_number,code2stack_prn
	mov	di,offset ligu2
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	bx,11
prl19:	push	cx
	@CHANGESEGM	ds,CODE2
	cmp	cx,6
	je	kit2
	@LPRINTSTR	ligu3,lpt_number,code2stack_prn
kit2:	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	cx,10
	mov	cs:ligu0,0
	mov	si,0
prlus:	push	cx
	mov	al,buffer1[bx][si]
	cmp	al,0
	jne	prlu0
	jmp	prlue
prlu0:	cmp	cs:ligu0,0
	je	kit3
	@LPRINTC	",",lpt_number,code2stack_prn
kit3:	xor	dx,dx
	mov	ax,si
	inc	ax
	cmp	ax,10
	jb	kit1
	xor	ax,ax
kit1:	@ITOA	strbuf,1
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	mov	cs:ligu0,1
prlue:	pop	cx
	inc	si
	loop	prlus
	add	bx,10
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	add	di,4
	pop	cx
	loop	prl191
	@POP
	ret
prl191:	jmp	prl19
ligu0	db	0
ligu1	db	"äÜÇéåíÑë ÄåÄ áÑëÜ ",0
ligu3	db	"                  ",0
ligu2	db	"á1",9,0
	db	"á2",9,0
	db	"á3",9,0
	db	"á4",9,0
	db	"á5",9,0
	db	"á6",9,0
prligu	endp

;************************************************************************

pr_monaziga	proc	near
	@PUSH
	@STRCOPY	buffer1,buffer2,100
	mov	di,offset WINDOWS:mmonaz
	call	u6prin
	@POP
	ret
pr_monaziga	endp

pr_mesa_ejo	proc	near
	@PUSH
	@STRCOPY	buffer1,buffer2,100
	mov	di,offset WINDOWS:mmesae
	call	u6prin
	@POP
	ret
pr_mesa_ejo	endp

pr_mikra_megala	proc	near
	@PUSH
	@STRCOPY	buffer1,buffer2,100
	mov	di,offset WINDOWS:mmikram
	call	u6prin
	@POP
	ret
pr_mikra_megala	endp

pr_aristera_dejia	proc	near
	@PUSH
	@STRCOPY	buffer1,buffer2,100
	mov	di,offset WINDOWS:maristd
	call	u6prin
	@POP
	ret
pr_aristera_dejia	endp

u6prin	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROBBUF	buffer1[14],10
	xor	cx,cx
	mov	cl,buffer2[14]
	cmp	cx,0
	je	mz02
	mov	si,15
	xor	bx,bx
mz01:	mov	bl,buffer2[si]
	add	bx,15
	mov	buffer1[bx],1
	inc	si
	loop	mz01
mz02:	call	print6
	@POP
	ret
u6prin	endp

print6	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTO	di,lpt_number,code2stack_prn
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	@CHANGESEGM	ds,DATA
	mov	cs:ligu0,0
	mov	cx,7
	mov	bx,15
pr6s:	push	cx
	mov	al,buffer1[bx]
	cmp	al,0
	je	pr6e
	cmp	cs:ligu0,0
	je	kit4
	@LPRINTC	",",lpt_number,code2stack_prn
kit4:	mov	ax,bx
	sub	ax,15
	mov	cx,4
	mul	cx
	mov	di,ax
	add	di,offset p6ae
	@CHANGESEGM	ds,CODE2
	@LPRINTO	di,lpt_number,code2stack_prn
	mov	cs:ligu0,1
	@CHANGESEGM	ds,DATA
pr6e:	pop	cx
	inc	bx
	loop	pr6s
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
p6ae	db	"0-6",0
	db	"1-5",0
	db	"2-4",0
	db	"3-3",0
	db	"4-2",0
	db	"5-1",0
	db	"6-0",0
print6	endp

;************************************************************************

pr_simetrika	proc	near
	@PUSH
	call	simprin
	call	prsim
	@POP
	ret
pr_simetrika	endp

prsim	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	sim1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,2,cs:simetr
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTC	"]",lpt_number,code2stack_prn
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[67]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,5,buffer1[68]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
simetr	dw	0
sim1	db	"ëìããÑíêàâÄ [",0
prsim	endp

simprin	proc	near
	@PUSH
	mov	ax,1
	mov	cx,49
	mov	bx,12
spr1:	cmp	buffer1[bx],0
	je	ojor
	inc	ax
	inc	bx
	loop	spr1
ojor:	mov	cs:simetr,ax
	@POP
	ret
simprin	endp

;************************************************************************

pr_mikra_mona	proc	near
	@PUSH
	mov	di,offset WINDOWS:mikmon
	call	in_7x7
	@POP
	ret
pr_mikra_mona	endp

pr_aristera_mona	proc	near
	@PUSH
	mov	di,offset WINDOWS:arimon
	call	in_7x7
	@POP
	ret
pr_aristera_mona	endp

pr_mesa_mona	proc	near
	@PUSH
	mov	di,offset WINDOWS:mesmon
	call	in_7x7
	@POP
	ret
pr_mesa_mona	endp

pr_aristera_mikra	proc	near
	@PUSH
	mov	di,offset WINDOWS:arimik
	call	in_7x7
	@POP
	ret
pr_aristera_mikra	endp

pr_mesa_mikra	proc	near
	@PUSH
	mov	di,offset WINDOWS:mesmik
	call	in_7x7
	@POP
	ret
pr_mesa_mikra	endp

pr_mesa_aristera	proc	near
	@PUSH
	mov	di,offset WINDOWS:mesari
	call	in_7x7
	@POP
	ret
pr_mesa_aristera	endp

in_7x7	proc	near
	@PUSH
	call	take7x7
	call	print7
	@POP
	ret
in_7x7	endp

print7	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	mov	si,di
	call	far ptr strlen
	mov	cs:mylen,ax
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	bx,17
	mov	cx,7
pr77:	push	cx
	cmp	cx,7
	je	is7
	@FILLSTR	strbuf," ",cs:mylen
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
is7:	@LPRINTC	" ",lpt_number,code2stack_prn
	mov	ax,7
	sub	ax,cx
	mov	cx,4
	mul	cx
	mov	di,ax
	add	di,offset p7x70
	@CHANGESEGM	ds,CODE2
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	mov	cs:ligu0,0
	mov	si,0
	mov	cx,7
pr71:	push	cx
	mov	al,buffer1[bx][si]
	cmp	al,0
	je	npr7
	cmp	cs:ligu0,0
	je	kit5
	@LPRINTC	",",lpt_number,code2stack_prn
kit5:	mov	ax,si
	mov	cx,4
	mul	cx
	mov	di,ax
	add	di,offset p7x70
	@CHANGESEGM	ds,CODE2
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	cs:ligu0,1
npr7:	pop	cx
	inc	si
	loop	pr71
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	pop	cx
	add	bx,7
	loop	pr771
	@POP
	ret
pr771:	jmp	pr77
mylen	dw	0
p7x70	db	"6-0",0
	db	"5-1",0
	db	"4-2",0
	db	"3-3",0
	db	"2-4",0
	db	"1-5",0
	db	"0-6",0
print7	endp

take7x7	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,200
	@ZEROBBUF	buffer1[11],120
	xor	cx,cx
	mov	cl,buffer2[16]
	cmp	cx,0
	je	okas
	mov	si,17
e7x7:	push	cx
	mov	ax,6
	sub	al,buffer2[si+1]
	mov	cx,7
	mul	cx
	mov	bx,ax
	mov	ax,6
	sub	al,buffer2[si]
	add	bx,ax
	add	bx,17
	mov	buffer1[bx],1
	pop	cx
	add	si,2
	loop	e7x7
okas:	@POP
	ret
take7x7	endp

;************************************************************************

pr_par_omilvn	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpomil
	call	pr_parag
	@POP
	ret
pr_par_omilvn	endp

pr_par_dekadvn	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpdek
	call	pr_parag
	@POP
	ret
pr_par_dekadvn	endp

pr_par_dvdekadvn proc	near
	@PUSH
	mov	di,offset WINDOWS:mpdvd
	call	pr_parag
	@POP
	ret
pr_par_dvdekadvn endp

pr_par_ori7ad	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpor7
	call	pr_parag
	@POP
	ret
pr_par_ori7ad	endp

pr_par_kau7ad	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpka7
	call	pr_parag
	@POP
	ret
pr_par_kau7ad	endp

pr_par_diag_a	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpdiga
	call	pr_parag
	@POP
	ret
pr_par_diag_a	endp

pr_par_diag_b	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpdigb
	call	pr_parag
	@POP
	ret
pr_par_diag_b	endp

pr_par_ligont	proc	near
	@PUSH
	mov	di,offset WINDOWS:mplig
	call	pr_parag
	@POP
	ret
pr_par_ligont	endp

pr_par_taytar	proc	near
	@PUSH
	mov	di,offset WINDOWS:mptayt
	call	pr_parag
	@POP
	ret
pr_par_taytar	endp

pr_par_sinex	proc	near
	@PUSH
	mov	di,offset WINDOWS:mpsin
	call	pr_parag
	@POP
	ret
pr_par_sinex	endp

pr_parag	proc	near
	@PUSH
	call	par_prin
	@POP
	ret
pr_parag	endp

par_prin proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,200
	@ZEROBBUF	buffer1[26],120
	mov	bx,27
	cmp	buffer1,"!"
	je	ssst01
	cmp	buffer1,"@"
	je	ssst01
	cmp	buffer1,"#"
	je	ssst01
	cmp	buffer1,"$"
	je	ssst11
	cmp	buffer1,"%"
	je	ssst11
	cmp	buffer1,"^"
	je	ssst11
	cmp	buffer1,"&"
	je	ssst11
	cmp	buffer1,"*"
	je	ssst12
	cmp	buffer1,"("
	je	ssst12
	cmp	buffer1,")"
	jne	ssst01
	mov	bx,36
	jmp	ssst01
ssst12:	mov	bx,42
	jmp	ssst01
ssst11:	mov	bx,33
ssst01:	xor	cx,cx
	mov	cl,buffer2[bx-1]
	cmp	cx,0
	jne	eppar
	jmp	telpar
eppar:	push	cx
	mov	cx,11
	mov	si,0
eppar2:	mov	al,buffer2[bx]
	cmp	al,pinpar[si]
	jne	eppar1
	mov	al,buffer2[bx+1]
	cmp	al,pinpar[si+1]
	jne	eppar1
	mov	al,buffer2[bx+2]
	cmp	al,pinpar[si+2]
	jne	eppar1
	mov	al,buffer2[bx+3]
	cmp	al,pinpar[si+3]
	jne	eppar1
	mov	al,buffer2[bx+4]
	cmp	al,pinpar[si+4]
	jne	eppar1
	mov	al,buffer2[bx+5]
	cmp	al,pinpar[si+5]
	jne	eppar1
	jmp	eppar8
eppar1:	add	si,12
	loop	eppar2
eppar3:	pop	cx
	add	bx,12
	loop	eppar9
telpar:	@POP
	ret
eppar9:	jmp	eppar
eppar8:	push	cx
	push	si
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	mov	cx,5
	xor	ax,ax
par99:	mov	al,pinpar[si]
	@ITOA	strbuf,1
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	cmp	pinpar[si+1],0
	je	kit7
	@LPRINTC	"-",lpt_number,code2stack_prn
	inc	si
	loop	par99
	mov	al,pinpar[si]
	@ITOA	strbuf,1
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
kit7:	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	pop	si
	pop	cx
	jmp	eppar3
par_prin endp

;************************************************************************

pr_baruesi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	barues,lpt_number,code2stack_prn
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	barm1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
	mov	dx,1
baru1:	mov	al,buffer1[si]
	cmp	al,0
	je	baru2
	cmp	dx,1
	je	baru3
	@LPRINTC	",",lpt_number,code2stack_prn
baru3:	mov	ax,dx
	@ITOA	strbuf,1
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
baru2:	inc	si
	inc	dx
	loop	baru1

	@LPRINTC	" ",lpt_number,code2stack_prn
	@LPRINTC	" ",lpt_number,code2stack_prn
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	mov	ax,word ptr buffer1[17]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	ax,word ptr buffer1[19]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
barm1	db	"áÑëÑàë : ",0
barm2	db	"    ",0
pr_baruesi	endp

;************************************************************************

pr_basikh	proc	near
	@PUSH
	mov	di,offset bastl
	call	bas_prin
	call	pr_oria_bas
	@POP
	ret
pr_basikh	endp

pr_oria_bas	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	basm1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOAB	strbuf,1,buffer1[66]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,1,buffer1[67]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	basm2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@ITOAB	strbuf,1,buffer1[68]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	@ITOAB	strbuf,1,buffer1[69]
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
basm1	db	9,"ëÜãÑàÄ ÅÄëàâÜë     Äèé : ",0
basm2	db	9,"ëìåÑïéãÑåÄ ëÜãÑàÄ  Äèé : ",0
pr_oria_bas	endp

bas_prin proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTO	di,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	bx,17
	mov	cx,49
	mov	cs:ligu0,0
bm021:	cmp	buffer1[bx],0
	jne	kit9
	jmp	bm011
kit9:	cmp	cs:ligu0,0
	je	kit8
	@LPRINTC	",",lpt_number,code2stack_prn
kit8:	mov	ax,50
	sub	ax,cx
	@ITOA	strbuf,2
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	inc	cs:ligu0
	cmp	cs:ligu0,35
	jne	bm011
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	mov	cs:ligu0,0		
bm011:	inc	bx
	loop	bm0211
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
bm0211:	jmp	bm021
bastl	db	"ÅÄëàâÜ ëíÜäÜ",9,0
bas_prin endp

;************************************************************************

pr_plhres	proc	near
	@PUSH
	mov	di,offset plhrtl
	call	bas_prin
	@POP
	ret
plhrtl	db	"èäÜêÑë",9,0
pr_plhres	endp

;************************************************************************
pr_periodo	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	ekperiom,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	mov	ax,word ptr buffer1[11]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
ekperiom	db	"èÑêàéÉéë",9,0
pr_periodo	endp

;************************************************************************

pr_ad_uesi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	aredej,lpt_number,code2stack_prn
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
aduus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	jne	aduue1
	mov	bl,"."
	jmp	aduzz
aduue1:	mov	bl,"É"
	cmp	al,2
	je	aduzz
	mov	bl,"Ä"
aduzz:	@LPRINTC	bl,lpt_number,code2stack_prn
aduue:	pop	cx
	inc	si
	loop	aduus
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_ad_uesi	endp

;************************************************************************

pr_me_uesi	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	mesaej,lpt_number,code2stack_prn
	@LPRINTC	9,lpt_number,code2stack_prn		;TAB
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
meuus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	jne	meuue1
	mov	bl,"."
	jmp	meuzz
meuue1:	mov	bl,"M"
	cmp	al,2
	je	meuzz
	mov	bl,"E"
meuzz:	@LPRINTC	bl,lpt_number,code2stack_prn
meuue:	pop	cx
	inc	si
	loop	meuus
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_me_uesi	endp

;************************************************************************

pr_ad_enal	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@LPRINTSTR	menalad,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	xor	ax,ax
	mov	al,buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[14]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
pr_ad_enal	endp

;************************************************************************

pr_bar6	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prsimbar,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	mov	al,buffer1[11]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[12]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn

	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prsimbar1,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	mov	al,buffer1[13]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[14]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn

	@CHANGESEGM	ds,CODE2
	@LPRINTSTR	prsimbar2,lpt_number,code2stack_prn
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pr_apo,lpt_number,code2stack_prn
	mov	al,buffer1[15]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	pr_evs,lpt_number,code2stack_prn
	mov	al,buffer1[16]
	@ITOA	strbuf
	@LPRINTSTR	strbuf,lpt_number,code2stack_prn
	@LPRINTSTR	prn_line_feed,lpt_number,code2stack_prn
	@POP
	ret
prsimbar	db	"ëìããÑíêàâÄ ÅÄêÜ",9,"[á1 & á6]  ",0
prsimbar1	db	9,"[á2 & á5]  ",0
prsimbar2	db	9,"[á3 & á4]  ",0
pr_bar6	endp

;************************************************************************

printor	db	"W"
	dw	offset	CODE2:pr_basikh
	db	"A"
	dw	offset	CODE2:pr_ajones
	db	"S"
	dw	offset	CODE2:pr_simetrika
	db	"D"
	dw	offset	CODE2:pr_baros
	db	"C"
	dw	offset	CODE2:pr_omad_sinexom
	db	"L"
	dw	offset	CODE2:pr_lhg_uesi
	db	"Z"
	dw	offset	CODE2:pr_monaziga
	db	"J"
	dw	offset	CODE2:pr_lhg_apol
	db	"1"
	dw	offset	CODE2:pr_mikra_megala
	db	"F"
	dw	offset	CODE2:pr_mesa_ejo
	db	"2"
	dw	offset	CODE2:pr_aristera_dejia
	db	"3"
	dw	offset	CODE2:pr_mikra_mona
	db	"4"
	dw	offset	CODE2:pr_aristera_mona
	db	"5"
	dw	offset	CODE2:pr_mesa_mona
	db	"6"
	dw	offset	CODE2:pr_aristera_mikra
	db	"7"
	dw	offset	CODE2:pr_mesa_mikra
	db	"8"
	dw	offset	CODE2:pr_mesa_aristera
	db	"V"
	dw	offset	CODE2:pr_evros
	db	"B"
	dw	offset	CODE2:pr_diasthmata
	db	"K"
	dw	offset	CODE2:pr_baros_lhg
	db	"H"
	dw	offset	CODE2:pr_lhg_sinex
	db	"G"
	dw	offset	CODE2:pr_omad_sin_lhg
	db	"Y"
	dw	offset	CODE2:pr_apol_apost
	db	"O"
	dw	offset	CODE2:pr_taj_apost
	db	"I"
	dw	offset	CODE2:pr_kena
	db	"M"
	dw	offset	CODE2:pr_mona_uesi
	db	"N"
	dw	offset	CODE2:pr_parast_mona
	db	"E"
	dw	offset	CODE2:pr_enalag
	db	"U"
	dw	offset	CODE2:pr_synex_enal
	db	"R"
	dw	offset	CODE2:pr_symet_mz
	db	"Q"
	dw	offset	CODE2:pr_taytar
	db	"!"
	dw	offset	CODE2:pr_par_omilvn
	db	"@"
	dw	offset	CODE2:pr_par_dekadvn
	db	"#"
	dw	offset	CODE2:pr_par_dvdekadvn
	db	"$"
	dw	offset	CODE2:pr_par_ori7ad
	db	"%"
	dw	offset	CODE2:pr_par_kau7ad
	db	"^"
	dw	offset	CODE2:pr_par_diag_a
	db	"&"
	dw	offset	CODE2:pr_par_diag_b
	db	"*"
	dw	offset	CODE2:pr_par_ligont
	db	"("
	dw	offset	CODE2:pr_par_taytar
	db	")"
	dw	offset	CODE2:pr_par_sinex
	db	"<"
	dw	offset	CODE2:pr_baruesi
	db	">"
	dw	offset	CODE2:pr_bar6
	db	"0"
	dw	offset	CODE2:pr_plhres
	db	":"
	dw	offset	CODE2:pr_periodo
	db	"_"
	dw	offset	CODE2:pr_me_uesi
	db	"|"
	dw	offset	CODE2:pr_ad_uesi
	db	"~"
	dw	offset	CODE2:pr_ad_enal
	db	0

;PCLorEPSON	proc	near
;	@PUSH
;	mov	bx,ax
;	cmp	pcl_prn[bx],0
;	je	is_EPSON
;	mov	si,offset pcl_commands
;	jmp	is_PCL
;is_EPSON:
;	mov	si,offset epson_commands
;is_PCL:	mov	cx,181
;	xor	di,di
;copynxt:
;	mov	al,[si]
;	mov	printer_commands[di],al
;	inc	si
;	inc	di
;	loop	copynxt
;	@POP
;	retf
;PCLorEPSON	endp

;*********************************************
ENDIF
;*********************************************

code2	ends
	end
