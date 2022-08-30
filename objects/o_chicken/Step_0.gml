/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

#region Switch weapon
if (global.player_switch[player_no]) {
	if (curr_weapon == 0) {
		curr_weapon = 1;
		obj_bullet = o_feather;
	} else {
		curr_weapon = 0;
		obj_bullet = o_seed;
	}
}

#endregion



