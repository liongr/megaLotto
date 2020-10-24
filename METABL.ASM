
INCLUDE	koina.inc

DATA	segment	public
;*******************************ODIGOI
pou_xani db	0
statfor5 db	0
ana58	db	0
metatrop db	0
statistikh db	0
mnhmhin	db	0
mnhmhout db	0
metrdlt	db	0
metabl	db	0
bug_period db	0
metrhma	db	0
aaxb	db	0
apla	db	0
pinakas	db	0
dialogh	db	0
diaaxb	db	0
mnhmo	db	0
;******************************************
emfanisi dw	0
orsinex	dw	0
orsinex1 dw	0
kiros	dw	0
idos58	db	10	;10metablito,9dismetablito....
filtra58 dw	999
plhres58 db	50 dup(0)
plhuos58 dw	0
;******************************************
idosmet db	0	;4metablito,3dismetablito....
filtra	dw	101
;******************************************
temp11	dw	0,0
temp12	dw	0,0
temp1	dw	0,0
temp2	dw	0,0
temp3	dw	0,0
temp4	dw	0,0
temp5	dw	0,0
pejeproto 	db	0
proto_simio	dw	0
protodrx dw	0,0
protom	db	"!!Ž’Ž!!",0
protop	db	15 dup(0)
protapo	dw	0,0
protevs	dw	0,0
load	db	0
akom1	dw	0
filtra1	dw	0
paxb1	db	50 dup(0)
paxb	db	1982 dup(0)
pinak3	dw	98 dup(0)
xarti1	dw	2 dup(0)
sthl	dw	0,0
deltia	dw	2 dup(0)
prvt	dw	0
deyt	dw	0
ejari	dw	2 dup(0)
pentari	dw	2 dup(0)
tesari	dw	2 dup(0)
triari	dw	2 dup(0)
ti	db	7 dup(0)
miden1	dw	2 dup(0)
ena1	dw	2 dup(0)
dio1	dw	2 dup(0)
tria1	dw	2 dup(0)
tesa1	dw	2 dup(0)
pent1	dw	2 dup(0)
ejar1	dw	2 dup(0)
;************************************

menu1	db	"  ŠOTTO ŽŽˆ Ž‹€ƒ„‘ “„Ž‹€ƒ„‘ Ž’€‘„ˆ‘ ‹„’€Š†’€ „„„‚€‘ˆ€ €•„ˆ€ E‚€ŠEIA  ",0
moroi	db	"F1 :‘’€’ˆ‘’ˆ‰†  ESC :€‰“—‘†  DEL :‘†‘ˆ‹Ž  + :EŽ‹„ŒŽ  - :Ž†‚Ž“‹„ŒŽ  ’ :’„ŠŽ‘",0  

menu1pn	db	2,5
	dw	offset lotto_diaf
	db	8,4
	dw	offset menu_oroi
	db	13,6
	dw	offset menu_omadop
	db	20,10
	dw	offset menu_yperomad
	db	31,9
	dw	offset menu_protasi
	db	41,9
	dw	offset menu_metablhta
	db	51,11
	dw	offset menu_epejerg
	db	63,6
	dw	offset menu_arxia
	db	70,8
	dw	offset menu_diafora

oroipin	label	word
	db	"W"
	dw	offset	CODEO:in_basikh
	dw	CODEO
	db	"A"
	dw	offset	CODEO:in_ajones
	dw	CODEO
	db	"S"
	dw	offset	CODEO:in_simetrika
	dw	CODEO
	db	"D"
	dw	offset	CODEO:in_baros
	dw	CODEO
	db	"C"
	dw	offset	CODEO:in_omad_sinexom
	dw	CODEO
	db	"L"
	dw	offset	CODEO:in_lhg_uesi
	dw	CODEO
	db	"Z"
	dw	offset	CODEO:in_monaziga
	dw	CODEO
	db	"J"
	dw	offset	CODEO:in_lhg_apol
	dw	CODEO
	db	"1"
	dw	offset	CODEO:in_mikra_megala
	dw	CODEO
	db	"F"
	dw	offset	CODEO:in_mesa_ejo
	dw	CODEO
	db	"2"
	dw	offset	CODEO:in_aristera_dejia
	dw	CODEO
	db	"3"
	dw	offset	CODEO:in_mikra_mona
	dw	CODEO
	db	"4"
	dw	offset	CODEO:in_aristera_mona
	dw	CODEO
	db	"5"
	dw	offset	CODEO:in_mesa_mona
	dw	CODEO
	db	"6"
	dw	offset	CODEO:in_aristera_mikra
	dw	CODEO
	db	"7"
	dw	offset	CODEO:in_mesa_mikra
	dw	CODEO
	db	"8"
	dw	offset	CODEO:in_mesa_aristera
	dw	CODEO
	db	"V"
	dw	offset	CODEO:in_evros
	dw	CODEO
	db	"B"
	dw	offset	CODEO:in_diasthmata
	dw	CODEO
	db	"K"
	dw	offset	CODEO:in_baros_lhg
	dw	CODEO
	db	"H"
	dw	offset	CODEO:in_lhg_sinex
	dw	CODEO
	db	"G"
	dw	offset	CODEO:in_omad_sin_lhg
	dw	CODEO
	db	"Y"
	dw	offset	CODEO:in_apol_apost
	dw	CODEO
	db	"O"
	dw	offset	CODEO:in_taj_apost
	dw	CODEO
	db	"I"
	dw	offset	CODEO:in_kena
	dw	CODEO
	db	"M"
	dw	offset	CODEO:in_mona_uesi
	dw	CODEO
	db	"|"
	dw	offset	CODEO:in_ad_uesi
	dw	CODEO
	db	"_"
	dw	offset	CODEO:in_me_uesi
	dw	CODEO
	db	"~"
	dw	offset	CODEO:in_ad_enal
	dw	CODEO
	db	"N"
	dw	offset	CODEO:in_parast_mona
	dw	CODEO
	db	"E"
	dw	offset	CODEO:in_enalag
	dw	CODEO
	db	"U"
	dw	offset	CODEO:in_synex_enal
	dw	CODEO
	db	"R"
	dw	offset	CODEO:in_symet_mz
	dw	CODEO
	db	"Q"
	dw	offset	CODEO:in_taytar
	dw	CODEO
	db	"!"
	dw	offset	CODEO:in_par_omilvn
	dw	CODEO
	db	"@"
	dw	offset	CODEO:in_par_dekadvn
	dw	CODEO
	db	"#"
	dw	offset	CODEO:in_par_dvdekadvn
	dw	CODEO
	db	"$"
	dw	offset	CODEO:in_par_ori7ad
	dw	CODEO
	db	"%"
	dw	offset	CODEO:in_par_kau7ad
	dw	CODEO
	db	"^"
	dw	offset	CODEO:in_par_diag_a
	dw	CODEO
	db	"&"
	dw	offset	CODEO:in_par_diag_b
	dw	CODEO
	db	"*"
	dw	offset	CODEO:in_par_ligont
	dw	CODEO
	db	"("
	dw	offset	CODEO:in_par_taytar
	dw	CODEO
	db	")"
	dw	offset	CODEO:in_par_sinex
	dw	CODEO
	db	">"
	dw	offset	CODEO:in_bar6
	dw	CODEO
	db	"<"
	dw	offset	CODEO:in_barues
	dw	CODEO
	db	":"
	dw	offset	CODEO:in_periodo
	dw	CODEO
	db	"0"
	dw	offset	CODEO:eisplhres
	dw	CODEO
	db	0,0,0,0,0,0

grptab	db	27,"D",30,0
pr_apo	db	9,"AŽ : ",0
pr_evs	db	"  „—‘ : ",0
promades dw	0

psyn	db	0	
	db	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
	db	21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37
	db	38,39,40,41,42,43,44,45,46,47,48,49

plhg	db	0
	db	0,1,2,3,4,5,6,7,8,9
	db	0,1,2,3,4,5,6,7,8,9
	db	0,1,2,3,4,5,6,7,8,9
	db	0,1,2,3,4,5,6,7,8,9
	db	0,1,2,3,4,5,6,7,8

pad	db	0
	db	1,1,1,1,1,2,2,2,2,2
	db	1,1,1,1,1,2,2,2,2,2
	db	1,1,1,1,1,2,2,2,2,2
	db	1,1,1,1,1,2,2,2,2,2
	db	1,1,1,1,1,2,2,2,2

pblhg	db	0
	db	1,2,3,4,5,6,7,8,9,0
	db	1,2,3,4,5,6,7,8,9,0
	db	1,2,3,4,5,6,7,8,9,0
	db	1,2,3,4,5,6,7,8,9,0
	db	1,2,3,4,5,6,7,8,9

ptay	db	0
	db	0,1,2,3,4,5,6,7,8
	db	0,1,2,3,4,5,6,7,8
	db	0,1,2,3,4,5,6,7,8
	db	0,1,2,3,4,5,6,7,8
	db	0,1,2,3,4,5,6,7,8
	db	0,1,2,3

psyen	db	0,1,2,1,1,2,1,0

	db	0,1,2,1,2,3,1,1,2,2,4,3,1,2,1,1
	db	1,1,2,1,3,4,2,2,1,1,3,2,1,2,1,0

	db	0,1,2,1,2,3,1,1,2,2,4,3,1,2,1,1
	db	2,2,2,2,4,5,3,3,1,1,3,2,1,2,1,1
	db	1,1,2,1,2,3,1,1,3,3,5,4,2,2,2,2
	db	1,1,2,1,3,4,2,2,1,1,3,2,1,2,1,0

pp10	db	0
	db	0,0,0,0,0,0,0,0,0
	db	1,1,1,1,1,1,1,1,1,1
	db	2,2,2,2,2,2,2,2,2,2
	db	3,3,3,3,3,3,3,3,3,3
	db	4,4,4,4,4,4,4,4,4,4

