/// @description Movement

#region Effect Cooldown
var need_update_spr = false;
if (dash_cooldown > 0) dash_cooldown--;
if (dash_active > 0) dash_active--;
if (fire_cooldown > 0) fire_cooldown--;
if (jump_cooldown > 0) jump_cooldown--;
if (hurt_cooldown > 0) hurt_cooldown--;
if (knockback_cooldown > 0) {
	knockback_cooldown--;
	if (knockback_cooldown == 0) {
		hsp = 0;
		need_update_spr = true;
	}
}
if (die_cooldown > 0) die_cooldown--;
#endregion

#region Player Died
if (state == player_state.DYING) {
	y -= 1;
	image_alpha =  clamp(4 * die_cooldown / die_duration, 0, 1.0);
	if (die_cooldown == 0) {
		state = player_state.DIED;	
	}
	return;	
}

if (state == player_state.DIED) {
	return;	
}
#endregion

#region Knockback
if (knockback_cooldown > 0) {
	disable_control(player_no);	
}
#endregion

#region Player Movement
hsp += player_speed * (global.player_right[player_no] - global.player_left[player_no]);

// drag
if (knockback_cooldown == 0) {
	hsp = lerp(hsp, 0, drag);
    
	// stop
	if abs(hsp) <= 1 hsp = 0;
    
	// limit speed
	hsp = sign(hsp) * min(abs(hsp), player_speed);
	
	if hsp != 0 {
		player_facing = hsp < 0 ? -1 : 1
	}
}

var xspeed = hsp;
var dash = global.player_dash[player_no];

if (dash && dash_cooldown == 0 && (jstate == jump_state.ON_GROUND || (jump_dash > 0))) {
	dash_cooldown = dash_disable;
	dash_active = dash_duration;
	if (jstate != jump_state.ON_GROUND) {
		jump_dash--;
	}
}
if (dash_active > 0) {
	xspeed = player_facing * dash_speed
}

x += xspeed;
#endregion 

#region jump
var jump = global.player_jump[player_no];
var crouch = global.player_down[player_no] - global.player_up[player_no] > 0;
if (jump && !crouch && jstate == jump_state.ON_GROUND) {
	jstate = jump_state.JUMPING;
	vsp = -jump_initial;
	jump_cooldown = jump_hold;
}
if (jstate == jump_state.JUMPING) {
	if (!jump) {
		jstate = jump_state.JUMPED;
	} else if (jump_cooldown == 0) {
		jstate = jump_state.JUMPED_STILL_HOLD;
	}
}

if (!jump && jstate == jump_state.JUMPED_STILL_HOLD) {
	jstate = jump_state.JUMPED;	
}

if (jump && jstate == jump_state.JUMPED) {
	jstate = jump_state.DOUBLE_JUMPING;
	vsp -= jump_initial;
	jump_cooldown = jump_hold;
}
if ((!jump || jump_cooldown == 0) && jstate == jump_state.DOUBLE_JUMPING) {
	jstate = jump_state.DOUBLE_JUMPED;
}

if (jstate == jump_state.JUMPING || jstate == jump_state.DOUBLE_JUMPING) {
	vsp -= jump_strength;	
}
if (jstate != jump_state.ON_GROUND && dash_active == 0) {
	if (jump) {
		vsp += grav_flying;
	} else {
		vsp += grav;	
	}
}

if (dash_active > 0) {
	vsp = 0;	
}

vsp = max(vsp, -jump_max);
var old_y = y;
y += vsp;

// Check if jump has landed on a platform
if (jstate != jump_state.ON_GROUND) {
	with (o_platform) {
		if (old_y < self.bbox_top && other.y >= self.bbox_top && other.bbox_right >= self.bbox_left && other.bbox_left <= self.bbox_right) {
			other.y = self.bbox_top;
			other.vsp = 0;
			other.jstate = jump_state.ON_GROUND;
			other.my_platform = self.id;
			other.jump_dash = other.max_jump_dash;
			need_update_spr = true;
			other.knockback_cooldown = 0;
			other.hsp = 0;
		}
	}
}

// Falling off platform
if (my_platform != noone && (bbox_right < my_platform.bbox_left || bbox_left > my_platform.bbox_right)) {
	jstate = jump_state.DOUBLE_JUMPED;
	my_platforn = noone;
	need_update_spr = true;
}

if (my_platform != noone && jstate != jump_state.ON_GROUND) {
	my_platform = noone;	
}

