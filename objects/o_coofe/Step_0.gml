event_inherited()

#region Cooldown
if (shoot_cooldown > 0) shoot_cooldown--
#endregion

#region State Management
if (state == enemy_state.IDLE && shoot_cooldown == 0) {
	state = enemy_state.ATTACKING;
	sprite_index = s_coofe_attack
	image_index = 0
}

if (state == enemy_state.ATTACKING && state.image_index == image_number) {
	shoot();
	shoot_cooldown = shoot_period
	state = enemy_state.IDLE;
	sprite_index = s_coofe_idle
	image_index = 0
}

image_xscale = (o_player.x <= x) ? 1 : -1;
#endregion


