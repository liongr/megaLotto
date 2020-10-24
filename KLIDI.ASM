
include	snaioxi.inc
include	mylib.inc
include	klidi.inc
include	xaza.inc

	assume	cs:MCODE1

MCODE1	segment	public

klid_sect	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@XAZOMARES

	call	new_int_all

	@XAZOMARES
	@XAZOMARES
	@TESTFORDEBUG
	@XAZOMARES
	@XAZOMARES

	call	TestIfFirst

	@XAZOMARES
	@XAZOMARES
	@TESTFORDEBUG
	@XAZOMARES

	cmp	FirstTime,0
	jne	nofir
	jmp	isold

nofir:	cmp	FirstTime,1
	jne	nofir1
	jmp	isfir1

nofir1:	call	is_hacker

isfir1:	@XAZOMARES
	mov	ax,10001
	call	InputCode
	@XAZOMARES
	@XAZOMARES
	call	CreateConfigFiles
	@XAZOMARES
	@XAZOMARES
	call	InputNames
	@XAZOMARES
	@CLOSE_HANDLE	KlidiHandle
	@TESTFORDEBUG
	@XAZOMARES
	@EXIT_ROUTINE
	@XAZOMARES
;**************************************
isold:	call	far ptr Test1Config
;**************************************
	@XAZOMARES
	@XAZOMARES
;**************************************
	call	far ptr Test2Config
;**************************************
	@XAZOMARES
	@XAZOMARES
;**************************************
	call	far ptr Test3Config
;**************************************
	@XAZOMARES
	@XAZOMARES
;**************************************
;;;;;;;;;;;;
;;;;;;;;;;;;	call	far ptr TestFores
;;;;;;;;;;;;
;**************************************
	@XAZOMARES
	@XAZOMARES
;**************************************
;;;;;;;;;;;;
;;;;;;;;;;;;	call	far ptr TestDate
;;;;;;;;;;;;
;**************************************
	@XAZOMARES
;************************************** READ NAME
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8,I_CUR
	@READ_HANDLE	KlidiHandle,praktname,41
	jnc	inme3
	call	error
inme3:	@STRXOR	praktname,74,40
;**************************************
	@CLOSE_HANDLE	KlidiHandle
	@XAZOMARES
	call	old_int
	@POP
	pop	ax
	pop	ax
	jmp	far ptr CODE:klidi_epistrofi
	retf
erro:	@XAZOMARES
	mov	ax,1001
	@EXIT_ROUTINE
klid_sect	endp

TestIfFirst	proc	near
	@PUSH
	xor	ax,ax
	@XAZOMARES
	mov	Neo,ax
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@READ_HANDLE	KlidiHandle,Pattern,10+8+8
	cmp	word ptr Pattern,1966
	jne	TstF0
	inc	Neo

TstF0:	cmp	word ptr Pattern[10],1976
	jne	TstF1
	inc	Neo

TstF1:	cmp	word ptr Pattern[18],1996
	jne	TstF2
	inc	Neo

TstF2:	@XAZOMARES
	cmp	Neo,3
	je	Mkeneo
	jmp	TstPalio

Mkeneo:	mov	FirstTime,1
	@XAZOMARES
	@POP
	ret
Neo	dw	0
TstPalio:
	mov	FirstTime,0
	@XAZOMARES
	@POP
	ret
FirstTime	dw	16000
disk_sides	dw	2
sect_per_track	dw	9
drive		db	0
sector		db	0
track		db	0
head		db	0
prosp		dw	0
Pattern		db	1030 dup(?)
KlidiHandle	dw	0
OffsetInFile	dw	0
strbuf		db	40 dup(0)
Fores		dw	100
Date		dw	0,0
TestIfFirst	endp

is_hacker	proc	near
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,0,I_BEG
	@WRITE_HANDLE	KlidiHandle,Pattern,200
	@CLOSE_HANDLE	KlidiHandle
	@RESETDISKBUF
	@XAZOMARES
;************************************* CRASH
	push	cs
	pop	ds
	mov	dx,offset cs:for_reset
	@DOINT	@TIMER
;*************************************
	@XAZOMARES
	ret
is_hacker	endp

Test1Config	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@READ_HANDLE	KlidiHandle,Pattern,10
	jnc	nti1
	jmp	erom1
nti1:	mov	ah,0c0h
	int	15h
	jnc	nter1
	push	cs
	pop	es
	mov	bx,offset conf1
