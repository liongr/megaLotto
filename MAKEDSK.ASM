INCLUDE	mylib.inc
INCLUDE	klidi.inc
INCLUDE	mdos.inc

@STARTFILE = 32

STACKSG SEGMENT STACK
	dw	2000 dup(?)
STACKSG ENDS

CODESG	segment public

	ASSUME	CS:CODESG,DS:CODESG

main	proc	far
	@STARTPRG
	@CHANGESEGM	ds,CODESG
	@CREATE_HANDLE	file,I_RW
	mov	Handle,ax
	@MOVEFP	Handle,0,@STARTFILE,I_BEG
	@WRITE_HANDLE	Handle,Pattern,10+8+8
	@CLOSE_HANDLE	Handle
	@EXIT

Handle	dw	0
file	db	"mega.inf",0
Pattern	label	byte
	dw	1966
	dw	923,1289,1674,1222
	dw	1976
	dw	234,678,986
	dw	1996
	dw	1212,1357,6767
main	endp

CODESG	ends
	end	main
