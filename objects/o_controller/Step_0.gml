
if (shake_enabled) {
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[1]);

	if (shake_cooldown > 0) {
		shake_cooldown--;
		view_x += choose(-shake_force, shake_force);
		view_y += choose(-shake_force, shake_force);
		camera_set_view_pos(view_camera[0], view_x, view_y); 
	} else {
		shake_force = 0;
		view_x = approach(view_xport[0], 0, 0.3);
		view_y = approach(view_yport[0], 0, 0.3);
		if (abs(view_x) < 1 and abs(view_y) < 1) {
			view_x = 0;
			view_y = 0;
			shake_enabled = false;
		}
	}
	camera_set_view_pos(view_camera[0], view_x, view_y); 
}