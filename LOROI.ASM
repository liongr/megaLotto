
INCLUDE	koina.inc

CODEO	segment	public

	assume	cs:codeo

in_periodo	proc	near
	@PUSH
	mov	ax,offset CODEO:perio_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wperio
	@SELECTWIND	wperio
	mov	si,offset WINDOWS:periom
	call	far ptr strlen
	mov	dx,22
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:perio3
	mov	word ptr buffer1[7],offset CODE1:perio2
	mov	word ptr buffer1[9],offset CODE1:perio1
	mov	buffer1,":"
	mov	word ptr buffer1[1],1
	mov	buffer1[3],13
jana:	@ITOA	strbuf,4,buffer1[11]
	@WINPUTNUMBER	9,4,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[11],ax
	pop	ax
	call	check_extra
	jmp	jana
in_periodo	endp

perio_meta	proc	near
	@PUSH
	cmp	word ptr buffer1[11],2
	jae	perok
	@POP
	stc
	ret
perok:	@POP
	clc
	ret
perio_meta	endp

in_omad_sinexom	proc	near
	@PUSH
	mov	cs:oxx,15
	mov	cs:oyy,16
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:mosin
	mov	word ptr buffer1[5],offset CODE1:osa3
	mov	word ptr buffer1[7],offset CODE1:osa2
	mov	word ptr buffer1[9],offset CODE1:osa1
	mov	buffer1,"C"
	mov	buffer1[3],17
	xor	ax,ax
	mov	al,buffer1[15]
	mov	in_apo,ax
	mov	al,buffer1[16]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_omad_sinexom	endp

in_symet_mz	proc	near
	@PUSH
	mov	cs:oxx,12
	mov	cs:oyy,13
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:msymmz
	mov	word ptr buffer1[5],offset CODE1:symz3
	mov	word ptr buffer1[7],offset CODE1:symz2
	mov	word ptr buffer1[9],offset CODE1:symz1
	mov	buffer1,"R"
	mov	buffer1[3],14
	xor	ax,ax
	mov	al,buffer1[12]
	mov	in_apo,ax
	mov	al,buffer1[13]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_symet_mz	endp

in_synex_enal	proc	near
	@PUSH
	mov	cs:oxx,11
	mov	cs:oyy,12
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:msenal
	mov	word ptr buffer1[5],offset CODE1:syen3
	mov	word ptr buffer1[7],offset CODE1:syen2
	mov	word ptr buffer1[9],offset CODE1:syen1
	mov	buffer1,"U"
	mov	buffer1[3],13
	xor	ax,ax
	mov	al,buffer1[11]
	mov	in_apo,ax
	mov	al,buffer1[12]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_synex_enal	endp

in_evros	proc	near
	@PUSH
	mov	cs:oxx,11
	mov	cs:oyy,12
	mov	ax,offset CODEO:oevros
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,2
	mov	word ptr buffer1[5],offset CODE1:eyr3
	mov	word ptr buffer1[7],offset CODE1:eyr2
	mov	word ptr buffer1[9],offset CODE1:eyr1
	mov	buffer1,"V"
	mov	buffer1[3],13
	mov	si,offset WINDOWS:mevros
	xor	ax,ax
	mov	al,buffer1[11]
	mov	in_apo,ax
	mov	al,buffer1[12]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_evros	endp

in_baros_lhg	proc	near
	@PUSH
	mov	cs:oxx,13
	mov	cs:oyy,14
	mov	ax,offset CODEO:olhgon
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,2
	mov	si,offset WINDOWS:mblig
	mov	word ptr buffer1[5],offset CODE1:blh3
	mov	word ptr buffer1[7],offset CODE1:blh2
	mov	word ptr buffer1[9],offset CODE1:blh1
	mov	buffer1,"K"
	mov	buffer1[3],15
	xor	ax,ax
	mov	al,buffer1[13]
	mov	in_apo,ax
	mov	al,buffer1[14]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_baros_lhg	endp

in_lhg_sinex	proc	near
	@PUSH
	mov	cs:oxx,15
	mov	cs:oyy,16
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:mlisix
	mov	word ptr buffer1[5],offset CODE1:syl3
	mov	word ptr buffer1[7],offset CODE1:syl2
	mov	word ptr buffer1[9],offset CODE1:syl1
	mov	buffer1,"H"
	mov	buffer1[3],17
	xor	ax,ax
	mov	al,buffer1[15]
	mov	in_apo,ax
	mov	al,buffer1[16]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_lhg_sinex	endp

in_omad_sin_lhg	proc	near
	@PUSH
	mov	cs:oxx,15
	mov	cs:oyy,16
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:momlig
	mov	word ptr buffer1[5],offset CODE1:osl3
	mov	word ptr buffer1[7],offset CODE1:osl2
	mov	word ptr buffer1[9],offset CODE1:osl1
	mov	buffer1,"G"
	mov	buffer1[3],17
	xor	ax,ax
	mov	al,buffer1[15]
	mov	in_apo,ax
	mov	al,buffer1[16]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_omad_sin_lhg	endp

in_enalag	proc	near
	@PUSH
	mov	cs:oxx,13
	mov	cs:oyy,14
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:menal
	mov	word ptr buffer1[5],offset CODE1:enal3
	mov	word ptr buffer1[7],offset CODE1:enal2
	mov	word ptr buffer1[9],offset CODE1:enal1
	mov	buffer1,"E"
	mov	buffer1[3],15
	xor	ax,ax
	mov	al,buffer1[13]
	mov	in_apo,ax
	mov	al,buffer1[14]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_enalag	endp

in_ad_enal	proc	near
	@PUSH
	mov	cs:oxx,13
	mov	cs:oyy,14
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:menalad
	mov	word ptr buffer1[5],offset CODE1:enalad3
	mov	word ptr buffer1[7],offset CODE1:enalad2
	mov	word ptr buffer1[9],offset CODE1:enalad1
	mov	buffer1,"~"
	mov	buffer1[3],15
	xor	ax,ax
	mov	al,buffer1[13]
	mov	in_apo,ax
	mov	al,buffer1[14]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_ad_enal	endp

in_ajones	proc	near
	@PUSH
	mov	cs:oxx,13
	mov	cs:oyy,14
	mov	ax,offset CODEO:oxxyy
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,1
	mov	si,offset WINDOWS:majon
	mov	word ptr buffer1[5],offset CODE1:ajv3
	mov	word ptr buffer1[7],offset CODE1:ajv2
	mov	word ptr buffer1[9],offset CODE1:ajv1
	mov	buffer1,"A"
	mov	buffer1[3],15
	xor	ax,ax
	mov	al,buffer1[13]
	mov	in_apo,ax
	mov	al,buffer1[14]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_ajones	endp

in_baros	proc	near
	@PUSH
	mov	ax,offset CODEO:obaros
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cs:in_123,3
	mov	si,offset WINDOWS:mbaros
	mov	word ptr buffer1[5],offset CODE1:bar3
	mov	word ptr buffer1[7],offset CODE1:bar2
	mov	word ptr buffer1[9],offset CODE1:bar1
	mov	buffer1,"D"
	mov	buffer1[3],17
	mov	ax,word ptr buffer1[13]
	mov	in_apo,ax
	mov	ax,word ptr buffer1[15]
	mov	in_evs,ax
	mov	ax,word ptr buffer1[1]
	mov	in_omada,ax
	call	in_apoevs
in_baros	endp

obaros	proc	near
	@PUSH
	cmp	in_apo,21
	ja	qw00
	cmp	in_evs,279
	jb	qw00
	@POP
	stc
	ret
qw00:	mov	ax,in_apo
	mov	word ptr buffer1[13],ax
	mov	ax,in_evs
	mov	word ptr buffer1[15],ax
	mov	ax,in_omada
	mov	word ptr buffer1[1],ax
	@POP
	clc
	ret
obaros	endp

oevros	proc	near
	@PUSH
	cmp	in_apo,5
	ja	qw01e
	cmp	in_evs,48
	jb	qw01e
	@POP
	stc
	ret
qw01e:	mov	ax,in_apo
	mov	bx,cs:oxx
	mov	buffer1[bx],al
	mov	ax,in_evs
	mov	bx,cs:oyy
	mov	buffer1[bx],al
	mov	ax,in_omada
	mov	word ptr buffer1[1],ax
	@POP
	clc
	ret
oevros	endp

olhgon	proc	near
	@PUSH
	cmp	in_apo,2
	ja	qw01l
	cmp	in_evs,53
	jb	qw01l
	@POP
	stc
	ret
qw01l:	mov	ax,in_apo
	mov	bx,cs:oxx
	mov	buffer1[bx],al
	mov	ax,in_evs
	mov	bx,cs:oyy
	mov	buffer1[bx],al
	mov	ax,in_omada
	mov	word ptr buffer1[1],ax
	@POP
	clc
	ret
olhgon	endp

oxxyy	proc	near
	@PUSH
	cmp	in_apo,0
	ja	qw01
	cmp	in_evs,6
	jb	qw01
	@POP
	stc
	ret
qw01:	mov	ax,in_apo
	mov	bx,cs:oxx
	mov	buffer1[bx],al
	mov	ax,in_evs
	mov	bx,cs:oyy
	mov	buffer1[bx],al
	mov	ax,in_omada
	mov	word ptr buffer1[1],ax
	@POP
	clc
	ret
oxxyy	endp

in_apoevs	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wapoevs
	@SELECTWIND	wapoevs
	call	far ptr strlen
	mov	dx,36
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	cs:c_xx,0
	cmp	cs:in_123,2
	jae	oktar
	inc	cs:c_xx
oktar:	call	pr_apoevs
	@ITOA	strbuf,cs:in_123,in_apo
	mov	ax,11
	add	ax,cs:c_xx
	@WINPUTNUMBER	al,3,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	in_apo,ax
	pop	ax
	call	check_extra
	jc	oria0
	cmp	cs:isenter,0
	je	oktar
nort:	@ITOA	strbuf,cs:in_123,in_evs
	mov	ax,27
	add	ax,cs:c_xx
	@WINPUTNUMBER	al,3,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	in_evs,ax
	pop	ax
	call	check_extra
	jc	oria0
	cmp	cs:isenter,0
	je	nort
	jmp	oktar
oria0:	@ITOA	strbuf,3,in_omada
	@WINPUTNUMBER	12,6,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	in_omada,ax
	pop	ax
	call	check_extra
	jmp	oktar
c_xx	dw	0
in_123	dw	0
in_apoevs	endp

pr_apoevs	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	in_omada,0
	jne	prae3
	mov	in_omada,1
	cmp	cs:in_123,3
	je	prp12
	cmp	cs:in_123,2
	jne	prp29
	cmp	buffer1,"K"
	jne	prp28	
	mov	in_apo,2
	mov	in_evs,53
	jmp	prae3
prp28:	mov	in_apo,5
	mov	in_evs,48
	jmp	prae3
prp29:	mov	in_apo,0
	mov	in_evs,6
	jmp	prae3
prp12:	mov	in_apo,21
	mov	in_evs,279
prae3:	@ITOA	strbuf,cs:in_123,in_apo
	mov	ax,11
	add	ax,cs:c_xx
	@WPRINT	al,3,strbuf
	@ITOA	strbuf,cs:in_123,in_evs
	mov	ax,27
	add	ax,cs:c_xx
	@WPRINT	al,3,strbuf
	@ITOA	strbuf,3,in_omada
	@WPRINT	12,6,strbuf
	@POP
	ret
pr_apoevs	endp

;************************************************************************

in_diasthmata	proc	near
	@PUSH
	mov	ax,offset CODEO:dias_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wdiast
	@SELECTWIND	wdiast
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1 [5],offset CODE1:dias3
	mov	word ptr buffer1 [7],offset CODE1:dias2
	mov	word ptr buffer1 [9],offset CODE1:dias1
	mov	buffer1,"B"
	mov	buffer1[3],25
	call	prdiast
disarx:	mov	cx,6
	mov	bx,13
	mov	cs:c_yy,5
prdis2:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	11,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prdiast
	pop	ax
	call	check_extra
	jnc	ord001
	call	oriadias
	jmp	prdis2
ord001:	cmp	cs:isenter,1
	je	prd01
	cmp	ah,@LEFT_ARROW
	jne	prdis2
	cmp	cs:c_yy,5
	je	prd01
	sub	bx,2
	dec	cs:c_yy
	dec	cs:c_yy
	inc	cx
prd01:	inc	bx
prdis3:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	18,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prdiast
	pop	ax
	call	check_extra
	jnc	ord002
	call	oriadias
	jmp	prdis3
ord002:	cmp	cs:isenter,1
	je	prd03
	cmp	ah,@LEFT_ARROW
	jne	prdis3
	dec	bx
	jmp	prdis2
