event_inherited()
shoot_period = room_speed*4;
hp = 2000

state = enemy_state.IDLE;
shoot_cooldown = shoot_period;

shoot = function() {
	var r = random_range(0, 99)
	if (r < 50){
		var bullet = instance_create_layer(x - 50,  y, "Layer_Bullet", o_coofe_bullet);
	} else {
		var bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -10: 10;
		bullet.cooldown = 1
		
		bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -10: 10;
		bullet.cooldown = room_speed*1
		
		bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -10: 10;
		bullet.cooldown = room_speed*2
	}
}

die = function() {
	hp = 0
	state = enemy_state.DYING;
	die_cooldown = die_duration;
	sprite_index = s_coofe_death
	image_index = 0
}