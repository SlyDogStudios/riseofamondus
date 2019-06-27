nmi_num:			.res 1
scroll_x:				.res 1
scroll_x_fine:			.res 1
scroll_y:				.res 1
scroll_dir:				.res 1
pause:					.res 1
ppu_offset:				.res 1
control_pad:			.res 1
control_old:			.res 1
loop_pointer:			.res 2
nmi_addy:				.res 2
level_pointer:			.res 2
level_offset:			.res 1
ppu_addy:				.res 2	; x10
temp_addy:				.res 2
coll_addy:				.res 2
e_type_addy:			.res 2
e_y_addy:				.res 2
e_x_addy:				.res 2
e_x_fine_addy:			.res 2
e_dir_addy:				.res 2
save2000:				.res 1	; x20
lay_tiles:				.res 1
stop_laying:			.res 1
level:					.res 1
lives:					.res 1
nametable:				.res 1
when_to_lay:			.res 1
enemy_offset:			.res 1
e_type_offset:			.res 1
slot_offset:			.res 1
e_bullet_type_offset:	.res 1
boss_addy:				.res 2
name:					.res 2
name_counter:			.res 1


cam:					.res 1	; x30
cam_count:				.res 1
p_anim_addy:			.res 2
raven_flap:				.res 1
p_dir:					.res 1
p_anim_state:			.res 1
p_anim_count:			.res 1
goblin_tens:			.res 1
goblin_ones:			.res 1
goblin_switch:			.res 1
end_level_switch:		.res 1
one_up_test:			.res 1
boss_switch:			.res 1	; x3d
flash_grave:			.res 1

p_x_fine:				.res 1
sprite_flicker:			.res 1
anim_ticker:			.res 1
anim_offset:			.res 1

map_pos:				.res 1
p_left:					.res 1
p_right:				.res 1
p_top:					.res 1
p_bot:					.res 1
g_left:					.res 1
g_right:				.res 1
g_top:					.res 1
g_bot:					.res 1
g_dir:					.res 1
raven_left:				.res 3
r_left:					.res 1
raven_right:			.res 3
r_right:				.res 1
raven_top:				.res 3
r_top:					.res 1
raven_bot:				.res 3
r_bot:					.res 1
reticle_switch:			.res 1

temp_8bit_1:			.res 1
temp_8bit_2:			.res 1

temp_16bit_1:			.res 2
temp_16bit_2:			.res 2
temp_16bit_3:			.res 2
raven_dir:				.res 3
char_dir:				.res 1

;e_top:					.res 8
;e_bot:					.res 8
;e_left:					.res 8
;e_right:				.res 8

e_type:					.res 9
e_move_count:			.res 9
e_dir:					.res 9
e_anim_count:			.res 9
e_anim_state:			.res 9
e_x_pos:				.res 9
e_x_fine:				.res 9
e_y_pos:				.res 9
e_hp:					.res 9
e_slot_offset:			.res 9

e_top:					.res 9
e_bot:					.res 9
e_left:					.res 9
e_right:				.res 9

control_pad2:			.res 1
control_old2:			.res 1
player2:				.res 1

return_music:			.res 2
return_sfx:				.res 2

char_stun:				.res 1

on_map:					.res 1
bank:					.res 1

reticle_on:				.res 1
reticle_save:			.res 1
charwit_fire_left:		.res 1
charwit_fire_right:		.res 1
charwit_fire_top:		.res 1
charwit_fire_bot:		.res 1
;TargetBank:				.res 1
;TargetAddress:			.res 2
;SourceAddress:			.res 1
;SourceAddress_h:		.res 1
;ReturnBank:				.res 1