ppom	db	0
	db	0,0,0,0,0,0,0,0,0,0
	db	1,1,1,1,1,1,1,1,1,1
	db	2,2,2,2,2,2,2,2,2,2
	db	3,3,3,3,3,3,3,3,3,3
	db	4,4,4,4,4,4,4,4,4

pp12	db	0
	db	0,0,0,0,0,0,0,0,0,0
	db	0,0,1,1,1,1,1,1,1,1
	db	1,1,1,1,2,2,2,2,2,2
	db	2,2,2,2,2,2,3,3,3,3
	db	3,3,3,3,3,3,3,3,3

pp07	db	0
	db	0,0,0,0,0,0,0
	db	1,1,1,1,1,1,1
	db	2,2,2,2,2,2,2
	db	3,3,3,3,3,3,3
	db	4,4,4,4,4,4,4
	db	5,5,5,5,5,5,5
	db	6,6,6,6,6,6,6

ppk7	db	0
	db	0,1,2,3,4,5,6
	db	0,1,2,3,4,5,6
	db	0,1,2,3,4,5,6
	db	0,1,2,3,4,5,6
	db	0,1,2,3,4,5,6
	db	0,1,2,3,4,5,6
	db	0,1,2,3,4,5,6

ppda	db	0
	db	0,4,5,6,6,5,4
	db	1,0,4,5,6,6,5
	db	2,1,0,4,5,6,6
	db	3,2,1,0,4,5,6
	db	3,3,2,1,0,4,5
	db	2,3,3,2,1,0,4
	db	1,2,3,3,2,1,0
	
ppdb	db	0
	db	4,5,6,6,5,4,0
	db	5,6,6,5,4,0,1
	db	6,6,5,4,0,1,2
	db	6,5,4,0,1,2,3
	db	5,4,0,1,2,3,3
	db	4,0,1,2,3,3,2
	db	0,1,2,3,3,2,1

ppme	db	0
	db	0,0,0,0,0,0,0,0,0,0
	db	0,1,1,1,1,1,1,1,1,0
	db	0,1,1,1,1,1,1,1,1,0
	db	0,1,1,1,1,1,1,1,1,0
	db	0,0,0,0,0,0,0,0,0

pinpar	db	6,0,0,0,0,0
	db	6,0,0,0,0,0
	db	5,1,0,0,0,0
	db	1,5,0,0,0,0
	db	4,2,0,0,0,0
	db	2,4,0,0,0,0
	db	4,1,1,0,0,0
	db	1,4,1,0,0,0
	db	3,3,0,0,0,0
	db	3,3,0,0,0,0
	db	3,2,1,0,0,0
	db	3,1,2,0,0,0
	db	3,1,1,1,0,0
	db	1,3,1,1,0,0
	db	2,2,2,0,0,0
	db	2,2,2,0,0,0
	db	2,2,1,1,0,0
	db	1,2,2,1,0,0
	db	2,1,1,1,1,0
	db	1,2,1,1,1,0
	db	1,1,1,1,1,1
	db	1,1,1,1,1,1
	db	0

autosave_file	db	"C:AUTOSAVE.L92",0
def_disk_file	db	"DISK",0
inffile		db	"C:MEGA.INI",0
prnfile		db	"C:MEGA.PRN",0
klidifile	db	"C:MEGA.INF",0
megadir		db	"C:\MEGA",0
st_omad		db	0
stat_epanal	dw	0
stat_tepanal	dw	0
stat_kauist	dw	0
stat_tkauist	dw	0
genplires	db	50 dup(0)

copir		db	"Ž‚€‹‹€ €Œ€’“†‘ ‘“‘’†‹€’—Œ ŠŽ’’Ž ‹„‚€ŠŽ’’Ž",0
kali_tixi	db	"‰€Š† ’“•†!",0
;******************************************
lptfile		db	"LPT.INF",0

lptnames	db	"lpt1",0,0,0,0,0,0,0,0,0,0,0
		db	"lpt2",0,0,0,0,0,0,0,0,0,0,0
		db	"lpt3",0,0,0,0,0,0,0,0,0,0,0
		db	"eror",0,0,0,0,0,0,0,0,0,0,0

lpt_number	dw	offset lptnames

pio_prn		dw	0
protia_prn	db	0

plqqq		db	"Q",0,"q",0,0,0

etoima_diri	db	"C:*.STI",0
etoima_dir	db	"C:*.STE",0
etoima_disk	db	"C:"
etoima_name	db	20 dup(0)
etoima		db	"‘“‘’†‹€ ‚ˆ€ €Œ’ˆ‰€’€‘’€‘†",0
etoima_i	dw	0
etoima_stl	db	6 dup(0)
etoima_plr	db	50 dup(0)
etoima_pliuos	dw	0
ariumoi		db	0
etoima_mes	db	"„ˆ‘€‘’„ ‘ˆ‚Ž“Ž‘?",0
pletoima	db	"Q",0,"q",0,"T",0,"t",0,0,0
;********************************************************** SVSIMO (KLIDOMA)
prakt_name	db	40 dup(" "),0
prakt_code	db	15 dup(" "),0
timh		dw	50,0,0,0
timhp		dw	100,0,0,0
;*************************************************************
deltio2prn	db	210 dup(0)
;************************************************************* EPSON
		db	"EPSON"
epson_commands	label byte
		db	0			;prn_ascii
		db	27,64,0,0,0,0,0,0,0,0	;prn_reset
		db	12,0,0,0,0,0,0,0,0,0	;prn_formfeed
		db	27,"l",0,0,0,0,0,0,0,0	;prn_left_mergin_1
		db	0,0,0,0,0,0,0,0,0,0	;prn_left_mergin_2
		db	27,"3",0,0,0,0,0,0,0,0	;prn_vert_space_1
		db	0,0,0,0,0,0,0,0,0,0	;prn_vert_space_2
		db	27," ",0,0,0,0,0,0,0,0	;prn_hori_space_1
		db	0,0,0,0,0,0,0,0,0,0	;prn_hori_space_2
		db	27,"E",0,0,0,0,0,0,0,0	;prn_set_emfasis
		db	27,"F",0,0,0,0,0,0,0,0	;prn_can_emfasis
		db	27,"G",0,0,0,0,0,0,0,0	;prn_set_double
		db	27,"H",0,0,0,0,0,0,0,0	;prn_can_double
		db	27,"P",0,0,0,0,0,0,0,0	;prn_set_10cpi
		db	27,"M",0,0,0,0,0,0,0,0	;prn_set_12cpi
		db	27,15,0,0,0,0,0,0,0,0	;prn_set_conden
		db	27,18,0,0,0,0,0,0,0,0	;prn_can_conden
		db	10,13,0,0,0,0,0,0,0,0	;prn_line_feed
		db	27,"W","1",0,0,0,0,0,0,0 ;prn_expanded_on
		db	27,"W","0",0,0,0,0,0,0,0 ;prn_expanded_off
		db	27,"9",0,0,0,0,0,0,0,0	;prn_paperout_on
		db	27,"8",0,0,0,0,0,0,0,0	;prn_paperout_off
;************************************************************* HP-PCL
		db	"HPPCL"
pcl_commands	label byte
		db	1				;prn_ascii
		db	27,69,0,0,0,0,0,0,0,0		;prn_reset
		db	27,38,108,48,72,0,0,0,0,0	;prn_formfeed
		db	27,38,97,0,0,0,0,0,0,0		;prn_left_mergin_1
		db	76,0,0,0,0,0,0,0,0,0		;prn_left_mergin_2
		db	27,38,108,0,0,0,0,0,0,0		;prn_vert_space_1
		db	67,0,0,0,0,0,0,0,0,0		;prn_vert_space_2
		db	27,38,107,0,0,0,0,0,0,0		;prn_hori_space_1
		db	72,0,0,0,0,0,0,0,0,0		;prn_hori_space_2
		db	0,0,0,0,0,0,0,0,0,0		;prn_set_emfasis
		db	0,0,0,0,0,0,0,0,0,0		;prn_can_emfasis
		db	0,0,0,0,0,0,0,0,0,0		;prn_set_double
		db	0,0,0,0,0,0,0,0,0,0		;prn_can_double
		db	27,38,107,48,83,0,0,0,0,0	;prn_set_10cpi
		db	27,38,107,52,83,0,0,0,0,0	;prn_set_12cpi
		db	27,38,107,50,83,0,0,0,0,0	;prn_set_conden
		db	27,38,107,48,83,0,0,0,0,0	;prn_can_conden
		db	13,10,0,0,0,0,0,0,0,0		;prn_line_feed
		db	0,0,0,0,0,0,0,0,0,0		;prn_expanded_on
		db	0,0,0,0,0,0,0,0,0,0		;prn_expanded_off
		db	0,0,0,0,0,0,0,0,0,0		;prn_paperout_on
		db	0,0,0,0,0,0,0,0,0,0		;prn_paperout_off

;************************************************************* HP_PCL_NEW
;PCL COMMANDS_NEA_EKTIPOSI

pcl_asci		db	1
pcl_reset		db	27,69,0,0,0,0,0,0,0,0
pcl_formfeed		db	27,38,108,48,72,0,0,0,0,0
pcl_10cpi		db	27,38,107,48,83,0,0,0,0,0
pcl_12cpi		db	27,38,107,52,83,0,0,0,0,0
pcl_linefeed		db	10,13,0,0,0,0,0,0,0,0
pcl_mov_horiz1		db	27,38,97,0,0,0,0,0,0,0
pcl_mov_horiz2		db	72,0,0,0,0,0,0,0,0,0
pcl_mov_vert1		db	27,38,97,0,0,0,0,0,0,0
pcl_mov_vert2		db	86,0,0,0,0,0,0,0,0,0
pcl_select_charset	db	27,'(','1','2','U',0,0,0,0,0
pcl_set_height		db	27,'(','s','3','4','V',0,0,0,0,0
pcl_char		db	'þ',0

