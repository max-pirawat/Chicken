/// @description Handle input
if(kb_player != -1)
{
	global.player_up[kb_player] = keyboard_check(ord("W"));
	global.player_down[kb_player] = keyboard_check(ord("S"));
	global.player_left[kb_player] = keyboard_check(ord("A"));
	global.player_right[kb_player] = keyboard_check(ord("D"));
	global.player_fire[kb_player] = keyboard_check(ord("X"));
	global.player_special[kb_player] = keyboard_check(ord("V"));
	global.player_jump[kb_player] = keyboard_check(ord("Z"));
	global.player_switch[kb_player] = keyboard_check(vk_tab);
	global.player_lock[kb_player] = keyboard_check(ord("C"));
	global.player_dash[kb_player] = keyboard_check(vk_lshift);
}

if (controller0_player != -1 && gamepad_is_connected(0))
{
	global.player_up[controller0_player] = gamepad_axis_value(0, gp_axislv) < -0.3;
	global.player_down[controller0_player] = gamepad_axis_value(0, gp_axislv) > 0.3;
	global.player_left[controller0_player] = gamepad_axis_value(0, gp_axislh) < -0.3;
	global.player_right[controller0_player] = gamepad_axis_value(0, gp_axislh) > 0.3;
	global.player_fire[controller0_player] = gamepad_button_check(0, gp_face3);
	global.player_special[controller0_player] = gamepad_button_check(0, gp_face2);
	global.player_jump[controller0_player] = gamepad_button_check(0, gp_face1);
	global.player_switch[controller0_player] = gamepad_button_check(0, gp_shoulderl);
	global.player_lock[controller0_player] = gamepad_button_check(0, gp_shoulderr);
	global.player_dash[controller0_player] = gamepad_button_check(0, gp_face4);
}

if(controller1_player != -1 && gamepad_is_connected(1))
{
	global.player_up[controller1_player] = gamepad_axis_value(1, gp_axislv) < -0.3;
	global.player_down[controller1_player] = gamepad_axis_value(1, gp_axislv) > 0.3;
	global.player_left[controller1_player] = gamepad_axis_value(1, gp_axislh) < -0.3;
	global.player_right[controller1_player] = gamepad_axis_value(1, gp_axislh) > 0.3;
	global.player_fire[controller1_player] = gamepad_button_check(1, gp_face3);
	global.player_special[controller1_player] = gamepad_button_check(1, gp_face2);
	global.player_jump[controller1_player] = gamepad_button_check(1, gp_face1);
	global.player_switch[controller1_player] = gamepad_button_check(1, gp_shoulderl);
	global.player_lock[controller1_player] = gamepad_button_check(1, gp_shoulderr);
	global.player_dash[controller1_player] = gamepad_button_check(1, gp_face4);
}
