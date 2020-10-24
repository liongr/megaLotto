include	mylib.inc
include	sdir.inc
include	mdos.inc

stac	segment	stack
	dw	1000 dup(?)
stac	ends


BUFFER	segment	public
	db	65520 dup(0)
BUFFER	ends

CODE	segment	public

	assume	cs:CODE
	
start	proc	far
	@STARTPRG
	@CLRCURS
	@USERW	0,0
	@FILLSCR	"±",07h
	@CHANGESEGM	ds,CODE
	@CHANGESEGM	es,BUFFER
	@SETWIND	wmain
	@SELECTWIND	wmain

in1:	@DISKDIR	fname1,directory,minima
	@WPRINT	23,2,fname1
	mov	bx,offset fname1
	call	addext
	cmp	fname1,"."
	jne	in2
	@EXIT
in2:	@DISKDIR	fname2,directory,minima
	@WPRINT	23,3,fname2
	mov	bx,offset fname2
	call	addext
	cmp	fname2,"."
	jne	in3
	@EXIT
in3:	@FILLSTR	fname3," ",8
	@WINPUT	23,5,fname3
	jnc	firr
	@EXIT
firr:	mov	bx,offset fname3
	call	addext
	@TESTFILE	fout
	jnc	in3

	@OPEN_HANDLE	fin1,I_READ
	mov	h_in1,ax
	@OPEN_HANDLE	fin2,I_READ
	mov	h_in2,ax
	@CREATE_HANDLE	fout,0
	mov	h_out,ax

	call	enosi_1
	call	enosi_2
	call	save_end

	@CLOSE_HANDLE	h_in1
	@CLOSE_HANDLE	h_in2
	@CLOSE_HANDLE	h_out
	@WPRINT	33,8,telmsg
	@BELL
	@ENDPRG
	retf
start	endp

data	proc	near
wmain	db	5,0,0,40,10,70h,2
	db	0
	db	" APXEIO EIëAÇóÇHë 1 :",0
	db	" AêXEIO EIëAÇóÇHë 2 :",0
	db	0
	db	" AêXEIO EçAÇóÇHë    :",0
	db	0
	db	"            ëTHäEë ->",0
	db	0
	db	"ƒ",1
	db	" 1o íé ãÑÇÄäìíÑêé ÄêïÑàé",0

directory db	"C:\MEGA\*.STL",0
telmsg	db	"TEäOë",0
minima	db	"îOêTóMA STL",0

strbuf	db	80 dup(0)

fin1	db	"C:\MEGA\"
fname1	db	8 dup(" "),0,0,0,0,0

fin2	db	"C:\MEGA\"
fname2	db	8 dup(" "),0,0,0,0,0

fout	db	"C:\MEGA\"
fname3	db	8 dup(" "),0,0,0,0,0

h_in1	dw	0
h_in2	dw	0
h_out	dw	0

stili6	db	6 dup(0)
stili49	db	50 dup(0)

stili6a	db	6 dup(0)

count	dw	0,0

bufpoint dw	0
data	endp

enosi_1	proc	near
	@PUSH
en39:	mov	stili6,0
	@READ_HANDLE	h_in1,stili6,6
	jc	end1
	cmp	stili6,0
	je	end1

	mov	cx,6
	xor	bx,bx
	xor	si,si
en1:	mov	bl,stili6[si]
	mov	stili49[bx],1
	inc	si
	loop	en1

	call	test_it
	jc	fier

	call	saveit

fier:	mov	cx,6
	xor	bx,bx
	xor	si,si
en2:	mov	bl,stili6[si]
	mov	stili49[bx],0
	inc	si
	loop	en2

	jmp	en39

end1:	@POP
	ret
enosi_1	endp

test_it	proc	near
	@PUSH
	@MOVEFP	h_in2,0,0,I_BEG
tes1:	mov	stili6a,0
	@READ_HANDLE	h_in2,stili6a,6
	jc	telos
	cmp	stili6a,0
	je	telos

	mov	cx,6
	xor	bx,bx
	xor	si,si
tes2:	mov	bl,stili6a[si]
	cmp	stili49[bx],0
	je	tes1
	inc	si
	loop	tes2
	@POP
	stc
	ret

telos:	@POP
	clc
	ret
test_it	endp

enosi_2	proc	near
	@PUSH
	@MOVEFP	h_in2,0,0,I_BEG
enit:	mov	stili6,0
	@READ_HANDLE	h_in2,stili6,6
	jc	end2
	cmp	stili6,0
	je	end2

	call	saveit

	jmp	enit

end2:	@POP
	ret
enosi_2	endp

saveit	proc	near
	@PUSH
	@INCL	count
	@LTOA	count,count[2],strbuf
	@WPRINT	23,7,strbuf
	mov	bx,bufpoint
	mov	cx,6
	xor	si,si
tes21:	mov	al,stili6[si]
	mov	es:[bx],al
	inc	si
	inc	bx
	loop	tes21
	add	bufpoint,6
	cmp	bx,65520
	jb	tes3

	@CHANGESEGM	ds,BUFFER
	@WRITE_MEM	cs:h_out,0,65520
	@CHANGESEGM	ds,CODE
	mov	bufpoint,0	

tes3:	@POP
	ret
saveit	endp

save_end	proc	near
	@PUSH
	mov	si,bufpoint
	@CHANGESEGM	ds,BUFFER
	mov	byte ptr [si],0
	mov	byte ptr [si+1],0
	mov	byte ptr [si+2],0
	mov	byte ptr [si+3],0
	mov	byte ptr [si+4],0
	mov	byte ptr [si+5],0
	@WRITE_MEM	cs:h_out,0,65520
	@CHANGESEGM	ds,CODE
	@POP
	ret
save_end	endp
addext	proc	near
	@PUSH
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
addext	endp

CODE	ends
	end	start
