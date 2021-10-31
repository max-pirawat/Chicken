event_inherited()
shoot_period = room_speed*4;
hp = 2500
spr_idle = s_frappe_idle
spr_attack = s_frappe_attack1

state = enemy_state.IDLE;
shoot_cooldown = shoot_period;
next_attack = 0;

prepare_to_shoot = function() {
	var r = random_range(0, 99)
	if (r < 40) {
		next_attack = 0;
		spr_attack = s_frappe_attack1;
	} else if (r < 80) {
		next_attack = 1;
		spr_attack = s_frappe_attack2;
	} else {
		next_attack = 2;
		spr_attack = s_frappe_attack3;
		//shake_screen(room_speed*2, 3);
		//audio_play_sound(snd_evil_laugh, 10, false);
	}
}

ready_to_shoot = function() {
	return image_index > image_number - 1;
}

// Return true if done
shoot = function() {
	if (next_attack == 0){
		var bullet_y = (o_player.bbox_top + o_player.bbox_bottom) / 2 
		var bullet = instance_create_layer(x - 50, bullet_y, "Layer_Bullet", o_frappe_bullet);
		bullet.shooter = self.id;
	} else if (next_attack == 1) {
		var bullet_speed = 10;
		for (var i=0; i < 3; ++i) {
			enemy_fire_cream_bullet(x, bbox_top, 1, bullet_speed);
			enemy_fire_cream_bullet(x, bbox_top, room_speed*1, bullet_speed);
			enemy_fire_cream_bullet(x, bbox_top, room_speed*2, bullet_speed);
		}
	} else {
		var bullet_speed = 20;
		enemy_fire_dir_bullet(x + 60, y - 235, s_fireeyes, 1, bullet_speed);
		enemy_fire_dir_bullet(x + 60, y - 235, s_fireeyes, room_speed * 0.5, bullet_speed);
		enemy_fire_dir_bullet(x + 60, y - 235, s_fireeyes, room_speed * 1, bullet_speed);
	}
}

die = function() {
	hp = 0
	state = enemy_state.DYING;
	die_cooldown = die_duration;
	sprite_index = s_frappe_death
	image_index = 0
}