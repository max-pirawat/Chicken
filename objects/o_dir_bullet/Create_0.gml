event_inherited();
image_xscale = 1.3
image_yscale = 1.3
cooldown_done = function() {
	dir = point_direction(x, y, (o_player.bbox_left + o_player.bbox_right)/2, (o_player.bbox_bottom + o_player.bbox_top)/2);
	image_angle = dir
}