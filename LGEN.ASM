
include	koina.inc

code1	segment public

	assume	cs:code1

lgenitr	proc	near
	@PUSH
	@CHANGESEGM	DS,DATA
	mov	epistrofi,sp
	@LOCATE	0,0
	@CLRPLBUF
	cmp	cs:handle_load,0
	je	is_zer

	@CLOSE_HANDLE	cs:handle_load
	@CLOSE_HANDLE	cs:handle_save

	mov	cs:handle_load,0
is_zer:	mov	bug_period,0
	@CHANGESEGM	DS,CODE
	mov	ax,word ptr pezonte[":"*2]
	@CHANGESEGM	DS,DATA
	cmp	ax,0
	je	noper4
	mov	bug_period,1

noper4:	call	far ptr clrmet
	cmp	statistikh,0
	je	bi000
	jmp	statistikh1
bi000:	call	check_lmnimi
	cmp	metatrop,0
	je	bi001
	jmp	metatrop1
bi001:	cmp	aaxb,0
	je	bi002
	jmp	aaxb1
bi002:	cmp	diaaxb,0
	je	bi003
	jmp	diaaxb1
bi003:	cmp	metrhma,0
	je	bi004
	jmp	metrhma1
bi004:	cmp	pinakas,0
	je	bi005
	jmp	pinakas1
bi005:	cmp	dialogh,0
	je	bi006
	jmp	dialogh1
bi006:	cmp	apla,0
	je	bi007
	jmp	apla1
bi007:	cmp	pou_xani,0
	je	bi008
	jmp	pou_xani1
bi008:	@MBELL
	@POP
	retf
;********************************************* metatrop=1
metatrop1:
	call	metat_bas
	@POP
	retf
;********************************************* statistikh=1
statistikh1:
	cmp	st_omad,0
	je	statom
	mov	ax,offset cs:prvti1
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyter1
	mov	cs:adres3,ax
	mov	ax,offset cs:trith6
	mov	cs:adres4,ax
	jmp	statyp
statom:	mov	ax,offset cs:prvti3
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyter3
	mov	cs:adres3,ax
	mov	ax,offset cs:trith5
	mov	cs:adres4,ax
statyp:	call	mystat
	@POP
	retf
;********************************************* aaxb=1
aaxb1:	mov	ax,offset cs:prvti
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al	
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyterh
	mov	cs:adres3,ax
	mov	ax,offset cs:trith
	mov	cs:adres4,ax
	call	metra
	call	xarths
	cmp	metrdlt,1
	je	aaxb2
	jmp	aaxb3
aaxb2:	call	emdlt
aaxb3:	jmp	terma
;********************************************* diaaxb=1
diaaxb1:
	mov	ax,offset cs:prvti
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyterh
	mov	cs:adres3,ax
	mov	ax,offset cs:trith
	mov	cs:adres4,ax
	call	metra
	call	xarths
	call	ektdialaxb1
	jmp	terma
;********************************************* metrhma=1
metrhma1:
	call	check_smnimi
	mov	ax,offset cs:prvti1
	mov	cs:adres1,ax
	mov	al,byte ptr cs:aa1
	mov	byte ptr cs:poke2,al
	mov	al,byte ptr cs:aa1[1]
	mov	byte ptr cs:poke2[1],al
	mov	al,byte ptr cs:aa1[2]
	mov	byte ptr cs:poke2[2],al
	mov	al,byte ptr cs:aa1[3]
	mov	byte ptr cs:poke2[3],al
	mov	al,byte ptr cs:aa1[4]
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:poy
	mov	cs:adres2,ax
	mov	ax,offset cs:deyter1
	mov	cs:adres3,ax
	cmp	metrhma,10
	jne	kits12
	mov	ax,offset cs:trith8
	mov	cs:adres4,ax
	jmp	kits13
kits12:	mov	ax,offset cs:trith1
	mov	cs:adres4,ax
kits13:	call	metra
	call	poy1
	mov	ax,sthles
	mov	sthles_old,ax
	mov	ax,sthles[2]
	mov	sthles_old[2],ax
	jmp	terma
;********************************************* apla=1
apla1:	mov	ax,offset cs:prvti1
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyter1
	mov	cs:adres3,ax
	mov	ax,offset cs:trith2
	mov	cs:adres4,ax
	call	metra
	jmp	terma
;********************************************* pinakas=1
pinakas1:
	mov	ax,offset cs:prvti1
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyter1
	mov	cs:adres3,ax
	mov	ax,offset cs:trith3
	mov	cs:adres4,ax
	call	metra
	call	pinaka1
	jmp	terma
;********************************************* dialogh=1
dialogh1:
	mov	ax,offset cs:prvti2
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	byte ptr cs:poke2[2],al
	mov	ax,offset cs:deyter2
	mov	cs:adres3,ax
	mov	ax,offset cs:trith4
	mov	cs:adres4,ax
	call	metra
	call	dialekt
	jmp	terma
;*************************************************** pou_xani=1
pou_xani1:
	mov	ax,offset cs:prvti3
	mov	cs:adres1,ax
	mov	al,090h
	mov	byte ptr cs:poke2,al
	mov	byte ptr cs:poke2[1],al
	mov	byte ptr cs:poke2[2],al
	mov	byte ptr cs:poke2[3],al
	mov	byte ptr cs:poke2[4],al
	mov	ax,offset cs:deyter3
	mov	cs:adres3,ax
	mov	ax,offset cs:trith7
	mov	cs:adres4,ax
	call	mystat
	call	praktdel
	mov	sp,epistrofi
	@POP
	retf
;***************************************************
terma:	call	praktdel
	@CHANGESEGM	ds,WINDOWS
	mov	wpattaf[1],0
	@STARTRND
	@RND
	@ENDRND
	cmp	al,127
	jbe	koko1
	mov	wpattaf[1],47
koko1:	@SETWIND	wpattaf
	@MBELL
koko:	@MBELL
	@WAITL
	@UPPERAX
	cmp	al,"T"
	jne	koko
	@DELWIND	werrors
	@DELWIND	wpattaf
	call	praktdel
	@POP
	retf
lgenitr	endp

praktdel	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@DELWINDI	98
	@DELWINDI	98
	@POP
	ret
praktdel	endp

metra	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	mnhmhin,0
	je	metra2
	call	movmnim
	jmp	metra9
metra2:	call	movplir
metra9:	@POP
	ret
;---------------------------------
aa1:	call	cs:adres2
adres1	dw	0
adres2	dw	0
adres3	dw	0
adres4	dw	0
metra	endp

check_smnimi	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	cmp	mejagf," "
	je	lg001
	cmp	mejagf,0
	je	lg001
	mov	mnhmhout,1
	mov	es:is_error,0
	@OPENHANDLE	ejagdisk,I_WRITE
	mov	cs:handle_save,ax
	cmp	es:is_error,0
	je	lg001
	call	error_save
lg001:	@POP
	ret
check_smnimi	endp

check_lmnimi	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	cmp	meisagf," "
	je	lg002
	cmp	meisagf,0
	je	lg002
	mov	mnhmhin,1
	mov	es:is_error,0
	@OPENHANDLE	eisagdisk,I_READ
	mov	cs:handle_load,ax
	@CHANGESEGM	ds,PINMNHMHL
	@READ_MEM	cs:handle_load,0,65520
	jnc	lg000
	call	error_load
	jmp	lg002
lg000:	cmp	es:is_error,0
	je	lg002
	call	error_load
lg002:	@POP
	ret
check_lmnimi	endp

init_mnim proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	@TESTFILE	nikitries
	jc	stater
	mov	mnhmhin,1
	mov	es:is_error,0
	@OPENHANDLE	nikitries,I_READ
	mov	cs:handle_load,ax
	cmp	es:is_error,1
	je	stater
	@CHANGESEGM	ds,PINMNHMHL
	@READ_MEM	cs:handle_load,0,65520
	jnc	statni
	jmp	stater
statni:	cmp	es:is_error,0
	je	statok
stater:	call	error_load
statok:	@POP
	ret
init_mnim	endp

mystat	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	pou_xani,1
	je	pxani1
	call	init_mnim
pxani1:	call	movmnim
	mov	ax,cs:st_kau
	mov	stat_tkauist,ax
	cmp	ax,stat_kauist
	jbe	smin11
	mov	stat_kauist,ax
smin11:	mov	ax,cs:st_epn
	mov	stat_tepanal,ax
	cmp	ax,stat_epanal
	jbe	smin22
	mov	stat_epanal,ax
smin22:	@POP
	ret
mystat	endp

metat_bas	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
metat2:	call	lmnhmh
	cmp	plhres,0
	jne	metat1
	jmp	metatend
metat1:	call	far ptr do_metatrop
	jmp	metat2
metatend:
	@POP
	ret
metat_bas	endp

error_save	proc	near
	@PUSH
	@MBELL
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	werrors
	@CHANGESEGM	ds,DATA
	@CLOSEHANDLE	cs:handle_save
	@CREATE_HANDLE	ejagdisk,0
	@CLOSE_HANDLE	ax
	@FILLSTR	mejagf," ",6
	mov	mnhmhout,0
	@MBELL
	@POP
	ret
error_save	endp

error_load	proc	near
	@PUSH
	@MBELL
	@MBELL
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	werrorl
	@WAITL
	@DELWIND	werrorl
	@CHANGESEGM	ds,DATA
	@CLOSE_HANDLE	cs:handle_load
	mov	cs:handle_load,0
	cmp	statistikh,0
	jne	staty1
	@FILLSTR	meisagf," ",6
