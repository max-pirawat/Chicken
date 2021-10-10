if (!process_cooldown()) {
	return;	
}

x += lengthdir_x(bullet_speed, dir);
y += lengthdir_y(bullet_speed, dir);

if(x < 0 || x > room_width || y < 0 || y > room_height) {
	instance_destroy();
	return;
}