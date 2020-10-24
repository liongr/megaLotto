
INCLUDE	koina.inc
INCLUDE	klidi.inc

code	segment	public

	assume	cs:code



testonom1	proc	near
	@PUSH
	@CHANGESEGM	ds,CODE
	@CHANGESEGM	es,WINDOWS
	@STRXOR	tstcpr3,44
	xor	bx,bx
idio2:	mov	al,tstcpr3[bx]
	cmp	al,0
	je	idio3
	mov	es:tstcpr1[bx],al
	inc	bx
	jmp	idio2
idio3:	@POP
	ret
tstcpr3	label	byte
XORDATA	<(c)1993 ’…—’…€‰†‘ ƒ. & €€ƒŽŽ“ŠŽ‘ Š.>,44
	db	0
testonom1	endp


printer_is_PCL	proc	near
	jmp	prnPCL
__X	dw	0
__Y	dw	0
prnPCL:	@PUSH
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	pcl_reset,lpt_number,cs:print_stack5
	@LPRINTSTR	pcl_10cpi,lpt_number,cs:print_stack5
	@LPRINTSTR	pcl_select_charset,lpt_number,cs:print_stack5
	@LPRINTSTR	pcl_set_height,lpt_number,cs:print_stack5
	mov	ax,riumisi_pano_lot[bx]
	mov	cs:__Y,ax
	mov	ax,riumisi_aris_lot[bx]
	mov	cs:__X,ax
	call	pcl_mov_Y
	call	pcl_mov_X

	mov	cx,12
	mov	si,0
pcl34:	push	cx
;----------------------------------------------------------------------------
	mov	ax,riumisi_aris_lot[bx]
	mov	cs:__X,ax
;----------------------------------------------------------------------------
	mov	cx,16
pcl13:	call	pcl_mov_X
	mov	dl,deltio2prn[si]
	cmp	dl,1
	je	pclone
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	jmp	pclken
pclone:
	@LPRINTCHR	prchar_lot[bx],lpt_number,cs:print_stack5
pclken:
	mov	ax,kena_orizontia_lot[bx]
	add	cs:__X,ax
	inc	si
	loop	pcl13
	
	pop	cx

	mov	ax,kena_kaueta_lot[bx]
	add	cs:__Y,ax
	call	pcl_mov_Y
	loop	pcl34

	mov	ax,riumisi_aris_lot[bx]
	mov	cs:__X,ax
	mov	ax,kena_info_plr[bx]
	add	cs:__Y,ax
	call	pcl_mov_Y
	call	pcl_mov_X

	@LMULN	sthl,timh
	cmp	pejeproto,0
	je	no_prt55
	add	ax,protodrx
	adc	dx,protodrx[2]
no_prt55:
	@LTOA	ax,dx,strbuf
	call	far ptr div100
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTCHR	"-",lpt_number,cs:print_stack5
	@LTOAN	deltia,strbuf
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTCHR	"-",lpt_number,cs:print_stack5
	@LTOAN	sthl,strbuf
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	pcl_formfeed,lpt_number,cs:print_stack5
	
	@POP
	ret
printer_is_PCL	endp

ektipd	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cs:print_stack5,sp
;*******************************************
IFDEF	@NORMAL
;*******************************************

	mov	bx,pio_prn
	shl	bx,1
	mov	cs:_bx,bx


	cmp	aytomato_lot,0
	jne	isauto
	mov	ax,offset lptnames
	mov	lpt_number,ax
	jmp	oxiayt

isauto:	mov	ax,offset lptnames
	mov	lpt_number,ax
	mov	ax,pio_prn
	mov	cx,15
	mul	cx
	add	lpt_number,ax

	inc	pio_prn
	mov	ax,ektipotes_lot
	cmp	pio_prn,ax
	jb	nomax
	mov	pio_prn,0

nomax:	mov	protia_prn,1

oxiayt:	
	cmp	pcl_prn[bx],4
	jbe	palia_ekt
	call	printer_is_PCL
	jmp	isPCL_RE
palia_ekt:

;-------------------------------------------------------------
	mov	ax,bx
	call	far ptr PCLorEPSON
;------------------------------------------------------------->reset
	@LPRINTSTR	prn_reset,lpt_number,cs:print_stack5
;------------------------------------------------------------->aristero periuorio
	cmp	pcl_prn[bx],1
	je	is_PCL_0
	mov	ax,riumisi_aris_lot[bx]
	call	far ptr do_left_mergin
is_PCL_0:
;------------------------------------------------------------->arxiki proouisi
	mov	ax,riumisi_pano_lot[bx]
	call	far ptr do_proouisi