staty1:	call	praktdel
	mov	sp,epistrofi
	@POP
	stc
	retf
error_load	endp

diakopi	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	statistikh,0
	je	statn5
	@POP
	ret
statn5:	cmp	mnhmhin,0
	je	diakop
	cmp	mnhmhout,0
	je	diakop
	@POP
	ret
diakop:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdiakopi
	@MBELL
	@MBELL
	@CLRPLBUF
	@WAITL
	@DELWIND	wdiakopi
	@UPPERAX
	cmp	al,"N"
	je	nai
	@POP
	ret
nai:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	werrors
	@CHANGESEGM	ds,DATA
	cmp	mnhmhin,0
	je	aaaq
	@CLOSE_HANDLE	cs:handle_load	
	mov	cs:handle_load,0
aaaq:	cmp	mnhmhout,0
	je	aaaw
	@CLOSE_HANDLE	cs:handle_save
	@CREATE_HANDLE	ejagdisk,0
	@CLOSE_HANDLE	ax
aaaw:	call	praktdel
	mov	sp,epistrofi
	@POP
	retf
diakopi	endp

clrmet	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	mov	protia_prn,0
	mov	pio_prn,0
	mov	ax,offset lptnames
	mov	lpt_number,ax
	mov	piodeltio,0
	mov	piodeltio[2],0
	mov	statstil,0
	mov	statstil[2],0
	mov	cs:st_epn,0
	mov	cs:st_kau,0
	mov	cs:period,1
	mov	stat_epanal,0
	mov	stat_tepanal,0
	mov	stat_tkauist,0
	mov	stat_kauist,0
	mov	cs:dilx,3
	mov	mnhmhin,0
	mov	mnhmhout,0
	mov	mnimi_save,0
	mov	mnimi_load,0
	mov	deltia,0
	mov	deltia[2],0
	mov	sthles,0
	mov	sthles[2],0
	mov	mexritora,0
	mov	mexritora[2],0
	mov	cs:kkk,0
	mov	cs:kkkk,0
	mov	filtra1,0
	mov	cx,7
	mov	si,0
sisi:	mov	ti[si],0
	inc	si
	loop	sisi
	mov	cx,98
	mov	si,0
clrm0:	mov	pinak3[si],0
	add	si,2
	loop	clrm0
	mov	ejari,0
	mov	ejari[2],0
	mov	pentari,0
	mov	pentari[2],0
	mov	tesari,0
	mov	tesari[2],0
	mov	triari,0
	mov	triari[2],0
	mov	miden1,0
	mov	miden1[2],0
	mov	ena1,0
	mov	ena1[2],0
	mov	dio1,0
	mov	dio1[2],0
	mov	tria1,0
	mov	tria1[2],0
	mov	tesa1,0
	mov	tesa1[2],0
	mov	pent1,0
	mov	pent1[2],0
	mov	ejar1,0
	mov	ejar1[2],0
	mov	akom1,0
	mov	filtra1,0
	mov	cx,50
	mov	si,0
sisi1:	mov	paxb1[si],0
	inc	si
	loop	sisi1
	mov	cx,1982
	mov	si,0
sisi2:	mov	paxb[si],0
	inc	si
	loop	sisi2
	mov	xarti1,0
	mov	sthl,0
	mov	prvt,0
	mov	deyt,0
	@ZEROBBUF	es:xarti,61
	@POP
	retf
clrmet	endp

;******************************************************************************
;******************************************************************************

;********************************************************* ODHGOS GENHTRIAS

r_oron3	proc	near
	@CHKKEYB
	jnz	opati
	jmp	opat1
opati:	@TAKEKEYB
	@UPPERAX
	cmp	al,27
	jne	opat1
	call	diakopi
opat1:	cmp	pinomad,0
	je	aprot3
	call	ypoxo3
	jc	fige3
aprot3:	cmp	aplesprot,0
	je	omd3
	call	aplprot3
	jc	fige3
omd3:	cmp	omades,0
	je	ypero3
	call	omad3
	jc	fige3
ypero3:	cmp	yperom,0
	je	allo3
	call	yomad3
	jc	fige3
allo3:	clc
	ret
fige3:	stc
	ret
r_oron3	endp

r_oron2	proc	near
	cmp	pinomad,0
	je	aprot2
	call	ypoxo2
	jc	fige2
aprot2:	cmp	aplesprot,0
	je	omd2
	call	aplprot2
	jc	fige2
omd2:	cmp	omades,0
	je	ypero2
	call	omad2
	jc	fige2
ypero2:	cmp	yperom,0
	je	allo2
	call	yomad2
	jc	fige2
allo2:	clc
	ret
fige2:	stc
	ret
r_oron2	endp

r_oron1	proc	near
	cmp	pinomad,0
	je	aprot1
	call	ypoxo1
	jc	fige1
aprot1:	cmp	aplesprot,0
	je	omd1
	call	aplprot1
	jc	fige1
omd1:	cmp	omades,0
	je	ypero1
	call	omad1
	jc	fige1
ypero1:	cmp	yperom,0
	je	allo1
	call	yomad1
	jc	fige1
allo1:	clc
	ret
fige1:	stc
	ret
r_oron1	endp

r_oron12	proc	near
	mov	cs:pios_xani[2],1
	cmp	pinomad,0
	je	aprot12
	call	ypoxo1
	jc	fige12
aprot12: mov	cs:pios_xani[2],2
	cmp	aplesprot,0
	je	omd12
	call	aplprot1
	jc	fige12
omd12:	mov	cs:pios_xani[2],3
	cmp	omades,0
	je	ypero12
	call	omad1
	jc	fige12
ypero12: mov	cs:pios_xani[2],4
	cmp	yperom,0
	je	allo12
	call	yomad1
	jc	fige12
allo12:	mov	cs:pios_xani[2],0
	clc
	ret
fige12:	stc
	ret
r_oron12	endp

;***********************************DIALOGI OUONHS

dial3	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	lea	si,stdial
	lea	di,deltio
	xor	ax,ax
	xor	bx,bx
dialn2:	mov	bl,[di]
	cmp	[si][bx],ah
	je	diaox2
	inc	al
diaox2:	inc	di
	loop	dialn2
	cmp	al,3
	jae	pisv1
	jmp	pisv
pisv1:	je	tesa3
	cmp	al,4
	je	tesa4
	cmp	al,5
	je	pent
	@INCL	ejari
	jmp	ektit
pent:	@INCL	pentari
	jmp	ektit
tesa4:	@INCL	tesari
	jmp	ektit
tesa3:	@INCL	triari

ektit:
pisv:	cmp	metabl,0
	jne	ddati2
	call	dialekt
ddati2:	@CHKKEYB
	jnz	ddati
	jmp	ddat1
ddati:	@TAKEKEYB
	call	dialekt
	@UPPERAX
	cmp	al,27
	jne	ddat1
	call	diakopi
ddat1:	@POP
	ret
dial3	endp

dialekt	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	lea	bx,deltio
	xor	ax,ax
	mov	al,[bx]
	@ITOA	strbuf,2
	@WPRINT	25,3,strbuf
	mov	al,[bx][1]
	@ITOA	strbuf,2
	@WPRINT	28,3,strbuf
	mov	al,[bx][2]
	@ITOA	strbuf,2
	@WPRINT	31,3,strbuf
	@LTOA	ejari,ejari[2],strbuf
	@WPRINT	25,5,strbuf
	@LTOA	pentari,pentari[2],strbuf
	@WPRINT	25,6,strbuf
	@LTOA	tesari,tesari[2],strbuf
	@WPRINT	25,7,strbuf
	@LTOA	triari,triari[2],strbuf
	@WPRINT	25,8,strbuf
	@POP
	ret
dialekt	endp

;**************************************DIALOGI AXB

dialaxb	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	lea	bx,ti
	mov	cx,7
ffl:	mov	byte ptr [bx],0
	inc	bx
	loop	ffl
	lea	bx,es:xarti
	cmp	byte ptr es:[bx][5],0
	jne	aplo
axbb:	xor	dx,dx
	mov	cx,5
	xor	ax,ax
tktb:	mov	al,es:[bx]
	mov	si,ax
	cmp	stdial[si],0
	je	denn
	inc	dl
denn:	inc	bx
	loop	tktb
	mov	dh,dl
dkd:	mov	dl,0
	inc	bx
	cmp	byte ptr es:[bx],0
	je	tellw
	mov	al,es:[bx]
	mov	si,ax
	cmp	stdial[si],0
	je	denn1
	inc	dl
denn1:	add	dl,dh
	lea	si,ti
	push	dx
	mov	dh,0
	add	si,dx
	inc	byte ptr [si]
	pop	dx
	jmp	dkd	
tellw:	inc	bx
	cmp	byte ptr es:[bx],0		
	je	tello
aplo:	mov	cx,6
	xor	ax,ax
	xor	dx,dx
ttd1:	mov	al,es:[bx]
	mov	si,ax
	cmp	stdial[si],0
	je	donn1
	inc	dl
donn1:	inc	bx
	loop	ttd1
	lea	si,ti
	add	si,dx
	inc	byte ptr [si]
	inc	bx
	cmp	byte ptr es:[bx],0		
	je	tello
	cmp	byte ptr es:[bx][5],0
	je	axbb
	mov	cx,6
	xor	ax,ax
	xor	dx,dx
