if (state >= enemy_state.DYING) {
	if (o_player.state < player_state.DYING) {
		if (o_enemy.x >= other.x ) {
			other.hurt(-3);
		} else {
			other.hurt(3);
		}
	}
}
