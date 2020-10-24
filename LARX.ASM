
INCLUDE	koina.inc

code	segment	public

	assume	cs:code

savesys	proc	near
;**********************************
IFNDEF	@DEMO
;**********************************
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	@STRCOPY	filename,strbuf1,8
	cmp	end_pointer,0
	jne	okit2
	@POP
	clc
	ret
okit2:	call	in_name
	cmp	filename,"."
	jne	okit
	@STRCOPY	strbuf1,filename,8
	@POP
	stc
	ret
okit:	@TESTFILE	filedisk
	jc	okit1
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,strbuf,myparx1,myparx2
	jnc	okit1
	cmp	ax,0
	je	okit2
	@STRCOPY	strbuf1,filename,8
	@POP
	stc
	ret
okit1:	call	far ptr gentaj
	mov	es:is_error,0
	@CREATE_HANDLE	filedisk,0
	cmp	es:is_error,0
	je	part2
	jmp	errorsave
part2:	mov	cs:handle,ax
	@WRITE_HANDLE	cs:handle,end_pointer,4
	@WRITE_HANDLE	cs:handle,metabl,1
	@WRITE_HANDLE	cs:handle,sys_stat,2
	@WRITE_HANDLE	cs:handle,kiros,2
	@WRITE_HANDLE	cs:handle,strbuf,40	;malakies
	@WRITE_HANDLE	cs:handle,strbuf,40	;malakies
	@WRITE_HANDLE	cs:handle,sthles_old,4
	@WRITE_HANDLE	cs:handle,pinomad,848	;malakies
	@WRITE_HANDLE	cs:handle,apliprot[64],64
	@WRITE_HANDLE	cs:handle,sinuprot,816
	@WRITE_HANDLE	cs:handle,apliprot,64
	@WRITE_HANDLE	cs:handle,pinomad,24000
	jnc	pari0
	jmp	errorsave
pari0:	@WRITE_HANDLE	cs:handle,pinyper,2000
	@WRITE_HANDLE	cs:handle,filtra,2
	@WRITE_HANDLE	cs:handle,idosmet,1
	jnc	pari1
	jmp	errorsave
pari1:	@WRITE_HANDLE	cs:handle,user_pointer,4
	@WRITE_HANDLE	cs:handle,end_oros,2
	@WRITE_HANDLE	cs:handle,user_oros,2
	mov	ax,end_pointer
	mov	cs:bytes,ax
	@CHANGESEGM	ds,PINOROI
	@WRITE_MEM	cs:handle,0,cs:bytes
	jnc	pari2
	jmp	errorsave
pari2:	@CLOSE_HANDLE	cs:handle
	cmp	es:is_error,1
	je	errorsave
	@CHANGESEGM	ds,DATA
	@STRCOPY	filename,fileold,15
	@POP
	clc
	ret
errorsave:
	@BELL
	@BELL
	@CLOSE_HANDLE	cs:handle
	@POP
	stc
;**********************************
ENDIF
;**********************************
	ret
handle	dw	0
bytes	dw	0
savesys	endp

autosave	proc	near
;**********************************
IFNDEF	@DEMO
;**********************************
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	cmp	end_pointer,0
	jne	okita2
	@POP
	ret
okita2:	mov	es:is_error,0
	@CREATE_HANDLE	autosave_file,0
	cmp	es:is_error,0
	je	parta2
	jmp	errasave
parta2:	mov	cs:handle,ax
	@WRITE_HANDLE	cs:handle,end_pointer,4
	@WRITE_HANDLE	cs:handle,metabl,1
	@WRITE_HANDLE	cs:handle,sys_stat,2
	@WRITE_HANDLE	cs:handle,kiros,2
	@WRITE_HANDLE	cs:handle,strbuf,40	;malakies
	@WRITE_HANDLE	cs:handle,strbuf,40	;malakies
	@WRITE_HANDLE	cs:handle,sthles_old,4
	@WRITE_HANDLE	cs:handle,pinomad,848	;malakies
	@WRITE_HANDLE	cs:handle,apliprot[64],64
	@WRITE_HANDLE	cs:handle,sinuprot,816
	@WRITE_HANDLE	cs:handle,apliprot,64
	@WRITE_HANDLE	cs:handle,pinomad,24000
	jnc	paria0
	jmp	errasave