;----------------------------------------------------------
printer_commands	label byte
prn_ascii		db	0
prn_reset		db	10 dup(0)
prn_formfeed		db	10 dup(0)
prn_left_mergin_1	db	10 dup(0)
prn_left_mergin_2	db	10 dup(0)
prn_vert_space_1	db	10 dup(0)
prn_vert_space_2	db	10 dup(0)
prn_hori_space_1	db	10 dup(0)
prn_hori_space_2	db	10 dup(0)
prn_set_emfasis		db	10 dup(0)
prn_can_emfasis		db	10 dup(0)
prn_set_double		db	10 dup(0)
prn_can_double		db	10 dup(0)
prn_set_10cpi		db	10 dup(0)
prn_set_12cpi		db	10 dup(0)
prn_set_conden		db	10 dup(0)
prn_can_conden		db	10 dup(0)
prn_line_feed		db	10 dup(0)
prn_expanded_on		db	10 dup(0)
prn_expanded_off	db	10 dup(0)
prn_paperout_on		db	10 dup(0)
prn_paperout_off	db	10 dup(0)
;*************************************************************
pcl_prn			dw	0,0,0
;*************************************************************

ektip_lot		label	word
ektipotes_lot		dw	1
aytomato_lot		dw	1
anamoni_lot		dw	80
riumisi_pano_lot	dw	28,28,28
riumisi_aris_lot	dw	2,2,2
kena_kaueta_lot		dw	40,40,40
kena_kaueta_end_lot	dw	39,39,39
kena_orizontia_lot	dw	0,0,0
kena_oriz_end_lot	dw	1,1,1
emfasi_lot		dw	0,0,0
double_str_lot		dw	0,0,0
prchar_lot		dw	42,42,42
tiposekt_lot		dw	5,5,5
endiam_kau_lot		dw	3,3,3
endiam_oriz_lot		dw	3,3,3
kena_info_plr		dw	2,2,2

lptmax	dw	0
lptnum	dw	0
msg_n_o	db	"OXI",0,"NAI",0
msg_o_n	db	"NAI",0,"OXI",0
ektbuf	db	160 dup(0)
ektanap	dw	0,0,0
piodeltio dw	0,0
;********************************************
sel	dw	0
mnimi_save dw	0
mnimi_load dw	0
plright	db	0,@FUNC1,0,@CTRL_F9,0,@FUNC2,0,@FUNC3,0,@FUNC4,0,@LEFT_ARROW
	db	0,@RIGHT_ARROW,"+",0,"-",0,"O",0,0,@DEL,"T",0,@TAB,0,0,0
plomad	db	0,@FUNC1,0,@CTRL_F9,0,@LEFT_ARROW,0,@RIGHT_ARROW,0,@DOWN_ARROW,0,@UP_ARROW
	db	0,@PG_DOWN,"T",0,"A",0,"S",0,"O",0,"L",0,0,0
pltaf	db	"T",0,"t",0,"’","«",0,0
paragu	db	0,2,6,10,14,18,22,26,31,35,41,47,0
myparx1	db	"“€•„ˆ ‘“‘’†‹€ ‹„ ’Ž ˆƒˆŽ ŽŒŽ‹€",0
myparx2	db	"NA ’Ž ‘†‘—?",0
myparx3	db	"“€•„ˆ AXEIO ‹„ ’Ž ˆƒˆŽ ŽŒŽ‹€",0
mpathst	db	"      €’†‘’„ „Œ€ Š†‰’Ž",0
mpattaf	db	"  €’†‘’„ „Œ€ Š†‰’Ž",0
mbastat	db	"ƒ†‹ˆŽ“‚ˆ€ BA‘IK—Œ ‘THŠ—Œ",0
mbastat1 db	"Œ€ ‘“Œ„•ˆ‘— ?",0
meisagf	db	9 dup(0)
mejagf	db	9 dup(0)
dirmnimi db	"C:*.STL",0
eisagdisk db	"C:"
eisagf	db	20 dup(0)
ejagdisk db	"C:"
ejagf	db	20 dup(0)
direnosi db	"C:*.STL",0
eisagenosi1 db	"C:"
	db	20 dup(0)
eisagenosi2 db	"C:"
	db	20 dup(0)
ejagenosi db	"C:"
	db	20 dup(0)
directory db	"C:*.L92",0
filedisk db	"C:"
filename db	15 dup(0)
fileold	db	15 dup(0)
nikitries db	"C:NIKITR.STL",0
mload	db	"”Ž’—‹€ ‘“‘’†‹€’Ž‘",0
mdelsys	db	"‘†‘ˆ‹Ž ‘“‘’†‹€’Ž‘",0
mdelstl	db	"‘†‘ˆ‹Ž €•„ˆŽ“ ‘’†Š—Œ",0
mdelm	db	"‡A ‘†‘— ’Ž €•„ˆŽ ",12 dup(0)
mejod	db	"’„ŠŽ‘ „‚€‘ˆ€‘",0
mejod1	db	"“€•„ˆ ‘“‘’†‹€ ‘’† ‹Œ†‹†",0
mejod2	db	"Œ€ ’Ž €Ž‡†‰„“‘— ?",0
mclrs	db	"NEO ‘“‘’†‹€",0
mmnimi	db	"€•„ˆŽ ‘’†Š—Œ „ˆ‘€‚—‚†‘",0
mepej	db	"  ‹„’†‹€  ",0
manam	db	"  ANAMONH  ",0
mplhrof	db	" ‘“‘’†‹€ :            ‘’†Š„‘ :            OMAƒ„‘ :       OŽˆ :                  ",0
cursx	db	0
cursy	db	0
cursx1	db	0
cursy1	db	0
buffer1	db	205 dup(0)
buffer2	db	205 dup(0)
buffer3	db	205 dup(0)
strbuf	db	205 dup(0)
strbuf1	db	205 dup(0)
stl_plir dw	0,0,0
user1		dw	0,0
user_pointer 	dw	0,0
end_pointer  	dw	0,0
user_oros	dw	0
end_oros	dw	0
pios_oros	db	0
adress	dw	0
stdial	db	50 dup(0)
sdial	db	0
deltio	db	12 dup(0)
cdeltio	db	12 dup(0)
oroi_all dw	0
sthles	dw	2 dup(0)
sthles_old dw	2 dup(0)
mexritora dw	2 dup(0)
telos	dw	12 dup(0)
maxbar	dw	0,0		;«˜ «¨ ˜ «œ¢œ¬«˜ ˜ , «¦ «œ¢œ¬«˜ ¦ ™˜¨¦ª

plhres	db	50 dup(0)
plhres1	db	7 dup(0)
plhres2	db	7 dup(0)

statstil dw	2 dup(0)
sys_stat dw	0

sinuprot db	816 dup(0)		;16(50(" "),0) simuetes protasis
apliprot dw	64 dup(0)		;16 aples protasis(ean x tote y)+16*2word stat
pinomad	dw	12050 dup(0)		;999 omades*10word +999*2word stat
pinyper	dw	1050 dup(0)		;99 yperomades*5word+99*2word stat
ypoxromad dw	1000 dup(0)		;999 dieuy.ypoxr.omadvn
yperomad dw	1000 dup(0)		;999 dieuy.omadvn se yperomada
ypomad	dw	100 dup(0)		;99 dieyu.yperomadvn
plhuos	dw	0
omador	dw	0
omades	dw	0
aplesprot dw	0
yper	dw	0
yperom	dw	0
plhroi	dw	0
in_apo	dw	0
in_evs	dw	0
in_omada dw	0
epistrofi dw	0
information	label	byte
inf_arium	db	8 dup(" "),0
inf_stils	db	8 dup(" "),0
inf_plranapt	db	8 dup(" "),0
inf_66		db	"   .  ",0
inf_56		db	"   .  ",0
inf_46		db	"   .  ",0
inf_55		db	"   .  ",0
inf_45		db	"   .  ",0
inf_44		db	"   .  ",0
inf_plrf	db	8 dup(35 dup(" "),0)
DATA	ends

DATA1	segment	public
lotsthl	label	word		;‘’†Š„‘ ŠŽ’’Ž €Œ€ 1,2,3,4,5,6
	dd	1,0,0,0,0,0
	dd	2,1,0,0,0,0
	dd	3,3,1,0,0,0
	dd	4,6,4,1,0,0
	dd	5,10,10,5,1,0
	dd	6,15,20,15,6,1
	dd	7,21,35,35,21,7
	dd	8,28,56,70,56,28
	dd	9,36,84,126,126,84
	dd	10,45,120,210,252,210
	dd	11,55,165,330,462,462
	dd	12,66,220,495,792,924
	dd	13,78,286,715,1287,1716
	dd	14,91,364,1001,2002,3003
	dd	15,105,455,1365,3003,5005
	dd	16,120,560,1820,4368,8008
	dd	17,136,680,2380,6188,12376
	dd	18,153,816,3060,8568,18564
	dd	19,171,969,3876,11628,27132
	dd	20,190,1140,4845,15504,38760
	dd	21,210,1330,5985,20349,54264
	dd	22,231,1540,7315,26334,74613
	dd	23,253,1771,8855,33649,100947
	dd	24,276,2024,10626,42504,134596
	dd	25,300,2300,12650,53130,177100
	dd	26,325,2600,14950,65780,230230
	dd	27,351,2925,17550,80730,296010
	dd	28,378,3276,20475,98280,376740
	dd	29,406,3654,23751,118755,475020
	dd	30,435,4060,27405,142506,593775
	dd	31,465,4495,31465,169911,736281
	dd	32,496,4960,35960,201376,906192
	dd	33,528,5456,40920,237336,1107568
	dd	34,561,5984,46376,278256,1344904
	dd	35,595,6545,52360,324632,1623160
	dd	36,630,7140,58905,376992,1947792
	dd	37,666,7770,66045,435897,2324784
	dd	38,703,8436,73815,501942,2760681
	dd	39,741,9139,82251,575757,3262623
	dd	40,780,9880,91390,658008,3838380
	dd	41,820,10660,101270,749398,4496388
	dd	42,861,11480,111930,850668,5245786
	dd	43,903,12341,123410,962598,6096454
	dd	44,946,13244,135751,1086008,7059052
	dd	0,990,14190,148995,1221759,8145060
	dd	0,0,15180,163185,1370754,9366819
	dd	0,0,0,178365,1533939,10737573
	dd	0,0,0,0,1712304,12271512
	dd	0,0,0,0,0,13983816