prd03:	inc	bx
	inc	cs:c_yy
	inc	cs:c_yy
	loop	prds21
	jmp	disarx
	jmp	prdis2
prds21: jmp	prdis2
in_diasthmata	endp

oriadias	proc	near
	@PUSH
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,17,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	@POP
	ret
oriadias	endp

prdiast	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	bx,13
	mov	ax,5
prdis1:	cmp	byte ptr buffer1[bx],0
	jne	prd12
	mov	byte ptr buffer1[bx],1
prd12:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	11,al,strbuf
	inc	bx
	cmp	byte ptr buffer1[bx],0
	jne	prd13
	mov	byte ptr buffer1[bx],49
prd13:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	18,al,strbuf
	inc	bx
	inc	ax
	inc	ax
	loop	prdis1
	cmp	word ptr buffer1[1],0
	jne	prd14
	mov	word ptr buffer1[1],1
prd14:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,17,strbuf
	@POP
	ret
prdiast	endp

dias_meta	proc	near
	@PUSH
	mov	cx,6
	mov	bx,13
qw09:	cmp	byte ptr buffer1[bx],1
	ja	qw08
	inc	bx
	cmp	byte ptr buffer1[bx],49
	jb	qw08
	inc	bx
	loop	qw09
	@POP
	stc
	ret
qw08:	@POP
	clc
	ret
dias_meta	endp

;************************************************************************

in_apol_apost	proc	near
	@PUSH
	mov	ax,offset CODEO:apol_ap_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wapolap
	@SELECTWIND	wapolap
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:aap3
	mov	word ptr buffer1[7],offset CODE1:aap2
	mov	word ptr buffer1[9],offset CODE1:aap1
	mov	buffer1,"Y"
	mov	buffer1[3],43
	call	prapolap
aaarxi:	mov	cx,15
	mov	cs:c_yy,4
	mov	bx,13
prap3:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	17,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prapolap
	pop	ax
	call	check_extra
	jnc	pror1
	call	oria_aa
	jmp	prap3
pror1:	cmp	cs:isenter,1
	je	prap11
	cmp	ah,@LEFT_ARROW
	jne	prap3
	cmp	cs:c_yy,4
	je	prap11
	inc	cx
	dec	cs:c_yy
	sub	bx,2
prap11:	inc	bx
prap4:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	25,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prapolap
	pop	ax
	call	check_extra
	jnc	pror2
	call	oria_aa
	jmp	prap4
pror2:	cmp	cs:isenter,1
	je	prap12
	cmp	ah,@LEFT_ARROW
	jne	prap4
	dec	bx
	jmp	prap3
prap12:	inc	bx
	inc	cs:c_yy
	loop	prap31
	jmp	aaarxi
prap31:	jmp	prap3
c_yy	db	0
in_apol_apost	endp

oria_aa	proc	near
	@PUSH
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	11,20,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	@POP
	ret
oria_aa	endp

prapolap proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,15
	mov	ax,4
	mov	bx,13
prap1:	cmp	byte ptr buffer1[bx],0
	jne	prap6
	mov	byte ptr buffer1[bx],1
prap6:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	17,al,strbuf
	inc	bx
	cmp	byte ptr buffer1[bx],0
	jne	prap51
	mov	byte ptr buffer1[bx],49
prap51:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	25,al,strbuf
	inc	bx
	inc	ax
	loop	prap1
	cmp	word ptr buffer1[1],0
	jne	prap5
	mov	word ptr buffer1[1],1
prap5:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	11,20,strbuf
	@POP
	ret
prapolap endp

apol_ap_meta	proc	near
	@PUSH
	mov	cx,15
	mov	bx,13
qw10:	cmp	byte ptr buffer1[bx],1
	ja	qw11
	inc	bx
	cmp	byte ptr buffer1[bx],49
	jb	qw11
	inc	bx
	loop	qw10
	@POP
	stc
	ret
qw11:	@POP
	clc
	ret
apol_ap_meta	endp

;************************************************************************

in_taj_apost	proc	near
	@PUSH
	mov	ax,offset CODEO:taj_ap_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wtajiap
	@SELECTWIND	wtajiap
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:tapo3
	mov	word ptr buffer1[7],offset CODE1:tapo2
	mov	word ptr buffer1[9],offset CODE1:tapo1
	mov	buffer1,"O"
	mov	buffer1[3],26
	call	prtajap
tarxi:	mov	cx,5
	mov	cs:c_yy,5
	mov	bx,16
prt013:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	15,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prtajap
	pop	ax
	call	check_extra
	jnc	taor1
	call	in_tapo
	call	prtajap
	jmp	prt013
taor1:	cmp	cs:isenter,1
	je	prt012
	cmp	ah,@LEFT_ARROW
	jne	prt013
	cmp	cs:c_yy,5
	je	prt012
	dec	cs:c_yy
	sub	bx,2
	inc	cx
prt012:	inc	bx
prt112:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	21,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prtajap
	pop	ax
	call	check_extra
	jnc	taor2
	call	in_tapo
	call	prtajap
	jmp	prt112
taor2:	cmp	cs:isenter,1
	je	prt014
	cmp	ah,@LEFT_ARROW
	jne	prt112
	dec	bx
	jmp	prt013
prt014:	inc	cs:c_yy
	inc	bx
	loop	prt131
	jmp	tarxi
prt131:	jmp	prt013
in_taj_apost	endp

in_tapo	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,11,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	@POP
	ret
in_tapo	endp

prtajap	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,5
	mov	ax,5
	mov	bx,16
prt03:	cmp	byte ptr buffer1[bx],0
	jne	prt01
	mov	byte ptr buffer1[bx],1
prt01:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	15,al,strbuf
	inc	bx
	cmp	byte ptr buffer1[bx],0
	jne	prt02
	mov	byte ptr buffer1[bx],49
prt02:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	21,al,strbuf
	inc	al
	inc	bx
	loop	prt03
	cmp	word ptr buffer1[1],0
	jne	prt4
	mov	word ptr buffer1[1],1
prt4:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,11,strbuf
	@POP
	ret
prtajap	endp

taj_ap_meta	proc	near
	@PUSH
	mov	cx,5
	mov	bx,16
qw12:	cmp	byte ptr buffer1[bx],1
	ja	qw13
	inc	bx
	cmp	byte ptr buffer1[bx],49
	jb	qw13
	inc	bx
	loop	qw12
	@POP
	stc
	ret
qw13:	@POP
	clc
	ret
taj_ap_meta	endp

;************************************************************************

in_kena	proc	near
	@PUSH
	mov	ax,offset CODEO:kena_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wkena
	@SELECTWIND	wkena
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	call	prkena
	mov	word ptr buffer1[5],offset CODE1:kena3
	mov	word ptr buffer1[7],offset CODE1:kena2
	mov	word ptr buffer1[9],offset CODE1:kena1
	mov	buffer1,"I"
	mov	buffer1[3],16
kenarx:	dec	buffer1[13]
	@ITOAB	strbuf,1,buffer1[13]
	@WINPUTNUMBER	17,2,strbuf,plright
	push	ax
	@ATOI	strbuf
	inc	ax
	mov	buffer1[13],al
	pop	ax
	call	check_extra
	jnc	ken031
	jmp	orken
ken031:	cmp	cs:isenter,1
	je	ken03
	cmp	ah,@LEFT_ARROW
	je	kenarx
ken03:	@ITOAB	strbuf,1,buffer1[14]
	@WINPUTNUMBER	10,5,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[14],al
	pop	ax
	call	check_extra
	jc	orken
	cmp	cs:isenter,1
	je	ken01
	cmp	ah,@LEFT_ARROW
	jne	ken03
	jmp	kenarx
ken01:	@ITOAB	strbuf,1,buffer1[15]
	@WINPUTNUMBER	24,5,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[15],al
	pop	ax
	call	check_extra
	jc	orken
	cmp	cs:isenter,1
	je	ken02
	cmp	ah,@LEFT_ARROW
	jne	ken01
	jmp	ken03
ken02:	jmp	kenarx

orken:	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	kenarx
in_kena	endp

prkena	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	buffer1[13],0
	jne	no130
	mov	buffer1[13],2
	mov	word ptr buffer1[1],1
	mov	buffer1[14],0
	mov	buffer1[15],6
no130:	dec	buffer1[13]
	@ITOAB	strbuf,1,buffer1[13]
	@WPRINT	17,2,strbuf
	inc	buffer1[13]
	@ITOAB	strbuf,1,buffer1[14]
	@WPRINT	10,5,strbuf
	@ITOAB	strbuf,1,buffer1[15]
	@WPRINT	24,5,strbuf
	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,7,strbuf
	@POP
	ret
prkena	endp

kena_meta	proc	near
	@PUSH
	cmp	buffer1[14],0
	ja	qw14
	cmp	buffer1[15],6
	jb	qw14
	@POP
	stc
	ret
qw14:	@POP
	clc
	ret
kena_meta	endp

;************************************************************************

in_mona_uesi	proc	near
	@PUSH
	mov	ax,offset CODEO:monau_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wuesis
	@SELECTWIND	wuesis
	mov	si,offset WINDOWS:monazi
	call	far ptr strlen
	mov	dx,44
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:mzu3
	mov	word ptr buffer1[7],offset CODE1:mzu2
	mov	word ptr buffer1[9],offset CODE1:mzu1
	mov	buffer1,"M"
	mov	buffer1[3],19
	call	printmzu
	mov	cursx,7
	mov	cursy,5
mzust:	call	cars7
	call	check_extra
	jnc	mznoo
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	mzust
mznoo:	cmp	ah,@RIGHT_ARROW
	jne	mzur
	cmp	cursx,35
	ja	mzur
	add	cursx,6
	jmp	mzust
mzur:	cmp	ah,@LEFT_ARROW
	jne	mzuli
	cmp	cursx,10
	jb	mzuli
	sub	cursx,6
	jmp	mzust
mzuli:	cmp	al,"M"
	jne	mzumi
	mov	bl,1
	jmp	mzum1	
mzumi:	cmp	al,"Z"
	jne	mzuzi
	mov	bl,2
	jmp	mzum1
mzuzi:	cmp	al," "
	jne	mzuke
	mov	bl,0
mzum1:	xor	ax,ax
	xor	dx,dx
	mov	al,cursx
	sub	ax,7
	mov	cx,6
	div	cx
	mov	si,ax
	add	si,11
	mov	buffer1[si],bl
	mov	cl," "
	cmp	bl,0
	je	mzu0
	mov	cl,"M"
	cmp	bl,1
	je	mzu0
	mov	cl,"Z"
mzu0:	@WPRINTCH	cursx,cursy,cl
mzuke:	jmp	mzust
in_mona_uesi	endp

printmzu	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
mzuus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	je	mzuue
	mov	bl,"Z"
	cmp	al,2
	je	mzuzz
	mov	bl,"M"
mzuzz:	mov	ax,si
	sub	ax,11
	mov	cx,6
	mul	cx
	add	ax,7
	@WPRINTCH	al,5,bl
mzuue:	pop	cx
	inc	si
	loop	mzuus
	cmp	word ptr buffer1[1],0
	jne	mzuu0
	mov	word ptr buffer1[1],1
mzuu0:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,7,strbuf
	@POP
	ret
printmzu	endp

monau_meta	proc	near
	@PUSH
	mov	cx,6
	mov	si,11
qw15:	mov	al,buffer1[si]
	cmp	al,0
	jne	qw16
	inc	si
	loop	qw15
	@POP
	stc
	ret
qw16:	@POP
	clc
	ret
monau_meta	endp

;************************************************************************

in_ad_uesi	proc	near
	@PUSH
	mov	ax,offset CODEO:adu_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wuesis
	@SELECTWIND	wuesis
	mov	si,offset WINDOWS:aredej
	call	far ptr strlen
	mov	dx,44
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:adu3
	mov	word ptr buffer1[7],offset CODE1:adu2
	mov	word ptr buffer1[9],offset CODE1:adu1
	mov	buffer1,"|"
	mov	buffer1[3],19
	call	printadu
	mov	cursx,7
	mov	cursy,5
adust:	call	cars7
	call	check_extra
	jnc	adnoo
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	adust
adnoo:	cmp	ah,@RIGHT_ARROW
	jne	adur
	cmp	cursx,35
	ja	adur
	add	cursx,6
	jmp	adust
adur:	cmp	ah,@LEFT_ARROW
	jne	aduli
	cmp	cursx,10
	jb	aduli
	sub	cursx,6
	jmp	adust
aduli:	cmp	al,"A"
	jne	adumi
	mov	bl,1
	jmp	adum1	
adumi:	cmp	al,"D"
	jne	aduzi
	mov	bl,2
	jmp	adum1
aduzi:	cmp	al," "
	jne	aduke
	mov	bl,0