ttd11:	mov	al,es:[bx]
	mov	si,ax
	cmp	stdial[si],0
	je	donn11
	inc	dl
donn11:	inc	bx
	loop	ttd11
	lea	si,ti
	add	si,dx
	inc	byte ptr [si]
	inc	bx
	cmp	byte ptr es:[bx],0		
	je	tello
	mov	cx,6
	xor	ax,ax
	xor	dx,dx
ttd12:	mov	al,es:[bx]
	mov	si,ax
	cmp	stdial[si],0
	je	donn12
	inc	dl
donn12:	inc	bx
	loop	ttd12
	lea	si,ti
	add	si,dx
	inc	byte ptr [si]
tello:	@POP
	ret
dialaxb	endp

;************************************************PROTI GENITRIA

prvti	proc	near
	call	r_oron3
	jc	oxi
	@PUSH
	@CHANGESEGM	ES,EAXB
	lea	si,es:pinak1
	mov	es:pin1,si
	lea	si,es:pinak2
	mov	es:pin2,si
	mov	es:metr,0
	mov	es:metr1,0
	@POP
	call	gen1
	call	genekty
oxi:	ret
prvti	endp

prvti1	proc	near
	call	r_oron3
	jc	axi
	call	gen1
axi:	ret
prvti1	endp

prvti2	proc	near
	call	dial01
	jc	axid
	call	r_oron3
	jc	axid
	call	gen1
axid:	ret
prvti2	endp

prvti3	proc	near
	call	r_oron3
	call	gen1
	ret
prvti3	endp

;************************************************DEYTERI GENITRIA

deyterh	proc	near
	@PUSH
	call	r_oron2
	jc	oxi1
	@CHANGESEGM	ds,DATA	
	mov	cx,50
	xor	bx,bx
rrtq:	mov	paxb1[bx],0
	inc	bx
	loop	rrtq
	call	gen2
	mov	cx,50
	xor	bx,bx
	xor	ax,ax
jkl:	cmp	paxb1[bx],0
	je	hjk
	inc	ax
hjk:	inc	bx
	loop	jkl
	cmp	ax,0
	je	oxi1
	cmp	ax,2
	jbe	ela3
	call	ekty
	call	ekty2
	jmp	oxi1
ela3:	call	ekty1
oxi1:	@pop
	ret
deyterh	endp

deyter1	proc	near
	call	r_oron2
	jc	axi1
	call	gen2
axi1:	ret
deyter1	endp

deyter2	proc	near
	call	dial02
	jc	axi1d
	call	r_oron2
	jc	axi1d
	call	gen2
axi1d:	ret
deyter2	endp

deyter3	proc	near
	call	r_oron2
	call	gen2
	ret
deyter3	endp

;*************************************************TRITH GENITRIA

trith	proc	near
	call	r_oron1
	jc	oxi2
	cmp	metabl,0
	je	bb50
	call	metablhto
	jc	oxi2
	@CHANGESEGM	ds,DATA
bb50:	xor	bx,bx
	mov	bl,deltio[5]
	mov	paxb1[bx],bl
	@INCL	STHLES
oxi2:	ret
trith	endp

trith1	proc	near
	call	r_oron1
	jc	axi2
	cmp	metabl,0
	je	bb51
	call	metablhto
	jc	axi2
bb51:	@INCL	sthles
	cmp	mnhmhout,0
	je	axi2
	call	smnhmh
axi2:	ret
trith1	endp

trith2	proc	near
	call	r_oron1
	jc	exi2
	cmp	metabl,0
	je	bb52
	call	metablhto
	jc	exi2
bb52:	call	aplad
	@INCL	STHLES
exi2:	ret
trith2	endp

trith3	proc	near
	call	r_oron1
	jc	pxi2
	cmp	metabl,0
	je	bb53
	call	metablhto
	jc	pxi2
bb53:	@INCL	STHLES
	call	pinaka
pxi2:	ret
trith3	endp

trith4	proc	near
	call	dial03
	jc	txi2
	call	r_oron1
	jc	txi2
	cmp	metabl,0
	je	bb54
	call	metablhto
	jc	txi2
bb54:	call	dial3
txi2:	ret
trith4	endp

trith5	proc	near
	mov	cs:stf5,0
	call	r_oron1
	jc	axis2
	mov	cs:stf5,1
	@INCL	sthles
axis2:	ret
st_kau	dw	0
st_epn	dw	0
stf5	db	0
trith5	endp

trith6	proc	near
	mov	cs:stf5,0
	call	r_oron1
	jc	axio2
	mov	cs:stf5,1
	@INCL	sthles
axio2:	ret
trith6	endp

trith7	proc	near
	call	r_oron12
	ret
trith7	endp

trith8	proc	near		;ektiposi stilon se xarti
	call	r_oron1
	jc	axi2_8
	cmp	metabl,0
	je	bb51_8
	call	metablhto
	jc	axi2_8
	jmp	bb51_8
axi2_8:	ret
bb51_8:	@INCL	sthles
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	bx,0
	mov	cx,6
sci8:	xor	ax,ax
	mov	al,deltio[bx]
	@ITOA	strbuf,2
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack_stl
	@LPRINTCHR	" ",lpt_number,cs:print_stack_stl
	inc	bx
	loop	sci8
	inc	sel
	cmp	sel,6
	jb	sci0
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack_stl
	mov	sel,0
	@POP
	jmp	lacta
sci0:	@LPRINTCHR	" ",lpt_number,cs:print_stack_stl
	@LPRINTCHR	"-",lpt_number,cs:print_stack_stl
	@LPRINTCHR	" ",lpt_number,cs:print_stack_stl
	@POP
lacta:	cmp	mnhmhout,0
	je	axi_81
	call	smnhmh
axi_81:	ret
print_stack_stl	dw	0
trith8	endp

;******************************************EKTYPOSI DELTIOY AXB

diala2	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ZEROWBUF	ektanap,3
	cmp	metrdlt,1
	jne	ektip
	@CHKKEYB
	jnz	qpati
	jmp	qpat1
qpati:	@TAKEKEYB
	call	emdlt
	cmp	al,27
	jne	qpat1
	call	diakopi
qpat1:	jmp	kkv1
ektip:	@CHANGESEGM	es,EAXB
	xor	ax,ax
	lea	si,es:xarti
	mov	cs:anaena,0
	mov	cx,xarti1
	cmp	cx,0
	jne	eec
	jmp	kkv1
eec:	@SELECTWI	51
	xor	ax,ax
	mov	cs:simia,0
eaaa:	mov	al,es:[si]
	cmp	al,0
	je	aaa1
	dec	al
	mov	bl,10
	div	bl
	inc	al
	mov	cs:delty,al
	mov	al,ah
	mov	ah,0
	mov	bl,4
	mul	bl
	inc	al
	inc	al
	mov	cs:deltx,al
	@INVERSE cs:deltx,cs:delty,4
	inc	si
	inc	cs:simia
	loop	eaaa
aaa1:	cmp	ana58,0
	je	no58
	cmp	cs:simia,0
	je	aaa11
	@INVERSE	44,5,3
	@INVERSE	48,3,3
	mov	ektanap[0],58
	jmp	aaa11
no58:	cmp	cs:simia,6
	je	aaa11
	cmp	cs:simia,5
	jne	aaa11
	@INVERSE	44,5,3
	mov	ektanap[0],5
	mov	cs:anaena,1
aaa11:	cmp	cx,0
	jne	aaa13
	jmp	eddd
aaa13:	@SELECTWI	52
	inc	si
	mov	cs:simia,0
	xor	ax,ax
ebbb:	mov	al,es:[si]
	cmp	al,0
	je	aaa2
	dec	al
	mov	bl,10
	div	bl
	inc	al
	mov	cs:delty,al
	mov	al,ah
	mov	ah,0
	mov	bl,4
	mul	bl
	inc	al
	inc	al
	mov	cs:deltx,al
	@INVERSE cs:deltx,cs:delty,4
	inc	si
	inc	cs:simia
	loop	ebbb
aaa2:	cmp	ana58,0
	je	no581
	cmp	cs:simia,0
	jne	skript
	jmp	aaa21
skript:	@INVERSE	44,5,3
	@INVERSE	48,3,3
	mov	ektanap[2],58
	jmp	aaa21
no581:	cmp	cs:anaena,1
	je	aaa22
	cmp	cs:simia,6
	je	aaa21
	cmp	cs:simia,5
	jne	aaa21
	@INVERSE	44,5,3
	mov	ektanap[2],5
	mov	cs:anaena,1
	jmp	aaa21
aaa22:	@INVERSE	44,1,3
	mov	cs:anaena,0
	mov	ektanap[2],1

aaa21:	cmp	cx,0
	jne	aaa23
	jmp	eddd
aaa23:	@SELECTWI	53
	inc	si
	xor	ax,ax
	mov	cs:simia,0
eccc:	mov	al,es:[si]
	cmp	al,0
	je	aaa3
	dec	al
	mov	bl,10
	div	bl
	inc	al
	mov	cs:delty,al
	mov	al,ah
	mov	ah,0
	mov	bl,4
	mul	bl
	inc	al
	inc	al
	mov	cs:deltx,al
	@INVERSE cs:deltx,cs:delty,4
	inc	si
	inc	cs:simia
	loop	eccc
