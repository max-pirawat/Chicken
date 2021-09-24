/// @description Insert description here
// You can write your code in this editor
event_inherited()
shoot_period = room_speed*4;

state = enemy_state.IDLE;
shoot_cooldown = shoot_period;

shoot = function() {
	var bullet = instance_create_layer(x - 50,  y, "Layer_Bullet", o_coofe_bullet);
}