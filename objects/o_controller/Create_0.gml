
kb_player = 0; 
controller0_player = 0;
controller1_player = 1;
shake_enabled = false;
shake_cooldown = 0;
shake_force = 0;
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0]);

shake = function(duration, force) {
	shake_enabled = true;
	shake_cooldown = max(shake_cooldown, duration);
	shake_force = max(shake_force, force);
}