;----------------------------------------------------------------------
	mov	ax,kena_kaueta_lot[bx]
	call	far ptr do_vertical_space
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
;----------------------------------------------------------------------
	cmp	double_str_lot[bx],0
	je	no_double
	@LPRINTSTR	prn_set_double,lpt_number,cs:print_stack5
no_double:
;------------------------------------------------------------------
	cmp	emfasi_lot[bx],0
	je	no_emfasi
	@LPRINTSTR	prn_set_emfasis,lpt_number,cs:print_stack5
no_emfasi:
;------------------------------------------------------------------
	@LPRINTSTR	prn_expanded_on,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_set_10cpi,lpt_number,cs:print_stack5
;------------------------------------------------------------------
	cmp	tiposekt_lot[bx],2
	jne	notipos_2
	call	far ptr ektiposi_pliraki_2
	jmp	egine

notipos_2:
	cmp	tiposekt_lot[bx],3
	jne	notipos_3
	call	far ptr ektiposi_pliraki_3
	jmp	egine

notipos_3:
	cmp	tiposekt_lot[bx],4
	jne	notipos_4
	call	far ptr ektiposi_pliraki_4
	jmp	egine

notipos_4:
	cmp	tiposekt_lot[bx],5
	jne	notipos_5
	call	far ptr ektiposi_pliraki_5
	jmp	egine

notipos_5:
	call	far ptr ektiposi_pliraki_1
;------------------------------------------------------------------
egine:	@LPRINTSTR	prn_formfeed,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_reset,lpt_number,cs:print_stack5
isPCL_RE:
	@LPRINT_STOP
	cmp	aytomato_lot,0
	je	oxiat1
	@WAIT	anamoni_lot
oxiat1:	@POP
	retf
;*******************************************
ENDIF
;*******************************************
	@POP
	clc
	retf
print_stack5	dw	0
_bx	dw	0
ektipd	endp

;-------------------------------------------------------------->1
ektiposi_pliraki_1	proc	near
	@PUSH
;**************************************************
IFDEF	@NORMAL
;**************************************************
	@CHANGESEGM	ds,DATA

	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call	ekti_st
	mov	cx,kena_info_plr[bx]
keninf1:
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	loop	keninf1
	call	ekti_st_simia

	mov	cx,12
	xor	si,si
t1_lop34:	push	cx
;----------------------------------------------------------------------------
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------------------------------------------------
	mov	cx,16
t1_lop13:
	call	make_orizontia_riumisi_printer
	mov	dl,deltio2prn[si]
	cmp	dl,1
	je	t1_isone
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	jmp	t1_tokana
t1_isone:
	@LPRINTCHR	prchar_lot[bx],lpt_number,cs:print_stack5
t1_tokana:
	inc	si
	loop	t1_lop13
	
	pop	cx
	call	make_kaueti_riumisi_printer
	loop	t1_lop349
	@POP
	clc
	retf
t1_lop349:
	jmp	t1_lop34
;**************************************************
ENDIF
;**************************************************
	@POP
	clc
	retf
ektiposi_pliraki_1	endp

;-------------------------------------------------------------->3
ektiposi_pliraki_3	proc	near
	@PUSH
;**************************************************
IFDEF	@NORMAL
;**************************************************
	@CHANGESEGM	ds,DATA

	call	ekti_st_simia

	mov	cx,12
	mov	si,191
t3_lop34:	
	push	cx
;----------------------------------------------------------------------------
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
;----------------------------------------------------------------------------
	mov	cx,16
t3_lop13:
	call	make_orizontia_riumisi_printer
	mov	dl,deltio2prn[si]
	cmp	dl,1
	je	t3_isone
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	jmp	t3_tokana
t3_lop349:
	jmp	t3_lop34
t3_isone:
	@LPRINTCHR	prchar_lot[bx],lpt_number,cs:print_stack5
t3_tokana:
	dec	si
	loop	t3_lop13
	
	pop	cx
	call	make_kaueti_riumisi_printer
	loop	t3_lop349
	mov	cx,kena_info_plr[bx]
keninf3:
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	loop	keninf3
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call	ekti_st
;**************************************************
ENDIF
;**************************************************
	@POP
	clc
	retf
ektiposi_pliraki_3	endp

;-------------------------------------------------------------->2
ektiposi_pliraki_2	proc	near
	@PUSH
;**************************************************
IFDEF	@NORMAL
;**************************************************
	@CHANGESEGM	ds,DATA

	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call	ekti_st
	mov	cx,kena_info_plr[bx]
keninf2:
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	loop	keninf2
	call	ekti_st_simia

	mov	cx,16
	mov	si,15
