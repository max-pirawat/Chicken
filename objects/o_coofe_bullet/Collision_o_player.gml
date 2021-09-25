
// Player get pushed
if (image_alpha > 0.5) {
	if (o_player.state < player_state.DYING) {
		if (o_enemy.x >= other.x ) {
			other.x -= 10;
		} else {
			other.x	+= 10;
		}
		o_player.hurt();
	}
}
