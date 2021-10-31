if (!process_cooldown()) {
	return;	
}

if (state == 1) {
	y -= bullet_speed
	if (y < 0) {
		state = 2
		x = random_range(314, 1367)
	}
} else if (state == 2) {
	var old_y = y;
	y += bullet_speed;
	
	with (o_platform) {
		if (old_y < self.bbox_top && other.y >= self.bbox_top && other.bbox_right - 3 >= self.bbox_left && other.bbox_left + 3 <= self.bbox_right) {
			other.y = self.bbox_top;
			other.sprite_index = s_cream_floor;
			other.image_index = 0;
			other.state = 3
		}
	}
	
	if (y > global.ground_y){
		y = global.ground_y;
		sprite_index = s_cream_floor;
		image_index = 0;
		state = 3
	}
} else {
	
}