DATA1	ends

EAXB	segment	public
pin1	dw	0
pin2	dw	0
metr	dw	0
metr1	dw	0
pinak1	db	21000 dup(0)
pinak2	db	21000 dup(0)
xarti	db	61 dup(0)
EAXB	ends

METABS	segment	public
	db	0
metablbuf db	49100 dup(0)
METABS	ends

PINOROI	segment	public
pinor	db	65300 dup(0)
stator	db	235 dup(0)
PINOROI	ends

PINMNHMHL segment public
	db	65535 dup(0)
PINMNHMHL ends

PINMNHMHS segment public
	db	65535 dup(0)
PINMNHMHS ends

WINDOWS	segment	public

wektipselect	db	3,30,8,21,5,70h,1
	db	" Ž„ˆŠŽ‚† „‰’“—’†",0
	db	"Ä",1
	db	"  1 ..DOT-MATRIX",0
	db	"  2 ..INK-JET EPSON",0
	db	"  3 ..INK-JET HP",0
		
wse58	db	4,9,5,26,5,70h,1
	db	"   1 ..„ˆ‘€‚—‚† Š†Ž“‘",0
	db	"   2 ..Žˆ‰ŽŒŽ‹ˆ€ ->",0
	db	"   3 ..MET†‹€ ‘’†Š—Œ",0
	db	"   4 ..„‰’“—‘† ƒ„Š’ˆ—Œ",0
	db	"   0 ..NEO Š†„‘",0


wektip	db	14,20,1,39,22,70h,2
	db	"           “‡‹ˆ‘†  „‰’“—’H",0
 	db	"Ä",1
	db	"       „‰’“—’„‘ :",0
	db	"       AY’Ž‹€’Ž  :",0
	db	"       ANA‹ŽŒ†   :",0
 	db	"Ä",1
	db	"                   ÚÄÄ1ÄÄÂÄÄ2ÄÄÂÄÄ3ÄÄ¿",0
	db	"     „ˆ‡—ˆŽ €Œ—³     ³     ³     ³",0
	db	" „ˆ‡—ˆŽ €ˆ‘’„Ž³     ³     ³     ³",0
	db	"  ‰“ˆ€ ‰€‡„’€ ‰„Œ€³     ³     ³     ³",0
	db	" „Œƒˆ€‹.‰€‡„’€ ‰„Œ€³     ³     ³     ³",0
	db	"  ‰“ˆ€ Oˆ…ŽŒ.‰„Œ€³     ³     ³     ³",0
	db	" „Œƒˆ€‹.Oˆ…ŽŒ.‰„Œ€³     ³     ³     ³",0
	db	"             „‹”€‘†³     ³     ³     ³",0
	db	"        2ž „‰’“—‘†³     ³     ³     ³",0
	db	"         •€€‰’†€‘³     ³     ³     ³",0
	db	" TOŽ‡„’†‘† ƒ„Š’ˆŽ“³     ³     ³     ³",0
	db	"                   ÀÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	" €Œ€ Ž‘€ „Œƒ.‰€‡„.³     ³     ³     ³",0
	db	" €Œ€ Ž‘€ „Œƒ.Oˆ….³     ³     ³     ³",0
	db	" LF €Ž Š†Ž”Žˆ„‘³     ³     ³     ³",0
	db	" 0=EPSON / 5=HP-PCL³     ³     ³     ³",0

wantigr	db	44,25,8,29,5,07h,2
	db	"      ANTI‚€”†  Ž‹€ƒ€‘",0
	db	0
	db	"     €Ž ’†Œ Ž‹€ƒ€ :",0
	db	"        ‘’†Œ Ž‹€ƒ€ :",0
	db	0

walagi	db	44,23,8,33,5,07h,2
	db	"          AŠŠ€‚† Ž‹€ƒ€‘",0
	db	0
	db	"         €Ž Ž‹€ƒ€ :",0
	db	"          ‘„ Ž‹€ƒ€ :",0
	db	0

wsbisom	db	44,23,7,31,7,07h,2
	db	0
	db	"        ‘†‘ˆ‹Ž  Ž‹€ƒ€‘",0
	db	0
	db	0
	db	"     ‘†‘„ ’†Œ Ž‹€ƒ€ :",0
	db	0
	db	0

wallor	db	44,18,7,45,10,07h,2
	db	0
	db	"        €ŠŠ€‚† Žˆ—Œ €‘ˆ‰—Œ Ž‹€ƒ€‘",0
	db	0
	db	"                Ž‹€ƒ€ :",0
	db	0
	db	"         (BA‘ˆ‰†) €Ž :",0
	db	"                  „—‘ :",0
	db	"     (‘“Œ„•Ž‹„Œ€) €Ž :",0
	db	"                  „—‘ :",0
	db	0

wmetatr	db	44,18,4,45,14,70h,2
	db	0
	db	"     META’Ž† €•„ˆŽ“ ‘’†Š—Œ ‘„ €‘ˆ‰„‘",0
	db	0
	db	"        €Ž ’†Œ ‘’†Š† :",0
	db	"              BA‘IKE‘ :",0
	db	0
	db	0
	db	"                Ž‹€ƒ€ :",0
	db	0
	db	"         (BA‘ˆ‰†) €Ž :",0
	db	"                  „—‘ :",0
	db	"     (‘“Œ„•Ž‹„Œ€) €Ž :",0
	db	"                  „—‘ :",0
	db	0

winputom db	3,7,20,65,3,70h,1
	db	" Ž‹€ƒ€ ³ /“ ³ OŽˆ ³ €Ž ³ E—‘ º €Ž ³ „—‘ º ‘†‹„ˆ€ ³ €Ž ³ „—‘ "
	db	"ÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ×ÄÄÄÄÄÅÄÄÄÄÄ×ÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ"
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³",0

wpanomad db	44,24,6,31,5,07h,2
	db	0
	db	0
	db	"     €Œ„ ‘’†Œ Ž‹€ƒ€ :",0
	db	0
	db	0

wpandelt db	44,24,6,34,5,07h,2
	db	0
	db	0
	db	"     €Œ„ ‘’O ƒ„Š’ˆŽ :",0
	db	0
	db	0

wpanoros db	44,24,6,31,5,07h,2
	db	0
	db	0
	db	"      €Œ„ ‘’OŒ OPO :",0
	db	0
	db	0

wstator	db	41,53,1,25,17,07h,2
	db	"      ‘’€’ˆ‘’ˆ‰† ŽŽ“",0
	db	0
	db	"      ‘’†Š„‘ :",0
	db	"     „€‘€Œ :",0
	db	0
	db	" ME‚ˆ‘’€",0
	db	"   E€Œ€Š†–† :",0
	db	" ‰€‡“‘’„†‘† :",0
	db	0
	db	" ’„Š„“’€ˆ€",0
	db	"   E€Œ€Š†–† :",0
	db	" ‰€‡“‘’„†‘† :",0
	db	0
	db	"     €ŽƒŽ‘† :",0
	db	0
	db	0
	db	0

wstat1	db	42,16,5,20,3,70h,2
	db	0
	db	"  !! ‘’€’ˆ‘’ˆ‰† !!",0
	db	0

waddf	db	40,45,14,33,8,70h,2
	db	0
	db	0
	db	" €•„ˆŽ „ˆ‘€‚—‚†‘ 1 :",0
	db	" AXEIŽ „ˆ‘€‚—‚†‘ 2 :",0
	db	0
	db	"    €•„ˆŽ „€‚—‚†‘ :",0
	db	0
	db	0

werrorl	db	37,20,7,40,7,70h,2
	db	0
	db	0
	db	"    !! Š€‡Ž‘ ‘’Ž €•„ˆŽ „ˆ‘€‚—‚†‘ !!",0
	db	"        !! TEŠŽ‘ „„„‚€‘ˆ€‘ !!",0
	db	"          €’†‘’„ „Œ€ Š†‰’Ž",0
	db	0
	db	0

werrors	db	38,6,16,39,3,70h,2
	db	0
	db	"    !! Š€‡Ž‘ ‘’Ž €•„ˆŽ „€‚—‚†‘ !!",0
	db	0

wpattaf	db	35,0,21,30,2,70h,2
	db	"      TEŠŽ‘ „„„‚€‘ˆ€‘",0
	db	"          €’†‘’„ '’'",0
	
wdialst	db	36,19,7,38,10,70h,2
	db	0
	db	0
	db	"     ‘’†Š†  €Œ€’“†‘ :",0
	db	0
	db	"                6Aˆ€ :",0
	db	"                5€ˆ€ :",0
	db	"                4€ˆ€ :",0
	db	"                3€ˆ€ :",0
	db	0
	db	0