aaa3:	cmp	ana58,0
	je	no582
	cmp	cs:simia,0
	je	aaa31
	@INVERSE	44,5,3
	@INVERSE	48,3,3
	mov	ektanap[4],58
	jmp	aaa31
no582:	cmp	cs:anaena,1
	je	aaa32
	cmp	cs:simia,6
	je	aaa31
	cmp	cs:simia,5
	jne	aaa31
	@INVERSE	44,5,3
	mov	ektanap[4],5
	jmp	aaa31
aaa32:	@INVERSE	44,1,3
	mov	ektanap[4],1
	mov	cs:anaena,0
aaa31:
eddd:
;********************************************** PROTO
	mov	pejeproto,0
	cmp	protevs,0
	je	nektpr
	mov	ax,protapo
	cmp	deltia,ax
	jb	nektpr
	mov	pejeproto,1
	dec	protevs
nektpr:
;************************************************
	@SELECTWI	28
	@LTOA	deltia,deltia[2],strbuf
	@WPRINT	15,1,strbuf
	@ITOA	strbuf,3,sthl
	@WPRINT	15,2,strbuf
	@LADD	mexritora[2],mexritora,0,sthl
	@LTOA	mexritora,mexritora[2],strbuf
	@WPRINT	15,3,strbuf
	call	chk_pls
	call	far ptr opendlt
kkv1:	@ZEROBBUF	es:xarti,61
	mov	xarti1,0
	mov	sthl,0
	@POP
	retf
deltx	db	0
delty	db	0
simia	db	0
anaena	db	0
diala2	endp

chk_pls	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
skari:	cmp	piodeltio,0
	je	atodel
	mov	ax,deltia[2]
	cmp	piodeltio[2],ax
	ja	alodel
	jb	atodel
	mov	ax,deltia
	cmp	piodeltio,ax
	ja	alodel
	jb	atodel
	mov	piodeltio,0
	cmp	aytomato_lot,0
	jne	fgfg
	jmp	cjana
fgfg:	call	dimiourgia_deltiou
	call	far ptr ektipd	;;;;;;---------------->>>>
	jmp	cjana
atodel:	cmp	aytomato_lot,0
	jne	gfgf
	jmp	cjana
gfgf:	@CPLRNS
	jc	cjana1
	cmp	protia_prn,0
	je	cjana
	call	dimiourgia_deltiou
	call	far ptr ektipd
	jc	cjana1
	@POP
	ret
alodel:	@CPLRNS
	jc	cjana1
	@POP
	ret
cjana1:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wdltpl
	@SETWIND	wdltpl
	@CHANGESEGM	ds,DATA
	mov	piodeltio,0
	@MBELL
	@MBELL
cjana:	@WAITL
	@UPPERAX
	cmp	al,@ESCAPE
	jne	nesc01
diak01:	call	diakopi
nesc01:	cmp	al,"I"
	jne	ni01
	call	far ptr for_proto
	jmp	cjana
ni01:	cmp	al,"T"
	je	diak01
	cmp	al,"Q"
	jne	nq01
	call	dimiourgia_deltiou
	call	far ptr ektipd
	jmp	cjana
nq01:	cmp	al,"P"
	jne	np01
	call	far ptr ektipotis
	jmp	cjana
np01:	cmp	al,"E"
	jne	eee01
	cmp	aytomato_lot,0
	je	eee02
	cmp	protia_prn,0
	je	eee02
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wdltpl
	@CHANGESEGM	ds,DATA
;	call	dimiourgia_deltiou
;	call	far ptr ektipd
;	jnc	eee02
;	jmp	cjana1
eee02:	@CLRPLBUF
	@POP
	ret
eee01:	cmp	al,"A"
	jne	naa01
	call	far ptr pane_deltio
	jmp	skari
naa01:	cmp	al,"!"
	jne	na002
	@ZEROBBUF	deltio2prn,200,1 	;16x12=192
	mov	deltio2prn[176],0
	mov	deltio2prn[160],0
	call	far ptr ektipd
na002:	jmp	cjana
chk_pls	endp

;------------------------------------------->
dimiourgia_deltiou	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	@ZEROBBUF	deltio2prn,200,0 	;16x12=192
;------------------------------------------->>PROTO
	cmp	pejeproto,0
	je	noproto
	mov	ax,proto_simio
	mov	cx,16
	xor	dx,dx
	xor	bx,bx
	mul	cx
	mov	bx,ax
	mov	deltio2prn[bx],1
noproto:
;---------------------------------------------------
	mov	si,offset es:xarti
	mov	di,1
altor:	xor	ax,ax
	mov	al,es:[si]
	cmp	ax,0
	je	allodl
	xor	bx,bx
	xor	dx,dx
	dec	ax
	mov	cx,10
	div	cx
	push	ax
	inc	dx
	mov	ax,dx
	xor	dx,dx
	xor	bx,bx
	mov	cx,16
	mul	cx
	mov	bx,ax
	pop	ax
	add	ax,di
	sub	bx,ax
	mov	deltio2prn[bx],1
	inc	si
	jmp	altor
allodl:	inc	si
	add	di,5
	cmp	di,11
	ja	iden
	jmp	altor
iden:
;-----------------------------------------anaposa
	mov	cx,3
	mov	bx,0
	mov	di,171
skati:	mov	ax,ektanap[bx]
	cmp	ax,0
	jne	no0
	jmp	no5
;------------------------------------------>58
no0:	cmp	ax,58
	jne	no58a
	mov	deltio2prn[di],1
	mov	deltio2prn[di][18],1
	jmp	no5
;------------------------------------------>1
no58a:	cmp	ax,1
	jne	no1
	mov	deltio2prn[di][4],1
	jmp	no5
;------------------------------------------>5
no1:	cmp	ax,5
	jne	no5
	mov	deltio2prn[di],1
	jmp	no5
;------------------------------------------
no5:	add	bx,2
	sub	di,5
	loop	skati
	@POP
	ret
dimiourgia_deltiou	endp


emdlt	proc	near
	@PUSH
	lea	bx,deltio
	xor	ax,ax
	mov	al,[bx]
	@ITOA	strbuf,2
	@WPRINT	25,3,strbuf
	mov	al,[bx][1]
	@ITOA	strbuf,2
	@WPRINT	28,3,strbuf
	mov	al,[bx][2]
	@ITOA	strbuf,2
	@WPRINT	31,3,strbuf
	@LTOA	sthles,sthles[2],strbuf
	@WPRINT	25,4,strbuf
	@LTOA	deltia,deltia[2],strbuf
	@WPRINT	25,5,strbuf
	@POP
	ret
emdlt	endp

;****************************************EKTIPOSI DIALOGIS AXB

diala1	proc	near
	@PUSH
	@CHANGESEGM	es,EAXB
	@CHANGESEGM	ds,DATA
	call	dialaxb
	@LADD	mexritora[2],mexritora,0,sthl
	xor	ax,ax
	mov	al,ti
	add	miden1,ax
	adc	miden1[2],0
	xor	ax,ax
	mov	al,ti[1]
	add	ena1,ax
	adc	ena1[2],0
	xor	ax,ax
	mov	al,ti[2]
	add	dio1,ax
	adc	dio1[2],0
	xor	ax,ax
	mov	al,ti[3]
	add	tria1,ax
	adc	tria1[2],0
	xor	ax,ax
	mov	al,ti[4]
	add	tesa1,ax
	adc	tesa1[2],0
	xor	ax,ax
	mov	al,ti[5]
	add	pent1,ax
	adc	pent1[2],0
	xor	ax,ax
	mov	al,ti[6]
	add	ejar1,ax
	adc	ejar1[2],0
	cmp	ti[3],0
	jne	paa
	cmp	ti[4],0
	jne	paa
	cmp	ti[5],0
	jne	paa
	cmp	ti[6],0
	jne	paa
	jmp	kkv		; ›œ¤ œ®œ  ¦¬«œ 4˜¨ 
paa:	call	ektdialaxb
;******************************		
kkv:	lea	bx,es:xarti
	mov	cx,62
gge:	mov	byte ptr es:[bx],0
	inc	bx
	loop	gge
	mov	xarti1,0
	mov	sthl,0
	@POP
	ret
diala1	endp

ektdialaxb proc	near
	@PUSH
	call	ektdialaxb1
	@SELECTWI	32
	@LTOA	deltia,deltia[2],strbuf
	@WPRINT	2,cs:dilx,strbuf
	cmp	ti[6],0
	jne	titi1
	@WPRINTCH	14,cs:dilx,"."
	jmp	titi2
titi1:	@ITOAB	strbuf,1,ti[6]
	@WPRINT	13,cs:dilx,strbuf
	@INVERSE	1,cs:dilx,31
	call	mysound
titi2:	cmp	ti[5],0
	jne	titi3
	@WPRINTCH	20,cs:dilx,"."
	jmp	titi4
titi3:	@ITOAB	strbuf,2,ti[5]
	@WPRINT	19,cs:dilx,strbuf
titi4:	cmp	ti[4],0
	jne	titi5
	@WPRINTCH	26,cs:dilx,"."
	jmp	titi6
titi5:	@ITOAB	strbuf,2,ti[4]
	@WPRINT	25,cs:dilx,strbuf
titi6:
	cmp	ti[3],0
	jne	titi31
	@WPRINTCH	33,cs:dilx,"."
	jmp	titi41
