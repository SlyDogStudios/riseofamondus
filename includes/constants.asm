; remap some punctuation for ascii
.charmap $21,$3e	; !
.charmap $22,$5b	; "
.charmap $27,$5c	; '
.charmap $2b,$5d	; +
.charmap $2c,$3c	; ,
.charmap $2d,$5e	; -
.charmap $2e,$3d	; .
.charmap $20,$00	; (space)

; Constants

a_punch				=	$01
b_punch				=	$02
select_punch		=	$04
start_punch			=	$08
up_punch			=	$10
down_punch			=	$20
left_punch			=	$40
right_punch			=	$80
up_left				=	$50
up_right			=	$90
down_left			=	$60
down_right			=	$a0


amondus_right_speed	=	$0060
amondus_left_speed	=	$0070
amondus_y_speed		=	$0080
scroll_speed		=	$0010
amondus_speed		=	$0100
tornado_speed		=	$0050
boss3_speed			=	$0020
energy_speed		=	$0030
ship_speed			=	$0004

pal_address			=	$100
e_bullet_type		=	$120
e_bullet_offset		=	$129
e_bullet_sprite_offset	=	$132
b_left				=	$13b
b_right				=	$156
b_top				=	$171
b_bot				=	$18c
b_finished			=	$1a7
;next would be $1c2

OAM_ram				=	$200

; Sprite ram
r_left_side				=	$400
r_right_side			=	$404
g_left_side				=	$408
g_right_side			=	$40c
p_left_side				=	$410
p_right_side			=	$414
raven1					=	$418
raven1_x				=	$41b
raven2					=	$41c
raven2_x				=	$41f
raven3					=	$420
raven3_x				=	$423
evil					=	$424
evil2					=	$428
charwit_fire			=	$42c

enemy_spr0_0y			=	$430
enemy_spr0_0tile		=	$431
enemy_spr0_0attr		=	$432
enemy_spr0_0x			=	$433

enemy_spr0_1y			=	$434
enemy_spr0_1tile		=	$435
enemy_spr0_1attr		=	$436
enemy_spr0_1x			=	$437

enemy_spr0_shot1y		=	$438
enemy_spr0_shot1tile	=	$439
enemy_spr0_shot1attr	=	$43a
enemy_spr0_shot1x		=	$43b

enemy_spr0_shot2y		=	$43c
enemy_spr0_shot2tile	=	$43d
enemy_spr0_shot2attr	=	$43e
enemy_spr0_shot2x		=	$43f

enemy_spr0_shot3y		=	$440
enemy_spr0_shot3tile	=	$441
enemy_spr0_shot3attr	=	$442
enemy_spr0_shot3x		=	$443



enemy_spr1_0y			=	$444
enemy_spr1_0x			=	$447

enemy_spr1_1y			=	$448
enemy_spr1_1x			=	$44b

enemy_spr1_shot1y		=	$44c
enemy_spr1_shot1tile	=	$44d
enemy_spr1_shot1attr	=	$44e
enemy_spr1_shot1x		=	$44f

enemy_spr1_shot2y		=	$450
enemy_spr1_shot2tile	=	$451
enemy_spr1_shot2attr	=	$452
enemy_spr1_shot2x		=	$453

enemy_spr1_shot3y		=	$454
enemy_spr1_shot3tile	=	$455
enemy_spr1_shot3attr	=	$456
enemy_spr1_shot3x		=	$457

enemy_spr2_0y			=	$458
enemy_spr2_0x			=	$45b
enemy_spr2_1y			=	$45c
enemy_spr2_1x			=	$45f
enemy_spr2_shot1y		=	$460
enemy_spr2_shot1tile	=	$461
enemy_spr2_shot1attr	=	$462
enemy_spr2_shot1x		=	$463
enemy_spr2_shot2y		=	$464
enemy_spr2_shot2tile	=	$465
enemy_spr2_shot2attr	=	$466
enemy_spr2_shot2x		=	$467
enemy_spr2_shot3y		=	$468
enemy_spr2_shot3tile	=	$469
enemy_spr2_shot3attr	=	$46a
enemy_spr2_shot3x		=	$46b

enemy_spr3_0y			=	$46c
enemy_spr3_0x			=	$46f
enemy_spr3_1y			=	$470
enemy_spr3_1x			=	$473
enemy_spr3_shot1y		=	$474
enemy_spr3_shot1tile	=	$475
enemy_spr3_shot1attr	=	$476
enemy_spr3_shot1x		=	$477
enemy_spr3_shot2y		=	$478
enemy_spr3_shot2tile	=	$479
enemy_spr3_shot2attr	=	$47a
enemy_spr3_shot2x		=	$47b
enemy_spr3_shot3y		=	$47c
enemy_spr3_shot3tile	=	$47d
enemy_spr3_shot3attr	=	$47e
enemy_spr3_shot3x		=	$47f

enemy_spr4_0y			=	$480
enemy_spr4_0x			=	$483
enemy_spr4_1y			=	$484
enemy_spr4_1x			=	$487
enemy_spr4_shot1y		=	$488
enemy_spr4_shot1tile	=	$489
enemy_spr4_shot1attr	=	$48a
enemy_spr4_shot1x		=	$48b
enemy_spr4_shot2y		=	$48c
enemy_spr4_shot2tile	=	$48d
enemy_spr4_shot2attr	=	$48e
enemy_spr4_shot2x		=	$48f
enemy_spr4_shot3y		=	$490
enemy_spr4_shot3tile	=	$491
enemy_spr4_shot3attr	=	$492
enemy_spr4_shot3x		=	$493

