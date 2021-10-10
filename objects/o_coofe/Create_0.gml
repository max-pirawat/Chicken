event_inherited()
shoot_period = room_speed*4;
hp = 2000
spr_idle = s_coofe_idle
spr_attack = s_coofe_attack

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

ready_to_shoot = function() {
	return image_index > image_number - 1;
}

// Return true if done
shoot = function() {
	if (next_attack == 0){
		var bullet = instance_create_layer(x - 50,  y, "Layer_Bullet", o_coofe_bullet);
		bullet.shooter = self.id;
	} else if (next_attack == 1) {
		var bullet_speed = 10;
		var dir = image_xscale > 0 ? 180 : 0;
		enemy_fire_normal_bullet(x-50, y-30, s_caffeine, 1, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-30, s_caffeine, room_speed*1, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-30, s_caffeine, room_speed*2, bullet_speed, dir);
	} else {
		var bullet_speed = 15;
		var dir = image_xscale > 0 ? 180 : 0; 
		enemy_fire_normal_bullet(x-50, y-30, s_caffeine, 1, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-60, s_caffeine, room_speed*0.8, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-90, s_caffeine, room_speed*1.6, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-30, s_caffeine, room_speed*2.4, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-60, s_caffeine, room_speed*3.2, bullet_speed, dir);
		enemy_fire_normal_bullet(x-50, y-90, s_caffeine, room_speed*4.0, bullet_speed, dir);
	}
}

die = function() {
	hp = 0
	state = enemy_state.DYING;
	die_cooldown = die_duration;
	sprite_index = s_coofe_death
	image_index = 0
}