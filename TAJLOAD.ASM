INCLUDE	koina.inc

code	segment	public

	assume	cs:code

tajload	proc	near
	@PUSH
	@CHANGESEGM	ds,PINOROI
	xor	si,si
skit1:	cmp	byte ptr [si],0
	je	oust9
	mov	al,[si]
	jmp	oros
oust:	xor	cx,cx
	mov	cl,[si+3]
	add	si,cx
	jmp	skit1
oust9:	@POP
	ret
oros:	@PUSH
	cmp	al,"C"
	jne	CC
	mov	word ptr [si][8],offset CODE1:osa3
	mov	word ptr [si][10],offset CODE1:osa2
	mov	word ptr [si][12],offset CODE1:osa1
	jmp	tt
CC:	cmp	al,"R"
	jne	RR
	mov	word ptr [si][8],offset CODE1:symz3
	mov	word ptr [si][10],offset CODE1:symz2
	mov	word ptr [si][12],offset CODE1:symz1
	jmp	tt
RR:	cmp	al,"U"
	jne	UU
	mov	word ptr [si][8],offset CODE1:syen3
	mov	word ptr [si][10],offset CODE1:syen2
	mov	word ptr [si][12],offset CODE1:syen1
	jmp	tt
UU:	cmp	al,"V"
	jne	VV
	mov	word ptr [si][8],offset CODE1:eyr3
	mov	word ptr [si][10],offset CODE1:eyr2
	mov	word ptr [si][12],offset CODE1:eyr1
	jmp	tt
VV:	cmp	al,"K"
	jne	KK
	mov	word ptr [si][8],offset CODE1:blh3
	mov	word ptr [si][10],offset CODE1:blh2
	mov	word ptr [si][12],offset CODE1:blh1
	jmp	tt
KK:	cmp	al,"H"
	jne	HH
	mov	word ptr [si][8],offset CODE1:syl3
	mov	word ptr [si][10],offset CODE1:syl2
	mov	word ptr [si][12],offset CODE1:syl1
	jmp	tt
HH:	cmp	al,"G"
	jne	GG
	mov	word ptr [si][8],offset CODE1:osl3
	mov	word ptr [si][10],offset CODE1:osl2
	mov	word ptr [si][12],offset CODE1:osl1
	jmp	tt
GG:	cmp	al,"E"
	jne	EE
	mov	word ptr [si][8],offset CODE1:enal3
	mov	word ptr [si][10],offset CODE1:enal2
	mov	word ptr [si][12],offset CODE1:enal1
	jmp	tt
EE:	cmp	al,"A"
	jne	sAA
	mov	word ptr [si][8],offset CODE1:ajv3
	mov	word ptr [si][10],offset CODE1:ajv2
	mov	word ptr [si][12],offset CODE1:ajv1
	jmp	tt
sAA:	cmp	al,"D"
	jne	sDD
	mov	word ptr [si][8],offset CODE1:bar3
	mov	word ptr [si][10],offset CODE1:bar2
	mov	word ptr [si][12],offset CODE1:bar1
	jmp	tt
sDD:	cmp	al,"B"
	jne	BB
	mov	word ptr [si] [8],offset CODE1:dias3
	mov	word ptr [si] [10],offset CODE1:dias2
	mov	word ptr [si] [12],offset CODE1:dias1
	jmp	tt
BB:	cmp	al,"Y"
	jne	YY
	mov	word ptr [si][8],offset CODE1:aap3
	mov	word ptr [si][10],offset CODE1:aap2
	mov	word ptr [si][12],offset CODE1:aap1
	jmp	tt
YY:	cmp	al,"O"
	jne	OO
	mov	word ptr [si][8],offset CODE1:tapo3
	mov	word ptr [si][10],offset CODE1:tapo2
	mov	word ptr [si][12],offset CODE1:tapo1
	jmp	tt
OO:	cmp	al,"I"
	jne	II
	mov	word ptr [si][8],offset CODE1:kena3
	mov	word ptr [si][10],offset CODE1:kena2
	mov	word ptr [si][12],offset CODE1:kena1
	jmp	tt
II:	cmp	al,"M"
	jne	MM
	mov	word ptr [si][8],offset CODE1:mzu3
	mov	word ptr [si][10],offset CODE1:mzu2
	mov	word ptr [si][12],offset CODE1:mzu1
	jmp	tt