paria0:	@WRITE_HANDLE	cs:handle,pinyper,2000
	@WRITE_HANDLE	cs:handle,filtra,2
	@WRITE_HANDLE	cs:handle,idosmet,1
	jnc	paria1
	jmp	errasave
paria1:	@WRITE_HANDLE	cs:handle,user_pointer,4
	@WRITE_HANDLE	cs:handle,end_oros,2
	@WRITE_HANDLE	cs:handle,user_oros,2
	mov	ax,end_pointer
	mov	cs:bytes,ax
	@CHANGESEGM	ds,PINOROI
	@WRITE_MEM	cs:handle,0,cs:bytes
	jnc	paria2
	jmp	errasave
paria2:	@CLOSE_HANDLE	cs:handle
	cmp	es:is_error,1
	je	errasave
	@POP
	ret
errasave:
	@CLOSE_HANDLE	cs:handle
	@POP
;**********************************
ENDIF
;**********************************
	ret
autosave	endp

loadsys	proc	near
;**********************************
IFNDEF	@DEMO
;**********************************
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	cmp	end_pointer,0
	je	okit99
	@NAIOXI	34,6,mload,mejod1,mejod2
	jnc	lkit1
	cmp	ax,0
	je	lkit2
	@POP
	ret
lkit1:	call	savesys
lkit2:	call	clrsys
	jmp	okit98
okit99:	cmp	meisagf," "
	jne	lkit2
	cmp	meisagf,0
	jne	lkit2
okit98:	@DISKDIR	filename,directory,mload
	call	addext
	cmp	filename,"."
	jne	oklo
	@POP
	ret
oklo:	mov	es:is_error,0
	@OPEN_HANDLE	filedisk,I_RW
	mov	cs:handle,ax
	@READ_HANDLE	cs:handle,end_pointer,4
	@READ_HANDLE	cs:handle,metabl,1
	@READ_HANDLE	cs:handle,sys_stat,2
	@READ_HANDLE	cs:handle,kiros,2
	@READ_HANDLE	cs:handle,strbuf,40	;malakies
	@READ_HANDLE	cs:handle,strbuf,40	;malakies
	@READ_HANDLE	cs:handle,sthles_old,4
	@READ_HANDLE	cs:handle,pinomad,848	;malakies
	@READ_HANDLE	cs:handle,apliprot[64],64
	@READ_HANDLE	cs:handle,sinuprot,816
	@READ_HANDLE	cs:handle,apliprot,64
	@READ_HANDLE	cs:handle,pinomad,24000
	jnc	lkit02
	jmp	errorload
lkit02:	@READ_HANDLE	cs:handle,pinyper,2000
	@READ_HANDLE	cs:handle,filtra,2
	@READ_HANDLE	cs:handle,idosmet,1
	@READ_HANDLE	cs:handle,user_pointer,4
	@READ_HANDLE	cs:handle,end_oros,2
	@READ_HANDLE	cs:handle,user_oros,2
	mov	ax,end_pointer
	mov	cs:bytes,ax
	@CHANGESEGM	ds,PINOROI
	@READ_MEM	cs:handle,0,cs:bytes
	jnc	lkit03
	jmp	errorload
lkit03:	@CLOSE_HANDLE	cs:handle
	cmp	es:is_error,1
	jne	nerrt
	jmp	errorload
nerrt:	@CHANGESEGM	ds,DATA
	mov	load,1
	call	far ptr gentaj
	mov	load,0
	@STRCOPY	filename,fileold,15
	call	versions
	@POP
	ret
errorload:
	@BELL
	@BELL
	@CLOSE_HANDLE	cs:handle
	call	clrsys
	@POP
;**********************************
ENDIF
;**********************************
	ret
loadsys	endp

versions	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	kiros,@VERSION
	je	isvers
	cmp	kiros,65530
	jne	piopalia
	jmp	palia
piopalia:
	@ZEROBBUF	apliprot[64],64
	cmp	kiros,65534
	jae	neos
neos:	cmp	kiros,65534
	jne	kirts
palia: 	mov	cx,999
	mov	si,0