adum1:	xor	ax,ax
	xor	dx,dx
	mov	al,cursx
	sub	ax,7
	mov	cx,6
	div	cx
	mov	si,ax
	add	si,11
	mov	buffer1[si],bl
	mov	cl," "
	cmp	bl,0
	je	adu0
	mov	cl,"A"
	cmp	bl,1
	je	adu0
	mov	cl,"ƒ"
adu0:	@WPRINTCH	cursx,cursy,cl
aduke:	jmp	adust
in_ad_uesi	endp

printadu	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
aduus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	je	aduue
	mov	bl,"ƒ"
	cmp	al,2
	je	aduzz
	mov	bl,"A"
aduzz:	mov	ax,si
	sub	ax,11
	mov	cx,6
	mul	cx
	add	ax,7
	@WPRINTCH	al,5,bl
aduue:	pop	cx
	inc	si
	loop	aduus
	cmp	word ptr buffer1[1],0
	jne	aduu0
	mov	word ptr buffer1[1],1
aduu0:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,7,strbuf
	@POP
	ret
printadu	endp

adu_meta	proc	near
	@PUSH
	mov	cx,6
	mov	si,11
adqw15:	mov	al,buffer1[si]
	cmp	al,0
	jne	adqw16
	inc	si
	loop	adqw15
	@POP
	stc
	ret
adqw16:	@POP
	clc
	ret
adu_meta	endp

;************************************************************************

in_me_uesi	proc	near
	@PUSH
	mov	ax,offset CODEO:meu_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wuesis
	@SELECTWIND	wuesis
	mov	si,offset WINDOWS:mesaej
	call	far ptr strlen
	mov	dx,44
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:meu3
	mov	word ptr buffer1[7],offset CODE1:meu2
	mov	word ptr buffer1[9],offset CODE1:meu1
	mov	buffer1,"_"
	mov	buffer1[3],19
	call	printmeu
	mov	cursx,7
	mov	cursy,5
meust:	call	cars7
	call	check_extra
	jnc	menoo
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	meust
menoo:	cmp	ah,@RIGHT_ARROW
	jne	meur
	cmp	cursx,35
	ja	meur
	add	cursx,6
	jmp	meust
meur:	cmp	ah,@LEFT_ARROW
	jne	meuli
	cmp	cursx,10
	jb	meuli
	sub	cursx,6
	jmp	meust
meuli:	cmp	al,"E"
	jne	meumi
	mov	bl,1
	jmp	meum1
meumi:	cmp	al,"M"
	jne	meuzi
	mov	bl,2
	jmp	meum1
meuzi:	cmp	al," "
	jne	meuke
	mov	bl,0
meum1:	xor	ax,ax
	xor	dx,dx
	mov	al,cursx
	sub	ax,7
	mov	cx,6
	div	cx
	mov	si,ax
	add	si,11
	mov	buffer1[si],bl
	mov	cl," "
	cmp	bl,0
	je	meu0
	mov	cl,"E"
	cmp	bl,1
	je	meu0
	mov	cl,"M"
meu0:	@WPRINTCH	cursx,cursy,cl
meuke:	jmp	meust
in_me_uesi	endp

printmeu	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
meuus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	je	meuue
	mov	bl,"M"
	cmp	al,2
	je	meuzz
	mov	bl,"E"
meuzz:	mov	ax,si
	sub	ax,11
	mov	cx,6
	mul	cx
	add	ax,7
	@WPRINTCH	al,5,bl
meuue:	pop	cx
	inc	si
	loop	meuus
	cmp	word ptr buffer1[1],0
	jne	meuu0
	mov	word ptr buffer1[1],1
meuu0:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,7,strbuf
	@POP
	ret
printmeu	endp

meu_meta	proc	near
	@PUSH
	mov	cx,6
	mov	si,11
meqw15:	mov	al,buffer1[si]
	cmp	al,0
	jne	meqw16
	inc	si
	loop	meqw15
	@POP
	stc
	ret
meqw16:	@POP
	clc
	ret
meu_meta	endp

;**************************************************************************

in_bar6		proc	near
	@PUSH
	mov	ax,offset CODEO:bar6_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wbar6
	@SELECTWIND	wbar6
	mov	si,offset WINDOWS:bar6
	call	far ptr strlen
	mov	dx,36
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:bar63
	mov	word ptr buffer1[7],offset CODE1:bar62
	mov	word ptr buffer1[9],offset CODE1:bar61
	mov	buffer1,">"
	mov	buffer1[3],17
	call	printbar6
biela9:	mov	cx,3
	mov	di,11
	mov	bl,4
biela1:	@ITOAB	strbuf,2,buffer1[di]
	@WINPUTNUMBER	18,bl,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[di],al
	call	printbar6
	pop	ax
	call	check_extra
	jnc	biela2
	call	omadbar6
	jmp	biela1
biela2:	cmp	cs:isenter,1
	je	biel1
	jmp	biela1
biel1:	@ITOAB	strbuf,2,buffer1[di+1]
	@WINPUTNUMBER	25,bl,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[di+1],al
	call	printbar6
	pop	ax
	call	check_extra
	jnc	biela3
	call	omadbar6
	jmp	biela1
biela3:	cmp	cs:isenter,1
	je	biel2
	jmp	biel1
biel2:	inc	di
	inc	di
	inc	bl
	inc	bl
	loop	biela11
	jmp	biela9
biela11:
	jmp	biela1
in_bar6		endp

omadbar6	proc	near
	@PUSH
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,10,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	@POP
	ret
omadbar6	endp

printbar6	proc	near
	@PUSH
	cmp	word ptr buffer1[1],0
	jne	bar6old
	mov	word ptr buffer1[1],1
	mov	byte ptr buffer1[11],7
	mov	byte ptr buffer1[12],93
	mov	byte ptr buffer1[13],7
	mov	byte ptr buffer1[14],93
	mov	byte ptr buffer1[15],7
	mov	byte ptr buffer1[16],93
bar6old:
	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,10,strbuf
	mov	cx,3
	mov	di,11
	mov	bl,4
biela:	@ITOAB	strbuf,2,buffer1[di]
	@WPRINT	18,bl,strbuf
	@ITOAB	strbuf,2,buffer1[di+1]
	@WPRINT	25,bl,strbuf
	inc	di
	inc	di
	inc	bl
	inc	bl
	loop	biela
	@POP
	ret
printbar6	endp

bar6_meta	proc	near
	@PUSH
	mov	cx,3
	mov	si,11
biela7:	cmp	buffer1[si],7
	jne	bar6ok
	cmp	buffer1[si+1],93
	jne	bar6ok
	inc	si
	inc	si
	loop	biela7
	@POP
	stc
	ret
bar6ok:	@POP
	clc
	ret
bar6_meta	endp

;**************************************************************************

in_barues	proc	near
	@PUSH
	mov	ax,offset CODEO:barues_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wbarues
	@SELECTWIND	wbarues
	mov	si,offset WINDOWS:barues
	call	far ptr strlen
	mov	dx,44
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:barues3
	mov	word ptr buffer1[7],offset CODE1:barues2
	mov	word ptr buffer1[9],offset CODE1:barues1
	mov	buffer1,"<"
	mov	buffer1[3],21
	call	printbarues
	mov	cursx,7
	mov	cursy,5
bmzust:	call	cars7
	call	check_extra
	jc	baru12
	jmp	baruno
baru12:	@ITOA	strbuf,3,buffer1[17]
	@WINPUTNUMBER	18,8,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[17],ax
	pop	ax
	call	check_extra
	@ITOA	strbuf,3,buffer1[19]
	@WINPUTNUMBER	30,8,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[19],ax
	pop	ax
	call	check_extra
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,10,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	bmzust
baruno:	cmp	ah,@RIGHT_ARROW
	jne	bmzur
	cmp	cursx,35
	ja	bmzur
	add	cursx,6
	jmp	bmzust
bmzur:	cmp	ah,@LEFT_ARROW
	jne	bmzuli
	cmp	cursx,10
	jb	bmzuli
	sub	cursx,6
	jmp	bmzust
bmzuli:	cmp	al,13
	je	bmzum1
bmzumi:	cmp	al," "
	je	bmzum1
	jmp	bmzuke
bmzum1:	xor	ax,ax
	xor	dx,dx
	mov	al,cursx
	sub	ax,7
	mov	cx,6
	div	cx
	mov	si,ax
	add	si,11
	mov	bl,buffer1[si]
	not	bl
	and	bl,1
	mov	buffer1[si],bl
	mov	cl," "
	cmp	bl,0
	je	bmzu0
	mov	cl,"X"
bmzu0:	@WPRINTCH	cursx,cursy,cl
bmzuke:	jmp	bmzust
in_barues	endp

printbarues	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,6
	mov	si,11
bmzuus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	je	bmzuue
	mov	bl,"X"
bmzuzz:	mov	ax,si
	sub	ax,11
	mov	cx,6
	mul	cx
	add	ax,7
	@WPRINTCH	al,5,bl
bmzuue:	pop	cx
	inc	si
	loop	bmzuus
	cmp	word ptr buffer1[1],0
	jne	bmzuu0
	mov	word ptr buffer1[1],1
	mov	word ptr buffer1[17],1
	mov	word ptr buffer1[19],279
bmzuu0:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,10,strbuf
	@ITOA	strbuf,3,buffer1[17]
	@WPRINT	18,8,strbuf
	@ITOA	strbuf,3,buffer1[19]
	@WPRINT	30,8,strbuf
	@POP
	ret
printbarues	endp

barues_meta	proc	near
	@PUSH
	mov	cx,6
	mov	si,11
bqw15:	mov	al,buffer1[si]
	cmp	al,0
	jne	bqw16
	inc	si
	loop	bqw15
	@POP
	stc
	ret
bqw16:	cmp	word ptr buffer1[17],1
	ja	bqw17
	cmp	word ptr buffer1[19],279
	jb	bqw17
	@POP
	stc
	ret
bqw17:	@POP
	clc
	ret
barues_meta	endp

;************************************************************************

in_parast_mona	proc	near
	@PUSH
	mov	ax,offset CODEO:parmeta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wuesis
	@SELECTWIND	wuesis
	mov	si,offset WINDOWS:mparmon
	call	far ptr strlen
	mov	dx,44
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:par3
	mov	word ptr buffer1[7],offset CODE1:par2
	mov	word ptr buffer1[9],offset CODE1:par1
	mov	buffer1,"N"
	mov	buffer1[3],16
	call	parprin
	call	printpm
	mov	cursx,7
	mov	cursy,5
pmst:	call	cars7
	call	check_extra
	jnc	pmnoo
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	pmst
pmnoo:	cmp	ah,@RIGHT_ARROW
	jne	pmr
	cmp	cursx,35
	ja	pmr
	add	cursx,6
	jmp	pmst
pmr:	cmp	ah,@LEFT_ARROW
	jne	pmli
	cmp	cursx,10
	jb	pmli
	sub	cursx,6
	jmp	pmst
pmli:	cmp	al,"M"
	jne	pmmi
	mov	bl,1
	jmp	pmm1	
pmmi:	cmp	al,"Z"
	jne	pmzi
	mov	bl,2
	jmp	pmm1
pmzi:	cmp	al," "
	jne	pmke
	mov	bl,0
pmm1:	xor	ax,ax
	xor	dx,dx
	mov	al,cursx
	sub	ax,7
	mov	cx,6
	div	cx
	mov	si,ax
	add	si,11
	cmp	bl,0
	je	pmm51
	cmp	buffer1[si-1],0
	je	pmke
	jmp	pmm52
pmm51:	cmp	buffer1[si+1],0
	jne	pmke
pmm52:	mov	buffer1[si],bl
	mov	cl," "
	cmp	bl,0
	je	pm0
	mov	cl,"M"
	cmp	bl,1
	je	pm0
	mov	cl,"Z"
pm0:	@WPRINTCH	cursx,cursy,cl
pmke:	jmp	pmst
in_parast_mona	endp

parmeta	proc	near
	@PUSH
	@STRCOPY	buffer1,buffer2,100
	@ZEROBBUF	buffer1[11],10
	mov	cx,6
	mov	si,16
	xor	ax,ax
	xor	dx,dx
	xor	bx,bx
pare2:	mov	dl,buffer2[si]
	cmp	dl,0
	je	pare1
	ror	dl,1
	rcr	al,1
	clc
	inc	bx
pare1:	dec	si
	loop	pare2
	cmp	bx,0
	jne	qw02
	@POP
	stc
	ret
qw02:	mov	buffer1[15],al
	mov	buffer1[13],bl
	xor	ax,ax
	mov	cx,bx
pare3:	stc
	rcr	al,1
	loop	pare3
	mov	buffer1[14],al
	@POP
	clc
	ret
parmeta	endp

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
	@CHANGESEGM	ds,DATA
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
pmzz:	mov	ax,si
	sub	ax,11
	mov	cx,6
	mul	cx
	add	ax,7
	@WPRINTCH	al,5,bl
