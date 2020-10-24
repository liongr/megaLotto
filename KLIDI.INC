
@CTRL_BREAK = 1bh
@CTRL_C = 23h
@ERROR_HANDLE = 24h
@BREAKPOINT = 03h
@TIMER = 08h

@EXIT_ROUTINE	macro
	@ITOA	strbuf
;;;;	@WPRINT	70,10,strbuf
	@XAZOMARES
	call	old_int
	@XAZOMARES
	@EXIT
	endm

@TESTFORDEBUG	macro
	local	no_debuging
	@PUSH
	@GETINT	@BREAKPOINT
	mov	ax,offset cs:BreakPoint
	cmp	ax,bx
	je	no_debuging
	call	is_hacker
no_debuging:
	@POP
	endm

@TESTKLIDI	macro
	call	far ptr klid_sect
	endm

MCODE1	segment public
global	klid_sect:proc
global	Test1Config:proc
global	Test2Config:proc
global	Test3Config:proc
global	praktname:byte:40
global	KlidiHandle:word
global	OffsetInFile:word
MCODE1	ends

CODE	segment	public
global	klidi_epistrofi:proc
CODE	ends