t2_lop34:	
	push	cx
	push	si
;----------------------------------------------------------------------------
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------------------------------------------------
	mov	cx,12
t2_lop13:
	call	make_orizontia_riumisi_printer
	mov	dl,deltio2prn[si]
	cmp	dl,1
	je	t2_isone
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	jmp	t2_tokana
t2_lop349:
	jmp	t2_lop34
t2_isone:
	@LPRINTCHR	prchar_lot[bx],lpt_number,cs:print_stack5
t2_tokana:
	add	si,16
	loop	t2_lop13
	
	pop	si
	dec	si
	pop	cx
	call	make_kaueti_riumisi_printer
	loop	t2_lop349
;**************************************************
ENDIF
;**************************************************
	@POP
	clc
	retf
ektiposi_pliraki_2	endp

;-------------------------------------------------------------->4
ektiposi_pliraki_4	proc	near
	@PUSH
;**************************************************
IFDEF	@NORMAL
;**************************************************
	@CHANGESEGM	ds,DATA

	call	ekti_st_simia

	mov	cx,16
	mov	si,176
t4_lop34:
	push	cx
	push	si
;----------------------------------------------------------------------------
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------------------------------------------------
	mov	cx,12
t4_lop13:
	call	make_orizontia_riumisi_printer
	mov	dl,deltio2prn[si]
	cmp	dl,1
	je	t4_isone
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	jmp	t4_tokana
t4_isone:
	@LPRINTCHR	prchar_lot[bx],lpt_number,cs:print_stack5
t4_tokana:
	sub	si,16
	loop	t4_lop13

	pop	si
	pop	cx
	inc	si
	call	make_kaueti_riumisi_printer
	loop	t4_lop349
	mov	cx,kena_info_plr[bx]
keninf4:
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	loop	keninf4
	call	do_apostasi	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call	ekti_st
	@POP
	clc
	retf
t4_lop349:
	jmp	t4_lop34
;**************************************************
ENDIF
;**************************************************
	@POP
	clc
	retf
ektiposi_pliraki_4	endp

;-------------------------------------------------------------->5 palia
ektiposi_pliraki_5	proc	near
	@PUSH
;**************************************************
IFDEF	@NORMAL
;**************************************************
	@CHANGESEGM	ds,DATA

	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	call	ekti_st
	mov	cx,kena_info_plr[bx]
keninf5:
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	loop	keninf5

	mov	cx,12
	xor	si,si
t5_lop34:
	push	cx
	mov	cx,16

	mov	al,0
	@LPRINTSTR	prn_set_12cpi,lpt_number,cs:print_stack5

t5_lop13:
	mov	dl,deltio2prn[si]

	call	tfd

	inc	si
	loop	t5_lop13
	
	pop	cx
	call	make_kaueti_riumisi_printer
	loop	t5_lop349
	@POP
	clc
	retf
t5_lop349:
	jmp	t5_lop34
;**************************************************
ENDIF
;**************************************************
	@POP
	clc
	retf
ektiposi_pliraki_5	endp

tfd	proc	near
	inc	al
	cmp	al,6
	jne	tfdno
	push	dx

	@LPRINTSTR	prn_set_10cpi,lpt_number,cs:print_stack5
	mov	al,0
	pop	dx
	jmp	tfdn
tfdno:	cmp	al,1
	jne	tfdn
	push	dx
	@LPRINTSTR	prn_set_12cpi,lpt_number,cs:print_stack5
	pop	dx
tfdn:	cmp	dl,1
	je	tfdo
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	ret
tfdo:	@LPRINTCHR	prchar_lot[bx],lpt_number,cs:print_stack5
	ret
tfd	endp

do_apostasi	proc	near
	@PUSH
	cmp	pcl_prn[bx],1
	je	is_PCL_3
	jmp	no_apost
is_PCL_3:
	@LPRINTSTR	prn_set_conden,lpt_number,cs:print_stack5
	cmp	riumisi_aris_lot[bx],0
	jne	nozero
	jmp	tis0
nozero:	mov	cx,riumisi_aris_lot[bx]
skati:	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	loop	skati
tis0:	@LPRINTSTR	prn_set_10cpi,lpt_number,cs:print_stack5
no_apost:
	@POP
	ret
do_apostasi	endp

ekti_st_simia	proc	near
	@PUSH
	cmp	pcl_prn[bx],1
	je	is_PCL_1
	@LPRINTSTR	prn_set_12cpi,lpt_number,cs:print_stack5
is_PCL_1:
	mov	ax,kena_kaueta_lot[bx]
	call	far ptr do_vertical_space
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
	@POP
	ret
