//if (need_play_sound) {
//    need_play_sound = false;
//    audio_play_sound(sound, 0, 0);   
//}

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
	o_player.specials += 0.05;
	if (enemy.hp > bullet_dmg) {
		enemy.hp -= bullet_dmg;
	} else {
		enemy.die();
	}

	instance_destroy();
	return;
}
#endregion