pmue:	pop	cx
	inc	si
	loop	pmus
	cmp	buffer1[1],0
	jne	pmu0
	mov	buffer1[1],1
pmu0:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,7,strbuf
	@POP
	ret
printpm	endp

;************************************************************************

in_taytar	proc	near
	@PUSH
	mov	ax,offset CODEO:taytar_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wtaytar
	@SELECTWIND	wtaytar
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:tay3
	mov	word ptr buffer1[7],offset CODE1:tay2
	mov	word ptr buffer1[9],offset CODE1:tay1
	mov	buffer1,"Q"
	mov	buffer1[3],56
	call	prtayt
taarxi:	mov	cx,9
	mov	cs:c_yy,5
	mov	bx,38
tay10:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	12,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prtayt
	pop	ax
	call	check_extra
	jnc	ta001
	call	tayt_or
	jmp	tay10
ta001:	cmp	cs:isenter,1
	je	tay11
	cmp	ah,@LEFT_ARROW
	jne	tay10
	cmp	cs:c_yy,5
	je	tay11
	inc	cx
	dec	cs:c_yy
	sub	bx,2
tay11:	inc	bx
tay111:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	18,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	prtayt
	pop	ax
	call	check_extra
	jnc	ta002
	call	tayt_or
	jmp	tay111
ta002:	cmp	cs:isenter,1
	je	tay13
	cmp	ah,@LEFT_ARROW
	jne	tay111
	dec	bx
	jmp	tay10
tay13:	inc	bx
	inc	cs:c_yy
	loop	tay101
	jmp	taarxi
tay101:	jmp	tay10
in_taytar	endp

tayt_or	proc	near
	@PUSH
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,15,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	@POP
	ret
tayt_or	endp

prtayt	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	word ptr buffer1[1],0
	jne	tay001
	mov	word ptr buffer1[1],1
	mov	cx,9
	mov	bx,38
tiay0:	mov	buffer1[bx],0
	inc	bx
	mov	buffer1[bx],6
	inc	bx
	loop	tiay0
tay001:	mov	cx,9
	mov	ax,5
	mov	bx,38
tay0:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	12,al,strbuf
	inc	bx
	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	18,al,strbuf
	inc	bx
	inc	ax
	loop	tay0
	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,15,strbuf
	@POP
	ret
prtayt	endp

taytar_meta	proc	near
	@PUSH
	mov	cx,9
	mov	bx,38
qw161:	cmp	buffer1[bx],0
	ja	qw17
	inc	bx
	cmp	buffer1[bx],6
	jb	qw17
	inc	bx
	loop	qw161
	@POP
	stc
	ret
qw17:	@POP
	clc
	ret
taytar_meta	endp

;************************************************************************

in_lhg_apol	proc	near
	@PUSH
	mov	ax,offset CODEO:lhg_apol_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	waplhg
	@SELECTWIND	waplhg
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:ali3
	mov	word ptr buffer1[7],offset CODE1:ali2
	mov	word ptr buffer1[9],offset CODE1:ali1
	mov	buffer1,"J"
	mov	buffer1[3],61
	call	pralig
lhgarx:	mov	cx,10
	mov	cs:c_yy,5
	mov	bx,41
pral10:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	12,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	pralig
	pop	ax
	call	check_extra
	jnc	pral01
	call	lhg_or
	jmp	pral10
pral01:	cmp	cs:isenter,1
	je	pral11
	cmp	ah,@LEFT_ARROW
	jne	pral10
	cmp	cs:c_yy,5
	je	pral11
	sub	bx,2
	dec	cs:c_yy
	inc	cx
pral11:	inc	bx
prl111:	@ITOAB	strbuf,2,buffer1[bx]
	@WINPUTNUMBER	18,cs:c_yy,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[bx],al
	call	pralig
	pop	ax
	call	check_extra
	jnc	pral02
	call	lhg_or
	jmp	prl111
pral02:	cmp	cs:isenter,1
	je	pral14
	cmp	ah,@LEFT_ARROW
	jne	prl111
	dec	bx
	jmp	pral10
pral14:	inc	bx
	inc	cs:c_yy
	loop	prl101
	jmp	lhgarx
prl101: jmp	pral10
in_lhg_apol	endp

lhg_or	proc	near
	@PUSH
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,16,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	@POP
	ret
lhg_or	endp

pralig	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	word ptr buffer1[1],0
	jne	pral1
	mov	word ptr buffer1[1],1
	mov	cx,10
	mov	bx,41
prl01:	mov	buffer1[bx],0
	inc	bx
	mov	buffer1[bx],6
	inc	bx
	loop	prl01
pral1:	mov	cx,10
	mov	al,5
	mov	bx,41
pral0:	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	12,al,strbuf
	inc	bx
	@ITOAB	strbuf,2,buffer1[bx]
	@WPRINT	18,al,strbuf
	inc	bx
	inc	ax
	loop	pral0
	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,16,strbuf
	@POP
	ret
pralig	endp

lhg_apol_meta	proc	near
	@PUSH
	mov	cx,10
	mov	bx,41
qw18:	cmp	buffer1[bx],0
	ja	qw19
	inc	bx
	cmp	buffer1[bx],6
	jb	qw19
	inc	bx
	loop	qw18
	@POP
	stc
	ret
qw19:	@POP
	clc
	ret
lhg_apol_meta	endp

;************************************************************************

in_lhg_uesi	proc	near
	@PUSH
	mov	ax,offset CODEO:lhg_uesi_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wlguesi
	@SELECTWIND	wlguesi
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:ulh3
	mov	word ptr buffer1[7],offset CODE1:ulh2
	mov	word ptr buffer1[9],offset CODE1:ulh1
	mov	buffer1,"L"
	mov	buffer1[3],73
	call	prligu
	mov	cursy,4
	mov	cursx,10
ilst:	call	cars7
	call	check_extra
	jnc	ilooo
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	16,16,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	ilst
ilooo:	cmp	ah,@UP_ARROW
	jne	ilu
	cmp	cursy,4
	jbe	ilu
	sub	cursy,2
	jmp	ilst
ilu:	cmp	ah,@DOWN_ARROW
	jne	ild
	cmp	cursy,14
	jae	ild
	add	cursy,2
	jmp	ilst
ild:	cmp	ah,@RIGHT_ARROW
	jne	ilr
	cmp	cursx,64
	jae	ilr
	add	cursx,6
	jmp	ilst
ilr:	cmp	ah,@LEFT_ARROW
	jne	ill
	cmp	cursx,10
	jbe	ill
	sub	cursx,6
	jmp	ilst
ill:	cmp	al," "
	je	ilk
	cmp	al,@ENTER
	jne	ile
ilk:	xor	dx,dx
	xor	ax,ax
	mov	al,cursy
	sub	ax,4
	shr	ax,1
	mov	cx,10
	mul	cx
	mov	bx,ax
	mov	al,cursx
	sub	ax,10
	mov	cx,6
	div	cx
	add	bx,ax
	add	bx,11
	mov	al,buffer1[bx]
	not	al
	and	al,1
	mov	buffer1[bx],al
	mov	cl," "
	cmp	al,0
	je	il00
	mov	cl,"X"
il00:	@WPRINTCH	cursx,cursy,cl
ile:	jmp	ilst
in_lhg_uesi	endp

prligu	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	word ptr buffer1[1],0
	jne	prlui
	mov	word ptr buffer1[1],1
	mov	cx,60
	mov	si,11
nnx1:	mov	buffer1[si],1
	inc	si
	loop	nnx1
prlui:	mov	cx,60
	mov	si,11
prlus:	push	cx
	mov	al,buffer1[si]
	cmp	al,0
	jne	prlu0
	jmp	prlue
prlu0:	xor	dx,dx
	mov	ax,si
	sub	ax,11
	mov	cx,10
	div	cx
	shl	ax,1
	add	ax,4
	mov	cursy,al
	mov	ax,dx
	mov	cx,6
	mul	cx
	add	ax,10
	mov	cursx,al
	@WPRINTCH	cursx,cursy,"X"
prlue:	pop	cx
	inc	si
	loop	prlus
	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	16,16,strbuf
	@POP
	ret
prligu	endp

lhg_uesi_meta	proc	near
	@PUSH
	mov	cx,60
	mov	si,11
lhgep:	cmp	buffer1[si],0
	je	lhgex
	inc	si
	loop	lhgep
	@POP
	stc
	ret
lhgex:	mov	si,11
	mov	cx,6
qw41:	push	cx
	push	si
	mov	cx,10
qw20:	mov	al,buffer1[si]
	cmp	al,0
	jne	qw21
	inc	si
	loop	qw20
	pop	si
	pop	cx
	@POP
	stc
	ret
qw21:	pop	si
	pop	cx
	add	si,10
	loop	qw41
	@POP
	clc
	ret
lhg_uesi_meta	endp

;************************************************************************

in_monaziga	proc	near
	@PUSH
	mov	si,offset WINDOWS:mmonaz
	mov	ax,offset CODEO:ues6
	mov	cs:callit,ax
	@STRCOPY	buffer1,buffer2,100
	mov	word ptr buffer1[5],offset CODE1:mz3
	mov	word ptr buffer1[7],offset CODE1:mz2
	mov	word ptr buffer1[9],offset CODE1:mz1
	mov	buffer1,"Z"
	call	u6prin
	call	in_6uesis
	@POP
	retf
in_monaziga	endp

in_mesa_ejo	proc	near
	@PUSH
	mov	si,offset WINDOWS:mmesae
	mov	ax,offset CODEO:ues6
	mov	cs:callit,ax
	@STRCOPY	buffer1,buffer2,100
	mov	word ptr buffer1[5],offset CODE1:me3
	mov	word ptr buffer1[7],offset CODE1:me2
	mov	word ptr buffer1[9],offset CODE1:me1
	mov	buffer1,"F"
	mov	buffer1[3],14
	call	u6prin
	call	in_6uesis
	@POP
	retf
in_mesa_ejo	endp

in_mikra_megala	proc	near
	@PUSH
	mov	si,offset WINDOWS:mmikram
	mov	ax,offset CODEO:ues6
	mov	cs:callit,ax
	@STRCOPY	buffer1,buffer2,100
	mov	word ptr buffer1[5],offset CODE1:mm3
	mov	word ptr buffer1[7],offset CODE1:mm2
	mov	word ptr buffer1[9],offset CODE1:mm1
	mov	buffer1,"1"
	mov	buffer1[3],14
	call	u6prin
	call	in_6uesis
	@POP
	retf
in_mikra_megala	endp

in_aristera_dejia	proc	near
	@PUSH
	mov	si,offset WINDOWS:maristd
	mov	ax,offset CODEO:ues6
	mov	cs:callit,ax
	@STRCOPY	buffer1,buffer2,100
	mov	word ptr buffer1[5],offset CODE1:ad3
	mov	word ptr buffer1[7],offset CODE1:ad2
	mov	word ptr buffer1[9],offset CODE1:ad1
	mov	buffer1,"2"
	mov	buffer1[3],14
	call	u6prin
	call	in_6uesis
	@POP
	retf
in_aristera_dejia	endp

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
mz02:	@POP
	ret
u6prin	endp

in_6uesis	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wstand
	@SELECTWIND	wstand
	call	far ptr strlen
	mov	dx,50
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	call	print6
	mov	cursx,7
	mov	cursy,5
i6st:	call	cars7
	call	check_extra
	jnc	i6ooo
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	13,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
i6ooo:	cmp	ah,@RIGHT_ARROW
	jne	i6r
	cmp	cursx,37
	ja	i6r
	add	cursx,6
	jmp	i6st
i6r:	cmp	ah,@LEFT_ARROW
	jne	i6l
	cmp	cursx,10
	jb	i6l
	sub	cursx,6
	jmp	i6st
i6l:	cmp	al," "
	je	i6ee
	cmp	al,@ENTER
	jne	i6e
i6ee:	xor	ax,ax
	xor	dx,dx
	mov	al,cursx
	sub	ax,7
	mov	cx,6
	div	cx
	mov	bx,ax
	add	bx,15
	mov	al,buffer1[bx]
	not	al
	and	al,1
	mov	buffer1[bx],al
	mov	cl," "
	cmp	al,0
	je	i60
	mov	cl,"X"
i60:	@WPRINTCH	cursx,cursy,cl
i6e:	jmp	i6st
in_6uesis	endp

print6	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,7
	mov	bx,15
pr6s:	push	cx
	mov	al,buffer1[bx]
	cmp	al,0
	je	pr6e
	mov	ax,bx
	sub	ax,15
	mov	cx,6
	mul	cx
	add	ax,7
	@WPRINTCH	al,5,"X"
