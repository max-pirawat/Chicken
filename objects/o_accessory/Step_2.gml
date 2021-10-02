if parent != noone {
	x = parent.x;
	y = parent.y - offset_y;
	if (parent.state == player_state.CROUCH) && (parent.jstate == jump_state.ON_GROUND) {
		y += 13;	
	}
	image_xscale = parent.image_xscale;
	image_yscale = parent.image_yscale;
	image_angle = parent.image_angle;
	image_alpha = parent.image_alpha;
	aim(self, parent.current_spr[parent.current_aim].img_aim);
}