// jumping down platform
if (my_platform != noone && jump && crouch) {
	jstate = jump_state.DOUBLE_JUMPED;
	y = my_platform.bbox_top + 1;
	my_platforn = noone;
	need_update_spr = true;
}


if (y > ground_y && jstate != jump_state.ON_GROUND) {
	y = ground_y;
	vsp = 0;
	jstate = jump_state.ON_GROUND;
	my_platform = noone;
	jump_dash = max_jump_dash;
	need_update_spr = true;
	knockback_cooldown = 0;
	hsp = 0;
}
#endregion

#region Room Boundary
x = clamp(x, 0, room_width);
if (y<0) y = 0	
#endregion

#region Sprite Management
var abs_xspeed = abs(xspeed)
var lock = global.player_lock[player_no];
var new_aim = lock ? current_aim : get_aim(abs_xspeed, global.player_up[player_no] - global.player_down[player_no])
if (knockback_cooldown == 0) {
	if (jstate == jump_state.ON_GROUND) {
		if (state == player_state.IDLE) {
			if (abs_xspeed > 0 && abs_xspeed < dash_speed) {
				state = player_state.RUN;
				set_current_spr(spr_run, new_aim);
			} else if (dash_active > 0) {
				state = player_state.DASH;
				set_current_spr(spr_dash, new_aim);
			} else if (crouch) {
				state = player_state.CROUCH;
				set_current_spr(spr_crouch, new_aim);
			} else if (current_aim != new_aim || need_update_spr) {
				set_current_spr(spr_idle, new_aim);
			}
		} else if (state == player_state.RUN) {
			if (abs_xspeed == 0) {
				state = player_state.IDLE;
				set_current_spr(spr_idle, new_aim);
			} else if (dash_active > 0) {
				state = player_state.DASH;
				set_current_spr(spr_dash, new_aim);
			} else if (current_aim != new_aim || need_update_spr) {
				set_current_spr(spr_run, new_aim);	
			}
		} else if (state == player_state.DASH) {
			if (abs_xspeed == 0) {
				state = player_state.IDLE;
				set_current_spr(spr_idle, new_aim);
			} else if (abs_xspeed > 0 && dash_active == 0) {
				state = player_state.RUN;
				set_current_spr(spr_run, new_aim);
			} else if (current_aim != new_aim || need_update_spr) {
				set_current_spr(spr_dash, new_aim);	
			}
		} else if (state == player_state.CROUCH) {
			if (abs_xspeed == 0 && !crouch) {
				state = player_state.IDLE;
				set_current_spr(spr_idle, new_aim);
			} else if (dash_active > 0) {
				state = player_state.DASH;
				set_current_spr(spr_dash, new_aim);
			} else if (abs_xspeed > 0) {
				state = player_state.RUN;
				set_current_spr(spr_run, new_aim);
			} else if (current_aim != new_aim || need_update_spr) {
				set_current_spr(spr_crouch, new_aim);	
			}
		}
	} else if (jstate <= jump_state.JUMPED_STILL_HOLD) {
		// jump	
		set_current_spr(spr_jump, new_aim);
	} else {
		// double jump
		set_current_spr(spr_double_jump, new_aim);
	}
}
image_xscale = player_facing
#endregion 

#region Fire Bullet 
var fire = global.player_fire[player_no];
if (fire && fire_cooldown == 0) {
	fire_cooldown = fire_disable;
	var dir = player_facing > 0 ? current_spr[current_aim].dir : 180 - current_spr[current_aim].dir;
	fire_bullet(x + player_facing * current_spr[current_aim].offset_x, y + current_spr[current_aim].offset_y, dir, obj_bullet);
}
fire = global.player_special[player_no];
if (fire && fire_cooldown == 0 && specials >= 1) {
	if specials >= 5 {
		specials -= 5;
		fire_cooldown = fire_disable;
		var dir = player_facing > 0 ? current_spr[current_aim].dir : 180 - current_spr[current_aim].dir;
		fire_bullet(x + player_facing * current_spr[current_aim].offset_x, y + current_spr[current_aim].offset_y, dir, obj_sspecial_bullet);
	}else if specials >= 1 {
		specials--;
		fire_cooldown = fire_disable;
		var dir = player_facing > 0 ? current_spr[current_aim].dir : 180 - current_spr[current_aim].dir;
		fire_bullet(x + player_facing * current_spr[current_aim].offset_x, y + current_spr[current_aim].offset_y, dir, obj_special_bullet);
	}
	
}
#endregion