clr999:	mov	pinomad[si+10],9999
	mov	pinomad[si+16],9999
	add	si,24
	loop	clr999
isvers:	mov	kiros,@VERSION
	@POP
	ret
kirts: 	mov	cx,999
	mov	si,0
clr998:	mov	pinomad[si+10],9999
	mov	pinomad[si+16],9999
	add	si,24
	loop	clr998
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	paliaver
janak:	@BELL
	@PLHKTRO
	@UPPERAX
	cmp	al,"T"
	jne	janak
	@DELWIND	paliaver
	@POP
	ret
versions	endp

end_lotto	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	cmp	end_pointer,0
	je	ekit2
	@NAIOXI	34,6,mejod,mejod1,mejod2
	jnc	ekit1
	cmp	ax,0
	je	ekit2
ekit3:	@POP
	ret
ekit1:	call	savesys
	jc	ekit3
ekit2:	@FILLSCR	" ",07h
	@EXIT
end_lotto	endp

addsys	proc	near
;**********************************
IFNDEF	@DEMO
;**********************************
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,MCODE
	cmp	end_pointer,0
	je	isload
	jmp	isadd
isload:	call	loadsys
	@POP
	ret
isadd:	@STRCOPY	filename,strbuf1,15
	@DISKDIR	filename,directory,mload
	call	addext
	cmp	filename,"."
	jne	aoklo
	@POP
	ret
aoklo:	call	far ptr gentaj
	mov	es:is_error,0
	@OPEN_HANDLE	filedisk,I_RW
	mov	cs:handle,ax
	@READ_HANDLE	cs:handle,temp1,4
	mov	ax,end_pointer
	add	ax,temp1
	jnc	mikro
kakos:	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmergem
	@MBELL
	@PLHKTRO
	@DELWIND	wmergem
	@CHANGESEGM	ds,DATA
	jmp	alkit3
mikro:	cmp	ax,65000
	ja	kakos
	@READ_HANDLE	cs:handle,strbuf,1
	@READ_HANDLE	cs:handle,strbuf,2
	@READ_HANDLE	cs:handle,kiros,2
	@READ_HANDLE	cs:handle,strbuf,40
	@READ_HANDLE	cs:handle,strbuf,40
	@READ_HANDLE	cs:handle,strbuf,4
	@READ_HANDLE	cs:handle,paxb,848	;malakies
	@CHANGESEGM	ds,METABS
	@READ_HANDLE	cs:handle,metablbuf[64],64		;apliprot1
	@CHANGESEGM	ds,DATA
	@READ_HANDLE	cs:handle,paxb,816
;*************************************************
	@CHANGESEGM	ds,METABS
	@READ_HANDLE	cs:handle,metablbuf,64			;apliprot2
	@READ_HANDLE	cs:handle,metablbuf[1000],26000 	;24000:pinomad
								;2000:pinyper
	jnc	alkit2
	jmp	erroradd
alkit2:	call	mergesys
	jnc	alkit21
	jmp	errormerge
alkit21:
	@CHANGESEGM	ds,DATA
;*************************************************
	@READ_HANDLE	cs:handle,strbuf,2
	@READ_HANDLE	cs:handle,strbuf,1
	@READ_HANDLE	cs:handle,strbuf,4
	@READ_HANDLE	cs:handle,strbuf,2
	@READ_HANDLE	cs:handle,strbuf,2
;*************************************************
	mov	dx,temp1
	mov	cs:bytes,dx
	mov	ax,end_pointer
	mov	user_pointer,ax
	mov	cs:topos,ax
	add	end_pointer,dx
	@CHANGESEGM	ds,PINOROI
	@READ_MEM	cs:handle,cs:topos,cs:bytes
	jnc	alkit3
	jmp	erroradd
alkit3:	@CLOSE_HANDLE	cs:handle
	cmp	es:is_error,1
	je	erroradd
	@CHANGESEGM	ds,DATA
	mov	load,1
	call	far ptr gentaj
	mov	load,0
	@STRCOPY	strbuf1,filename,15
	@POP
	ret
erroradd:
	@MBELL
	@MBELL
	@CLOSE_HANDLE	cs:handle
	call	clrsys
	@POP
	ret