ekti_st_simia	endp

ekti_st	proc	near
	@PUSH
	cmp	pcl_prn[bx],1
	je	is_PCL_2
	mov	ax,0
	call	far ptr do_horizontial_space
is_PCL_2:
	@LPRINTSTR	prn_set_10cpi,lpt_number,cs:print_stack5
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	@LPRINTCHR	" ",lpt_number,cs:print_stack5
	@LMULN	sthl,timh
	cmp	pejeproto,0
	je	no_prt1
	add	ax,protodrx
	adc	dx,protodrx[2]
no_prt1:
	@LTOA	ax,dx,strbuf
	call	far ptr div100
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTCHR	"-",lpt_number,cs:print_stack5
	@LTOAN	deltia,strbuf
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTCHR	"-",lpt_number,cs:print_stack5
	@LTOAN	sthl,strbuf
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	@POP
	ret
ekti_st	endp

make_orizontia_riumisi_printer proc	near
	@PUSH
	mov	bx,cs:_bx
diafor:	xor	dx,dx
	mov	ax,cx
	mov	cx,endiam_oriz_lot[bx]
	div	cx
	cmp	dx,0
	je	is_or_endiameso
is_or_kirios:
	mov	bx,cs:_bx
	mov	ax,kena_orizontia_lot[bx]
	call	far ptr do_horizontial_space
	@POP
	ret
is_or_endiameso:
	mov	bx,cs:_bx
	mov	ax,kena_oriz_end_lot[bx]
	call	far ptr do_horizontial_space
	@POP
	ret
make_orizontia_riumisi_printer endp

make_kaueti_riumisi_printer proc near
	@PUSH
	mov	bx,cs:_bx
	xor	dx,dx
	mov	ax,cx
	mov	cx,endiam_kau_lot[bx]
	div	cx
	cmp	dx,0
	jne	is_ka_kirios
	jmp	is_ka_endiameso
is_ka_kirios:
	mov	bx,cs:_bx
	mov	ax,kena_kaueta_lot[bx]
	call	far ptr do_vertical_space
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	@POP
	ret
is_ka_endiameso:
	mov	bx,cs:_bx
	mov	ax,kena_kaueta_end_lot[bx]
	call	far ptr do_vertical_space
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	@POP
	ret
make_kaueti_riumisi_printer endp


do_proouisi	proc	near
	@PUSH
	cmp	ax,0
	jne	isnt0
	jmp	is_miden
isnt0:	mov	cs:_temp,al
	cmp	ax,40
	ja	is_big
	jmp	is_nmiden
is_big:	xor	dx,dx
	mov	cx,40
	div	cx
	mov	cs:_temp,dl
	mov	cx,ax
	mov	ax,40
	call	far ptr do_vertical_space
nxtsm:
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
	loop	nxtsm
is_small:
	cmp	cs:_temp,0
	jne	is_nmiden
	jmp	is_miden
is_nmiden:
	mov	ah,0
	mov	al,cs:_temp
	call	far ptr do_vertical_space
	@LPRINTSTR	prn_line_feed,lpt_number,cs:print_stack5
is_miden:
	@POP
	retf
_temp	db	0
do_proouisi	endp

do_horizontial_space	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	prn_hori_space_1,lpt_number,cs:print_stack5
	cmp	prn_ascii,1
	je	send_0
	@LPRINTCHR	al,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_hori_space_2,lpt_number,cs:print_stack5
	@POP
	retf
send_0:	@LTOA	ax,0,strbuf
	call	do_using
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_hori_space_2,lpt_number,cs:print_stack5
	@POP
	retf
do_horizontial_space	endp

do_vertical_space	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	prn_vert_space_1,lpt_number,cs:print_stack5
	cmp	prn_ascii,1
	je	send_1
	@LPRINTCHR	al,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_vert_space_2,lpt_number,cs:print_stack5
	@POP
	retf
send_1:	@LTOA	ax,0,strbuf
	call	do_using
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_vert_space_2,lpt_number,cs:print_stack5
	@POP
	retf
do_vertical_space	endp

do_left_mergin	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@LPRINTSTR	prn_left_mergin_1,lpt_number,cs:print_stack5
	cmp	prn_ascii,1
	je	send_2
	@LPRINTCHR	al,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_left_mergin_2,lpt_number,cs:print_stack5
	@POP
	retf
send_2:	@LTOA	ax,0,strbuf
	call	do_using
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	prn_left_mergin_2,lpt_number,cs:print_stack5
	@POP
	retf
do_left_mergin	endp