nter1:	mov	cx,10
	mov	si,0
tst1c1:	mov	al,es:[bx]
	cmp	Pattern[si],al
	jne	erom19			;;;;->ERROR sta WINDOWS
	inc	si
	inc	bx
	loop	tst1c1
erom19:	@POP
	retf
erom1:	@XAZOMARES
	mov	ax,2000
	@EXIT_ROUTINE
Test1Config	endp

CreateConfigFiles	proc	near
	@PUSH
	@TESTFORDEBUG
	@XAZOMARES
	call	Make1Config
	@TESTFORDEBUG
	@XAZOMARES
	call	Make2Config
	@TESTFORDEBUG
	@XAZOMARES
	call	Make3Config
	@TESTFORDEBUG
	@XAZOMARES
	call	MakeDate
	@TESTFORDEBUG
	@XAZOMARES
	@POP
	ret
CreateConfigFiles	endp

MakeDate	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@GET_DATE		;Take Date from Dos
	push	dx
	xor	dx,dx
	mov	ax,12
	mul	cx
	pop	dx
	mov	dl,dh
	mov	dh,0
	add	ax,dx
	mov	Date,ax
	mov	Date[2],ax
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41+2,I_CUR
	@WRITE_HANDLE	KlidiHandle,Date,4
	@POP
	ret
MakeDate	endp

Test2Config	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10,I_CUR
	@READ_HANDLE	KlidiHandle,Pattern,8
	jnc	nti2
	jmp	erom2
nti2:	mov	dl,80h
	mov	ah,08h
	int	13h
	jnc	nter2
	mov	cx,3019
	mov	dx,4156
nter2:	cmp	word ptr pattern[0],cx
	jne	erom2
	cmp	word ptr pattern[2],dx
	jne	erom2
	add	dx,1966
	add	cx,1976
	cmp	word ptr pattern[4],dx
	jne	erom2
	cmp	word ptr pattern[6],cx
	jne	erom2
	@POP
	retf
erom2:	@XAZOMARES
	mov	ax,2001
	@EXIT_ROUTINE
Test2Config	endp

Test3Config	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8,I_CUR
	@READ_HANDLE	KlidiHandle,Pattern,8
	jnc	nti3
	jmp	erom3
nti3:				
	mov	dl,"C"		;cx=bytes per sector,ax=sector,
	mov	ah,36h		;dx=total clusters,bx=clusters
	int	21h
	jnc	nter3
	mov	cx,3019
	mov	dx,4156
	mov	ax,1220
	mov	bx,18

nter3:	cmp	word ptr pattern[0],cx
	jne	erom3
	cmp	word ptr pattern[2],dx
	jne	erom3
	cmp	word ptr pattern[4],ax
	jne	erom3
	cmp	word ptr pattern[6],bx
	jne	erom3
	@POP
	retf
erom3:	@XAZOMARES
	mov	ax,8002
	@EXIT_ROUTINE
Test3Config	endp

TestFores	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41,I_CUR
	@READ_HANDLE	KlidiHandle,Fores,2
	cmp	Fores,0
	je	uelo
	dec	Fores
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41,I_CUR
	@WRITE_HANDLE	KlidiHandle,Fores,2
	cmp	Fores,30
	ja	exiako
	cmp	Fores,10
	jb	uelo
	@NAIOXI	3,3,codemsg1,codemsg2,codemsg3
	jc	exiako

uelo:	mov	ax,10002
	call	InputCode
	mov	Fores,65500
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41,I_CUR
	@WRITE_HANDLE	KlidiHandle,Fores,2

exiako:	@POP
	retf
TestFores	endp

TestDate	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41+2,I_CUR
	@READ_HANDLE	KlidiHandle,Date,2
	@XAZOMARES
	cmp	Date,32222
	jne	dat1
	@POP
	retf

dat1:	@XAZOMARES
	call	TestDate0
	@XAZOMARES
	@GET_DATE		;Take Date from Dos
	push	dx
	xor	dx,dx
	mov	ax,12
	mul	cx
	pop	dx
	mov	dl,dh
	mov	dh,0
	add	ax,dx
	
	sub	ax,Date
	cmp	ax,3
	jae	dat4
	jmp	dat2

dat4:	cmp	ax,4
	jae	dat3
	@NAIOXI	3,3,codemsg1,codemsg2,codemsg3
	jnc	dat3
	jmp	dat2