wdial1	db	32,6,4,38,17,70h,1
	db	"   ƒ„Š’ˆŽ   ÚÄ6Ä¿ ÚÄ5Ä¿ ÚÄ4Ä¿ ÚÄ3Ä¿",0
	db	"Ä",1
	db	13 dup(0)
	db	"Ä",1
	db	0

wdial2	db	33,43,5,25,14,07h,1
	db	0
	db	"   ƒ„Š’ˆO :",0
	db	" „—‘ ’—€ :",0
	db	0
	db	"    ‘“ŒŽŠŽ  „ˆ’“•ˆ—Œ",0
	db	0
	db	"        6 : 0",0
	db	"        5 : 0",0
	db	"        4 : 0",0
	db	"        3 : 0",0
	db	"        2 : 0",0
	db	"        1 : 0",0
	db	"        0 : 0",0
	db	0

wnikitr	db	34,12,2,51,15,07h,1
	db	16 dup(0)

wdiafor	db	31,48,3,30,8,70h,1
	db	"   1 ..‹„’€’Ž† ‘„ €‘ˆ‰„‘",0
	db	"   2 ..€‘ˆ‰„‘ ‘’†Š„‘ (‘’€’)",0
	db	"   3 ..€ˆ‡‹Ž‘„ˆ„‘",0
	db	"   4 ..„Œ—‘† €•„ˆ—Œ ‘’†Š—Œ",0
	db	"   5 ..„‰’“—‘† Ž—Œ",0
	db	"   6 ..’ˆ‹† ‘’†Š.ŠŽ’’Ž/Ž’Ž",0
	db	"   7 ..EK’“—‘† ‘’†Š—Œ",0
	db	"   8 ..„ˆŠŽ‚† „‰’“—’†",0

wlotto	db	11,2,3,30,4,70h,1
	db	"   1 ..Œ„€ Œˆ‰H’ˆ€",0
	db	"   2 ..’“ŽŽˆ†‹„ŒŽ 58",0
	db	"   3 ..’“•€ˆ„‘ ‘’†Š„‘",0
	db	"   4 ..„’Žˆ‹€ ‘“‘’†‹€’€",0
	
warxeia	db	31,45,3,28,8,70h,1
	db	"   1 ..‘—‘ˆ‹Ž ‘“‘’†‹€’Ž‘",0
	db	"   2 ..”Ž’—‹€ ‘“‘’†‹€’Ž‘",0
	db	"   3 ..Ž‘‡„‘† Ž—Œ",0
	db	"   4 ..Oˆ‘‹Ž‘ ƒˆ‘‰Ž“",0
	db	"   5 ..Œ„Ž ‘“‘’†‹€",0
	db	"   6 ..‘†‘ˆ‹Ž ‘“‘’†‹€’Ž‘",0
	db	"   7 ..‘†‘ˆ‹Ž €•.‘’†Š—Œ",0
	db	"   8 ..„ŽƒŽ‘",0

wsave	db	29,22,9,35,5,70h,2
	db	"         ‘—‘ˆ‹Ž ‘“‘’†‹€’Ž‘",0
	db	0
	db	"     ONOMA €•„ˆŽ“ :",0
	db	0
	db	0

wmnimi	db	29,18,12,35,5,70h,2
	db	"     A•„ˆŽ ‘’†Š—Œ „€‚—‚†‘",0
	db	0
	db	"     ONOMA €•„ˆŽ“ :",0
	db	0
	db	0

wdeltio	db	51,1,2,50,5,07h,1
	db	"   1   2   3   4   5   6   7   8   9  10  ³ 1 ³ 6",0
	db	"  11  12  13  14  15  16  17  18  19  20  ³ 2 ³ 7",0
	db	"  21  22  23  24  25  26  27  28  29  30  ³ 3 ³ 8",0
	db	"  31  32  33  34  35  36  37  38  39  40  ³ 4 ³ 9",0
	db	"  41  42  43  44  45  46  47  48  49      ³ 5 ³ 0",0

wdiakopi db	90,7,22,64,1,70h,2
	db	"                    €’†‘’„  'Œ' ‚ˆ€ ƒˆ€‰Ž†",0
	
wplhres	db	99,3,2,71,17,07h,1
	db	15 dup(0)
	db	"Ä",1
	db	"      EI‘€‚—‚† Š†Ž“‘      ³  ‘†‹„ˆ€ :     ³  ‘’†Š„‘ : ",0
	
wstlouon db	25,20,3,20,15,70h,2
	db	15 dup(0)
	
wgentaj	db	21,27,9,26,5,07h,1
	db	0
	db	0
	db	"        TAˆŒŽ‹†‘†",0
	db	0
	db	0

wmetrstl db	22,19,7,38,6,70h,2
	db	0
	db	0
	db	"     ‘’†Š†  €Œ€’“†‘ :",0
	db	"               ‘’†Š„‘ :",0
	db	0
	db	0

wmetrdlt db	22,19,7,38,7,70h,2
	db	0
	db	0
	db	"     ‘’†Š†  €Œ€’“†‘ :",0
	db	"               ‘’†Š„‘ :",0
	db	"               ƒ„ŠTIA :",0
	db	0
	db	0

wepej	db	20,42,3,27,9,70h,1
	db	"   1 ..MET†‹€ ‘’†Š—Œ",0
	db	"   2 ..‹„’†‹€ ƒ„Š’ˆ—Œ",0
	db	"   3 ..ˆŒ€‰€‘ €ˆ‡‹—Œ",0
	db	"   4 ..„‰’“—‘† ƒ„Š’ˆ—Œ",0
	db	"   5 ..‘’†Š„‘ ‘’†Œ Ž‡ŽŒ†",0
	db	"   6 ..ƒˆ€ŠŽ‚† ‘’†Š—Œ",0
	db	"   7 ..ƒˆ€ŠŽ‚† ƒ„Š’ˆ—Œ",0
	db	"   8 ..„ˆ‘€‚—‚† :",0
	db	"   9 ..E€‚—‚†  :",0

wdelti	db	28,55,10,22,3,70h,2
	db	" Aˆ‡.ƒ„Š’. :",0
	db	" ‘’†Š.ƒ„Š’. :",0
	db	" MEXˆ ’—€ :",0

wdltpl	db	22,55,15,22,7,07h,2
	db	" „ ..EŽ‹„ŒŽ ƒ„Š’ˆŽ",0
	db	" Q ..„‰’“—‘† ƒ„Š’ˆŽ“",0
	db	" P ..“‡‹ˆ‘† „‰’“—’†",0
	db	" € ..€Œ„ ‘’Ž ƒ„Š’ˆŽ",0
	db	" ˆ ..Ž’Ž",0
	db	" ’ ..’„ŠO‘",0
	db	" ! ..ƒŽ‰ˆ‹† „‰’“—‘†‘",0
	
wmetabl	db	29,26,3,28,12,70h,1
	db	0
	db	"         6 ..100% 6",0
	db	"         5 ..100% 5",0
	db	"         4 ..100% 4",0
	db	"         3 ..100% 3",0
	db	"         2 ..100% 2",0
	db	"         1 ..100% 1",0
	db	0
	db	"Ä",1
	db	0
	db	"     F ..”ˆŠ’€ :",0
	db	0

wpinakas db	23,2,2,73,17,07h,1
	db	"  ³    0         1         2         3         4         5         6",0
	db	"ÄÄÅÄ",1
	db	" 1³",0
	db	"  ³",0
	db	" 8³",0
	db	"  ³",0
	db	"15³",0
	db	"  ³",0
	db	"22³",0
	db	"  ³",0
	db	"29³",0
	db	"  ³",0
	db	"36³",0
	db	"  ³",0
	db	"43³",0
	db	"ÄÄÁÄ",1
	db	"         ‘’†Š† €Œ€’“†‘ :                    ‘’†Š„‘ :",0
	db	0

woroi	db	2,6,2,65,16,70h,1
	db	" 0 ..Œ„Ž Š†„‘      ³ L ..Š†‚ŽŒ’„‘/‡„‘†   ³ M ..MONA-ZY‚€/‡„‘†",0
	db	" W ..€‘ˆ‰† ‘’†Š†    ³ K ..€Ž‘ Š†‚ŽŒ’—Œ  ³ N ..€€‘’€‘„ˆ‘ ‹…",0
	db	" S ..‘“‹‹„’ˆ‰€      ³ J ..€ŽŠ. Š†‚ŽŒ’„‘  ³ Z ..‹ŽŒ€-…“‚€",0
	db	" D ..€Ž‘           ³ H ..‘“Œ„•.Š†‚ŽŒ’„‘  ³ U ..‘“Œ„•.„Œ€Š.‹…",0
	db	" A ..€ŽŒ„‘          ³ G ..Ž‹.‘“Œ„•.Š†‚ŽŒ  ³ E ..„Œ€ŠŠ€‚„‘ ‹…",0
	db	" C ..Ž‹.‘“Œ„•Ž‹„Œ—Œ  ³ Y ..€ŽŠ.€Ž‘’€‘„ˆ‘ ³ R ..‘“‹‹„’ˆ‰€ ‹…",0
	db	" V ..„“Ž‘           ³ O ..’€ˆŒŽ‹.€Ž‘’€‘ ³ Q ..’€“’€ˆ‡‹Žˆ",0
	db	" B ..ƒˆ€‘’†‹€’€      ³ I ..‰„Œ€            ³ F ..ME‘€-„—",0
	db	" 1 ..MIKPA-‹„‚€Š€    ³ 2 ..€ˆ‘’„€-ƒ„ˆ€  ³ 3 ..MIK€-‹ŽŒ€",0
	db	" 8 ..ME‘€-€ˆ‘’„€   ³ 4 ..€ˆ‘’„€-‹ŽŒ€   ³ 5 ..‹„‘€-‹ŽŒ€",0
	db	" 6 ..€ˆ‘’„€-‹ˆ‰€  ³ 7 ..‹„‘€-‹ˆ‰€      ³ ) ...‘“Œ„•Ž‹„Œ—Œ",0
	db	" ! ...Ž‹ˆŠ—Œ        ³ @ ...ƒ„‰€ƒ—Œ       ³ # ...ƒ—ƒ„‰€ƒ—Œ",0
	db	" $ ...Žˆ….7€ƒ—Œ    ³ % ...‰€‡.7€ƒ—Œ     ³ ^ ...ƒˆ€‚—ŒˆŽ“ €'",0
	db	" & ...ƒˆ€‚—ŒˆŽ“ '  ³ * ...Š†‚ŽŒ’—Œ      ³ ( ...’€“’€ˆ‡‹—Œ",0
	db	" > ..‘“‹‹„’ˆ‰€ €† ³ < ..€Ž‘ €Œ€ ‡„‘†  ³ ~ ..„Œ€ŠŠ€‚„‘ €ƒ",0
	db	" | ..€ˆ‘-ƒ„ˆ€/‡„‘† ³ _ ..‹„‘€-„—/‡„‘†   ³ : ..„ˆŽƒŽ‘",0
	