MM:	cmp	al,"N"
	jne	NN
	mov	word ptr [si][8],offset CODE1:par3
	mov	word ptr [si][10],offset CODE1:par2
	mov	word ptr [si][12],offset CODE1:par1
	jmp	tt
NN:	cmp	al,"Q"
	jne	QQ
	mov	word ptr [si][8],offset CODE1:tay3
	mov	word ptr [si][10],offset CODE1:tay2
	mov	word ptr [si][12],offset CODE1:tay1
	jmp	tt
QQ:	cmp	al,"J"
	jne	JJ
	mov	word ptr [si][8],offset CODE1:ali3
	mov	word ptr [si][10],offset CODE1:ali2
	mov	word ptr [si][12],offset CODE1:ali1
	jmp	tt
JJ:	cmp	al,"L"
	jne	LL
	mov	word ptr [si][8],offset CODE1:ulh3
	mov	word ptr [si][10],offset CODE1:ulh2
	mov	word ptr [si][12],offset CODE1:ulh1
	jmp	tt
LL:	cmp	al,"Z"
	jne	ZZ
	mov	word ptr [si][8],offset CODE1:mz3
	mov	word ptr [si][10],offset CODE1:mz2
	mov	word ptr [si][12],offset CODE1:mz1
	jmp	tt
ZZ:	cmp	al,"F"
	jne	FF
	mov	word ptr [si][8],offset CODE1:me3
	mov	word ptr [si][10],offset CODE1:me2
	mov	word ptr [si][12],offset CODE1:me1
	jmp	tt
FF:	cmp	al,"1"
	jne	n11
	mov	word ptr [si][8],offset CODE1:mm3
	mov	word ptr [si][10],offset CODE1:mm2
	mov	word ptr [si][12],offset CODE1:mm1
	jmp	tt
n11:	cmp	al,"2"
	jne	n22
	mov	word ptr [si][8],offset CODE1:ad3
	mov	word ptr [si][10],offset CODE1:ad2
	mov	word ptr [si][12],offset CODE1:ad1
	jmp	tt
n22:	cmp	al,"S"
	jne	qSS
	mov	word ptr [si][8],offset CODE1:sym3
	mov	word ptr [si][10],offset CODE1:sym2
	mov	word ptr [si][12],offset CODE1:sym1
	jmp	tt
qSS:	cmp	al,"3"
	jne	n33
	mov	word ptr [si][8],offset CODE1:mmmz3
	mov	word ptr [si][10],offset CODE1:mmmz2
	mov	word ptr [si][12],offset CODE1:mmmz1
	jmp	tt
n33:	cmp	al,"4"
	jne	n44
	mov	word ptr [si][8],offset CODE1:admz3
	mov	word ptr [si][10],offset CODE1:admz2
	mov	word ptr [si][12],offset CODE1:admz1
	jmp	tt
n44:	cmp	al,"5"
	jne	n55
	mov	word ptr [si][8],offset CODE1:memz3
	mov	word ptr [si][10],offset CODE1:memz2
	mov	word ptr [si][12],offset CODE1:memz1
	jmp	tt
n55:	cmp	al,"6"
	jne	n66
	mov	word ptr [si][8],offset CODE1:admm3
	mov	word ptr [si][10],offset CODE1:admm2
	mov	word ptr [si][12],offset CODE1:admm1
	jmp	tt
n66:	cmp	al,"7"
	jne	n77
	mov	word ptr [si][8],offset CODE1:memm3
	mov	word ptr [si][10],offset CODE1:memm2
	mov	word ptr [si][12],offset CODE1:memm1
	jmp	tt
n77:	cmp	al,"8"
	jne	n88
	mov	word ptr [si][8],offset CODE1:mead3
	mov	word ptr [si][10],offset CODE1:mead2
	mov	word ptr [si][12],offset CODE1:mead1
	jmp	tt
n88:	cmp	al,"!"
	jne	ns1
	mov	word ptr [si][8],offset CODE1:pom3
	mov	word ptr [si][10],offset CODE1:pom2
	mov	word ptr [si][12],offset CODE1:pom1
	jmp	tt
ns1:	cmp	al,"@"
	jne	ns2
	mov	word ptr [si][8],offset CODE1:p103
	mov	word ptr [si][10],offset CODE1:p102
	mov	word ptr [si][12],offset CODE1:p101
	jmp	tt
