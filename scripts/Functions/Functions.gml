function fire_bullet(x, y, dir, obj_bullet) {
	var bullet = instance_create_layer(x,  y, "Layer_Bullet", obj_bullet);
	bullet.dir = dir;
	bullet.image_angle = dir;
	if dir > 90 and dir < 270 bullet.image_yscale =-1;
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