errormerge:
	@MBELL
	@MBELL
	@CLOSE_HANDLE	cs:handle
	@POP
;**********************************
ENDIF
;**********************************
	ret
topos	dw	0,0
addsys	endp

mergesys proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,METABS
	mov	cx,998
	mov	bx,24
	mov	si,1024
merge2:	cmp	word ptr pinomad[bx],0
	je	merge1
	cmp	word ptr es:metablbuf[si],0
	je	merge1
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmergeo
	@MBELL
	@PLHKTRO
	@DELWIND	wmergeo
	@CHANGESEGM	ds,DATA
	@POP
	stc
	ret
merge1:	add	bx,24
	add	si,24
	loop	merge2
	mov	cx,2000
	mov	bx,0
	mov	si,25000
merge4:	cmp	word ptr pinyper[bx],0
	je	merge3
	cmp	word ptr es:metablbuf[si],0
	je	merge3
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmergey
	@MBELL
	@PLHKTRO
	@DELWIND	wmergey
	@CHANGESEGM	ds,DATA
	@POP
	stc
	ret
merge3:	inc	bx
	inc	bx
	inc	si
	inc	si
	loop	merge4
	cmp	kiros,65530
	je	okp12
	@ZEROBBUF	es:metablbuf[64],64
okp12:	mov	cx,15
	mov	bx,0
	xor	ax,ax
pnken:	cmp	apliprot[bx],0
	je	pkeno
	inc	ax
pkeno:	add	bx,8
	loop	pnken
	mov	cx,15
	mov	bx,0
	xor	dx,dx
pnken1:	cmp	es:metablbuf[bx],0
	je	pkeno1
	inc	dx
pkeno1:	add	bx,8
	loop	pnken1
	add	ax,dx
	cmp	ax,15
	jbe	protok
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmergep
	@MBELL
	@PLHKTRO
	@DELWIND	wmergep
	@CHANGESEGM	ds,DATA
	@POP
	stc
	ret
;*******************************************
protok:	mov	cx,999
	mov	bx,24
	mov	si,1024
merg21:	cmp	word ptr pinomad[bx],0
	jne	merg11
	push	cx
	push	bx
	push	si
	mov	cx,12
merg42:	mov	ax,word ptr es:metablbuf[si]
	mov	pinomad[bx],ax
	add	bx,2
	add	si,2
	loop	merg42
	pop	si
	pop	bx
	pop	cx
merg11:	add	bx,24
	add	si,24
	loop	merg21
;-------------------------------------------
	mov	cx,2000
	mov	bx,0
	mov	si,25000
merg41:	cmp	word ptr pinyper[bx],0
	jne	merg31
	mov	ax,word ptr es:metablbuf[si]
	mov	pinyper[bx],ax
merg31:	inc	bx
	inc	bx
	inc	si
	inc	si
	loop	merg41
	mov	cx,15
	mov	bx,0
pnken2:	cmp	apliprot[bx],0
	je	pkeno2
	add	bx,8
	loop	pnken2
pkeno2:	mov	cx,15
	mov	si,0
pnken3:	cmp	es:metablbuf[si],0
	je	pkeno4
	push	cx
	mov	cx,8
pnk23:	mov	al,es:metablbuf[si]
	mov	byte ptr apliprot[bx],al
	inc	bx
	inc	si
	loop	pnk23
	pop	cx
	loop	pnken3
pkeno4:	@POP
	clc
	ret
mergesys endp

in_disk	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
ind011:	@INDISK	38,9,directory
	jc	ind01
	mov	dl,al
	@TESTDRIVE	dl
	jc	ind011
	mov	directory,al
	mov	filedisk,al
	mov	megadir,al
	@CHANGE_DIR	megadir
	clc
ind01:	@POP
	ret
in_disk	endp

in_name	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wsave
	@SELECTWIND	wsave
	@CHANGESEGM	ds,DATA
	@FILLSTR	filename," ",8
	mov	filename[8],0
janar1:	@WINPUT	22,3,filename
	mov	ax,offset filename
	call	chk_namefile
	jc	janar1
	call	addext
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wsave
	@POP
	ret
in_name	endp

