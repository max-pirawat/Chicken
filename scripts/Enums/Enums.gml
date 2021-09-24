enum player_state {
	IDLE,
	RUN,
	DASH,
	JUMP,
	DOUBLE_JUMP,
};

enum jump_state {
	// Player is on the ground
	ON_GROUND,
	// Player starts to jump. Still hold JUMP button
	JUMPING,
	// Player let go of JUMP button
	JUMPED,
	// Player still hold JUMP button while we fully add jump strength
	JUMPED_STILL_HOLD,
	DOUBLE_JUMPING,
	DOUBLE_JUMPED
};