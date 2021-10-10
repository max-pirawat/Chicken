
// Player get pushed
if (o_player.state < player_state.DYING && image_alpha > 0.5) {
	o_player.hurt(sign(lengthdir_x(bullet_speed, dir)));
}