pr6e:	pop	cx
	inc	bx
	loop	pr6s
	cmp	word ptr buffer1[1],0
	jne	pr60
	mov	word ptr buffer1[1],1
pr60:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	13,7,strbuf
	@POP
	ret
print6	endp

ues6	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,100
	@ZEROBBUF	buffer1[14],10
	mov	cx,7
	mov	si,15
	mov	bx,15
u601:	mov	dl,buffer2[si]
	cmp	dl,0
	je	u602
	mov	dx,si
	sub	dx,15
	mov	buffer1[bx],dl
	inc	bx
u602:	inc	si
	loop	u601
	mov	buffer1[3],bl
	sub	bx,11
	mov	buffer1[11],bl
	sub	bx,4
	mov	buffer1[14],bl
	cmp	bx,0
	jne	qw03
	@POP
	stc
	ret
qw03:	@POP
	clc
	ret
ues6	endp

;************************************************************************

in_simetrika	proc	near
	@PUSH
	mov	ax,offset CODEO:simmeta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wsymetr
	@SELECTWIND	wsymetr
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:sym3
	mov	word ptr buffer1[7],offset CODE1:sym2
	mov	word ptr buffer1[9],offset CODE1:sym1
	mov	buffer1,"S"
	mov	buffer1[3],69
	call	prsim
simarx:	@ITOA	strbuf,2,cs:simetr
	@WINPUTNUMBER	17,3,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	cs:simetr,ax
	cmp	cs:simetr,0
	jne	nos0
	mov	cs:simetr,25
nos0:	cmp	cs:simetr,49
	jbe	simm4
	mov	cs:simetr,25
simm4:	@ITOA	strbuf,2,cs:simetr
	@WPRINT	17,3,strbuf
	pop	ax
	call	check_extra
	jnc	sim031
	jmp	orsim
sim031:	cmp	cs:isenter,1
	je	sim03
	jmp	simarx
sim03:	@ITOAB	strbuf,1,buffer1[67]
	@WINPUTNUMBER	10,6,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[67],al
	pop	ax
	call	check_extra
	jc	orsim
	cmp	cs:isenter,1
	je	sim01
	cmp	ah,@LEFT_ARROW
	jne	sim03
	jmp	simarx
sim01:	@ITOAB	strbuf,1,buffer1[68]
	@WINPUTNUMBER	24,6,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[68],al
	pop	ax
	call	check_extra
	jc	orsim
	cmp	cs:isenter,1
	je	sim02
	cmp	ah,@LEFT_ARROW
	jne	sim01
	jmp	sim03
sim02:	jmp	simarx
orsim:	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,8,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	jmp	simarx
in_simetrika	endp

prsim	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	word ptr buffer1[1],0
	jne	sim00
	mov	word ptr buffer1[1],1
	mov	cs:simetr,25
	mov	buffer1[67],0
	mov	buffer1[68],6
	jmp	sim11
sim00:	call	simprin
sim11:	@ITOA	strbuf,2,cs:simetr
	@WPRINT	17,3,strbuf
	@ITOAB	strbuf,1,buffer1[67]
	@WPRINT	10,6,strbuf
	@ITOAB	strbuf,1,buffer1[68]
	@WPRINT	24,6,strbuf
	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,8,strbuf
	@POP
	ret
simetr	dw	0
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

simmeta	proc	near
	@PUSH
	cmp	buffer1[67],0
	ja	qw04
	cmp	buffer1[68],6
	jb	qw04
	@POP
	stc
	ret
qw04:	mov	cx,3
	mov	bx,0
simm2:	push	cx
	mov	cx,49
	mov	al,1
simm1:	mov	buffer2[bx],al
	inc	bx
	inc	ax
	loop	simm1
	pop	cx
	loop	simm2

	mov	cx,49
	mov	si,cs:simetr
	xor	bx,bx
	add	si,48
	mov	di,si
simm3:	dec	si
	inc	di
	
	mov	bl,buffer2[si]
	mov	al,buffer2[di]
	mov	buffer1[bx+11],al
	
	mov	bl,buffer2[di]
	mov	al,buffer2[si]
	mov	buffer1[bx+11],al
	loop	simm3
	mov	si,cs:simetr
	mov	buffer1[si+11],0
	@POP
	clc
	ret
simmeta	endp

;************************************************************************

in_mikra_mona	proc	near
	@PUSH
	mov	ax,offset CODEO:meta7x7
	mov	cs:callit,ax
	mov	word ptr buffer1[5],offset CODE1:mmmz3
	mov	word ptr buffer1[7],offset CODE1:mmmz2
	mov	word ptr buffer1[9],offset CODE1:mmmz1
	mov	buffer1,"3"
	mov	si,offset WINDOWS:mikmon
	call	in_7x7
	@POP
	retf
in_mikra_mona	endp

in_aristera_mona	proc	near
	@PUSH
	mov	ax,offset CODEO:meta7x7
	mov	cs:callit,ax
	mov	word ptr buffer1[5],offset CODE1:admz3
	mov	word ptr buffer1[7],offset CODE1:admz2
	mov	word ptr buffer1[9],offset CODE1:admz1
	mov	buffer1,"4"
	mov	si,offset WINDOWS:arimon
	call	in_7x7
	@POP
	retf
in_aristera_mona	endp

in_mesa_mona	proc	near
	@PUSH
	mov	ax,offset CODEO:meta7x7
	mov	cs:callit,ax
	mov	word ptr buffer1[5],offset CODE1:memz3
	mov	word ptr buffer1[7],offset CODE1:memz2
	mov	word ptr buffer1[9],offset CODE1:memz1
	mov	buffer1,"5"
	mov	si,offset WINDOWS:mesmon
	call	in_7x7
	@POP
	retf
in_mesa_mona	endp

in_aristera_mikra	proc	near
	@PUSH
	mov	ax,offset CODEO:meta7x7
	mov	cs:callit,ax
	mov	word ptr buffer1[5],offset CODE1:admm3
	mov	word ptr buffer1[7],offset CODE1:admm2
	mov	word ptr buffer1[9],offset CODE1:admm1
	mov	buffer1,"6"
	mov	si,offset WINDOWS:arimik
	call	in_7x7
	@POP
	retf
in_aristera_mikra	endp

in_mesa_mikra	proc	near
	@PUSH
	mov	ax,offset CODEO:meta7x7
	mov	cs:callit,ax
	mov	word ptr buffer1[5],offset CODE1:memm3
	mov	word ptr buffer1[7],offset CODE1:memm2
	mov	word ptr buffer1[9],offset CODE1:memm1
	mov	buffer1,"7"
	mov	si,offset WINDOWS:mesmik
	call	in_7x7
	@POP
	retf
in_mesa_mikra	endp

in_mesa_aristera	proc	near
	@PUSH
	mov	ax,offset CODEO:meta7x7
	mov	cs:callit,ax
	mov	word ptr buffer1[5],offset CODE1:mead3
	mov	word ptr buffer1[7],offset CODE1:mead2
	mov	word ptr buffer1[9],offset CODE1:mead1
	mov	buffer1,"8"
	mov	si,offset WINDOWS:mesari
	call	in_7x7
	@POP
	retf
in_mesa_aristera	endp

in_7x7	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	w7x7
	@SELECTWIND	w7x7
	call	far ptr strlen
	mov	dx,36
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	mov	cx,9
	mov	al,2
i70:	@WPRINTCH	0,al,"Ã"
	@WPRINTCH	33,al,"´"
	add	al,2
	loop	i70

	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	call	take7x7
	call	print7
	mov	cursx,7
	mov	cursy,5
narx7:	call	cars7
	call	check_extra
	jnc	or7x7
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,19,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	call	print7
	jmp	narx7
or7x7:	cmp	ah,@LEFT_ARROW
	jne	nl7
	cmp	cursx,7
	jbe	nl7
	sub	cursx,4
	jmp	narx7
nl7:	cmp	ah,@RIGHT_ARROW
	jne	nr7
	cmp	cursx,31
	jae	nr7
	add	cursx,4
	jmp	narx7
nr7:	cmp	ah,@UP_ARROW
	jne	nu7
	cmp	cursy,5
	jbe	nu7
	sub	cursy,2
	jmp	narx7
nu7:	cmp	ah,@DOWN_ARROW
	jne	nd7
	cmp	cursy,17
	jae	nd7
	add	cursy,2
	jmp	narx7
nd7:	cmp	al," "
	je	iken
	cmp	al,@ENTER
	jne	ne7
iken:	xor	ax,ax
	mov	al,cursy
	sub	ax,5
	shr	ax,1
	mov	cx,7
	mul	cx
	mov	bx,ax
	xor	ax,ax
	mov	al,cursx
	xor	dx,dx
	sub	ax,7
	mov	cx,4
	div	cx
	add	bx,ax
	add	bx,17
	mov	al,buffer1[bx]
	not	al
	and	al,1
	mov	buffer1[bx],al
	mov	cl," "
	cmp	al,0
	je	its0
	mov	cl,"X"
its0:	@WPRINTCH	cursx,cursy,cl
	jmp	narx7
	@WPRINTCH	cursx,cursy,"X"
ne7:	jmp	narx7
in_7x7	endp

print7	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cx,49
	mov	bx,17
pr71:	push	cx
	mov	al,buffer1[bx]
	cmp	al,0
	je	npr7
	xor	dx,dx
	mov	ax,bx
	sub	ax,17
	mov	cx,7
	div	cx
	mov	cx,2
	mul	cx
	add	ax,5
	mov	cursy,al
	xor	dx,dx
	mov	ax,bx
	sub	ax,17
	mov	cx,7
	div	cx
	mov	ax,dx
	mov	cx,4
	mul	cx
	add	ax,7
	mov	cursx,al
	@WPRINTCH	cursx,cursy,"X"
npr7:	pop	cx
	inc	bx
	loop	pr71
	cmp	word ptr buffer1[1],0
	jne	no70
	mov	word ptr buffer1[1],1
no70:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,19,strbuf
	@POP
	ret
print7	endp

cars7	proc	near
	@PUSHAX
	@CHANGESEGM	ds,DATA
	dec	cursx
alip7:	@inverse cursx,cursy,3
	@wait 3
	pushf
	@inverse cursx,cursy,3
	popf
	jc	ekkp7
	@wait 2
	jnc	alip7
ekkp7:	@UPPERAX
	inc	cursx
	@POPAX
	ret
cars7	endp

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

meta7x7	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,200
	@ZEROBBUF	buffer1[11],120
	mov	cx,49
	mov	si,17
	mov	di,17
mest72:	push	cx
	mov	al,buffer2[si]
	cmp	al,0
	je	mest71
	mov	ax,si
	sub	ax,17
	mov	cx,7
	xor	dx,dx
	div	cx
	mov	bx,6
	sub	bx,ax
	mov	buffer1[di+1],bl
	inc	di
	mov	ax,6
	sub	ax,dx
	mov	buffer1[di-1],al
	inc	di
mest71:	pop	cx
	inc	si
	loop	mest72
	mov	ax,di
	mov	buffer1[3],al
	sub	ax,11
	mov	buffer1[11],al
	sub	ax,6
	shr	ax,1
	mov	buffer1[16],al
	cmp	al,0
	jne	qw05
	@POP
	stc
	ret
qw05:	@POP
	clc
	ret
meta7x7	endp

;************************************************************************

in_par_omilvn	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpomil
	mov	word ptr buffer1[5],offset CODE1:pom3
	mov	word ptr buffer1[7],offset CODE1:pom2
	mov	word ptr buffer1[9],offset CODE1:pom1
	mov	buffer1,"!"
	call	in_parag
	@POP
	retf
in_par_omilvn	endp

in_par_dekadvn	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpdek
	mov	word ptr buffer1[5],offset CODE1:p103
	mov	word ptr buffer1[7],offset CODE1:p102
	mov	word ptr buffer1[9],offset CODE1:p101
	mov	buffer1,"@"
	call	in_parag
	@POP
	retf
in_par_dekadvn	endp

in_par_dvdekadvn proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpdvd
	mov	word ptr buffer1[5],offset CODE1:p123
	mov	word ptr buffer1[7],offset CODE1:p122
	mov	word ptr buffer1[9],offset CODE1:p121
	mov	buffer1,"#"
	call	in_parag
	@POP
	retf
in_par_dvdekadvn endp

in_par_ori7ad	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpor7
	mov	word ptr buffer1[5],offset CODE1:p073
	mov	word ptr buffer1[7],offset CODE1:p072
	mov	word ptr buffer1[9],offset CODE1:p071
	mov	buffer1,"$"
	call	in_parag
	@POP
	retf
in_par_ori7ad	endp

in_par_kau7ad	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpka7
	mov	word ptr buffer1[5],offset CODE1:pk73
	mov	word ptr buffer1[7],offset CODE1:pk72
	mov	word ptr buffer1[9],offset CODE1:pk71
	mov	buffer1,"%"
	call	in_parag
	@POP
	retf