titi31:	@ITOAB	strbuf,3,ti[3]
	@WPRINT	31,cs:dilx,strbuf
titi41:
	inc	cs:dilx
	cmp	cs:dilx,16
	jb	dilok
	@WPRINT	1,17,mpathst,@FLASH
	@WAITL
	@UPPERAX
	cmp	al,@ESCAPE
	jne	nott
	call	diakopi
nott:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdial1
	mov	cs:dilx,3
dilok:	@POP
	ret
dilx	db	0
ektdialaxb endp

mysound	proc	near
	@PUSH
	mov	cx,10
sond1:	push	cx
	mov	cx,400
	mov	ax,cx
sond:	@SOUND	3,ax
	dec	ax
	loop	sond
	pop	cx
	loop	sond1
sond3:	@POP
	ret
mysound	endp

ektdialaxb1 proc near
	@PUSH
	@CHANGESEGM	ds,DATA
	@SELECTWI	33
	@LTOA	deltia,deltia[2],strbuf
	@WPRINT	13,2,strbuf
	@LTOA	mexritora,mexritora[2],strbuf
	@WPRINT	13,3,strbuf
	@LTOA	ejar1,ejar1[2],strbuf
	@WPRINT	13,7,strbuf
	@LTOA	pent1,pent1[2],strbuf
	@WPRINT	13,8,strbuf
	@LTOA	tesa1,tesa1[2],strbuf
	@WPRINT	13,9,strbuf
	@LTOA	tria1,tria1[2],strbuf
	@WPRINT	13,10,strbuf
	@LTOA	dio1,dio1[2],strbuf
	@WPRINT	13,11,strbuf
	@LTOA	ena1,ena1[2],strbuf
	@WPRINT	13,12,strbuf
	@LTOA	miden1,miden1[2],strbuf
	@WPRINT	13,13,strbuf
	@POP
	ret
ektdialaxb1	endp

;*****************************************EKTIPOSI 4

ekty	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	mov	si,es:pin1
	mov	cx,5
	mov	bx,0
	xor	ax,ax
jana:	mov	al,deltio[bx]
	mov	es:[si],al
	inc	si
	inc	bx
	loop	jana
	mov	es:pin1,si
	@POP
	ret
ekty	endp

;******************************************EKTIPOSI 2

ekty1	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,EAXB
	mov	si,es:pin2
	mov	cx,ax
jjo:	push	cx
	mov	cx,5
	mov	bx,0
	xor	ax,ax
papa:	mov	al,deltio[bx]
	mov	es:[si],al
	inc	si
	inc	bx
	loop	papa
	xor	bx,bx
jano1:	xor	ax,ax
	mov	al,paxb1[bx]
	cmp	al,0
	je	llo
	mov	es:[si],al
	mov	paxb1[bx],0
	inc	es:metr1
	inc	si
	pop	cx
	loop	jjo
llo1:	mov	es:pin2,si
	@pop
	ret
llo:	inc	bx
	jmp	jano1
ekty1	endp

;****************************************EKTIPOSI PLIROUS

ekty2	proc	near
	@PUSH
	@CHANGESEGM	es,EAXB
	@CHANGESEGM	ds,DATA
	mov	si,es:pin1
	xor	ax,ax
	mov	cx,50
	mov	bx,1
ekto22:	cmp	paxb1[bx],0
	je	ekty22
	mov	al,paxb1[bx]
	mov	es:[si],al
	inc	si
ekty22:	inc	bx
	loop	ekto22
	mov	byte ptr es:[si],0
	inc	si
	mov	es:pin1,si
	inc	es:metr
	@POP
	ret
ekty2	endp

;******************************************

genekty	proc	near
	@PUSH
	@CHANGESEGM	es,EAXB
	@CHANGESEGM	ds,DATA
	lea	si,es:pinak2
	mov	akom1,si
	mov	cx,es:metr
	cmp	es:metr,0
	jne	mapla3
	jmp	mapla
mapla3:	xor	bx,bx
	cmp	cs:kkkk,1
	jng	llkp
	mov	cs:kkkk,0
	call	xarths
llkp:	lea	bx,es:pinak1
ffg2:	push	cx
	mov	cx,5
ffg:	xor	ax,ax
	mov	al,es:[bx]
	push	si
	mov	si,xarti1
	mov	es:[xarti][si],al
	inc	xarti1
	pop	si
	inc	bx
	loop	ffg
	jmp	klo		;›œ¤ ­«˜¤œ  «¦ ¢¦¦§
lalao:	cmp	cs:kkkk,1
	jne	lalao2
	mov	cs:kkkk,0
	jmp	lalao1
lalao2:	jmp	gnekt1
lalao1:	call	xarths
teldel:	pop	cx
	inc	bx
tyty:	loop	ffg2
mapla:	call	genekt2
	@pop
	ret
genekty	endp

;*****************************************************************************

gnekt1:	mov	ax,es:metr1
	cmp	ax,0
	je	lalao1
	inc	sthl
	push	si
	mov	si,xarti1
	mov	es:[xarti][si],0
	inc	xarti1
	pop	si
	@push
	mov	bx,akom1
	mov	cx,6
	xor	ax,ax
jala:	mov	al,es:[bx]
	push	si
	mov	si,xarti1
	mov	es:[xarti][si],al
	inc	xarti1
	pop	si
	inc	bx
	loop	jala
	dec	es:metr1
	mov	akom1,bx
	call	xarths
	@pop
	jmp	teldel
klo:	push	si
	mov	si,xarti1
	mov	es:[xarti][si],0
	inc	xarti1
	pop	si
	mov	cx,49
ffg1:	mov	al,es:[bx]
	cmp	al,0
	jne	lalao8
	jmp	lalao
lalao8:	push	si
	mov	si,xarti1
	mov	es:[xarti][si],al
	inc	xarti1
	pop	si
	inc	bx
	inc	sthl
	loop	ffg1
	@MBELL
	@EXIT

;***************************************************************************

genekt2	proc	near
	@PUSH
	@CHANGESEGM	es,EAXB
	@CHANGESEGM	ds,DATA
hhl:	mov	ax,es:metr1
	cmp	ax,0
	jne	kla1
	jmp	hla
kla1:	mov	bx,akom1
	mov	cx,6
	xor	ax,ax
jala1:	mov	al,es:[bx]
	push	si
	mov	si,xarti1
	mov	es:[xarti][si],al
	inc	xarti1
	pop	si
	inc	bx
	loop	jala1
	inc	sthl
	dec	es:metr1
	mov	akom1,bx
	inc	cs:kkkk
	cmp	cs:kkkk,3
	je	hla1
	push	si
	mov	si,xarti1
	mov	es:xarti[si],0
	inc	xarti1
	pop	si
	jmp	hhl
hla1:	mov	cs:kkkk,0
	call	xarths
	jmp	hhl
hla:	@POP
	ret
genekt2	endp

;****************************************METABLHTO

metablhto proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,METABS
tty1:	push	di
	cmp	cs:kkk,0
	jne	nnn
	mov	cs:kkk,1
	mov	filtra1,1
	mov	ax,filtra
	mov	cx,49
	mul	cx
	mov	cx,ax
	xor	si,si		;lea	si,metablbuf
jana1:	mov	byte ptr es:[si],0
	inc	si
	loop	jana1
	lea	si,deltio
	xor	di,di		;lea	si,metablbuf
	xor	bx,bx
	xor	cx,cx
	mov	cl,6
japa:	mov	bl,[si]
	mov	byte ptr es:[di][bx],1
	inc	si
	loop	japa
	jmp	tty
nnn:	xor	si,si		;lea	si,metablbuf
	mov	cx,filtra1
	cmp	cx,filtra
	jne	kiki
	jmp	telas
kiki:	push	cx
	lea	di,deltio
	xor	dx,dx
	xor	bx,bx
	xor	cx,cx
	mov	cl,6
kkkl:	mov	bl,[di]
	cmp	byte ptr es:[si][bx],0
	je	den
	inc	dl
den:	inc	di
	loop	kkkl
	cmp	dl,idosmet
	ja	dper
	add	si,49
	pop	cx
	loop	kiki
	inc	filtra1
	lea	di,deltio
	xor	bx,bx
	xor	cx,cx
	mov	cl,6
jano:	mov	bl,[di]
	mov	byte ptr es:[si][bx],1
	inc	di
	loop	jano
tty:	pop	di
	@pop
	clc
	ret
dper:	pop	cx
	pop	di
	@pop
	stc
	ret
telas:	pop	di
	mov	cs:kkk,0
	jmp	tty1
metablhto endp

;**********************************************PINAKAS

pinaka	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	lea	bx,deltio
bnm:	xor	ax,ax
	mov	al,[bx]
	dec	al
	add	al,al
	add	al,al
	mov	si,ax
	@incl	pinak3[si]
	inc	bx
	loop	bnm
	@CHKKEYB
	jnz	ppati
	jmp	ppati1
ppati:	@TAKEKEYB
	call	pinaka1
	cmp	al,27
	jne	ppati1
	call	diakopi
ppati1:	@POP
	ret
pinaka	endp

pinaka1	proc	near
	push	ax
	mov	cx,7
	mov	ah,3
	mov	si,0
jaj22:	push	cx
	mov	al,5
	mov	cx,7