arx_ejag proc	near
;**********************************
IFNDEF	@DEMO
;**********************************
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	wmnimi
okit31:	@CHANGESEGM	ds,WINDOWS
	call	in_disks
	jnc	wwww
	jmp	okit41
wwww:	@SELECTWIND	wmnimi
	@CHANGESEGM	ds,DATA
janar:	@WINPUT	22,3,mejagf
	mov	ax,offset mejagf
	call	chk_namefile
	jc	janar
	@FILLSTR	ejagf,0,15
	@STRCOPY	mejagf,ejagf,8
	lea	bx,ejagf
	call	addext1
	cmp	ejagf,"."
	jne	okit22
	jmp	skato
okit22:	@TESTFILE	ejagdisk
	jc	okit21
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,strbuf,myparx3,myparx2
	jnc	okit41
	cmp	ax,1
	je	skato
	jmp	okit31
skato:	@FILLSTR	mejagf," ",8
	jmp	okit41
okit21:	@CREATE_HANDLE	ejagdisk,0
	mov	cs:handle,ax
	@CLOSE_HANDLE	cs:handle
okit41:	@TOUPPER	mejagf
	@CHANGESEGM	ds,WINDOWS
	@DELWIND	wmnimi
	@POP
;**********************************
ENDIF
;**********************************
	ret
arx_ejag endp

chk_namefile	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	bx,ax
	xor	dx,dx
	mov	cx,8
chknf:	cmp	byte ptr [bx],"."
	je	ernamf
	cmp	byte ptr [bx],"*"
	je	ernamf
	cmp	byte ptr [bx],"?"
	je	ernamf
	cmp	byte ptr [bx],","
	je	ernamf
	cmp	byte ptr [bx],"\"
	je	ernamf
	cmp	byte ptr [bx],"/"
	je	ernamf
	cmp	byte ptr [bx],":"
	je	ernamf
	cmp	byte ptr [bx],"`"
	je	ernamf
	cmp	byte ptr [bx],";"
	je	ernamf
	cmp	byte ptr [bx]," "
	jne	chknf1
	inc	dx
	jmp	chknf2
chknf1:	cmp	dx,0
	jne	ernamf
chknf2:	inc	bx
	loop	chknf
	@POP
	clc
	ret
ernamf:	@MBELL
	@POP
	stc
	ret
chk_namefile	endp

arx_eisag proc	near
;**********************************
IFNDEF	@DEMO
;**********************************
	@PUSH
	@CHANGESEGM	ds,DATA
	call	far ptr gentaj
	cmp	plhroi,0
	jne	skata
	call	in_diskl
	jc	skata
	@FILLSTR	meisagf," ",8
	@FILLSTR	eisagf,0,15
	@DISKDIR	meisagf,dirmnimi,mmnimi
	@STRCOPY	meisagf,eisagf,8
	@ENDCHAR	meisagf,8
	lea	bx,eisagf
	call	addext1
skata:	@POP
;**********************************
ENDIF
;**********************************
	ret
arx_eisag endp

in_diskl proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
indl11:	@INDISK	38,9,dirmnimi
	jc	indl1
	mov	dl,al
	@TESTDRIVE	dl
	jc	indl11
	mov	dirmnimi,al
	mov	eisagdisk,al
	mov	filedisk,al
	mov	megadir,al
	@CHANGE_DIR	megadir
	clc
indl1:	@POP
	ret
in_diskl endp

in_disks proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
inds11:	@INDISK	38,9,ejagdisk
	jc	inds1
	mov	dl,al
	@TESTDRIVE	dl
	jc	inds11
	mov	ejagdisk,al
	mov	megadir,al
	@CHANGE_DIR	megadir
	clc
inds1:	@POP
	ret
in_disks endp

addext1	proc	near
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
	mov	byte ptr [bx+3],"L"
	mov	byte ptr [bx+4],0
	@POP
	ret
addext1	endp

addext	proc	near
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
	mov	filename[bx+1],"L"
	mov	filename[bx+2],"9"
	mov	filename[bx+3],"2"
	mov	filename[bx+4],0
	@POP
	ret
addext	endp

