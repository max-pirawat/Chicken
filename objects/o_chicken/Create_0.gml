event_inherited();

spr_idle = [
	{ sprite: s_chicken_idle, offset_x: 33, offset_y: -31, dir: 0, img_aim: 0 }, 
	{ sprite: s_chicken_idle_45, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45, img_aim: 1},
	{ sprite: s_chicken_idle_90, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90, img_aim: 2}];
spr_run = [
	{ sprite: s_chicken_run, offset_x: 33, offset_y: -31, dir: 0, img_aim: 0 },
	{ sprite: s_chicken_run, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45, img_aim: 0 },
	{ sprite: s_chicken_run, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90, img_aim: 0 }];
	
spr_dash = [
	{ sprite: s_chicken_dash, offset_x: 33, offset_y: -31, dir: 0, img_aim: 0 },
	{ sprite: s_chicken_dash, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45, img_aim: 0 },
	{ sprite: s_chicken_dash, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90, img_aim: 0 }];

spr_jump = [
	{ sprite: s_chicken_jump, offset_x: 33, offset_y: -31, dir: 0, img_aim: 0 },
	{ sprite: s_chicken_jump, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45, img_aim: 0 },
	{ sprite: s_chicken_jump, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90, img_aim: 0 }];

spr_double_jump = [
	{ sprite: s_chicken_double_jump, offset_x: 33, offset_y: -31, dir: 0, img_aim: 0 },
	{ sprite: s_chicken_double_jump, offset_x: (59 - 32), offset_y: (10 - 64), dir: 45, img_aim: 0 },
	{ sprite: s_chicken_double_jump, offset_x: (42 - 32), offset_y: (0 - 64), dir: 90, img_aim: 0 }];

spr_crouch = [
	{ sprite: s_chicken_crouch, offset_x: (63 - 32), offset_y: (46 - 64), dir: 0, img_aim: 0 },
	{ sprite: s_chicken_crouch, offset_x: (59 - 32), offset_y: (46 - 64), dir: 45, img_aim: 0 },
	{ sprite: s_chicken_crouch, offset_x: (42 - 32), offset_y: (46 - 64), dir: 90, img_aim: 0 }];

spr_dying = [
	{ sprite: s_chicken_dying, offset_x: (63 - 32), offset_y: (46 - 64), dir: 0, img_aim: 0 }];
	
spr_knockback= [
	{ sprite: s_chicken_knockback, offset_x: (63 - 32), offset_y: (46 - 64), dir: 0, img_aim: 0 }];

obj_bullet = o_seed;
obj_special_bullet = o_big_seed;
current_spr = spr_idle;
current_aim = 0;