dat3:	mov	ax,10003
	call	InputCode
	@XAZOMARES
	mov	Date,32222
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41+2,I_CUR
	@WRITE_HANDLE	KlidiHandle,Date,2
	
dat2:	@POP
	retf
TestDate	endp

TestDate0	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@XAZOMARES
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41+2+2,I_CUR
	@READ_HANDLE	KlidiHandle,Date[2],2

	@GET_DATE		;Take Date from Dos
	push	dx
	xor	dx,dx
	mov	ax,12
	mul	cx
	pop	dx
	mov	dl,dh
	mov	dh,0
	add	ax,dx

	cmp	ax,Date[2]
	jb	dat01
	jmp	dat02

dat01:	@EXIT_ROUTINE

dat02:	mov	Date[2],ax
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8+41+2+2,I_CUR
	@WRITE_HANDLE	KlidiHandle,Date[2],2
	@POP
	ret
TestDate0	endp

new_int_all	proc	near
	@XAZOMARES
	@PUSH
	@XAZOMARES
	@GETINT	@CTRL_BREAK
	mov	cs:old_ctrl_break,bx
	mov	cs:old_ctrl_break[2],es
	@XAZOMARES
	@GETINT	@CTRL_C
	mov	cs:old_ctrl_c,bx
	mov	cs:old_ctrl_c[2],es
	@XAZOMARES
	@GETINT	@ERROR_HANDLE
	mov	cs:old_eror_handle,bx
	mov	cs:old_eror_handle[2],es
	@XAZOMARES
	@GETINT	@BREAKPOINT
	mov	cs:old_breakpoint,bx
	mov	cs:old_breakpoint[2],es
	push	cs
	pop	ds
	mov	dx,offset cs:ctrl_c
	@DOINT	@CTRL_C
	@XAZOMARES
	mov	dx,offset cs:ctrl_break
	@DOINT	@CTRL_BREAK
	@XAZOMARES
	mov	dx,offset cs:error_handle
	@DOINT	@ERROR_HANDLE
	@XAZOMARES
	mov	dx,offset cs:BreakPoint
	@DOINT	@BREAKPOINT
	@XAZOMARES
	@POP
	@XAZOMARES
	ret
old_breakpoint	dw	0,0
old_eror_handle	dw	0,0
old_ctrl_c	dw	0,0
old_ctrl_break	dw	0,0
new_int_all	endp

old_int	proc	near
	@XAZOMARES
	@PUSH
	lds	dx,dword ptr cs:old_ctrl_c
	@DOINT	@CTRL_C
	@XAZOMARES
	lds	dx,dword ptr cs:old_ctrl_break
	@DOINT	@CTRL_BREAK
	@XAZOMARES
	lds	dx,dword ptr cs:old_eror_handle
	@DOINT	@ERROR_HANDLE
	@XAZOMARES
	lds	dx,dword ptr cs:old_breakpoint
	@DOINT	@BREAKPOINT
	@XAZOMARES
	@POP
	@XAZOMARES
	@BIGCURS
	ret
old_int	endp

ctrl_c	proc	far
	sti
	iret
ctrl_c	endp

error_handle	proc	far
	mov	ax,0
	stc
	iret
error_handle	endp

ctrl_break	proc	far
	sti
	iret
ctrl_break	endp

BreakPoint proc	far
	@XAZOMARES
	call	is_hacker
	@XAZOMARES
	pushf
	cli
	iret
BreakPoint endp

Make1Config	proc	near
	@PUSH
	@TESTFORDEBUG
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	mov	ah,0c0h
	int	15h
	jnc	nero1
	push	cs
	pop	es
	mov	bx,offset conf1
nero1:	push	ds
	push	es
	pop	ds
	mov	dx,bx
	mov	cx,10
	mov	bx,cs:KlidiHandle
	mov	ah,40h
	int	21h
	pop	ds
	jc	ero11
	@POP
	ret
ero11:	mov	ax,3002
	@EXIT_ROUTINE
	@XAZOMARES
conf1	dw	2
	db	11
	db	26
	db	89
	db	98
	db	111
	db	89
	db	98
	db	92
Make1Config	endp

Make2Config	proc	near
	@PUSH
	@TESTFORDEBUG
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10,I_CUR
	mov	dl,80h
	mov	ah,08h
	int	13h
	jnc	nero2
	mov	cx,3019
	mov	dx,4156
