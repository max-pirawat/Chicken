/// @description Insert description here
// You can write your code in this editor
event_inherited()

if (shoot_cooldown > 0) {
	shoot_cooldown--
}
	
if (state == enemy_state.IDLE && shoot_cooldown == 0) {
	state = enemy_state.ATTACKING;
	sprite_index = s_coofe_attack
	image_index = 0
}

if (state == enemy_state.ATTACKING && state.image_index == image_number) {
	shoot();
	shoot_cooldown = shoot_period
	state = enemy_state.IDLE;
	sprite_index = s_coofe_idle
	image_index = 0
}