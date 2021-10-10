event_inherited()
shoot_period = room_speed*4;
hp = 2000

state = enemy_state.IDLE;
shoot_cooldown = shoot_period;
next_attack = 0;

prepare_to_shoot = function() {
	var r = random_range(0, 99)
	if (r < 50){
		next_attack = 0;	
	} else if (r < 80) {
		next_attack = 1;
	} else {
		next_attack = 2;
		shake_screen(room_speed*2, 3);
		audio_play_sound(snd_evil_laugh, 10, false);
	}
}

shoot = function() {
	if (next_attack == 0){
		var bullet = instance_create_layer(x - 50,  y, "Layer_Bullet", o_coofe_bullet);
		bullet.shooter = self.id;
	} else if (next_attack == 1) {
		var bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -10: 10;
		bullet.cooldown = 1
		
		bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -10: 10;
		bullet.cooldown = room_speed*1
		
		bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -10: 10;
		bullet.cooldown = room_speed*2
	} else {
		var bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -15: 15;
		bullet.cooldown = 1
		
		bullet = instance_create_layer(x - 50,  y - 60, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -15: 15;
		bullet.cooldown = room_speed*0.8
		
		bullet = instance_create_layer(x - 50,  y - 90, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -15: 15;
		bullet.cooldown = room_speed*1.6
		
		bullet = instance_create_layer(x - 50,  y - 30, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -15: 15;
		bullet.cooldown = room_speed*2.4
		
		bullet = instance_create_layer(x - 50,  y - 60, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -15: 15;
		bullet.cooldown = room_speed*3.2
		
		bullet = instance_create_layer(x - 50,  y - 90, "Layer_Bullet", o_caffeine_bullet);
		bullet.bullet_speed = image_xscale > 0 ? -15: 15;
		bullet.cooldown = room_speed*4.0
	}
}

die = function() {
	hp = 0
	state = enemy_state.DYING;
	die_cooldown = die_duration;
	sprite_index = s_coofe_death
	image_index = 0
}