jaj21:	@LTOA	pinak3[si],pinak3[si][2],strbuf
	@WPRINT	al,ah,strbuf
	add	al,10
	add	si,4
	loop	jaj21
	pop	cx
	add	ah,2
	loop	jaj22
	lea	bx,deltio
	xor	ax,ax
	mov	al,[bx]
	@ITOA	strbuf,2
	@WPRINT	29,17,strbuf
	mov	al,[bx][1]
	@ITOA	strbuf,2
	@WPRINT	32,17,strbuf
	mov	al,[bx][2]
	@ITOA	strbuf,2
	@WPRINT	35,17,strbuf
	@LTOA	sthles,sthles[2],strbuf
	@WPRINT	58,17,strbuf
	pop	ax
	ret
pinaka1	endp

;*********************************************************

xarths	proc	near
	push	cx
	push	bx
	cmp	aaxb,0
	je	bb55
	@incl	deltia
	call	far ptr diala2
	jmp	bb57
bb55:	cmp	diaaxb,0
	je	bb56
	@incl	deltia
	call	diala1
	jmp	bb57
bb56:	cmp	mnhmo,0
	je	bb57
	inc	deltia
bb57:	pop	bx
	pop	cx
	ret
xarths	endp

;******************************************** METRHMA

poy	proc	near
	@PUSH
	@CHKKEYB
	jnz	pati
	jmp	pati1
pati:	@TAKEKEYB
	call	poy1
	cmp	al,27
	jne	pati1
	call	diakopi
pati1:	@POP
	ret
poy	endp

poy1	proc	near
	push	ax
	lea	bx,deltio
	xor	ax,ax
	mov	al,[bx]
	@ITOA	strbuf,2
	@WPRINT	25,3,strbuf
	mov	al,[bx][1]
	@ITOA	strbuf,2
	@WPRINT	28,3,strbuf
	mov	al,[bx][2]
	@ITOA	strbuf,2
	@WPRINT	31,3,strbuf
	@LTOA	sthles,sthles[2],strbuf
	@WPRINT	25,4,strbuf
	pop	ax
	ret
poy1	endp

;******************************************** STHLES SE OUONH

aplad	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	lea	bx,deltio
	mov	cx,6
	xor	ax,ax
jala11:	mov	al,[bx]
	@ITOA	strbuf,3
	@PRINTS	strbuf
	inc	bx
	loop	jala11
	inc	cs:kkkk
	cmp	cs:kkkk,14
	jbe	jala12
	@CLRPLBUF
	@WAITL
	cmp	al,@ESCAPE
	jne	jala90
	call	diakopi
jala90:	mov	cs:kkkk,0
jala12:	@PRINTC	10
	@PRINTC	13
	@POP
	ret
kkkk	db	0
kkk	db	0
aplad	endp

;*************************************************METAFORA PLHROYS

movplir	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
;***********************************
	mov	ax,plhroi
	add	pinomad,ax
	xor	si,si
	mov	pinomad[18],si
epom_plir:
	mov	cs:pia1,0
	mov	cs:pia1[2],0
	mov	cs:pia2,0
	mov	cs:pia2[2],0
	mov	cs:pia3,0
	mov	cs:pia3[2],0
	mov	si,pinomad[18]
	cmp	byte ptr es:[si],"0"
	je	plir
	jmp	telplir
plir:	mov	plhuos,0
	mov	cx,49
	mov	bx,20
	xor	dx,dx
	xor	di,di
	mov	ax,1
isn0:	cmp	byte ptr es:[si][bx],0
	je	is000
	mov	byte ptr plhres[di],al
	inc	di
	inc	plhuos
is000:	inc	bx
	inc	ax
	loop	isn0
;***********************************
	mov	maxbar[2],0
	mov	cx,50
	mov	bx,69
	mov	ax,50
iisn0:	cmp	byte ptr es:[si][bx],0
	je	iis000
	mov	maxbar[2],ax
	jmp	iiss
iis000:	dec	bx
	dec	ax
	loop	iisn0
;************************************
iiss:	mov	maxbar,0
	mov	cx,50
	mov	bx,69
	mov	ax,50
	mov	dx,3
iiisn0:	cmp	byte ptr es:[si][bx],0
	je	iiis00
	add	maxbar,ax
	dec	dx
	cmp	dx,0
	je	iiss1
iiis00:	dec	bx
	dec	ax
	loop	iiisn0
;************************************
iiss1:	dec	pinomad
	add	pinomad[18],73
;***********************************
	mov	si,offset plhres
	mov	cx,6
	xor	bx,bx
	mov	ax,plhuos		; ™¨ ©¡œ  « ª «œ¢ ¡œª › œ¬Ÿ¬¤©œ ª ˜§¦
	add	ax,si			; « ª 6 ¢¦¬§œª
a1:	dec	ax
	mov	telos[bx],ax
	add	bx,2
	loop	a1
;***********************************
	call	gen
	jmp	epom_plir
telplir:
	@STRCOPY	deltio,cdeltio,6
	cmp	mnhmhout,0
	je	mnouta
	@FILLSTR	deltio,0,6
	call	smnhmh
	cmp	mnimi_save,0
	je	mniiia
	@CHANGESEGM	ds,PINMNHMHS
	@WRITE_MEM	cs:handle_save,0,65520
	jnc	mniiia
	call	error_save
mniiia:	@CLOSEHANDLE	cs:handle_save
mnouta:	@CHANGESEGM	ds,DATA
	@STRCOPY	cdeltio,deltio,6
	@POP
	ret
movplir	endp

;*************************************************METAFORA MNHMHS

movmnim	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
;***********************************
	cmp	pou_xani,1
	je	mepom_plir
	cmp	statistikh,0
	je	statno
	jmp	mepom_plir
statno:	xor	si,si
	mov	pinomad[18],si
mepom_plir:
	mov	cs:pia1,0
	mov	cs:pia1[2],0
	mov	cs:pia2,0
	mov	cs:pia2[2],0
	mov	cs:pia3,0
	mov	cs:pia3[2],0
	cmp	pou_xani,0
	je	nopoux
	cmp	pou_xani,2
	jne	mplir
	jmp	mtelplir
nopoux:	call	lmnhmh
	cmp	plhres,0
	jne	mplir
	jmp	mtelplir
mplir:	cmp	pou_xani,1
	jne	pxan12
	mov	pou_xani,2
pxan12:	cmp	statfor5,0
	je	nfor51
	@STRCOPY	plhres,plhres1,6
	mov	plhres,1
	mov	cs:uesifor5,0
nfor51:	@INCL	statstil
;***********************************
nfor54:	mov	plhuos,6
	@STRCOPY	plhres,plhres2,6
	mov	cx,5
sttaj4:	mov	bx,cx
	mov	al,plhres[bx]
	push	cx
	mov	si,bx
	dec	si
sttaj2:	cmp	al,plhres[si]
	ja	sttaj1
	jb	sttaj3
	pop	cx
	jmp	stidio
sttaj3:	mov	ah,plhres[si]
	mov	plhres[bx],ah
	mov	plhres[si],al
	mov	al,ah
sttaj1:	dec	si
	loop	sttaj2
	pop	cx
	loop	sttaj4
;***********************************
	xor	ax,ax
	mov	al,plhres[5]
	mov	maxbar[2],ax
	add	al,plhres[4]
	add	al,plhres[3]
	mov	maxbar,ax
;************************************
	mov	si,offset plhres
	mov	cx,6
	xor	bx,bx
	mov	ax,plhuos
	add	ax,si
ma1:	dec	ax
	mov	telos[bx],ax
	add	bx,2
	loop	ma1
;***********************************
	mov	cs:stf5,0
	call	gen
	cmp	cs:stf5,0
	je	nfor55
	jmp	nfor52
nfor55:	cmp	statfor5,0
	jne	nfor56
	jmp	nfor52
;***********************************
nfor56:
stidio:	@STRCOPY	plhres2,plhres,6
	mov	bx,cs:uesifor5
	inc	plhres[bx]
	mov	al,plhres[bx]
	cmp	al,50
	jb	nfor53
	inc	cs:uesifor5
	cmp	cs:uesifor5,6
	je	nfor52
	mov	al,plhres1[bx]
	mov	plhres[bx],al
	mov	plhres[bx+1],1
nfor53:	mov	cs:pia1,0
	mov	cs:pia1[2],0
	mov	cs:pia2,0
	mov	cs:pia2[2],0
	mov	cs:pia3,0
	mov	cs:pia3[2],0
	jmp	nfor54
;***********************************
nfor52:	cmp	st_omad,1
	je	stf5_2
	cmp	cs:stf5,0
	je	stf5_1
	inc	cs:st_epn
	mov	ax,cs:st_kau
	cmp	ax,stat_kauist
	jbe	smin1
	mov	stat_kauist,ax
smin1:	mov	cs:st_kau,0
	jmp	stf5_2
stf5_1:	inc	cs:st_kau
	mov	ax,cs:st_epn
	cmp	ax,stat_epanal
	jbe	smin2
	mov	stat_epanal,ax
smin2:	mov	cs:st_epn,0
stf5_2:	jmp	mepom_plir
mtelplir:
	@STRCOPY	deltio,cdeltio,6
	cmp	mnhmhout,0
	je	mnout
	@FILLSTR	deltio,0,6
	call	smnhmh
	cmp	mnimi_save,0
	je	mniii
	@CHANGESEGM	ds,PINMNHMHS
	@WRITE_MEM	cs:handle_save,0,65520
