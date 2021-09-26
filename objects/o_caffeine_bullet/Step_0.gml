if (cooldown > 0) {
	cooldown--;
	if (cooldown == 0) {
		image_alpha=1
	}else{
		return	
	}
	
}

x += bullet_speed

if (x < 0 || x > room_width) instance_destroy();