
// Player get pushed
if (image_alpha > 0.5) {
	if (other.state < player_state.DYING) {
		if (shooter.x >= other.x ) {
			other.x -= 10;
			other.hurt(-1);
		} else {
			other.x	+= 10;
			other.hurt(1);
		}
	}
}
