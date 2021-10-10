function fire_bullet(x, y, dir, obj_bullet) {
	var bullet = instance_create_layer(x,  y, "Layer_Bullet", obj_bullet);
	bullet.dir = dir;
	bullet.image_angle = dir;
	if dir > 90 and dir < 270 bullet.image_yscale =-bullet.image_yscale;
}

function enemy_fire_normal_bullet(x, y, spr, cooldown, bullet_speed, dir) {
	var bullet = instance_create_layer(x,  y, "Layer_Bullet", o_normal_bullet);
	bullet.shooter = self.id;
	bullet.cooldown = cooldown;
	bullet.bullet_speed = bullet_speed;
	bullet.dir = dir;
	if spr != noone {
		bullet.sprite_index = spr;
	}
}

function enemy_fire_dir_bullet(x, y, spr, cooldown, bullet_speed) {
	var bullet = instance_create_layer(x,  y, "Layer_Bullet", o_dir_bullet);
	bullet.shooter = self.id;
	bullet.cooldown = cooldown;
	bullet.bullet_speed = bullet_speed;
	if spr != noone {
		bullet.sprite_index = spr;
	}
}

function enemy_fire_bounce_bullet(x, y, spr, cooldown, destroy_duration, bullet_speed, dir) {
	var bullet = instance_create_layer(x,  y, "Layer_Bullet", o_bounce_bullet);
	bullet.shooter = self.id;
	bullet.cooldown = cooldown;
	bullet.destroy_cooldown = destroy_duration;
	bullet.bullet_speed = bullet_speed;
	bullet.dir = dir;
	if spr != noone {
		bullet.sprite_index = spr;
	}
}

function set_current_spr(spr, aim) {
	if (current_spr != spr) {
		current_spr = spr;
		current_aim = aim;
		sprite_index = spr[aim].sprite;
		image_index = 0;
	} else if (current_aim != aim) {
		current_aim = aim;
		sprite_index = spr[aim].sprite;
		image_index = 0;
	}
}

function get_aim(dx, dy) {
	if (dy < 0) {
		dy = 0;
	}
	if (dx == 0 && dy == 0) {
		return 0;
	} else if (dx == 0 && dy > 0) {
		return 2;
	} else if (dx > 0 && dy > 0) {
		return 1;
	} else {
		return 0;
	}
}

function create_accessory(parent, a_template) {
	var accessory = instance_create_layer(parent.x,  parent.y, "Layer_Player", o_accessory);
	accessory.sprite_index = a_template.sprite;
	accessory.parent = parent;
	accessory.offset_y = a_template.offset_y;
	accessory.aim = a_template.aim;
	return accessory;	
}

function disable_control(player) {
	global.player_up[player] = false;
	global.player_down[player] = false;
	global.player_left[player] = false;
	global.player_right[player] = false;
	global.player_fire[player] = false;
	global.player_special[player] = false;
	global.player_jump[player] = false;
	global.player_switch[player] = false;
	global.player_lock[player] = false;
	global.player_dash[player] = false;
}

function approach(s, e, shift) {
	if (s < e) {
		return min(s + shift, e);
	} else {
		return max(s - shift, e);
	}
}

function shake_screen(duration, force) {
	o_controller.shake(duration, force);	
}