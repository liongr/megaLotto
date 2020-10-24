
INCLUDE	mylib.inc

stac	segment	stack
	dw	2000 dup(?)
stac	ends

DATA	segment	public
strbuf		db	10 dup(0)
posa		dw	6
filein		db	20 dup(0)
fileout		db	20 dup(0)
idos		db	"0",0
pointer		dw	0,0
index		dw	0
deltio		db	50 dup(0)
file_index	dw	100
buffer		db	30000 dup(0)

winmet		db	1,24,6,33,10,07h,2
		db	"    METATêéèÜ ëíÜäóå ëÑ éêéìë",0
		db	"ƒ",1
		db	0
		db	"   AêïÑàé ëíÜäóå :",0
		db	"   AêïÑàA éêóå   :",0
		db	"   åéìãÑêÄ       :",0
		db	"   ÑàÉéë éêéì    :",0
		db	0
		db	"ƒ",1
		db	"        @1995  MEGA LoTTo",0
DATA	ends

OROI	segment	public
	db	65500 dup(0)
OROI	ends

code	segment	public

	assume	cs:code
	
start	proc	far
	@STARTPRG
	@CHANGESEGM	ds,DATA
	@FILLSCR	"±",07h
	call	inputs
	call	do_open
	@FILLSCR	" ",07h
	@ENDPRG
	retf
handlein	dw	0
handleout	dw	0
bytes		dw	0
start	endp

inputs	proc	near
	@PUSH
	@SETPOPUP	winmet
	@SELECTWIND	winmet
	@FILLSTR	filein," ",12
	@WINPUT	20,4,filein
	@FILLSTR	strbuf," ",5
	@WINPUT	20,5,strbuf
	mov	fileout[0],"0"
	mov	fileout[1],"0"
	mov	fileout[2],"0"
	mov	al,strbuf[0]
	mov	fileout[3],al
	mov	al,strbuf[1]
	mov	fileout[4],al
	mov	al,strbuf[2]
	mov	fileout[5],al
	mov	al,strbuf[3]
	mov	fileout[6],al
	mov	al,strbuf[4]
	mov	fileout[7],al
	call	addext
	mov	ax,posa
	@ITOA	strbuf,2
	@WINPUTNUMBER	20,6,strbuf
	@ATOI	strbuf
	mov	posa,ax
	@WINPUT	20,7,idos
	@TESTFILE	filein
	jc	xxxx
	cmp	fileout[3],"."
	je	xxxx
	@TESTFILE	fileout
	jnc	xxxx
	cmp	idos,"0"
	je	noxx
	cmp	idos,"W"
	je	noxx
	cmp	posa,0
	je	xxxx
noxx:	@POP
	ret
xxxx:	@MBELL
	@FILLSCR	" ",07h
	@EXIT
inputs	endp

addext	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	mov	bx,0
jana:	cmp	fileout[bx],0
	je	endit
	cmp	fileout[bx]," "
	je	endit
	inc	bx
	jmp	jana
endit:	mov	fileout[bx],"."
	mov	fileout[bx+1],"L"
	mov	fileout[bx+2],"9"
	mov	fileout[bx+3],"2"
	mov	fileout[bx+4],0
	@POP
	ret
addext	endp

do_open	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@OPEN_HANDLE	filein,I_READ
	mov	cs:handlein,ax
kialo:	mov	deltio,0
	@READ_HANDLE	cs:handlein,deltio,posa
	cmp	deltio,0
	je	telos
	call	do_metatrop
	cmp	pointer,65000
	jb	mina
	call	save_buf
	call	clr_oroi
	mov	pointer,0
	mov	index,0
	jmp	kialo

mina:	add	pointer,73
	jmp	kialo

telos:	call	save_buf
	@POP
	ret
do_open	endp

clr_oroi	proc	near
	@PUSH
	@CHANGESEGM	ds,OROI
	mov	cx,32500
	mov	bx,0
	mov	ax,0
clr1:	mov	[bx],ax
	inc	bx
	inc	bx
	loop	clr1
	@POP
	ret
clr_oroi	endp

do_metatrop	proc	near
	@PUSH
	@CHANGESEGM	ds,DATA
	@CHANGESEGM	es,OROI
	mov	bx,pointer
	inc	index
	mov	ax,index
	mov	word ptr es:[bx+6],ax
	mov	al,idos
	mov	byte ptr es:[bx],al
	mov	byte ptr es:[bx+3],73
	mov	byte ptr es:[bx+4],254
	mov	byte ptr es:[bx+5],254
	mov	di,bx
	add	di,19
	mov	si,0
	mov	ax,1
	xor	bx,bx
	mov	cx,posa
skata:	mov	bl,deltio[si]
	mov	es:[bx][di],al
	inc	si
	inc	ax
	loop	skata
	@POP
	ret
do_metatrop	endp

save_buf	proc	near
	@PUSH
	mov	ax,file_index
	inc	file_index
	@ITOA	strbuf,3
	mov	al,strbuf[0]
	mov	fileout[0],al
	mov	al,strbuf[1]
	mov	fileout[1],al
	mov	al,strbuf[2]
	mov	fileout[2],al
	@CREATE_HANDLE	fileout,0
	mov	cs:handleout,ax
	@WRITE_HANDLE	cs:handleout,pointer,4
	@WRITE_HANDLE	cs:handleout,buffer,27892
	mov	ax,pointer
	mov	cs:bytes,ax
	@CHANGESEGM	ds,OROI
	@WRITE_MEM	cs:handleout,0,cs:bytes
	@CLOSE_HANDLE	cs:handleout
	@POP
	ret
save_buf	endp

code	ends
	end	start