do_using	proc	near
	@PUSH
	xor	bx,bx
nxtus:	mov	al,strbuf[bx]
	cmp	al,"0"
	jb	usend
	cmp	al,"9"
	ja	usend
	inc	bx
	cmp	bx,20
	ja	usend
	jmp	nxtus
usend:	mov	strbuf[bx],0
	@POP
	ret
do_using	endp

PCLorEPSON	proc	near
	@PUSH
	mov	bx,ax
	cmp	pcl_prn[bx],0
	je	is_EPSON
	mov	si,offset pcl_commands
	jmp	is_PCL
is_EPSON:
	mov	si,offset epson_commands
is_PCL:	mov	cx,211
	xor	di,di
copynxt:
	mov	al,[si]
	mov	printer_commands[di],al
	inc	si
	inc	di
	loop	copynxt
	@POP
	retf
PCLorEPSON	endp


pcl_mov_Y	proc	near
	@PUSH
	@LPRINTSTR	pcl_mov_vert1,lpt_number,cs:print_stack5
	mov	ax,cs:__Y
	@LTOA	ax,0,strbuf
	call	do_using
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	pcl_mov_vert2,lpt_number,cs:print_stack5
	@POP
	clc
	ret
pcl_mov_Y	endp

pcl_mov_X	proc	near
	@PUSH
	@LPRINTSTR	pcl_mov_horiz1,lpt_number,cs:print_stack5
	mov	ax,cs:__X
	@LTOA	ax,0,strbuf
	call	do_using
	@LPRINTSTR	strbuf,lpt_number,cs:print_stack5
	@LPRINTSTR	pcl_mov_horiz2,lpt_number,cs:print_stack5
	@POP
	ret
pcl_mov_X	endp

testonom	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@STRXOR	tstcpr2,30
	@STRCMP	tstcpr1,tstcpr2
	jc	nidio
	jmp	idio
nidio:	mov	keno[1],5
	mov	keno[2],5
	mov	keno[3],70
	mov	keno[4],6
	@SETWIND	keno
	@SELECTWIND	keno
	@CHANGESEGM	ds,CODE
	@STRXOR	tikans1,22
	@STRXOR	tikans2,23
	@STRXOR	tikans3,25
	@WPRINT	5,2,tikans1
	@WPRINT	5,4,tikans2,@FLASH
	@WPRINT	1,6,tikans3
	@CHANGESEGM	ds,WINDOWS
crash3:	@WPRINT	19,2,tstcpr1
	jmp	crash3
idio:	@STRXOR	tstcpr2,30
	@POP
	ret
tikans1	label	byte
XORDATA	<‚„ˆ€ ‘Ž“ ”ˆŠ„>,22
	db	0
tikans2	label	byte
XORDATA	<T—€ €Œ€€Š„ ’€ ŽŒŽ‹€’€...>,23
	db	0
tikans3	label	byte
XORDATA	<Y.‚.  ‹„GA LoTTo * ’…—’…€‰†‘-€€ƒŽŽ“ŠŽ‘>,25
	db	0
testonom	endp

praktor	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE1
	mov	cx,40
prk1:	mov	al,es:praktname[bx]
	mov	prakt_name[bx],al
	inc	bx
	loop	prk1
	@STRCOPY	prakt_name,prakt_code,15
	@POP
	ret
praktor	endp

praktscr	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	prakt_name,"+"
	jne	prakty
	@POP
	ret
prakty:	@TAKEWIND
	push	ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wprakt
	@SELECTWIND	wprakt
	@CHANGESEGM	ds,DATA
	@STRLEN	prakt_name
	mov	dx,44
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	inc	ax
	@WPRINT al,2,prakt_name
	@CHANGESEGM	ds,WINDOWS
	pop	dx
	@SELECTWI	dl
	@POP
	ret
praktscr	endp

cright	proc	near
	@PUSHAX
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wcright

scrt15:	@WAIT	6000
	jc	scri15
	call	save_screen
	jmp	scrt15
scri15:
	@POPAX
	ret
cright	endp

	assume	ds:data

div100	proc	near
	@PUSH
	mov	cx,10
	mov	bx,0
dvx1:	cmp	strbuf[bx],0
	je	dvx2
	inc	bx
	loop	dvx1
	@POP
	retf
dvx2:	dec	bx
	mov	al,strbuf[bx]
	mov	strbuf[bx+1],al
	dec	bx
	mov	al,strbuf[bx]
	mov	strbuf[bx+1],al
	mov	strbuf[bx],"."
	mov	strbuf[bx+3],0
	@POP
	retf
div100	endp

code	ends
	end
 