nero2:	mov	word ptr pattern[0],cx
	mov	word ptr pattern[2],dx
	mov	word ptr pattern[4],dx
	mov	word ptr pattern[6],cx
	add	word ptr pattern[4],1966
	add	word ptr pattern[6],1976
	@WRITE_HANDLE	KlidiHandle,Pattern,8
	jc	ero21
	@POP
	ret
ero21:	mov	ax,3001
	@EXIT_ROUTINE
	@XAZOMARES
Make2Config	endp

Make3Config	proc	near
	@PUSH
	@TESTFORDEBUG
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8,I_CUR
	mov	dl,"C"		;cx=bytes per sector,ax=sector
	mov	ah,36h		;dx=total clusters,bx=clusters
	int	21h
	jnc	nero5
	mov	cx,3019
	mov	dx,4156
	mov	ax,1220
	mov	bx,18
nero5:	mov	word ptr pattern[0],cx
	mov	word ptr pattern[2],dx
	mov	word ptr pattern[4],ax
	mov	word ptr pattern[6],bx
	@WRITE_HANDLE	KlidiHandle,Pattern,8
	jc	ero51
	@POP
	ret
ero51:	mov	ax,8001
	@EXIT_ROUTINE
	@XAZOMARES
Make3Config	endp

InputCode proc near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@BELL
	@USERW	0,0
	@SETWIND	kodew
	@SELECTWIND	kodew
	@ITOA	strbuf
	@WPRINT	2,0,strbuf

	call	MakeRNDCode
	@WPRINT	27,3,xrisi

	call	InputDate

	call	XorStr

	@STRXOR	MyCode1,13,8
	@STRXOR	MyCode2,26,8
	@STRXOR	MyCode3,59,8

	mov	Prosp,3
	@FILLSTR	newcode," ",8
jafr:	@WINPUTNUMBER	27,4,newcode
	jc	escap1
;******************************************
;***             PES KODIKO              **
;******************************************
;	@WINPUTNUMBER	0,0,xrisi
;	call	XorStr
;	@WPRINT	10,0,strbuf1
;	call	error
;******************************************
	cmp	newcode," "
	je	jafr

	@STRCMP	newcode,MyCode1
	je	OurCode

	@STRCMP	newcode,strbuf1
	jnc	RightCode
	dec	Prosp
	jnz	jafr

	mov	ax,5021
	call	error

RightCode:
	@DELWIND	kodew
	@POP
	ret

escap1:	mov	ax,5023
	call	error

OurCode:
	@FILLSTR	newcode," ",8
	@WCODEINPUT	27,4,newcode
	@TOUPPER	newcode
	@STRCMP	newcode,MyCode2
	je	OurCode1

	mov	ax,5024
	call	error

OurCode1:
	@FILLSTR	newcode," ",8
	@WCODEINPUT	27,4,newcode
	@STRCMP	newcode,MyCode3
	je	OurCode2

	mov	ax,5025
	call	error

OurCode2:
	@DELWIND	kodew
	@POP
	ret
InputCode endp

InputDate	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@GET_DATE		;Take Date from Dos
	mov	ah,0
	mov	al,dl
	@ITOA	mera,2
	mov	al,dh
	@ITOA	mhna,2
	mov	ax,cx
	@ITOA	xrono,4

	@WPRINT	27,2,mera
	@WPRINT	30,2,mhna
	@WPRINT	33,2,xrono

mr00:	@WINPUTNUMBER	27,2,mera
	jnc	mr001
	call	error
mr001:	@WPRINTCH	29,2,"/",kodew[5]
	@ATOI	mera
	cmp	ax,31
	ja	mr00
	cmp	ax,0
	je	mr00
mr01:	@WINPUTNUMBER	30,2,mhna
	jnc	mr002
	call	error
mr002:	@WPRINTCH	32,2,"/",kodew[5]
	@ATOI	mhna
	cmp	ax,12
	ja	mr01
	cmp	ax,0
	je	mr01
mr02:	@WINPUTNUMBER	33,2,xrono
	jnc	mr003
	call	error
mr003:	@ATOI	xrono
	cmp	ax,1999
	jb	mr02
	cmp	ax,2020
	ja	mr02
	mov	xrono1,ax
	@ATOI	mhna
	mov	mhna1,al
	@ATOI	mera
	mov	mera1,al
	@SET_DATE	xrono1,mhna1,mera1
	@POP
	ret