mniii:	@CLOSEHANDLE	cs:handle_save
mnout:	@CLOSEHANDLE	cs:handle_load
	mov	cs:handle_load,0
	@CHANGESEGM	ds,DATA
	@STRCOPY	cdeltio,deltio,6
	@POP
	ret
uesifor5 dw	0
movmnim	endp

;*************************************************GENHTRIA

gen	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	push	ds
	pop	es
	mov	si,offset plhres
	mov	di,offset deltio
	cld
a2:	movsb
	push	si
a3:	movsb
	push	si
a4:	movsb
	push	si
	mov	prvt,si

	call	cs:adres1
poke2:	call	cs:adres2

	pop	si
	dec	di
	cmp	si,telos[6]
	jbe	a4
	pop	si
	dec	di
	cmp	si,telos[8]
	jbe	a3
	pop	si
	dec	di
	cmp	si,telos[10]
	jbe	a2
	@POP
	ret
gen	endp

gen1	proc	near
	@push
	mov	si,prvt

a5:	movsb
	push	si
a6:	movsb
	push	si
	mov	deyt,si

	call	cs:adres3

	pop	si
	dec	di
	cmp	si,telos[2]
	jbe	a6
	pop	si
	dec	di
	cmp	si,telos[4]
	jbe	a5
	@pop
	ret
gen1	endp

gen2	proc	near
	@push
	mov	si,deyt
a7:	movsb
	
	call	cs:adres4

	dec	di
	cmp	si,telos
	jbe	a7
	@pop
	ret
gen2	endp

;*************************************************YPOXREOTIKOI

ypoxo3	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	cmp	cs:pia3[2],0
	jne	or33
or34:	mov	di,es:pinomad[18]
	mov	cx,es:pinomad
or32:	mov	ax,[di][8]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	or31
	loop	or32
	mov	cs:pia3[2],0
	@POP
	clc
	ret
or31:	mov	cs:pia3,di
	mov	cs:pios_xani,cx
	@POP
	stc
	ret
or33:	mov	di,cs:pia3
	mov	ax,[di-6]
	push	cx
	call	ax
	pop	cx
	jc	or31
	jmp	or34
ypoxo3	endp

ypoxo2	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	cmp	cs:pia2[2],0
	jne	or23
or24:	mov	di,es:pinomad[18]
	mov	cx,es:pinomad
or22:	mov	ax,[di+10]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	or21
	loop	or22
	mov	cs:pia2[2],0
	@POP
	clc
	ret
or21:	mov	cs:pia2,di
	mov	cs:pios_xani,cx
	@POP
	stc
	ret
or23:	mov	di,cs:pia2
	mov	ax,[di-4]
	push	cx
	call	ax
	pop	cx
	jc	or21
	jmp	or24
ypoxo2	endp

ypoxo1	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	cmp	cs:pia1[2],0
	jne	or13
or14:	mov	cs:pia1[2],0
	mov	di,es:pinomad[18]
	mov	cx,es:pinomad
or12:	mov	ax,[di+12]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	or11
	loop	or12
	mov	cs:pia1[2],0
	@POP
	clc
	ret
or11:	mov	cs:pia1,di
	mov	cs:pios_xani,cx
	@POP
	stc
	ret
or13:	mov	di,cs:pia1
	mov	ax,[di-2]
	push	cx
	call	ax
	pop	cx
	jc	or11
	jmp	or14
pia1	dw	0,0
pia2	dw	0,0
pia3	dw	0,0
ypoxo1	endp

;*************************************************OMADES

omad3	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	mov	cx,es:omades
	mov	bx,offset es:ypoxromad
omepom3:
	mov	si,es:[bx]
	push	si
	push	cx
	push	bx
	mov	di,es:[si+18]
	mov	es:omador,0
	mov	cx,es:[si]
om32:	mov	ax,[di][8]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	om31
	inc	es:omador
	jmp	om321
om31:	add	di,ax
om321:	loop	om32
	pop	bx
	pop	cx
	pop	si
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	om33
	inc	bx
	inc	bx
	loop	omepom3
	@POP
	clc
	ret
om33:	mov	cs:pios_xani,si
	@POP
	stc
	ret
omad3	endp

omad2	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	mov	cx,es:omades
	mov	bx,offset es:ypoxromad
omepom2:
	mov	si,es:[bx]
	push	si
	push	cx
	push	bx
	mov	di,es:[si+18]
	mov	es:omador,0
	mov	cx,es:[si]
om22:	mov	ax,[di][10]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	om21
	inc	es:omador
	jmp	om221
om21:	add	di,ax
om221:	loop	om22
	pop	bx
	pop	cx
	pop	si
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	om23
	inc	bx
	inc	bx
	loop	omepom2
	@POP
	clc
	ret
om23:	mov	cs:pios_xani,si
	@POP
	stc
	ret
omad2	endp

omad1	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	mov	cx,es:omades
	mov	bx,offset es:ypoxromad
omepom1:
	mov	si,es:[bx]
	push	si
	push	cx
	push	bx
	mov	di,es:[si+18]
	xor	ax,ax
	mov	es:omador,ax
	mov	es:emfanisi,ax
	mov	es:orsinex1,ax
	mov	es:orsinex,ax
	mov	cx,es:[si]
om12:	mov	ax,[di][12]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	om11
	inc	es:omador
	inc	es:orsinex1
	jmp	om121
om11:	add	di,ax
	mov	ax,es:orsinex1
	mov	es:orsinex1,0
	cmp	ax,es:orsinex
	jbe	om121
	mov	es:orsinex,ax
om121:	loop	om12
	mov	ax,es:orsinex1
	cmp	ax,es:orsinex
	jbe	om1211
	mov	es:orsinex,ax
om1211:	pop	bx
	pop	cx
	pop	si
;--------------------------------- TEST ORIA OMADAS
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	om13
	cmp	ax,es:[si+6]
	ja	om13
;--------------------------------- TEST SYNEXOMENOYS OROYS
	mov	ax,es:orsinex
	cmp	ax,es:[si+8]
	jb	om13
	cmp	ax,es:[si+10]
	ja	om13
;--------------------------------- TEST EMFANISEIS
	mov	ax,es:emfanisi
	cmp	ax,es:[si+14]
	jb	om13
	cmp	ax,es:[si+16]
	ja	om13
;---------------------------------
	inc	bx
	inc	bx
	loop	omepom_1
	@POP
	clc
	ret
om13:	mov	cs:pios_xani,si
	@POP
	stc
	ret
omepom_1: jmp	omepom1
omad1	endp

;*************************************************YPEROMADES

yomad3	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,yperom
	mov	ax,offset yperomad
	mov	cs:_bx,ax
	mov	si,offset ypomad
yper31:	mov	di,[si]
	call	iomad3
	mov	ax,yper
	cmp	ax,[di+2]
	jb	yper32
	inc	si
	inc	si
	loop	yper31
	@POP
	clc
	ret
yper32:	mov	cs:pios_xani,di
	@POP
	stc
	ret
yomad3	endp

yomad2	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,yperom
	mov	ax,offset yperomad
	mov	cs:_bx,ax
	mov	si,offset ypomad
yper21:	mov	di,[si]
	call	iomad2
	mov	ax,yper
	cmp	ax,[di+2]
	jb	yper22
	inc	si
	inc	si
	loop	yper21
	@POP
	clc
	ret
yper22:	mov	cs:pios_xani,di
	@POP
	stc
	ret
yomad2	endp

yomad1	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,yperom
	mov	ax,offset yperomad
	mov	cs:_bx,ax
	mov	si,offset ypomad
yper11:	mov	di,[si]
	call	iomad1
	mov	ax,yper
	cmp	ax,[di+2]
	jb	yper12
	cmp	ax,[di+4]
	ja	yper12
	inc	si
	inc	si
	loop	yper11
	@POP
	clc
	ret
yper12:	mov	cs:pios_xani,di
	@POP
	stc
	ret
_bx	dw	0
yomad1	endp

iomad3	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	mov	cx,es:[di]
	mov	es:yper,0
	mov	bx,cs:_bx
iomepom3:
	mov	si,es:[bx]
	push	si
	push	cx
	push	bx
	mov	di,es:[si+18]
	mov	es:omador,0
	mov	cx,es:[si]
iom32:	mov	ax,[di][8]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	iom31
	inc	es:omador
	jmp	iom321
iom31:	add	di,ax
iom321:	loop	iom32
	pop	bx
	pop	cx
	pop	si
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	iom33
	inc	es:yper
iom33:	inc	bx
	inc	bx
	loop	iomepom3
	mov	cs:_bx,bx
	@POP
	ret
iomad3	endp

iomad2	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	mov	cx,es:[di]
	mov	es:yper,0
	mov	bx,cs:_bx
iomepom2:
	mov	si,es:[bx]
	push	si
	push	cx
	push	bx
	mov	di,es:[si+18]
	mov	es:omador,0
	mov	cx,es:[si]
iom22:	mov	ax,[di][10]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	iom21
	inc	es:omador
	jmp	iom221
iom21:	add	di,ax
iom221:	loop	iom22
	pop	bx
	pop	cx
	pop	si
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	iom23
	inc	es:yper
iom23:	inc	bx
	inc	bx
	loop	iomepom2
	mov	cs:_bx,bx
	@POP
	ret
iomad2	endp

iomad1	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	mov	cx,es:[di]
	mov	es:yper,0
	mov	bx,cs:_bx