ns2:	cmp	al,"#"
	jne	ns3
	mov	word ptr [si][8],offset CODE1:p123
	mov	word ptr [si][10],offset CODE1:p122
	mov	word ptr [si][12],offset CODE1:p121
	jmp	tt
ns3:	cmp	al,"$"
	jne	ns4
	mov	word ptr [si][8],offset CODE1:p073
	mov	word ptr [si][10],offset CODE1:p072
	mov	word ptr [si][12],offset CODE1:p071
	jmp	tt
ns4:	cmp	al,"%"
	jne	ns5
	mov	word ptr [si][8],offset CODE1:pk73
	mov	word ptr [si][10],offset CODE1:pk72
	mov	word ptr [si][12],offset CODE1:pk71
	jmp	tt
ns5:	cmp	al,"^"
	jne	ns6
	mov	word ptr [si][8],offset CODE1:pda3
	mov	word ptr [si][10],offset CODE1:pda2
	mov	word ptr [si][12],offset CODE1:pda1
	jmp	tt
ns6:	cmp	al,"&"
	jne	ns7
	mov	word ptr [si][8],offset CODE1:pdb3
	mov	word ptr [si][10],offset CODE1:pdb2
	mov	word ptr [si][12],offset CODE1:pdb1
	jmp	tt
ns7:	cmp	al,"*"
	jne	ns8
	mov	word ptr [si][8],offset CODE1:plg3
	mov	word ptr [si][10],offset CODE1:plg2
	mov	word ptr [si][12],offset CODE1:plg1
	jmp	tt
ns8:	cmp	al,"("
	jne	ns9
	mov	word ptr [si][8],offset CODE1:pta3
	mov	word ptr [si][10],offset CODE1:pta2
	mov	word ptr [si][12],offset CODE1:pta1
	jmp	tt
ns9:	cmp	al,")"
	jne	ns0
	mov	word ptr [si][8],offset CODE1:psy3
	mov	word ptr [si][10],offset CODE1:psy2
	mov	word ptr [si][12],offset CODE1:psy1
	jmp	tt
ns0:	cmp	al,"W"
	jne	WW
	mov	word ptr [si][8],offset CODE1:bas3
	mov	word ptr [si][10],offset CODE1:bas2
	mov	word ptr [si][12],offset CODE1:bas1
	jmp	tt
WW:	cmp	al,"0"
	jne	n00
	mov	word ptr [si][8],offset CODE1:basn3
	mov	word ptr [si][10],offset CODE1:basn2
	mov	word ptr [si][12],offset CODE1:basn1
	jmp	tt
n00:	cmp	al,":"
	jne	npe
	mov	word ptr [si][8],offset CODE1:perio3
	mov	word ptr [si][10],offset CODE1:perio2
	mov	word ptr [si][12],offset CODE1:perio1
	jmp	tt
npe:	cmp	al,">"
	jne	nb6
	mov	word ptr [si][8],offset CODE1:bar63
	mov	word ptr [si][10],offset CODE1:bar62
	mov	word ptr [si][12],offset CODE1:bar61
	jmp	tt
nb6:	cmp	al,"<"
	jne	nbu
	mov	word ptr [si][8],offset CODE1:barues3
	mov	word ptr [si][10],offset CODE1:barues2
	mov	word ptr [si][12],offset CODE1:barues1
	jmp	tt
nbu:	cmp	al,"|"
	jne	nbua
	mov	word ptr [si][8],offset CODE1:adu3
	mov	word ptr [si][10],offset CODE1:adu2
	mov	word ptr [si][12],offset CODE1:adu1
	jmp	tt
nbua:	cmp	al,"_"
	jne	nbub
	mov	word ptr [si][8],offset CODE1:meu3
	mov	word ptr [si][10],offset CODE1:meu2
	mov	word ptr [si][12],offset CODE1:meu1
	jmp	tt
nbub:	cmp	al,"~"
	jne	nbuw
	mov	word ptr [si][8],offset CODE1:enalad3
	mov	word ptr [si][10],offset CODE1:enalad2
	mov	word ptr [si][12],offset CODE1:enalad1
	jmp	tt
nbuw:	@BELL
	@EXIT
tt:	@POP
	jmp	oust
tajload	endp

code	ends
	end