InputDate	endp

XorStr	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@ATOI	xrono
	mov	dx,ax
	@ATOI	mhna
	add	dx,ax
	@ATOI	mera
	add	dx,ax
	mov	ax,dx
	mov	dl,10
	div	dl
	mov	dl,ah
	mov	cx,8
	xor	si,si
xorit:	mov	al,xrisi[si]
	sub	al,48
	xor	al,CodeString[si]
	cmp	dl,CodeString[si]
	je	xorno
	xor	al,dl
xorno:	cmp	al,9
	jbe	xr1
	mov	ah,0
	mov	bl,2
	div	bl
xr1:	add	al,48
	mov	strbuf1[si],al
	inc	si
	loop	xorit
	@POP
	clc
	ret

kodew	db	1,17,7,46,5,07h,2
	db	0
	db	"             ÜãÑêéãÜåàÄ :   /  /  ",0
	db	"                âóÉàâéë :",0
	db	"           NEOë âóÉàâéë :",0
	db	0

namew	db	5,29,7,47,3,07h,2
	db	" ONOMA - íÜäÑîóåé",0
	db	"ƒ",1
	db	0

CodeMsg1	db	"KóÉàâéë",0
CodeMsg2	db	"To è®Êö®ò££ò Æ®ú†·ùú´ò† °‡õ†°Ê...",0
CodeMsg3	db	"á‚¢ú´ú §ò õÈ©ú´ú °‡õ†°Ê ´È®ò;",0

		db	1,4,9,12,5,8,19,23,2,7
CodeString	db	2,7,9,9,6,5,3,9
		db	3,1,4,9,4,9,9,5,3,3,9,6,7,2,9
mera	db	2 dup(" "),0,0
mhna	db	2 dup(" "),0,0
xrono	db	2 dup(" "),0,0
xrono1	dw	0
mhna1	db	0
mera1	db	0
xrisi	db	8 dup(" "),0,0
newcode	db	8 dup(" "),0,0
strbuf1	db	20 dup(" "),0,0
MyCode1	label	byte
	XORDATA	<93192053>,13
	db	0
MyCode2	label	byte
	XORDATA	<36087448>,26
	db	0
MyCode3	label	byte
	XORDATA	<94219673>,59
	db	0
strkena	db	"        ",0
praktname	db 40 dup(" "),0
XorStr	endp

MakeRNDCode	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@STARTRND
	mov	cx,8
	xor	si,si
zk0:	@RND
	add	ax,48
	cmp	al,"0"
	jb	zk0
	cmp	al,"9"
	ja	zk0
	cmp	si,3
	jb	zk4
	push	cx
	mov	cx,3
	mov	bx,si
	dec	bx
zk2:	cmp	xrisi[bx],al
	jne	zk1
	pop	cx
	jmp	zk0
zk1:	dec	bx
	loop	zk2
	pop	cx
zk4:	mov	xrisi[si],al
	inc	si
	loop	zk0
	@ENDRND
	@POP
	ret
MakeRNDCode	endp

error	proc	near
	@EXIT_ROUTINE
error	endp

InputNames	proc	near
	@PUSH
	@CHANGESEGM	ds,MCODE1
	@SETWIND	namew
	@SELECTWIND	namew
ok912:	@FILLSTR	praktname," ",40
	@WINPUTGREEK	4,3,praktname
	jnc	ok888
	@WINPUT	4,3,praktname
	jnc	ok888
	mov	ax,5029
	call	error
ok888:	cmp	praktname," "
	je	ok912
	@ASCIIZ	praktname
	@STRXOR	praktname,74,40
	@MOVEFP	KlidiHandle,0,OffsetInFile,I_BEG
	@MOVEFP	KlidiHandle,0,10+8+8,I_CUR
	@WRITE_HANDLE	KlidiHandle,praktname,41
	jnc	ok93
	mov	ax,5028
	call	Error
ok93:	mov	Fores,140
	@WRITE_HANDLE	KlidiHandle,Fores,2
	jnc	ok94
	mov	ax,5039
	call	Error
ok94:	@DELWIND	namew
	@POP
	ret
InputNames	endp

for_reset	proc	far
	call	for_reset
for_reset endp

MCODE1	ends
	end