wpezo	db	62,6,2,65,16,70h,1
	db	"          Š††      ³  Š†‚ŽŒ’„‘/‡„‘†      ³ MONA-ZY‚€/‡„‘†",0
	db	" €‘ˆ‰„‘ ‘’†Š„‘      ³ €Ž‘ Š†‚ŽŒ’—Œ      ³ €€‘’€‘„ˆ‘ ‹…",0
	db	"     ‘“‹‹„’ˆ‰€      ³ €ŽŠ. Š†‚ŽŒ’„‘      ³      ‹ŽŒ€-…“‚€",0
	db	"          €Ž‘      ³ ‘“Œ„•.Š†‚ŽŒ’„‘      ³  ‘“Œ„•.„Œ€Š.‹…",0
	db	"         €ŽŒ„‘      ³ Ž‹.‘“Œ„•.Š†‚ŽŒ      ³   „Œ€ŠŠ€‚„‘ ‹…",0
	db	" Ž‹.‘“Œ„•Ž‹„Œ—Œ      ³€ŽŠ.€Ž‘’€‘„ˆ‘      ³  ‘“‹‹„’ˆ‰€ ‹…",0
	db	"          „“Ž‘      ³’€ˆŒŽ‹.€Ž‘’€‘      ³    ’€“’€ˆ‡‹Žˆ",0
	db	"     ƒˆ€‘’†‹€’€      ³           ‰„Œ€      ³       ME‘€-„—",0
	db	" MIKPA - ‹„‚€Š€      ³ €ˆ‘’„€-ƒ„ˆ€      ³     MIK€-‹ŽŒ€",0
	db	"  ME‘€-€ˆ‘’„€      ³  €ˆ‘’„€-‹ŽŒ€      ³      ‹„‘€-‹ŽŒ€",0
	db	" €ˆ‘’„€-‹ˆ‰€      ³     ‹„‘€-‹ˆ‰€      ³  .‘“Œ„•Ž‹„Œ—Œ",0
	db	"   €€‚.Ž‹ˆŠ—Œ      ³      .ƒ„‰€ƒ—Œ      ³    .ƒ—ƒ„‰€ƒ—Œ",0
	db	"   .Žˆ….7€ƒ—Œ      ³    .‰€‡.7€ƒ—Œ      ³ .ƒˆ€‚—ŒˆŽ“ €'",0
	db	" .ƒˆ€‚—ŒˆŽ“ '      ³     .Š†‚ŽŒ’—Œ      ³  .’€“’€ˆ‡‹—Œ",0
	db	"  ‘“‹‹„’. €†      ³ €Ž‘ €Œ€ ‡„‘†      ³   „Œ€ŠŠ€‚„‘ €ƒ",0
	db	"€ˆ‘-ƒ„ˆ€/‡„‘†      ³  ‹„‘€-„—/‡„‘†      ³       „ˆŽƒŽ‘",0
	
womades	db	3,3,2,72,19,70h,1
	db	"  Š†† :       ³ ‘’€’ :        º‘“Œ„•Ž‹„ŒOIº     „‹”€Œˆ‘„ˆ‘     º ‘’€’ "
	db	"ÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÁÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ×ÄÄÄÄÄÂÄÄÄÄÄ×ÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ×ÄÄÄÄÄÄ"
	db	" Ž‹€ƒ€ ³ /“ ³ OŽˆ ³ €Ž ³ E—‘ º €Ž ³ „—‘ º ‘†‹„ˆ€ ³ €Ž ³ „—‘ º  %   "
	db	"ÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ×ÄÄÄÄÄÅÄÄÄÄÄ×ÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ×ÄÄÄÄÄÄ"
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0
	db	"       ³     ³      ³     ³     º     ³     º        ³     ³     º",0

wom0	db	"     F1 ..‘’€’ˆ‘’ˆ‰†   A ..€Œ’ˆ‚€”†   S ..‘†‘ˆ‹Ž   L ..€ŠŠ€‚†   O ..Oˆ€      ",0
wom2	db	"ÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÐÄÄÄÄÄÁÄÄÄÄÄÐÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÐÄ",0
wom1	db	"ÒÄÄÄÄÄÄÄÄÄÄÄÒÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÒ",0

wyperomad db	4,22,2,39,17,70h,1
	db	" “„Ž‹€ƒ€ ³ Ž‹€ƒ„‘ ³ €Ž ³ „—‘ ³ ‘’€’ "
	db	"ÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄ"
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0
	db	"           ³        ³     ³     ³",0

wapliprot db	6,21,2,42,20,70h,1
	db	"             €Š„‘  Ž’€‘„ˆ‘",0
	db	"ÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄ"
	db	"   ³ „€Œ „€‘„ˆ ³ ’Ž’„ Œ€ „€‘„ˆ ³ ‘’€’ "
	db	"   ³   † Ž‹€ƒ€   ³   ‰Aˆ H Ž‹€ƒ€   ³   %  "
	db	"ÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄ"
	db	" 1 ³             ³                 ³",0
	db	" 2 ³             ³                 ³",0
	db	" 3 ³             ³                 ³",0
	db	" 4 ³             ³                 ³",0
	db	" 5 ³             ³                 ³",0
	db	" 6 ³             ³                 ³",0
	db	" 7 ³             ³                 ³",0
	db	" 8 ³             ³                 ³",0
	db	" 9 ³             ³                 ³",0
	db	"10 ³             ³                 ³",0
	db	"11 ³             ³                 ³",0
	db	"12 ³             ³                 ³",0
	db	"13 ³             ³                 ³",0
	db	"14 ³             ³                 ³",0
	db	"15 ³             ³                 ³",0

wbasikh	db	99,2,3,51,19,07h,1
	db	15 dup(0)
	db	"Ä",1
	db	"  BA‘ˆ‰†      AŽ :    ³  „—‘ :    ³",0
	db	"ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄ´",0
	db	"  ‘YNEXOMENA  AŽ :    ³  „—‘ :    ³  Ž‹€ƒ€ :",0
	
w7x7	db	99,20,3,32,19,07h,1
	db	0
	db	"ÄÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ"
	db	"    ³6-0³5-1³4-2³3-3³2-4³1-5³0-6"
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 6-0³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 5-1³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 4-2³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 3-3³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 2-4³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 1-5³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ"
	db	" 0-6³   ³   ³   ³   ³   ³   ³",0
	db	"ÄÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄ"
	db	" OMAƒ€ :",0
	

winpar	db	99,3,4,50,7,07h,1
	db	0
	db	"ÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÄÂÄÄÄÂÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄ"
	db	" 6 ³51 ³42 ³411³33 ³321³3111³222³2211³21111³111111"
	db	"ÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄ"
	db	"   ³   ³   ³   ³   ³   ³    ³   ³    ³     ³",0
	db	"ÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÄÁÄÄÄÁÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄ"
	db	" Ž‹€ƒ€ :",0

wlguesi	db	99,4,3,69,16,07h,1
	db	"                            Š†‚ŽŒ’„‘ €Œ€ ‡„‘†",0
	db	"        Š1    Š2    Š3    Š4    Š5    Š6    Š7    Š8    Š9    Š0",0
	db	"      ÚÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"  ‡1  ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"      ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"  ‡2  ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"      ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"  ‡3  ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"      ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"  ‡4  ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"      ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"  ‡5  ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"      ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"  ‡6  ³     ³     ³     ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"      ÀÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	"       Ž‹€ƒ€ :",0
	
waplhg	db	99,20,3,29,16,07h,1
	db	"      €ŽŠ“’Žˆ Š†‚ŽŒ’„‘",0
	db	"        ÚÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"        ³ AŽ ³ „—‘ ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     Š1 ³     ³     ³",0
	db	"     Š2 ³     ³     ³",0
	db	"     Š3 ³     ³     ³",0
	db	"     Š4 ³     ³     ³",0
	db	"     Š5 ³     ³     ³",0
	db	"     Š6 ³     ³     ³",0
	db	"     Š7 ³     ³     ³",0
	db	"     Š8 ³     ³     ³",0
	db	"     Š9 ³     ³     ³",0
	db	"     Š0 ³     ³     ³",0
	db	"        ÀÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	" OMAƒA :",0
	
wstand	db	99,2,3,49,7,07h,1
	db	0
	db	"   ÚÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"   ³ 0-6 ³ 1-5 ³ 2-4 ³ 3-3 ³ 4-2 ³ 5-1 ³ 6-0 ³",0
	db	"   ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"   ³     ³     ³     ³     ³     ³     ³     ³",0
	db	"   ÀÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	"    OMAƒ€ :",0

