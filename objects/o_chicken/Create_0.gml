event_inherited();

spr_idle = [
	{ sprite: s_chicken_idle, offset_x: 33, offset_y: -31, dir: 0 }, 
	{ sprite: s_chicken_idle_45, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45 },
	{ sprite: s_chicken_idle_90, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90 }];
spr_run = [
	{ sprite: s_chicken_run, offset_x: 33, offset_y: -31, dir: 0 },
	{ sprite: s_chicken_run, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45 },
	{ sprite: s_chicken_run, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90 }];
	
spr_dash = [
	{ sprite: s_chicken_dash, offset_x: 33, offset_y: -31, dir: 0 },
	{ sprite: s_chicken_dash, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45 },
	{ sprite: s_chicken_dash, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90 }];

spr_jump = [
	{ sprite: s_chicken_jump, offset_x: 33, offset_y: -31, dir: 0 },
	{ sprite: s_chicken_jump, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45 },
	{ sprite: s_chicken_jump, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90 }];

spr_double_jump = [
	{ sprite: s_chicken_double_jump, offset_x: 33, offset_y: -31, dir: 0 },
	{ sprite: s_chicken_double_jump, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45 },
	{ sprite: s_chicken_double_jump, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90 }];

obj_bullet = o_seed;
current_spr = spr_idle;