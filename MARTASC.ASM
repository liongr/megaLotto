INCLUDE	mylib.inc
INCLUDE	klidi.inc
INCLUDE	mdos.inc

STACKSG SEGMENT STACK
	dw	2000 dup(?)
STACKSG ENDS

CODESG	segment public

	ASSUME	CS:CODESG,DS:CODESG

main	proc	far
	@STARTPRG
	@CHANGESEGM	ds,CODESG
	mov	fato,10920
	@OPEN_HANDLE	file_artemis,I_READ
	mov	Handle_in,ax
	@CREATE_HANDLE	file_ascii,0
	mov	Handle_out,ax

jana:	mov	stl,0
	@READ_HANDLE	Handle_in,stl,6
	jc	telos
	cmp	stl,0
	je	telos
	call	to_asc
	@WRITE_HANDLE	Handle_out,stltxt1,20
	dec	fato
alli:	jmp	jana
telos:
;	mov	cx,fato
;allit:	push	cx
;	@WRITE_HANDLE	Handle_out,stlz,6
;	pop	cx
;	loop	allit
	@CLOSE_HANDLE	Handle_in
	@CLOSE_HANDLE	Handle_out
	@EXIT

Handle_in	dw	0
Handle_out	dw	0
file_artemis	db	"LOTTO.LST",0
file_ascii	db	"lotto.txt",0
stl		db	6 dup(0),13,10
stlz		db	0,0,0,0,0,0,0
stltxt1		db	"  ",0
stltxt2		db	"  ",0
stltxt3		db	"  ",0
stltxt4		db	"  ",0
stltxt5		db	"  ",0
stltxt6		db	"  ",0
stltxt		db	13,10
fato		dw	0
main	endp

to_asc	proc	near
	@PUSH
	mov	al,stl[0]
	@ITOA	stltxt1,2
	mov	al,stl[1]
	@ITOA	stltxt2,2
	mov	al,stl[2]
	@ITOA	stltxt3,2
	mov	al,stl[3]
	@ITOA	stltxt4,2
	mov	al,stl[4]
	@ITOA	stltxt5,2
	mov	al,stl[5]
	@ITOA	stltxt6,2
	mov	stltxt1[2]," "
	mov	stltxt2[2]," "
	mov	stltxt3[2]," "
	mov	stltxt4[2]," "
	mov	stltxt5[2]," "
	mov	stltxt6[2]," "
	@POP
	ret
to_asc	endp

CODESG	ends
	end	main