wapoevs	db	99,18,3,35,6,07h,1
	db	0
	db	"       ÚÄÄÄÄÄÄÄ¿       ÚÄÄÄÄÄÄÄ¿",0
	db	"   €Ž ³       ³   „—‘ ³       ³",0
	db	"       ÀÄÄÄÄÄÄÄÙ       ÀÄÄÄÄÄÄÄÙ",0
	db	0
	db	"   OMAƒ€ :",0

wdiast	db	99,18,3,29,17,07h,1
	db	"         ƒˆ€‘’†‹€’€",0
	db	"        ÚÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"        ³ €Ž ³ „—‘ ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ‡1 ³     ³     ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ‡2 ³     ³     ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ‡3 ³     ³     ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ‡4 ³     ³     ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ‡5 ³     ³     ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ‡6 ³     ³     ³",0
	db	"        ÀÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	" OMAƒA :",0

wapolap	db	99,17,2,35,20,07h,1
	db	"        €ŽŠ“’„‘ €Ž‘’€‘„ˆ‘",0
	db	"                €Ž    „—‘ ",0
	db	"        ÚÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄ¿",0
	db	"        ³ 1-2 ³      ³      ³",0
	db	"        ³ 1-3 ³      ³      ³",0
	db	"        ³ 1-4 ³      ³      ³",0
	db	"        ³ 1-5 ³      ³      ³",0
	db	"        ³ 1-6 ³      ³      ³",0
	db	"        ³ 2-3 ³      ³      ³",0
	db	"        ³ 2-4 ³      ³      ³",0
	db	"        ³ 2-5 ³      ³      ³",0
	db	"        ³ 2-6 ³      ³      ³",0
	db	"        ³ 3-4 ³      ³      ³",0
	db	"        ³ 3-5 ³      ³      ³",0
	db	"        ³ 3-6 ³      ³      ³",0
	db	"        ³ 4-5 ³      ³      ³",0
	db	"        ³ 4-6 ³      ³      ³",0
	db	"        ³ 5-6 ³      ³      ³",0
	db	"        ÀÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÙ",0
	db	"  OMAƒA :",0

wtajiap	db	99,20,3,30,11,07h,1
	db	"   ’€ˆŒŽ‹†‹„Œ„‘ €Ž‘’€‘„ˆ‘",0
	db	"      ÚÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"      ³    ³ €Ž ³ „—‘ ³",0
	db	"      ÃÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"      ³ T1 ³     ³     ³",0
	db	"      ³ T2 ³     ³     ³",0
	db	"      ³ T3 ³     ³     ³",0
	db	"      ³ T4 ³     ³     ³",0
	db	"      ³ T5 ³     ³     ³",0
	db	"      ÀÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	" OMAƒA :",0

wkena	db	99,18,3,29,7,07h,1
	db 	"              ÚÄÄÄ¿",0
	db	"         KENA ³   ³",0
	db	"              ÀÄÄÄÙ",0
	db	"       ÚÄÄÄ¿         ÚÄÄÄ¿",0
	db	"   €Ž ³   ³     E—‘ ³   ³",0
	db	"       ÀÄÄÄÙ         ÀÄÄÄÙ",0
	db	" Ž‹€ƒ€ :",0

wsymetr	db	99,17,3,29,8,07h,1
	db	"          ‘“‹‹„’ˆ‰€",0
	db 	"              ÚÄÄÄÄ¿",0
	db	"       ‰„Œ’Ž ³    ³",0
	db	"              ÀÄÄÄÄÙ",0
	db	"       ÚÄÄÄ¿         ÚÄÄÄ¿",0
	db	"   €Ž ³   ³     E—‘ ³   ³",0
	db	"       ÀÄÄÄÙ         ÀÄÄÄÙ",0
	db	" Ž‹€ƒ€ :",0

wtaytar	db	99,17,3,29,15,07h,1
	db	"         TAYTAˆ‡‹Žˆ",0
	db	"        ÚÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"        ³ AŽ ³ „—‘ ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"     ’1 ³     ³     ³",0
	db	"     ’2 ³     ³     ³",0
	db	"     ’3 ³     ³     ³",0
	db	"     ’4 ³     ³     ³",0
	db	"     ’5 ³     ³     ³",0
	db	"     ’6 ³     ³     ³",0
	db	"     ’7 ³     ³     ³",0
	db	"     ’8 ³     ³     ³",0
	db	"     ’9 ³     ³     ³",0
	db	"        ÀÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	" OMAƒA :",0

wuesis	db	99,6,3,43,7,07h,1
	db	0
	db	"   ÚÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"   ³  1  ³  2  ³  3  ³  4  ³  5  ³  6  ³",0
	db	"   ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"   ³     ³     ³     ³     ³     ³     ³",0
	db	"   ÀÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	"    OMAƒ€ :",0

wbarues	db	99,6,3,43,10,07h,1
	db	0
	db	"   ÚÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄ¿",0
	db	"   ³  1  ³  2  ³  3  ³  4  ³  5  ³  6  ³",0
	db	"   ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ´",0
	db	"   ³     ³     ³     ³     ³     ³     ³",0
	db	"   ÀÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÙ",0
	db	0
	db	"           AŽ :       „—‘ :",0
	db	0
	db	"    OMAƒ€ :",0

wbar6	db	99,17,2,35,10,07h,1
	db	0
	db	"                 €Ž    „—‘ ",0
	db	"        ÚÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄ¿",0
	db	"        ³ 1-6 ³      ³      ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´",0
	db	"        ³ 2-5 ³      ³      ³",0
	db	"        ÃÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄ´",0
	db	"        ³ 3-4 ³      ³      ³",0
	db	"        ÀÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÙ",0
	db	"    OMAƒA :",0

wperio	db	99,20,5,21,6,07h,1
	db	0
	db	0
	db	"     ÚÄÄÄÄÄÄÄÄ¿",0
	db	"     ³        ³",0
	db	"     ÀÄÄÄÄÄÄÄÄÙ",0
	db	0

wproto	db	2,12,5,46,12,70h,1
	db	0
	db	"                             ÚÄ¿ÚÄ¿ÚÄ¿ÄÂÄÚÄ¿",0
	db	"                             ³ ³ÃÄÙ³ ³ ³ ³ ³",0
	db	"     AŽ ’Ž ƒ„Š’ˆŽ :         ³  ³  ÀÄÙ ³ ÀÄÙ",0
	db	"   ‚ˆ€ Ž‘€ ƒ„Š’ˆ€ :",0
	db	0
	db	"   ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿",0
	db	"   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³",0
	db	"   ³ 1 ³ 2 ³ 3 ³ 4 ³ 5 ³ 6 ³10 ³20 ³50 ³100³",0
	db	"   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³   ³",0
	db	"   ÀÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ",0
	db	0

wsbisim	db	12,26,7,28,7,70h,2
	db	0
	db	0
	db	"      ÚÄÄÄÄÄ¿  ",0
	db	"      ³ DEL ³  ‘†‘ˆ‹Ž",0
	db	"      ÀÄÄÄÄÄÙ  ",0
	db	0
	db	0

keno	db	23,3,2,71,17,07h,1
	db	17 dup(0)

periom	db	"„ˆŽƒŽ‘",0
barues	db	"€Ž‘ €Œ€ ‡„‘†",0
bar6	db	"‘“‹‹„’ˆ‰€ €†",0
mikmon	db	"MIK€-‹ŽŒ€",0
arimon	db	"€ˆ‘’„€-‹ŽŒ€",0
mesmon	db	"‹„‘€-‹ŽŒ€",0
arimik	db	"€ˆ‘’„€-‹ˆ‰€",0
mesmik	db	"‹„‘€-‹ˆ‰€",0
mesari	db	"‹„‘€-€ˆ‘’„€",0
monazi	db	"‡„‘EI‘ ‹ŽŒ—Œ-…“‚—Œ",0
aredej	db	"‡„‘EI‘ €ˆ‘’„—Œ-ƒ„ˆ—Œ",0
mesaej	db	"‡„‘EI‘ ME‘€-„—",0
mparmon	db	"€€‘’€‘„ˆ‘ ‹ŽŒ—Œ-…“‚—Œ",0
mmonaz	db	"‹ŽŒ€-…“‚€",0
mmesae	db	"‹„‘€-„—",0
mmikram	db	"MIKPA-‹„‚€Š€",0
maristd	db	"€ˆ‘’„€-ƒ„ˆ€",0
mevros	db	"E“Ž‘ ‘’†Š†‘",0
mbaros	db	"€Ž‘ ‘’†Š†‘",0
mlisix	db	"‘“Œ„•.Š†‚ŽŒ’„‘",0
momlig	db	"Ž‹€ƒ„‘ ‘“Œ„•Ž‹„Œ—Œ Š†‚ŽŒ’—Œ",0
menal	db	"„Œ€ŠŠ€‚„‘ ‹…",0
menalad	db	"„Œ€ŠŠ€‚„‘ €ƒ",0
msenal	db	"‘“Œ„•Ž‹„Œ„‘ „Œ€ŠŠ€‚„‘ MZ",0
msymmz	db	"‘“‹‹„’ˆ‰€ ‹…",0
msymsh	db	"‘“‹‹„’ˆ‰€ ‘†‹„ˆ€",0
majon	db	"AŽŒ„‘",0
mosin	db	"O‹€ƒ„‘ ‘“Œ„•Ž‹„Œ—Œ ‘†‹„ˆ—Œ",0
mblig	db	"€Ž‘ Š†‚ŽŒ’—Œ",0
mpdek	db	"€€‚—‚€ ƒ„‰€ƒ—Œ",0
mpdvd	db	"€€‚—‚€ ƒ—ƒ„‰€ƒ—Œ",0
mpomil	db	"€€‚—‚€ Ž‹ˆŠ—Œ",0
mpor7	db	"€€‚—‚€ Žˆ…ŽŒ’ˆ—Œ 7€ƒ—Œ",0
mpka7	db	"€€‚—‚€ ‰€‡„’—Œ 7€ƒ—Œ",0
mpsin	db	"€€‚—‚€ ‘“Œ„•Ž‹„Œ—Œ",0
mplig	db	"€€‚—‚€ Š†‚ŽŒ’—Œ",0
mptayt	db	"€€‚—‚€ ’€“’€ˆ‡‹—Œ",0
mpdiga	db	"€€‚—‚€ ƒˆ€‚—ŒˆŽ“ €'",0
mpdigb	db	"€€‚—‚€ ƒˆ€‚—ŒˆŽ“ B'",0