deletef	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	filedisk,strbuf1,10
	@STRCOPY	directory,strbuf1[15],2
	call	in_disk
	jnc	allod
	jmp	nodel
allod:	@SELECT_DRIVE	directory
	@DISKDIR	filename,directory,mdelsys
	@STRCOPY	filename,mdelm[19],8
	call	addext
	cmp	filename,"."
	je	nodel
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,mdelsys,strbuf,mdelm
	jnc	dkit1
	cmp	ax,0
	je	allod
	jmp	nodel
dkit1:	mov	ax,offset filedisk
	call	delfile
	jmp	allod
nodel:	@STRCOPY	strbuf1,filedisk,10
	@STRCOPY	strbuf1[15],directory,2
	@POP
	ret
deletef	endp

deletes	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@STRCOPY	filedisk,strbuf1,10
	@STRCOPY	dirmnimi,strbuf1[15],2
	@STRCOPY	eisagdisk,strbuf1[20],2
	call	in_diskl
	jnc	sallod
	jmp	snodel
sallod:	@SELECT_DRIVE	dirmnimi
	@DISKDIR	filename,dirmnimi,mdelstl
	@STRCOPY	filename,mdelm[19],8
	lea	bx,filename
	call	addext1
	cmp	filename,"."
	je	snodel
	@STRCMP	filedisk,nikitries
	jnc	sallod
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,mdelstl,strbuf,mdelm
	jnc	sdkit1
	cmp	ax,0
	je	sallod
	jmp	snodel
sdkit1:	mov	ax,offset filedisk
	call	delfile
	jmp	sallod
snodel:	@STRCOPY	strbuf1,filedisk,10
	@STRCOPY	strbuf1[15],dirmnimi,2
	@STRCOPY	strbuf1[20],eisagdisk,2
	@POP
	ret
deletes	endp

delfile	proc	near
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
delfile	endp

addfile	proc	near
	@PUSH
	@CHANGESEGM	ds,WINDOWS
	@SETWIND	waddf
	@SELECTWIND	waddf
	@CHANGESEGM	ds,DATA
	@INDISK	38,9,direnosi
	jnc	addf0
	jmp	addf99
addf0:	mov	eisagenosi1,al
	mov	eisagenosi2,al
	mov	ejagenosi,al
	mov	direnosi,al
	mov	megadir,al
	@CHANGE_DIR	megadir
	@FILLSTR	eisagenosi1[2],0,15
	@DISKDIR	eisagenosi1[2],direnosi,mmnimi
	@SELECTWI	40
	@WPRINT	23,3,eisagenosi1[2]
	lea	bx,eisagenosi1[2]
	call	addext1
	cmp	eisagenosi1[2],"."
	jne	addf1
	jmp	addf99

addf1:	@FILLSTR	eisagenosi2[2],0,15
	@DISKDIR	eisagenosi2[2],direnosi,mmnimi
	@SELECTWI	40
	@WPRINT	23,4,eisagenosi2[2]
	lea	bx,eisagenosi2[2]
	call	addext1
	cmp	eisagenosi2[2],"."
	jne	addf2
	jmp	addf99

addf2:	@STRCMP	eisagenosi1,eisagenosi2
	jc	addf3
	@MBELL
	jmp	addf99

addf3:	@SELECTWI	40
	@FILLSTR	ejagenosi[2]," ",8
	mov	ejagenosi[10],0
	@WINPUT	23,6,ejagenosi[2]
	mov	bx,offset ejagenosi[2]
	call	addext1
	cmp	ejagenosi[2],"."
	jne	addf30
	jmp	addf99

addf30:	@TOUPPER	ejagenosi
	@STRCMP	eisagenosi1,ejagenosi
	jc	addq1
	@MBELL
	jmp	addf99
addq1:	@STRCMP	eisagenosi2,ejagenosi
	jc	addq2
	@MBELL
	jmp	addf99
addq2:	@TESTFILE	ejagenosi
	jc	addf31
	mov	byte ptr strbuf,0
	@NAIOXI	34,6,strbuf,myparx1,myparx2
	jnc	addf31
	cmp	ax,0
	je	addq33
	jmp	addf99
addq33:	jmp	addf3
;*************************************************

