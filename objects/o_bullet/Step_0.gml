//if (need_play_sound) {
//    need_play_sound = false;
//    audio_play_sound(sound, 0, 0);   
//}

if (sprite_index == spr_hit) {
	if (image_index > image_number-1) {
		instance_destroy();
	}
	return;
}

// Move bullet
x += lengthdir_x(bullet_speed, dir);
y += lengthdir_y(bullet_speed, dir);

// Destroy if move out of room
if(x < 0 || x > room_width || y < 0 || y > room_height) {
	instance_destroy();
	return;
}

#region Enemey collision
var enemy = instance_place(x, y, o_enemy)
if (enemy != noone && enemy.state < enemy_state.DYING) {	
	o_player.specials = min(o_player.specials + 0.05, o_player.max_specials);
	if (enemy.hp > bullet_dmg) {
		enemy.hp -= bullet_dmg;
	} else {
		enemy.die();
	}

	if (spr_hit == noone) {
		instance_destroy();
	} else {
		sprite_index = spr_hit;
		image_index = 0;
	}
	return;
}
#endregion