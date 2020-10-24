INCLUDE	koina.inc
INCLUDE	klidi.inc
INCLUDE	xaza.inc


stac	segment	stack
	dw	5000 dup(?)
stac	ends

code	segment	public

	assume	cs:code
	
start	proc	far
	@STARTPRG
	@CLRCURS
	@USERW	0,0
	@FILLSCR	"±",07h
	@CHANGESEGM	ds,DATA
;*********************************
  	jmp	far ptr CODE:klidi_epistrofi	;;;*** AKLEIDOTO <<<-------
;*********************************

;*********************************
IFDEF	@PAIKTIS
;*********************************
	jmp	far ptr CODE:klidi_epistrofi
;*********************************
ENDIF
;*********************************
	@CHANGESEGM	es,MCODE1
	@OPEN_HANDLE	klidifile,I_RW
	jc	error
	mov	es:KlidiHandle,ax
	mov	es:OffsetInFile,32
	@TESTKLIDI
;*********************************
	@ENDPRG
error:	@EXIT
	retf
start	endp

code	ends
	end	start
