event_inherited()
shoot_period = room_speed*4;
hp = 2000
spr_idle = s_lattey_idle
spr_attack = s_lattey_attack1
can_collide_with_player = false;
num_bounces = 5;
spr_bounces = [s_lattey_art1, s_lattey_art2, s_lattey_art3, s_lattey_art4, s_lattey_art5];

state = enemy_state.IDLE;
shoot_cooldown = shoot_period;
next_attack = 0;

prepare_to_shoot = function() {
	var r = random_range(0, 99)
	if (r < 40) {
		next_attack = 0;
		spr_attack = s_lattey_attack1;
	} else if (r < 80) {
		next_attack = 1;
		spr_attack = s_lattey_attack2;
	} else {
		next_attack = 2;
		spr_attack = s_lattey_attack3;
		//shake_screen(room_speed*2, 3);
		//audio_play_sound(snd_evil_laugh, 10, false);
	}
}

ready_to_shoot = function() {
	return image_index > image_number - 1;
}

shoot = function() {
	if (next_attack == 0){
		var bullet_speed = 20;
		enemy_fire_dir_bullet(x + 14 * image_xscale, y - 705 * image_yscale, s_lattey_shot, 1, bullet_speed);
		enemy_fire_dir_bullet(x + 14 * image_xscale, y - 705 * image_yscale, s_lattey_shot, room_speed * 0.5, bullet_speed);
		enemy_fire_dir_bullet(x + 14 * image_yscale, y - 705 * image_yscale, s_lattey_shot, room_speed * 1, bullet_speed);
	} else if (next_attack == 1) {
		var bullet_speed = 12;
		var dir = 270;
		var cooldown = 1;
		for (var i=0; i < 25; ++i) {
			enemy_fire_normal_bullet(irandom_range(0, room_width), 50, s_lattey_shotup, cooldown + room_speed * random_range(0, 4.0), bullet_speed, dir);
		}
	} else {
		var spr = spr_bounces[irandom(num_bounces - 1)];
		var duration = room_speed * 7;
		var bullet_speed = 15;
		var dir = random_range(0, 360);
		enemy_fire_bounce_bullet(x + 18 * image_xscale, y - 256 * image_yscale, spr, 1, duration, bullet_speed, dir); 
		spr = spr_bounces[irandom(num_bounces - 1)];
		dir = random_range(0, 360);
		enemy_fire_bounce_bullet(x + 18 * image_xscale, y - 256 * image_yscale, spr, room_speed*0.5, duration, bullet_speed, dir); 
		spr = spr_bounces[irandom(num_bounces - 1)];
		dir = random_range(0, 360);
		enemy_fire_bounce_bullet(x + 18 * image_xscale, y - 256 * image_yscale, spr, room_speed*1, duration, bullet_speed, dir); 
	}
}

die = function() {
	hp = 0
	state = enemy_state.DYING;
	die_cooldown = die_duration;
	sprite_index = s_lattey_death
	image_index = 0
}