image_alpha = 0
dir=1
bullet_speed = 0
cooldown = 1;

cooldown_done = function() {
	
}

// Return false if still cooldown.
process_cooldown = function() {
	if (cooldown > 0) {
		cooldown--;
		if (cooldown <= 0) {
			cooldown = 0;
			image_alpha=1
			image_angle=dir;
			cooldown_done();
		}else{
			return false;
		}	
	}
	return true;
}