iomepom1:
	mov	si,es:[bx]
	push	si
	push	cx
	push	bx
	mov	di,es:[si+18]
	xor	ax,ax
	mov	es:omador,ax
	mov	es:emfanisi,ax
	mov	es:orsinex1,ax
	mov	es:orsinex,ax
	mov	cx,es:[si]
iom12:	mov	ax,[di][12]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	iom11
	inc	es:omador
	inc	es:orsinex1
	jmp	iom121
iom11:	add	di,ax
	mov	ax,es:orsinex1
	mov	es:orsinex1,0
	cmp	ax,es:orsinex
	jbe	iom121
	mov	es:orsinex,ax
iom121:	loop	iom12
	mov	ax,es:orsinex1
	cmp	ax,es:orsinex
	jbe	iom1211
	mov	es:orsinex,ax
iom1211: pop	bx
	pop	cx
	pop	si
;--------------------------------- TEST ORIA OMADAS
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	iom13
	cmp	ax,es:[si+6]
	ja	iom13
;--------------------------------- TEST SYNEXOMENOYS OROYS
	mov	ax,es:orsinex
	cmp	ax,es:[si+8]
	jb	iom13
	cmp	ax,es:[si+10]
	ja	iom13
;--------------------------------- TEST EMFANISEIS BASIKVN
	mov	ax,es:emfanisi
	cmp	ax,es:[si+14]
	jb	iom13
	cmp	ax,es:[si+16]
	ja	iom13
;---------------------------------
	inc	es:yper
iom13:	inc	bx
	inc	bx
	loop	iomepom_1
	mov	cs:_bx,bx
	@POP
	ret
iomepom_1: jmp	iomepom1
iomad1	endp

;*************************************************PROTASEIS

aplprot3	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,aplesprot
	mov	bx,0
	mov	di,offset pinomad
epmp31:	mov	ax,apliprot[bx]
	dec	ax
	mov	si,24
	mul	si
	add	ax,di
	mov	si,ax
	call	prtad3
	jc	epmp32
	mov	ax,apliprot[bx+2]
	dec	ax
	mov	si,24
	mul	si
	add	ax,di
	mov	si,ax
	call	prtad3
epmp32:	add	bx,8
	loop	epmp31
	@POP
	clc
	ret
epmp30:	mov	cs:pios_xani,bx
	@POP
	stc
	ret
aplprot3	endp

aplprot2	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,aplesprot
	mov	di,offset pinomad
	mov	bx,0
epmp21:	mov	ax,apliprot[bx]
	dec	ax
	mov	si,24
	mul	si
	add	ax,di
	mov	si,ax
	call	prtad2
	jc	epmp22
	mov	ax,apliprot[bx+2]
	dec	ax
	mov	si,24
	mul	si
	add	ax,di
	mov	si,ax
	call	prtad2
epmp22:	add	bx,8
	loop	epmp21
	@POP
	clc
	ret
epmp20:	mov	cs:pios_xani,bx
	@POP
	stc
	ret
aplprot2	endp

aplprot1	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,aplesprot
	mov	di,offset pinomad
	mov	bx,0
epmp11:	mov	ax,apliprot[bx]
	dec	ax
	mov	si,24
	mul	si
	add	ax,di
	mov	si,ax
	call	prtad1
	jc	epmp12
	mov	ax,apliprot[bx+2]
	dec	ax
	mov	si,24
	mul	si
	add	ax,di
	mov	si,ax
	call	prtad1
	jc	epmp10
epmp12:	add	bx,8
	loop	epmp11
	@POP
	clc
	ret
epmp10:	mov	cs:pios_xani,bx
	@POP
	stc
	ret
aplprot1	endp

prtad3	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	push	si
	mov	di,es:[si+18]
	mov	es:omador,0
	mov	cx,es:[si]
prt32:	mov	ax,[di][8]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	prt31
	inc	es:omador
	jmp	prt321
prt31:	add	di,ax
prt321:	loop	prt32
	pop	si
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	prt33
	@POP
	clc
	ret
prt33:	@POP
	stc
	ret
prtad3	endp

prtad2	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	push	si
	mov	di,es:[si+18]
	mov	es:omador,0
	mov	cx,es:[si]
prt22:	mov	ax,[di][10]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	prt21
	inc	es:omador
	jmp	prt221
prt21:	add	di,ax
prt221:	loop	prt22
	pop	si
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	prt23
	@POP
	clc
	ret
prt23:	@POP
	stc
	ret
prtad2	endp

prtad1	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINOROI
	push	si
	mov	di,es:[si+18]
	xor	ax,ax
	mov	es:omador,ax
	mov	es:emfanisi,ax
	mov	es:orsinex1,ax
	mov	es:orsinex,ax
	mov	cx,es:[si]
prt12:	mov	ax,[di][12]
	add	di,14
	push	cx
	call	ax
	pop	cx
	jc	prt11
	inc	es:omador
	inc	es:orsinex1
	jmp	prt121
prt11:	add	di,ax
	mov	ax,es:orsinex1
	mov	es:orsinex1,0
	cmp	ax,es:orsinex
	jbe	prt121
	mov	es:orsinex,ax
prt121:	loop	prt12
	mov	ax,es:orsinex1
	cmp	ax,es:orsinex
	jbe	prt1211
	mov	es:orsinex,ax
prt1211: pop	si
;--------------------------------- TEST ORIA OMADAS
	mov	ax,es:omador
	cmp	ax,es:[si+4]
	jb	prt13
	cmp	ax,es:[si+6]
	ja	prt13
;--------------------------------- TEST SYNEXOMENOYS OROYS
	mov	ax,es:orsinex
	cmp	ax,es:[si+8]
	jb	prt13
	cmp	ax,es:[si+10]
	ja	prt13
;--------------------------------- TEST EMFANISEIS BASIKVN
	mov	ax,es:emfanisi
	cmp	ax,es:[si+14]
	jb	prt13
	cmp	ax,es:[si+16]
	ja	prt13
;---------------------------------
	@POP
	clc
	ret
prt13:	@POP
	stc
	ret
prtad1	endp

;*************************************** DIALOGI (BASIKH 4-6)

dial01	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	metabl,0
	je	dl001
nper1:	@POP
	clc
	ret
dl001:	cmp	bug_period,0
	jne	nper1
	xor	ax,ax
	mov	cx,3
	lea	si,deltio
	xor	bx,bx
b2:	mov	bl,[si]
	cmp	byte ptr stdial[bx],0
	je	b1
	inc	ax
b1:	inc	si
	loop	b2
	mov	cs:simdial,ax
	@POP
	clc
	ret
dial01	endp

dial02	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	metabl,0
	je	dl002
nper2:	@POP
	clc
	ret
dl002:	cmp	bug_period,0
	jne	nper2
	mov	ax,cs:simdial
	mov	cx,2
	lea	si,deltio[3]
	xor	bx,bx
b22:	mov	bl,[si]
	cmp	byte ptr stdial[bx],0
	je	b12
	inc	ax
b12:	inc	si
	loop	b22
	mov	cs:simdial[2],ax
	cmp	ax,2			;;;;-> 3
	jb	b32
	@POP
	clc
	ret
b32:	@POP
	stc
	ret
dial02	endp

dial03	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	metabl,0
	je	dl003
nper3:	@POP
	clc
	ret
dl003:	cmp	bug_period,0
	jne	nper3
	mov	ax,cs:simdial[2]
	xor	bx,bx
	mov	bl,deltio[5]
	cmp	byte ptr stdial[bx],0
	je	b121
	inc	ax
b121:	cmp	ax,3			;;; -> 4
	jb	b321
	@POP
	clc
	ret
b321:	@POP
	stc
	ret
simdial	dw	0,0
dial03	endp

;**************************************************** MNHMH

smnhmh	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINMNHMHS
	mov	bx,es:mnimi_save
	mov	si,0
	mov	cx,6
amns0:	mov	al,es:deltio[si]
	mov	[bx],al
	inc	bx
	inc	si
	loop	amns0
	cmp	bx,65520
	jb	amns1
	@CHANGESEGM	es,MCODE
	mov	es:is_error,0
	@WRITE_MEM	cs:handle_save,0,65520
	jnc	okitss
	call	error_save
	jmp	amns1
okitss:	cmp	es:is_error,0
	je	qwtr
	call	error_save
qwtr:	xor	bx,bx
amns1:	@CHANGESEGM	es,DATA
	mov	es:mnimi_save,bx
	@POP
	ret
handle_save	dw	0
smnhmh	endp

lmnhmh	proc	near
	@PUSH
	@CHANGESEGM	es,DATA
	@CHANGESEGM	ds,PINMNHMHL
	mov	bx,es:mnimi_load
	mov	si,0
	mov	cx,6
amnl0:	mov	al,[bx]
	mov	es:plhres[si],al
	inc	bx
	inc	si
	loop	amnl0
	cmp	bx,65520
	jb	amnl1
	@CHANGESEGM	es,MCODE
	mov	es:is_error,0
	@READ_MEM	cs:handle_load,0,65520
	jnc	okitl
	call	error_load
	jmp	amnl1
okitl:	cmp	es:is_error,0
	je	wrty
	call	error_load
wrty:	xor	bx,bx
amnl1:	@CHANGESEGM	es,DATA
	mov	es:mnimi_load,bx
	@POP
	ret
handle_load	dw	0,0
pios_xani	dw	0,0
lmnhmh	endp

code1	ends
	end