in_par_kau7ad	endp

in_par_diag_a	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpdiga
	mov	word ptr buffer1[5],offset CODE1:pda3
	mov	word ptr buffer1[7],offset CODE1:pda2
	mov	word ptr buffer1[9],offset CODE1:pda1
	mov	buffer1,"^"
	call	in_parag
	@POP
	retf
in_par_diag_a	endp

in_par_diag_b	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpdigb
	mov	word ptr buffer1[5],offset CODE1:pdb3
	mov	word ptr buffer1[7],offset CODE1:pdb2
	mov	word ptr buffer1[9],offset CODE1:pdb1
	mov	buffer1,"&"
	call	in_parag
	@POP
	retf
in_par_diag_b	endp

in_par_ligont	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mplig
	mov	word ptr buffer1[5],offset CODE1:plg3
	mov	word ptr buffer1[7],offset CODE1:plg2
	mov	word ptr buffer1[9],offset CODE1:plg1
	mov	buffer1,"*"
	call	in_parag
	@POP
	retf
in_par_ligont	endp

in_par_taytar	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mptayt
	mov	word ptr buffer1[5],offset CODE1:pta3
	mov	word ptr buffer1[7],offset CODE1:pta2
	mov	word ptr buffer1[9],offset CODE1:pta1
	mov	buffer1,"("
	call	in_parag
	@POP
	retf
in_par_taytar	endp

in_par_sinex	proc	near
	@PUSH
	mov	ax,offset CODEO:par_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	si,offset WINDOWS:mpsin
	mov	word ptr buffer1[5],offset CODE1:psy3
	mov	word ptr buffer1[7],offset CODE1:psy2
	mov	word ptr buffer1[9],offset CODE1:psy1
	mov	buffer1,")"
	call	in_parag
	@POP
	retf
in_par_sinex	endp

in_parag	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	winpar
	@SELECTWIND	winpar
	@WPRINTCH	0,2,"Ã"
	@WPRINTCH	0,4,"Ã"
	@WPRINTCH	51,2,"´"
	@WPRINTCH	51,4,"´"
	@WPRINTCH	0,6,"Ã"
	@WPRINTCH	51,6,"´"
	call	far ptr strlen
	mov	dx,51
	xchg	dx,ax
	sub	ax,dx
	shr	ax,1
	@WPRINTSI al,1
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	call	par_prin
	call	prparag
	mov	si,1
	mov	al,paragu[si]
	mov	cursx,al
lltr:	call	carsp
	call	check_extra
	jnc	nocri
	call	in_omada_parag
	call	check_extra
	jmp	lltr
nocri:	cmp	ah,@LEFT_ARROW
	jne	oxiq1
	cmp	paragu[si-1],0
	je	oxiq1
	dec	si
	mov	al,paragu[si]
	mov	cursx,al
oxiq1:	cmp	ah,@RIGHT_ARROW
	jne	oxiq2
	cmp	paragu[si+1],0
	je	oxiq2
	inc	si
	mov	al,paragu[si]
	mov	cursx,al
oxiq2:	cmp	al," "
	je	ppsp
	cmp	al,@ENTER
	jne	nenter
ppsp:	cmp	buffer1,"@"
	je	is1111
	cmp	buffer1,"!"
	je	is1111
	cmp	buffer1,"#"
	je	is1111_2
no1111:	mov	bx,si
	dec	bx
	add	bx,27
	mov	al,buffer1[bx]
	not	al
	and	al,1
	mov	buffer1[bx],al
	call	prparag
sk12:	jmp	lltr
nenter:	jmp	lltr
is1111:	cmp	paragu[si+1],0
	jne	no1111
	jmp	lltr
is1111_2:
	cmp	paragu[si+1],0
	je	lltr
	cmp	paragu[si+2],0
	jne	no1111
lltr1:	jmp	lltr
in_parag	endp

par_meta proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,200
	@ZEROBBUF	buffer1[26],120
	mov	bx,27
	mov	si,27
	cmp	buffer1,"!"
	je	ssst
	cmp	buffer1,"@"
	je	ssst
	cmp	buffer1,"#"
	je	ssst
	cmp	buffer1,"$"
	je	ssst1
	cmp	buffer1,"%"
	je	ssst1
	cmp	buffer1,"^"
	je	ssst1
	cmp	buffer1,"&"
	je	ssst1
	cmp	buffer1,"*"
	je	ssst2
	cmp	buffer1,"("
	je	ssst2
	cmp	buffer1,")"
	jne	ssst
	mov	si,36
	jmp	ssst
ssst2:	mov	si,42
	jmp	ssst
ssst1:	mov	si,33
ssst:	mov	cs:_si,si
	mov	cx,11
	mov	cs:much,0
prm03:	push	cx
	cmp	buffer2[bx],1
	jne	prm02
	inc	cs:much
	inc	cs:much
	mov	ax,bx
	sub	ax,27
	mov	cx,12
	mul	cx
	mov	di,ax
	mov	cx,12
prm01:	mov	al,pinpar[di]
	mov	buffer1[si],al
	inc	si
	inc	di
	loop	prm01
prm02:	pop	cx
	inc	bx
	loop	prm03
	mov	al,cs:much
	cmp	al,0
	jne	qw06
	@POP
	stc
	ret
qw06:	mov	si,cs:_si
	dec	si
	mov	buffer1[si],al
	mov	ah,0
	mov	cx,6
	mul	cx
	add	ax,cs:_si
	mov	buffer1[3],al
	@POP
	clc
	ret
much	db	0
_si	dw	0
par_meta endp

par_prin proc	near
	@PUSH
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
	xor	dx,dx
	mov	ax,si
	mov	cx,12
	div	cx
	mov	di,ax
	add	di,27
	mov	buffer1[di],1
	jmp	eppar3
eppar1:	add	si,12
	loop	eppar2
eppar3:	pop	cx
	add	bx,12
	loop	eppar9
telpar:	@POP
	ret
eppar9:	jmp	eppar
par_prin endp

in_omada_parag	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	10,7,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	call	prparag
	pop	ax
	call	check_extra
	@POP
	ret
in_omada_parag	endp

carsp	proc	near
	@PUSHAX
	@CHANGESEGM	ds,DATA
	dec	cursx
palip:	@inverse cursx,5,3
	@wait 3
	pushf
	@inverse cursx,5,3
	popf
	jc	ekkp
	@wait 2
	jnc	palip
ekkp:	@UPPERAX
	inc	cursx
	@POPAX
	ret
carsp	endp	

prparag	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	bx,27
	mov	cx,11
	mov	si,1
ska:	cmp	buffer1[bx],1
	jne	oxx1
	@WPRINTCH	paragu[si],5,"X"
oxx1:	cmp	buffer1[bx],0
	jne	oxx2
	@WPRINTCH	paragu[si],5," "
oxx2:	inc	bx
	inc	si
	loop	ska
	cmp	word ptr buffer1[1],0
	jne	oxx3
	mov	buffer1[1],1
oxx3:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	10,7,strbuf
	@POP
	ret
prparag	endp

;************************************************************************

in_basikh	proc	near
	@PUSH
	mov	ax,offset CODEO:bas_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,DATA
	mov	cursy,14
	mov	cursx,48
	mov	word ptr buffer1[5],offset CODE1:bas3
	mov	word ptr buffer1[7],offset CODE1:bas2
	mov	word ptr buffer1[9],offset CODE1:bas1
	mov	buffer1,"W"
	mov	buffer1[3],70
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wbasikh
	@SELECTWIND	wbasikh
	@WPRINTCH	0,16,"Ã"
	@WPRINTCH	52,16,"´"
	@WPRINTCH	0,18,"Ã"
	@WPRINTCH	24,16,"Â"
	@WPRINTCH	36,16,"Â"
	@WPRINTCH	24,20,"Á"
	@WPRINTCH	36,20,"Á"
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	call	bas_prin
	call	far ptr setboxes
	call	far ptr setinverseb
	call	far ptr editor_basikhs
	@EXIT
in_basikh	endp

setboxes	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cs:_box1,0
	mov	cx,49
	mov	bx,0
	xor	ax,ax
sb22:	cmp	genplires[bx],0
	je	sb21
	inc	ax
sb21:	inc	bx
	loop	sb22
	cmp	ax,0
	jne	sb23
	mov	cs:_box1,1
	mov	cs:_box,1
sb23:	mov	cx,49
	mov	bx,1
sb1:	push	cx
	cmp	cs:_box1,1
	je	pl00
	mov	cs:_box,0
	cmp	genplires[bx-1],0
	je	pl00
	mov	cs:_box,1
pl00:	xor	ax,ax
	mov	ax,bx
	dec	al
	mov	cl,10
	div	cl
	push	ax
	mov	ah,0
	mov	cl,3
	mul	cl
	inc	al
	mov	cursy,al
	pop	ax
	mov	al,ah
	mov	ah,0
	mov	cl,5
	mul	cl
	inc	al
	inc	al
	mov	cursx,al
	@SETBOX	cursx,cursy,4,3,07h,cs:_box
	mov	ax,bx
	@ITOA	strbuf,2
	add	cursx,1
	inc	cursy
	@WPRINT	cursx,cursy,strbuf
	inc	bx
	pop	cx
	loop	sb191
sbend:	@POP
	retf
sb191:	jmp	sb1
_box	dw	0
_box1	db	0
setboxes	endp

lotcursb proc	near
crs1b:	@INVERSE	cursx,cursy,2
	@WAIT	3
	pushf
	@INVERSE	cursx,cursy,2
	popf
	jc	crs2b
	@WAIT	2
	jnc	crs1b
crs2b:	@UPPERAX
	ret
lotcursb endp

selectb	proc	near
	cmp	cursx,48
	jne	sel1
	cmp	cursy,14
	jne	sel1
	ret
sel1:	@PUSH
	xor	ax,ax
	mov	al,cursx
	sub	al,3
	mov	cl,5
	div	cl
	push	ax
	xor	ax,ax
	mov	al,cursy
	sub	al,2
	mov	cl,3
	div	cl
	mov	cl,10
	mul	cl
	pop	cx
	add	ax,cx
	mov	bx,ax
	add	bx,17
	mov	al,buffer1[bx]
	not	al
	and	al,1
	mov	buffer1[bx],al
	dec	cursx
	dec	cursy
	@INVERSE	cursx,cursy,4
	inc	cursy
	@INVERSE	cursx,cursy,4
	inc	cursy
	@INVERSE	cursx,cursy,4
	inc	cursx
	dec	cursy
	@POP
	ret
selectb	endp	

setinverseb	proc	near
	@PUSH
	@CHANGESEGM	ds,data
	mov	cx,49
	mov	bx,17
bisb1:	push	cx
	xor	ax,ax
	mov	al,buffer1[bx]
	cmp	al,0
	je	stib
	mov	ax,50
	sub	ax,cx
	dec	al
	mov	cl,10
	div	cl
	push	ax
	mov	ah,0
	mov	cl,3
	mul	cl
	inc	al
	mov	cursy,al
	pop	ax
	mov	al,ah
	mov	ah,0
	mov	cl,5
	mul	cl
	inc	al
	inc	al
	mov	cursx,al
	@INVERSE	cursx,cursy,4
	inc	cursy
	@INVERSE	cursx,cursy,4
	inc	cursy
	@INVERSE	cursx,cursy,4
stib:	inc	bx
	pop	cx
	loop	bisb1
	@POP
	retf
setinverseb	endp

pr_oria_bas	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	buffer1[1],0
	jne	isnot0
	mov	buffer1[1],1
	mov	buffer1[66],0
	mov	buffer1[68],1
	mov	buffer1[67],6
	mov	buffer1[69],6
isnot0:	@ITOAB	strbuf,1,buffer1[66]
	@WPRINT	21,17,strbuf
pob2:	@ITOAB	strbuf,1,buffer1[68]
	@WPRINT	21,19,strbuf
pob3:	@ITOAB	strbuf,1,buffer1[67]
	@WPRINT	33,17,strbuf
pob4:	@ITOAB	strbuf,1,buffer1[69]
	@WPRINT	33,19,strbuf
pob5:	@ITOA	strbuf,3,buffer1[1]
	@WPRINT	47,19,strbuf
	@POP
	ret
pr_oria_bas	endp

editor_basikhs	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	sdial,1
	je	sdil01
	call	pr_oria_bas
sdil01:	mov	al,cursx1
	mov	cursx,al
	mov	al,cursy1
	mov	cursy,al
btst:	call	lotcursb
	cmp	sdial,1
	jne	sdil02
	cmp	al,@ESCAPE
	jne	sdil03
	@POP
	stc
	retf
sdil03:	cmp	al,"T"
	jne	sdil04
	@POP
	clc
	retf
