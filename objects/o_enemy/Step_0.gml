
#region Cooldown
if (shoot_cooldown > 0) shoot_cooldown--
if (die_cooldown > 0) die_cooldown--
#endregion

if (state == enemy_state.DYING) {
	image_alpha =  clamp(4 * die_cooldown / die_duration, 0, 1.0);
	if (die_cooldown == 0) {
		state = enemy_state.DIED;
		
		room_goto_next();
	}
	return;	
}

if (state == enemy_state.DIED) {
	return;	
}

#region collision with player
if can_collide_with_player {
	var player = instance_place(x, y, o_player);
	if (player != noone) {
		if (player.state < player_state.DYING) {
			if (x >= player.x) {
				player.hurt(-3);
			} else {
				player.hurt(3);
			}
		}
	}
}
#endregion

#region State Management
if (state == enemy_state.IDLE && shoot_cooldown == 0) {
	prepare_to_shoot();
	state = enemy_state.ATTACKING;
	sprite_index = spr_attack;
	image_index = 0;
}

if (state == enemy_state.ATTACKING && ready_to_shoot()) {
	shoot();
	shoot_cooldown += shoot_period;
	state = enemy_state.IDLE;
	sprite_index = spr_idle;
	image_index = 0;
}
#endregion