enemy_spr5_0y			=	$494
enemy_spr5_0x			=	$497
enemy_spr5_1y			=	$498
enemy_spr5_1x			=	$49b
enemy_spr5_shot1y		=	$49c
enemy_spr5_shot1tile	=	$49d
enemy_spr5_shot1attr	=	$49e
enemy_spr5_shot1x		=	$49f
enemy_spr5_shot2y		=	$4a0
enemy_spr5_shot2tile	=	$4a1
enemy_spr5_shot2attr	=	$4a2
enemy_spr5_shot2x		=	$4a3
enemy_spr5_shot3y		=	$4a4
enemy_spr5_shot3tile	=	$4a5
enemy_spr5_shot3attr	=	$4a6
enemy_spr5_shot3x		=	$4a7

enemy_spr6_0y			=	$4a8
enemy_spr6_0x			=	$4ab
enemy_spr6_1y			=	$4ac
enemy_spr6_1x			=	$4af
enemy_spr6_shot1y		=	$4b0
enemy_spr6_shot1tile	=	$4b1
enemy_spr6_shot1attr	=	$4b2
enemy_spr6_shot1x		=	$4b3
enemy_spr6_shot2y		=	$4b4
enemy_spr6_shot2tile	=	$4b5
enemy_spr6_shot2attr	=	$4b6
enemy_spr6_shot2x		=	$4b7
enemy_spr6_shot3y		=	$4b8
enemy_spr6_shot3tile	=	$4b9
enemy_spr6_shot3attr	=	$4ba
enemy_spr6_shot3x		=	$4bb

enemy_spr7_0y			=	$4bc
enemy_spr7_0x			=	$4bf
enemy_spr7_1y			=	$4c0
enemy_spr7_1x			=	$4c3
enemy_spr7_shot1y		=	$4c4
enemy_spr7_shot1tile	=	$4c5
enemy_spr7_shot1attr	=	$4c6
enemy_spr7_shot1x		=	$4c7
enemy_spr7_shot2y		=	$4c8
enemy_spr7_shot2tile	=	$4c9
enemy_spr7_shot2attr	=	$4ca
enemy_spr7_shot2x		=	$4cb
enemy_spr7_shot3y		=	$4cc
enemy_spr7_shot3tile	=	$4cd
enemy_spr7_shot3attr	=	$4ce
enemy_spr7_shot3x		=	$4cf

enemy_spr8_0y			=	$4d0
enemy_spr8_0x			=	$4d3
enemy_spr8_1y			=	$4d4
enemy_spr8_1x			=	$4d7
enemy_spr8_shot1y		=	$4d8
enemy_spr8_shot1tile	=	$4d9
enemy_spr8_shot1attr	=	$4da
enemy_spr8_shot1x		=	$4db
enemy_spr8_shot2y		=	$4dc
enemy_spr8_shot2tile	=	$4dd
enemy_spr8_shot2attr	=	$4de
enemy_spr8_shot2x		=	$4df
enemy_spr8_shot3y		=	$4e0
enemy_spr8_shot3tile	=	$4e1
enemy_spr8_shot3attr	=	$4e2
enemy_spr8_shot3x		=	$4e3

mm1						=	$4e4
mm1x					=	$4e7
mm2						=	$4e8
mm2x					=	$4eb
mm3						=	$4ec
mm3x					=	$4ef
mm4						=	$4f0
mm4x					=	$4f3

mm_left					=	$600
mm_right				=	$604
mm_top					=	$608
mm_bot					=	$60c
mm_launcher				=	$610
hold_y					=	$611
raven1y					=	$612
raven2y					=	$613
raven3y					=	$614
raven1x					=	$615
raven2x					=	$616
raven3x					=	$617
raven1fine				=	$618
raven2fine				=	$619
raven3fine				=	$61a

;e_top					=	$61b	;.res 9
;e_bot					=	$624	;.res 9
;e_left					=	$62d	;.res 9
;e_right					=	$636	;.res 9
g_hold					=	$63f	;.res 1
g_hold_offset			=	$640
top_left_y				=	$641
top_left_x				=	$642
top_right_y				=	$643
top_right_x				=	$644
bot_left_y				=	$645
bot_left_x				=	$646
bot_right_y				=	$647
bot_right_x				=	$648
up_pos					=	$649
down_pos				=	$64a
left_pos				=	$64b
right_pos				=	$64c

score_ones				=	$64d
score_tens				=	$64e
score_hundreds			=	$64f
score_thousands			=	$650
score_ten_thousands		=	$651
score_hun_thousands		=	$652
score_millions			=	$653
score_tens_add			=	$654
score_hundreds_add		=	$655
score_thousands_add		=	$656
score_ten_thousands_add	=	$657
score_hun_thousands_add	=	$658
score_millions_add		=	$659
char_left				=	$65a	;:				.res 1
char_right				=	$65b	;:				.res 1
char_top				=	$65c	;:				.res 1
char_bot				=	$65d	;:				.res 1
bonus_game				=	$65e
number_times_beaten		=	$65f
kyr_speed				=	$660
eye_speed				=	$661
lightning_speed			=	$662
rain_speed				=	$663
boss_color_counter		=	$664
;hi_ones					=	$664
;hi_tens					=	$665
;hi_huns					=	$666
;hi_thous				=	$667
;hi_ten_thous			=	$668
;hi_hun_thous			=	$669
;hi_mills				=	$66a


;reticle_on				=	$66b	;:				.res 1
;reticle_save			=	$66c	;:			.res 1
;charwit_fire_left		=	$66d	;:		.res 1
;charwit_fire_right		=	$66e	;:		.res 1
;charwit_fire_top		=	$66f	;:		.res 1
;charwit_fire_bot		=	$670	;:		.res 1

dead_count			=	$6be
bg_collision_byte	=	$6bf
store_meta_16		=	$6c0
bg_attribs_byte		=	$6d0

;FlashRamPage		=	$700