paliaver db	90,20,5,41,10,70h,2
	db	0
	db	"             !!! Ž‘Ž•† !!!",0
	db	0
	db	"           TO ‘“‘’†‹€ ‚€”†‰„",0
	db	"    ‘„ €Šˆ€ VERSION ’Ž“ MEGA LOTTO",0
	db	"  ƒˆŽ‡—‘’„ ŽŠŽ“‘ ’Ž“‘ ŽŽ“‘ '€€‚—‚€'",0
	db	"            ’Ž“ ‘“‘’†‹€’Ž‘",0
	db	0
	db	"         €’†‘’„ TO Š†‰’Ž 'T'",0
	db	0

wprakt	db	98,1,1,44,2,07h,2
	db	"           €‰’Ž„ˆŽ ŽŽ-ŠŽ’’Ž",0
	db	0

wcright	db	1,15,3,45,19,07h,2
	db	0
	db	"      ±±±  ±±±  ±±±±±±±  ±±±±±   ±±±±±",0
	db	"     ±± ±±±± ±± ±±      ±±      ±±   ±±",0
	db	"     ±±  ±±  ±± ±±±±±   ±±  ±±± ±±   ±±",0
	db	"     ±±      ±± ±±      ±±   ±± ±±±±±±±",0
	db	"     ±±      ±± ±±±±±±±  ±±±±±  ±±   ±±",0
	db	0
	db	"                    ±±±±±±",0
	db	"     ±±       ±±±±±   ±±         ±±±±±",0
	db	"     ±±      ±±±  ±±  ±± ±±±±±± ±±±  ±±",0
	db	"     ±±      ±±±  ±±  ±±   ±±   ±±±  ±±",0
	db	"     ±±      ±±±  ±±  ±±   ±±   ±±±  ±±",0
	db	"     ±±      ±±±  ±±  ±±   ±±   ±±±  ±±",0
	db	"     ±±±±±±±  ±±±±±        ±±    ±±±±±",0
;**************************************************************
IFDEF	@DEMO
;**************************************************************
	db	"  EKƒO‘H EIƒEIH‘ (DEMO)  ±±    2009",0
;**************************************************************
ENDIF
;**************************************************************
IFDEF	@PAIKTIS
;**************************************************************
	db	"  EKƒO‘H €IKTH            ±±    2009",0
;**************************************************************
ENDIF
;**************************************************************
IFDEF	@NORMAL
;**************************************************************
	db	"  „‰ƒŽ‘† €‰’Ž„ˆŽ        ±±    2009",0
;**************************************************************
ENDIF
;**************************************************************
	db	0
	db	"   "
tstcpr1	db	"(c)1993 ’…—’…€‰†‘ ƒ. & €€ƒŽŽ“ŠŽ‘ Š.",0
	db	"            http://propo.go.to",0
	db	"        e-mail:leonidas@freemail.gr",0

tstcpr2	label	byte
XORDATA	<(c)1993 ’…—’…€‰†‘ ƒ. & €€ƒŽŽ“ŠŽ‘ Š.>,30
	db	0

wmergeo	db	2,20,8,40,5,07h,2
	db	0
	db	"   ’Ž €•„ˆŽ Ž“ ‡„Š„’„ Œ€ Ž‘‡„‘„’„",0
	db	"    •†‘ˆ‹ŽŽˆ„ˆ ‰ŽˆŒ„‘ Ž‹€ƒ„‘ ‹„ ’Ž",0
	db	"         †ƒ† “€•OŒ ‘’†Œ ‹Œ†‹†",0
	db	0

wmergey	db	2,20,8,40,5,07h,2
	db	0
	db	"   ’Ž €•„ˆŽ Ž“ ‡„Š„’„ Œ€ Ž‘‡„‘„’„",0
	db	"  •†‘ˆ‹ŽŽˆ„ˆ ‰ŽˆŒ„‘ Y„Ž‹€ƒ„‘ ‹„ ’Ž",0
	db	"         †ƒ† “€•OŒ ‘’†Œ ‹Œ†‹†",0
	db	0

wmergep	db	2,20,8,40,4,07h,2
	db	0
	db	"   ’Ž €•„ˆŽ Ž“ ‡„Š„’„ Œ€ Ž‘‡„‘„’„",0
	db	"     •†‘ˆ‹ŽŽˆ„ˆ ŽŠŠ„‘ Ž’€‘„ˆ‘",0
	db	0

wmergem	db	2,20,8,40,5,07h,2
	db	0
	db	"   ’Ž €•„ˆŽ Ž“ ‡„Š„’„ Œ€ Ž‘‡„‘„’„",0
	db	"          ƒ„Œ •—€„ˆ ‹€…ˆ ‹„ ’Ž",0
	db	"         †ƒ† “€•OŒ ‘’†Œ ‹Œ†‹†",0
	db	0

wexase	db	3,18,9,40,5,07h,2
	db	0
	db	"           † ‘’†Š† €“’† •€Œ„I",0
	db	0
	db	0
	db	0

exase1	db	"          ‘’ŽŒ “Ž•„—’ˆ‰Ž ŽŽ",0
exase2	db	"             ‘’†Œ Ž’€‘†",0
exase3	db	"              ‘’†Œ Ž‹€ƒ€",0
exase4	db	"            ‘’†Œ “„Ž‹€ƒ€",0

wetoima	db	18,6,20,62,1,07h,1
	db	" ‘“‘’†‹€ :            ‘’†Š„‘ :            ‘†‹„ˆ€ Š†Ž“‘ :",0

wmetoima db	19,33,6,26,11,70h,1
	db	"    „’Žˆ‹€  ‘“‘’†‹€’€",0
	db	"Ä",1
	db	0
	db	"  1 ..„ˆŠŽ‚† ‘“‘’H‹€’Ž‘",0
	db	0
	db	"  2 ..‘“‘’†‹€’€ „Š€’—Œ",0
	db	0
	db	"  6 ..‘†‘ˆ‹Ž ‘“‘’†‹€’—Œ",0
	db	0
	db	"  0 ..TEŠŽ‘",0
	db	0

wdetoima db	20,36,8,20,7,70h,1
	db	0
	db	0
	db	"    1 ..ƒˆ€ŠŽ‚†",0
	db	0
	db	"    2 ..„‰’“—‘†",0
	db	0
	db	0
		
wetdil	db	33,43,6,25,11,07h,1
	db	0
	db	"    ‘“ŒŽŠŽ  „ˆ’“•ˆ—Œ",0
	db	0
	db	"        6 : 0",0
	db	"        5 : 0",0
	db	"        4 : 0",0
	db	"        3 : 0",0
	db	"        2 : 0",0
	db	"        1 : 0",0
	db	"        0 : 0",0
	db	0

wsaves	db	97,0,0,80,24,07h,0
	db	25 dup(0)

wsaves1	db	96,0,0,14,3,70h,1
	db	0
	db	"  MEGA LoTTo",0
	db	0

warsira	db	39,51,7,26,7,70h,1
	db	"       Aˆ‡‹Ž‘„ˆ„‘",0
	db	"Ä",1
	db	0
	db	"      €ˆ‡‹Ž‘„ˆ„‘ :",0
	db	"   NOYME€ (12,18) :",0
	db	"  NIKITˆ„‘ (5-20) :",0
	db	0

wprofes	db	19,12,10,50,6,70h,2
	db	0
	db	"      H Š„ˆ’Ž“‚ˆ€ €“’† ƒˆ€’ˆ‡„’€ˆ ‹ŽŒŽ ‘’†Œ",0
	db	"      „€‚‚„Š‹€’ˆ‰† „‰ƒŽ‘† ’Ž“ Ž‚€‹‹€’Ž‘.",0
	db	"           ‚ˆ€ „ˆ‘‘Ž’„„‘ Š†Ž”Žˆ„‘",0
	db	"           ’†ŠE”—Œ†‘’„ ‘’Ž (094)540-590",0
	db	0

winfo	db	96,2,1,37,22,07h,2
	db	0
	db	"           ‘“‘’†‹€ :",0
	db	"           €ˆ‡‹Žˆ :",0
	db	"            ‘’†Š„‘ :",0
	db	" ‘’†Š„‘ Š†.€Œ€’.:",0
	db	0
	db	"   €ŽƒŽ‘† 6 ‘’€ 6 :       %",0
	db	"   €ŽƒŽ‘† 5 ‘’€ 6 :       %",0
	db	"   €ŽƒŽ‘† 4 ‘’€ 6 :       %",0
	db	"   €ŽƒŽ‘† 5 ‘’€ 5 :       %",0
	db	"   €ŽƒŽ‘† 4 ‘’€ 5 :       %",0
	db	"   €ŽƒŽ‘† 4 ‘’€ 4 :       %",0
	db	0
	db	" Š†Ž”Žˆ„‘",0
	db	8 dup(0)


wtimes	db	97,20,6,31,8,70h,2
	db	"    ’ˆ‹„‘",0
	db	"Ä",1
	db	0
	db	"    ’ˆ‹† ‘’†Š†‘ ŠŽ’’Ž :",0
	db	"    ’ˆ‹† ‘’†Š†‘ Ž’Ž :",0
	db	0
	db	"-",1
	db	"        (E“— ® 10)"

WINDOWS	ends
	end
