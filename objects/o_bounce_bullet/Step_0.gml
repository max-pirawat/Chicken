if (!process_cooldown()) {
	return;	
}

if (destroy_cooldown > 0) {
	--destroy_cooldown;
	if (destroy_cooldown == 0) {
		instance_destroy();	
	}
}

if (destroy_cooldown < room_speed * 0.5) {
	image_alpha = clamp(destroy_cooldown / (room_speed * 0.5), 0, 1.0);
}

var boost = 1;
if bbox_top <= 0 || bbox_bottom >= o_player.ground_y - 1 {
	dir = (360 - dir) % 360;
	boost = 2;
} else if bbox_left <= 0 || bbox_right >= room_width-1 {
	dir = (dir - 90 + 360) % 360
	boost = 2;
}

x += lengthdir_x(boost * bullet_speed, dir);
y += lengthdir_y(boost * bullet_speed, dir);
image_angle += 5;

