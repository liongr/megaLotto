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
	@WRITE_HANDLE	Handle_out,stl,6
	dec	fato
alli:	jmp	jana
telos:	mov	cx,fato
allit:	push	cx
	@WRITE_HANDLE	Handle_out,stlz,6
	pop	cx
	loop	allit
	@CLOSE_HANDLE	Handle_in
	@CLOSE_HANDLE	Handle_out
	@EXIT

Handle_in	dw	0
Handle_out	dw	0
file_artemis	db	"LOTTO.LST",0
file_ascii	db	"nikitr.stl",0
stl		db	7 dup(0)
stlz		db	0,0,0,0,0,0,0
fato		dw	0
main	endp

CODESG	ends
	end	main