addf31:	@OPEN_HANDLE	eisagenosi1,I_READ
	mov	cs:handle_loada,ax
	@CREATE_HANDLE	ejagenosi,0
	mov	cs:handle_save,ax
	@CHANGESEGM	ds,PINMNHMHL

addf9:	@READ_MEM	cs:handle_loada,0,65520
	jnc	addf4
	jmp	addf98
addf4:	mov	cx,10920
	mov	bx,0
addf7:	cmp	byte ptr [bx],0
	jne	addf5
	jmp	addf10
addf5:	add	bx,6
	loop	addf7
	@WRITE_MEM	cs:handle_save,0,65520
	jnc	addf8
	jmp	addf98
addf8:	jmp	addf9

addf10:	mov	si,bx
	@CHANGESEGM	ds,DATA
	@CLOSE_HANDLE	cs:handle_loada
	@OPEN_HANDLE	eisagenosi2,I_READ
	jnc	addf33
	jmp	addf98
addf33:	mov	cs:handle_loada,ax

addf19:	@CHANGESEGM	ds,PINMNHMHS
	@READ_MEM	cs:handle_loada,0,65520
	jnc	addf14
	jmp	addf98
addf14:	mov	cx,65520
	mov	bx,0
addf17:	@CHANGESEGM	ds,PINMNHMHS
	mov	al,[bx]
	@CHANGESEGM	ds,PINMNHMHL
	mov	[si],al
	cmp	si,65520
	jb	addf21
	@WRITE_MEM	cs:handle_save,0,65520
	xor	si,si
addf21:	cmp	al,0
	jne	addf15
	jmp	addf20
addf15:	inc	bx
	inc	si
	loop	addf17
	jmp	addf19

addf20:	@CHANGESEGM	ds,PINMNHMHL
	mov	byte ptr [si],0
	mov	byte ptr [si+1],0
	mov	byte ptr [si+2],0
	mov	byte ptr [si+3],0
	mov	byte ptr [si+4],0
	mov	byte ptr [si+5],0
	@WRITE_MEM	cs:handle_save,0,65520
addf98:	@CLOSE_HANDLE	cs:handle_loada
	@CLOSE_HANDLE	cs:handle_save
addf99:	@CHANGESEGM	ds,WINDOWS
	@DELWIND	waddf
	@POP
	ret
handle_loada	dw	0
handle_save	dw	0
addfile	endp

loadinf	proc	near
	@PUSH
;*********************************
IFNDEF	@DEMO
;*********************************
	@CHANGESEGM	ds,DATA
	@OPEN_HANDLE	inffile,I_READ
	jnc	ejof
	jmp	perni
ejof:	mov	cs:handlef,ax
	@READ_HANDLE	cs:handlef,stdial,49
	@READ_HANDLE	cs:handlef,timh,4
	@READ_HANDLE	cs:handlef,timhp,4
	@CLOSE_HANDLE	cs:handlef

perni:	@OPEN_HANDLE	prnfile,I_READ
	jnc	ejof1
	@POP
	ret
ejof1:	mov	cs:handlef,ax
	@READ_HANDLE	cs:handlef,ektip_lot,84
	@READ_HANDLE	cs:handlef,pcl_prn,6
	@CLOSE_HANDLE	cs:handlef
;*********************************
ENDIF
;*********************************
	@POP
	ret
loadinf	endp

save_inf	proc	near
	@PUSH
;*********************************
IFNDEF	@DEMO
;*********************************
	@CHANGESEGM	ds,DATA
	@CREATE_HANDLE	inffile,0
	mov	cs:handlef,ax
	@WRITE_HANDLE	cs:handlef,stdial,49
	@WRITE_HANDLE	cs:handlef,timh,4
	@WRITE_HANDLE	cs:handlef,timhp,4
	@CLOSE_HANDLE	cs:handlef

	@CREATE_HANDLE	prnfile,0
	mov	cs:handlef,ax
	@WRITE_HANDLE	cs:handlef,ektip_lot,84
	@WRITE_HANDLE	cs:handlef,pcl_prn,6
	@CLOSE_HANDLE	cs:handlef
;*********************************
ENDIF
;*********************************
	@POP
	ret
handlef	dw	0
save_inf	endp

code	ends
	end