sdil02:	push	ax
	mov	al,cursx
	mov	cursx1,al
	mov	al,cursy
	mov	cursy1,al
	pop	ax
	call	check_extra
	jnc	bnosc
	cmp	sdial,1
	je	btst
	call	in_oria_bas
	call	check_extra
	jmp	btst	
sdil04:
bnosc:	cmp	al,@ENTER
	je	b13
	cmp	al," "
	jne	bnoken
b13:	call	selectb
	jmp	btst
bnoken:	cmp	ah,@RIGHT_ARROW
	jne	bnol
	cmp	cursx,47
	jb	bno60
	mov	cursx,3
	jmp	btst
bno60:	add	cursx,5
	jmp	btst
bnol:	cmp	ah,@LEFT_ARROW
	jne	bnor
	cmp	cursx,3
	ja	bno3
	mov	cursx,48
	jmp	btst
bno3:	sub	cursx,5
	jmp	btst
bnor:	cmp	ah,@UP_ARROW
	jne	bnou
	cmp	cursy,2
	ja	bno2
	mov	cursy,14
	jmp	btst
bno2:	sub	cursy,3
	jmp	btst
bnou:	cmp	ah,@DOWN_ARROW
	jne	bnod
	cmp	cursy,12
	ja	bno21
	add	cursy,3
	jmp	btst
bno21:	mov	cursy,2
bnod:	jmp	btst
editor_basikhs	endp

in_oria_bas	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
baso1:	@ITOAB	strbuf,1,buffer1[66]
	@WINPUTNUMBER	21,17,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[66],al
	pop	ax
	call	check_extra
	cmp	ah,@LEFT_ARROW
	jne	baso2
	jmp	baso6
baso2:	@ITOAB	strbuf,1,buffer1[67]
	@WINPUTNUMBER	33,17,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[67],al
	pop	ax
	call	check_extra
	cmp	ah,@LEFT_ARROW
	jne	baso3
	jmp	baso1
baso3:	@ITOAB	strbuf,1,buffer1[68]
	@WINPUTNUMBER	21,19,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[68],al
	pop	ax
	cmp	buffer1[68],0
	je	baso3
	call	check_extra
	cmp	ah,@LEFT_ARROW
	jne	baso4
	jmp	baso2
baso4:	@ITOAB	strbuf,1,buffer1[69]
	@WINPUTNUMBER	33,19,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	buffer1[69],al
	pop	ax
	cmp	buffer1[69],0
	je	baso4
	call	check_extra
	cmp	ah,@LEFT_ARROW
	jne	baso5
	jmp	baso3
baso5:	@ITOA	strbuf,3,buffer1[1]
	@WINPUTNUMBER	47,19,strbuf,plright
	push	ax
	@ATOI	strbuf
	mov	word ptr buffer1[1],ax
	pop	ax
	call	check_extra
	cmp	ah,@LEFT_ARROW
	jne	baso6
	jmp	baso4
baso6:	call	pr_oria_bas
	@POP
	ret
in_oria_bas	endp

bas_meta proc	near
	@PUSH
	mov	bx,17
	mov	cx,49
	mov	ax,2
bm02:	cmp	buffer1[bx],0
	je	bm01
	mov	buffer1[bx],al
	inc	ax
bm01:	inc	bx
	loop	bm02
	call	sumbuf
	cmp	al,0
	jne	qw07
	@POP
	stc
	ret
qw07:	@POP
	clc
	ret
bas_meta endp

bas_prin proc	near
	@PUSH
	mov	bx,17
	mov	cx,49
bm021:	cmp	buffer1[bx],0
	je	bm011
	mov	buffer1[bx],1
bm011:	inc	bx
	loop	bm021
	@POP
	ret
bas_prin endp

;************************************************************************

eisplhres	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	meisagf," "
	je	skata
	cmp	meisagf,0
	je	skata
	@POP
	retf
skata:	mov	ax,offset CODEO:plir_meta
	mov	cs:callit,ax
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wplhres
	@SELECTWIND	wplhres
	@WPRINTCH	29,16,"Â"
	@WPRINTCH	29,18,"Á"
	@WPRINTCH	45,16,"Â"
	@WPRINTCH	45,18,"Á"
	@WPRINTCH	0,16,"Ã"
	@WPRINTCH	72,16,"´"
	@CHANGESEGM	ds,DATA
	@LTOA	user_oros,0,strbuf
	@WPRINT	1,0,strbuf
	mov	word ptr buffer1[5],offset CODE1:basn3
	mov	word ptr buffer1[7],offset CODE1:basn2
	mov	word ptr buffer1[9],offset CODE1:basn1
	mov	buffer1,"0"
	mov	buffer1[3],70
	mov	word ptr buffer1[1],0
	call	bas_prin
	call	far ptr setallboxes
	call	setinversep
	call	editor_plhres
	@EXIT
eisplhres	endp

setinversep	proc	near
	@PUSH
	@CHANGESEGM	DS,DATA
	mov	cx,49
	mov	bx,17
isb1:	cmp	byte ptr buffer1[bx],0
	jne	isb0
	inc	bx
	loop	isb1
	jmp	isbend
isb0:	push	cx
	mov	ax,bx
	sub	ax,17
	mov	cl,10
	div	cl
	push	ax
	mov	ah,0
	mov	cl,3
	mul	cl
	inc	al
	mov	cursy,al
	pop	ax
	mov	al,ah
	mov	ah,0
	mov	cl,7
	mul	cl
	inc	al
	inc	al
	mov	cursx,al
	@INVERSE	cursx,cursy,6
	inc	cursy
	@INVERSE	cursx,cursy,6
	inc	cursy
	@INVERSE	cursx,cursy,6
	pop	cx
	inc	bx
	loop	isb1
isbend:	@POP
	ret
setinversep	endp

editor_plhres	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	cursx,66
	mov	cursy,14
tst:	@FILLSTR	strbuf," ",8
	@WPRINT	57,17,strbuf
	mov	strbuf[2],0
	@WPRINT	41,17,strbuf
	call	sumbuf
	cmp	ax,0
	jne	mid22
	jmp	mid23
mid22:	@ITOA	strbuf,2
	@WPRINT	41,17,strbuf
	dec	ax
	mov	cl,24
	mul	cl
	sub	ax,4
	mov	bx,ax
	@CHANGESEGM	ds,DATA1
	mov	cx,lotsthl[bx]
	mov	dx,lotsthl[bx+2]
	@CHANGESEGM	ds,DATA
	mov	stl_plir,cx
	mov	stl_plir[2],dx
	@LTOA	stl_plir,stl_plir[2],strbuf
	@WPRINT	57,17,strbuf
mid23:	call	lotcursp
	call	check_extra
naf:	cmp	al,@ENTER
	je	p13
	cmp	al," "
	jne	noken
p13:	call	selectp
	jmp	tst
noken:	cmp	ah,@RIGHT_ARROW
	jne	nol
	cmp	cursx,63
	jb	no60
	mov	cursx,3
	jmp	tst
no60:	add	cursx,7
	jmp	tst
nol:	cmp	ah,@LEFT_ARROW
	jne	nor
	cmp	cursx,3
	ja	no3
	mov	cursx,66
	jmp	tst
no3:	sub	cursx,7
	jmp	tst
nor:	cmp	ah,@INS
	jne	nof
	call	setall
	jmp	tst
nof:	cmp	ah,@UP_ARROW
	jne	nou
	cmp	cursy,2
	ja	no2
	mov	cursy,14
	jmp	tst
no2:	sub	cursy,3
	jmp	tst
nou:	cmp	ah,@DOWN_ARROW
	jne	nod
	cmp	cursy,12
	jb	no12
	mov	cursy,2
	jmp	tst
no12:	add	cursy,3
nod:	jmp	tst
editor_plhres	endp

setall	proc	near
	mov	ah,cursy
	mov	al,cursx
	push	ax
	call	setinversep
	mov	cx,49
	mov	bx,17
ssp:	mov	al,byte ptr buffer1[bx]
	not	al
	and	al,1
	mov	byte ptr buffer1[bx],al
	inc	bx
	loop	ssp
	call	setinversep
	pop	ax
	mov	cursy,ah
	mov	cursx,al
	ret
setall	endp

setallboxes	proc	near
	@PUSH
	@CHANGESEGM	DS,DATA
	mov	cursx,2
	mov	cursy,1
	mov	cx,5
	mov	ax,1
sba2:	push	cx
	mov	cx,10
sba1:	@SETBOX	cursx,cursy,6,3,07h,1
	cmp	ax,50
	je	sba3
	@ITOA	strbuf,2
	add	cursx,2
	inc	cursy
	cmp	ariumoi,1
	je	kotas
	@WPRINT	cursx,cursy,strbuf
kotas:	sub	cursx,2
	dec	cursy
sba3:	add	cursx,7
	inc	ax
	loop	sba1
	add	cursy,3
	mov	cursx,2
	pop	cx
	loop	sba2
	@POP
	retf
setallboxes	endp

lotcursp proc	near
crs1:	@INVERSE	cursx,cursy,4
	@WAIT	3
	pushf
	@INVERSE	cursx,cursy,4
	popf
	jc	crs2
	@WAIT	2
	jnc	crs1
crs2:	@UPPERAX
	ret
lotcursp endp

selectp	proc	near
	cmp	cursx,66
	jne	psel1
	cmp	cursy,14
	jne	psel1
	ret
psel1:	@PUSH
	xor	ax,ax
	mov	al,cursx
	sub	al,3
	mov	cl,7
	div	cl
	push	ax
	xor	ax,ax
	mov	al,cursy
	sub	al,2
	mov	cl,3
	div	cl
	mov	cl,10
	mul	cl
	pop	cx
	add	ax,cx
	mov	bx,ax
	add	bx,17
	mov	al,byte ptr buffer1[bx]
	not	al
	and	al,1
	mov	byte ptr buffer1[bx],al
	dec	cursx
	dec	cursy
	@INVERSE	cursx,cursy,6
	inc	cursy
	@INVERSE	cursx,cursy,6
	inc	cursy
	@INVERSE	cursx,cursy,6
	inc	cursx
	dec	cursy
	@POP
	ret
selectp	endp

sumbuf	proc	near
	@PUSHAX
	@CHANGESEGM	ds,DATA
	xor	ax,ax
	mov	bx,17
	mov	cx,49
sum2:	cmp	buffer1[bx],0
	je	sum1
	inc	ax
sum1:	inc	bx
	loop	sum2
	@POPAX
	ret
sumbuf	endp

plir_meta proc	near
	@PUSH
	mov	ax,1
	mov	cx,49
	mov	bx,17
plm2:	cmp	buffer1[bx],0
	je	plm1
	mov	buffer1[bx],al
plm1:	inc	ax
	inc	bx
	loop	plm2
	call	sumbuf
	cmp	al,6
	jae	ok
	@POP
	stc
	ret
ok:	@POP
	clc
	ret
plir_meta endp

;************************************************************************

check_extra	proc	near
	@PUSH
	mov	cs:isenter,0
	cmp	al,@ESCAPE
	jne	ceesc
	call	bgalton
	jmp	ceterma

ceesc:	cmp	ah,@FUNC1
	jne	nof1
	call	statist
	jmp	ceterma

nof1:	cmp	ah,@CTRL_F9
	jne	noclf1
	call	statistfor5
	jmp	ceterma

noclf1:	cmp	al,"O"
	jne	ceoo
	@POP
	stc
	ret

ceoo:	cmp	al,"+"
	jne	ceee
	call	epomeno
	jmp	ceterma

ceee:	cmp	al,"-"
	jne	cepp
	call	proigoumeno
	jmp	ceterma

cepp:	cmp	ah,@DEL
	jne	cess
	call	sbisimo
	jmp	ceterma

cess:	cmp	al,"T"
	jne	cett
cetab:	call	tonuelo
	jmp	ceterma

cett:	cmp	ah,@RIGHT_ARROW
	jne	cnarr
	mov	cs:isenter,1
	jmp	ceterma

cnarr:	cmp	ax,0
	jne	cnerr
	mov	cs:isenter,1
	jmp	ceterma

cnerr:	cmp	ah,@FUNC2
	jne	nff2
	call	pane_oro1
	jmp	ceterma

nff2:	cmp	ah,@FUNC3
	jne	nff3
	call	pane_omad1
	jmp	ceterma

nff3:	cmp	ah,@FUNC4
	jne	nff4
	call	input_omad1
	jmp	ceterma

nff4:
ceterma:
	@POP
	clc
	ret

callit	dw	0
oxx	dw	0
oyy	dw	0
isenter	db	0
check_extra	endp

pane_oro1 proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	call	balton
	jc	nor13
	call	far ptr pane_oro
	mov	sp,adress
	@POP
	retf
nor13:	@POP
	ret
pane_oro1 endp

pane_omad1 proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	call	balton
	jc	nom13
	call	far ptr pane_omad
	mov	sp,adress
	@POP
	retf
nom13:	@POP
	ret
pane_omad1 endp

input_omad1	proc	near
	@PUSH
	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	mov	ax,word ptr buffer1[1]
	call	far ptr input_omad
	@POP
	ret
input_omad1	endp

epomeno	proc	near
	@PUSH
	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	call	balton
	jnc	ep01
	@POP
	ret
ep01:	mov	si,user_pointer
	xor	cx,cx
	mov	cl,es:[si+3]
	add	si,cx
	mov	al,es:[si]
	cmp	al,0
	jne	exi
	push	si
	mov	si,user_pointer
	mov	al,es:[si]
	pop	si
exi:	mov	user_pointer,si
	mov	pios_oros,al
	mov	sp,adress
	@POP
	retf
epomeno	endp

proigoumeno	proc	near
	@PUSH
	call	balton
	jnc	pr02
	mov	si,user_pointer
	cmp	si,0
	jne	pr03
	@POP
	ret
pr03:	@CHANGESEGM	ds,WINDOWS
	@DELWINDI	99
pr02:	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	mov	si,user_pointer
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
	cmp	al,0
	jne	pr01
	@POP
	ret
pr01:	mov	pios_oros,al
	mov	sp,adress
	@POP
	retf
proigoumeno	endp

sbisimo	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wsbisim
	@WAITL
	@UPPERAX
	@DELWIND	wsbisim
	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	cmp	ah,@DEL
	je	sbnai
	@POP
	ret
sbnai:	@MBELL
	call	balton
	jnc	sb03
	@POP
	ret
sb03:	mov	si,user_pointer
	mov	al,es:[si]
	mov	cs:_boxpl,al
	xor	dx,dx
	mov	dl,es:[si+3]
	cmp	dx,0
	jne	sb02
	jmp	sbtec
sb02:	mov	bx,user_pointer
	mov	di,bx
	add	bx,dx
bal71:	mov	al,es:[bx]
	mov	es:[di],al
	inc	di
	inc	bx
	cmp	bx,end_pointer
	jbe	bal71
	mov	cx,100
bal87:	mov	byte ptr es:[di],0
	inc	di
	loop	bal87
	sub	end_pointer,dx
	dec	oroi_all
	call	far ptr bale_index
sbtec:	mov	si,user_pointer
	mov	al,es:[si]
	cmp	al,0
	jne	sbok
	call	proigoumeno
sbok:	mov	pios_oros,al
	cmp	cs:_boxpl,"0"
	jne	isno0
	call	far ptr gentaj
isno0:	mov	sp,adress
	@POP
	retf
_boxpl	db	0
sbisimo	endp

balton	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	ax,cs:callit
	cmp	ax,0
	je	bal01
	call	ax
	jnc	bal01
	jmp	baler
;**********************************
;***       „Š„‚•Ž‘ Ž‹€ƒ€‘       ***
;**********************************
bal01:	cmp	buffer1,"0"
	je	bbb1
	cmp	buffer1,":"
	je	bbb1
	cmp	word ptr buffer1[1],0
	ja	bbb0
	jmp	baler
bbb0:	cmp	word ptr buffer1[1],999
	jbe	bbb1
	jmp	baler
;**********************************
;***     META”Ž€ ‘„ ‹€‘’„     ***
;**********************************
bbb1:	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	cmp	buffer1[3],0
	jne	bal001
	jmp	baler
bal001:	call	balekena
	mov	si,user_pointer
	mov	al,buffer1
	cmp	es:[si],al
	jne	bal03
	jmp	edit
;**********************************
;***         NEO‘ ŽŽ‘          ***
;**********************************
bal03:	cmp	buffer1,":"
	jne	bba18
	call	far ptr gentaj
	@CHANGESEGM	ds,CODE
	mov	ax,word ptr pezonte[":"*2]
	@CHANGESEGM	ds,DATA
	cmp	ax,0
	je	bba18
	call	bgalekena
	jmp	baler
bba18:	mov	ax,user_pointer
	mov	cs:_user_p,ax
	mov	si,end_pointer
	mov	user_pointer,si
	inc	end_oros
	mov	ax,end_oros
	mov	word ptr buffer1[6],ax
	mov	buffer1[4],254
	mov	buffer1[5],254
	xor	cx,cx
	mov	cl,buffer1[3]
	add	end_pointer,cx
	cmp	end_pointer,65000
	jbe	xorai
	sub	end_pointer,cx
	dec	end_oros
	mov	ax,cs:_user_p
	mov	user_pointer,ax
	call	bgalekena
	jmp	baler
_user_p	dw	0
xorai:	xor	bx,bx
bal09:	mov	al,buffer1[bx]
	mov	es:[si],al
	inc	bx
	inc	si
	loop	bal09
	inc	oroi_all
	jmp	bal02
;**********************************
;***            EDIT            ***
;**********************************
edit:	mov	si,user_pointer
	xor	ax,ax
	mov	al,buffer1[3]
	cmp	es:[si+3],al
	jne	bal04
;**********************************
;***         IƒˆŽ ‹†‰Ž‘         ***
;**********************************
bal05:	mov	si,user_pointer
	mov	ax,user_oros
	mov	word ptr buffer1[6],ax
	mov	buffer1[4],254
	mov	buffer1[5],254
	xor	cx,cx
	mov	cl,buffer1[3]
	mov	bx,0
bal061:	mov	al,buffer1[bx]
	mov	es:[si],al
	inc	bx
	inc	si
	loop	bal061
	jmp	bal02
;**********************************
;***         AŠŠŽ ‹†‰Ž‘         ***
;**********************************
bal04:	cmp	es:[si+3],al
	ja	maxim
;**********************************
;***      MEGALYTERO ‹†‰Ž‘      ***
;**********************************
	sub	al,es:[si+3]
	mov	bx,end_pointer
	add	end_pointer,ax
	cmp	end_pointer,65000
	jbe	xorai1
	sub	end_pointer,ax
	call	bgalekena
	jmp	baler
xorai1:	mov	di,bx
	add	di,ax
bal06:	mov	al,es:[bx]
	mov	es:[di],al
	dec	di
	dec	bx
	cmp	bx,si
	ja	bal06
	jmp	bal05
;**********************************
;***    MIKROTERO ‹†‰Ž‘         ***
;**********************************
maxim:	xor	dx,dx
	mov	dl,es:[si+3]
	sub	dx,ax
	mov	bx,user_pointer
	mov	di,bx
	add	bx,dx
bal07:	mov	al,es:[bx]
	mov	es:[di],al
	inc	di
	inc	bx
	cmp	bx,end_pointer
	jbe	bal07
	mov	cx,100
bal88:	mov	byte ptr es:[di],0
	inc	di
	loop	bal88
	sub	end_pointer,dx
	jmp	bal05
	jmp	bal02
;**********************************
baler:	@POP
	stc
	ret
bal02:	cmp	buffer1,"0"
	jne	b181
	call	far ptr gentaj
b181:	@ZEROBBUF	buffer1,200
	@ZEROBBUF	buffer2,200
	@CHANGESEGM	ds,WINDOWS
	@DELWINDI	99
	@POP
	clc
	ret
balton	endp

balekena	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,200
	@ZEROBBUF	buffer1,200
	xor	cx,cx
	mov	cl,buffer2[3]
	mov	bx,0
	mov	si,0
bal61:	cmp	si,5
	jne	bal62
	add	si,3
bal62:	mov	al,buffer2[bx]
	mov	buffer1[si],al
	inc	bx
	inc	si
	loop	bal61
	add	byte ptr buffer1[3],3
	@POP
	ret
balekena	endp	

bgalekena	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer1,buffer2,200
	@ZEROBBUF	buffer1,200
	xor	cx,cx
	mov	cl,buffer2[3]
	mov	bx,0
	mov	si,0
	mov	cs:_keri,8
bgal61:	cmp	si,cs:_keri
	jne	bgal62
	mov	si,5
	mov	cs:_keri,0
bgal62:	mov	al,buffer2[bx]
	mov	buffer1[si],al
	inc	bx
	inc	si
	loop	bgal61
	sub	byte ptr buffer1[3],3
	@POP
	ret
_keri	dw	0
bgalekena	endp	

tonuelo	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	call	balton
	jnc	to01
	@POP
	ret
to01:	mov	si,user_pointer
	xor	cx,cx
	mov	cl,es:[si+3]
	add	si,cx
	mov	al,es:[si]
	mov	user_pointer,si
	mov	pios_oros,0
	mov	sp,adress
	@POP
	retf
tonuelo	endp

bgalton	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@DELWINDI	99
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	mov	si,user_pointer
	xor	cx,cx
	mov	cl,es:[si+3]
	add	si,cx
	mov	al,es:[si]
	mov	user_pointer,si
	mov	pios_oros,0
	@ZEROBBUF	buffer1,200
	@ZEROBBUF	buffer2,200
	mov	sp,adress
	@POP
	retf
bgalton	endp

statistfor5	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	statfor5,1
	call	statist
	mov	statfor5,0
	@POP
	ret
statistfor5	endp

statist	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,PINOROI
	@STRCOPY	buffer1,buffer3,200
	mov	ax,cs:callit
	cmp	ax,0
	je	sbal01
	call	ax
	jnc	sbal01
	jmp	sbaler
sbal01:	cmp	buffer1[3],0
	jne	sbal02
	jmp	sbaler
sbal02:	@CHANGESEGM	DS,WINDOWS
	@TAKEWIND
	push	ax
	@SETWIND	wstator
	@SETWIND	wstat1
	@CHANGESEGM	ds,DATA
	cmp	buffer1,"0"
	jne	noplr
	mov	word ptr buffer1[5],offset CODE1:bas3
	mov	word ptr buffer1[7],offset CODE1:bas2
	mov	word ptr buffer1[9],offset CODE1:bas1
	mov	buffer1[66],6
	mov	buffer1[67],6
	mov	buffer1[68],0
	mov	buffer1[69],6
noplr:	call	balekena
sbal03:	@ZEROBBUF	es:stator,200
	mov	si,0
	xor	cx,cx
	mov	cl,buffer1[3]
	xor	bx,bx
sbal09:	mov	al,buffer1[bx]
	mov	es:stator[si],al
	inc	bx
	inc	si
	loop	sbal09
	mov	ax,offset es:stator
	mov	pinomad[18],ax
	mov	pinomad,1
	mov	aplesprot,0
	mov	omades,0
	mov	yperom,0
	mov	statistikh,1
	call	far ptr lgenitr
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wstat1
	@SELECTWIND	wstator
	@CHANGESEGM	ds,DATA
	@LTOA	statstil,statstil[2],strbuf
	@WPRINT	16,3,strbuf
	@LTOA	sthles,sthles[2],strbuf
	@WPRINT	16,4,strbuf
	mov	ax,sthles
	mov	cx,100
	mul	cx
	mov	cx,statstil
	cmp	cx,0
	jne	no00
	jmp	skara
no00:	div	cx
	@ITOA	strbuf,3
	@WPRINT	16,14,strbuf
	@WPRINTCH	19,14,"."
	mov	ax,dx
	mov	si,10
	mul	si
	div	cx
	add	ax,30h
	mov	strbuf,al
	mov	ax,dx
	mov	si,10
	mul	si
	div	cx
	add	ax,30h
	mov	strbuf[1],al
	mov	strbuf[2]," "
	mov	strbuf[3],"%"
	mov	strbuf[4],0
	@WPRINT	20,14,strbuf
	@ITOA	strbuf,5,stat_epanal
	@WPRINT	16,7,strbuf
	@ITOA	strbuf,5,stat_kauist
	@WPRINT	16,8,strbuf
	@ITOA	strbuf,5,stat_tepanal
	@WPRINT	16,11,strbuf
	@ITOA	strbuf,5,stat_tkauist
	@WPRINT	16,12,strbuf
	@WPRINT	2,16,mpattaf,@FLASH
	@MBELL
	@WAITL
skara:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wstator
	pop	dx
	@SELECTWI	dl
sbaler:	@CHANGESEGM	ds,DATA
	@STRCOPY	buffer3,buffer1,200
	@POP
	ret
statist	endp

bale_index	proc	near
	@PUSH
	@CHANGESEGM	es,PINOROI
	@CHANGESEGM	ds,DATA
	mov	si,0
	mov	cx,1
	xor	dx,dx
bi001:	mov	dl,es:[si+3]
	cmp	dx,0
	je	bi002
	mov	word ptr es:[si+6],cx
	add	si,dx
	inc	cx
	jmp	bi001
bi002:	dec	cx
	mov	end_oros,cx
	@POP
	retf
bale_index	endp

CODEO	ends
	end
