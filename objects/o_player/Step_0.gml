/// @description Movement

#region Effect Cooldown
if (dash_cooldown > 0) dash_cooldown--;
if (dash_active > 0) dash_active--;
if (fire_cooldown > 0) fire_cooldown--;
if (jump_cooldown > 0) jump_cooldown--;
#endregion

#region Player Movement
hsp += player_speed * (global.player_right[player_no] - global.player_left[player_no]);

// drag
hsp = lerp(hsp, 0, drag);
    
// stop
if abs(hsp) <= 1 hsp = 0;
    
// limit speed
hsp = sign(hsp) * min(abs(hsp), player_speed);
    
var xspeed = hsp;
var dash = global.player_dash[player_no];

if xspeed != 0 {
	player_facing = xspeed < 0 ? -1 : 1
}

if (dash && dash_cooldown == 0) {
	dash_cooldown = dash_disable
	dash_active = dash_duration
}
if (dash_active > 0) {
	xspeed = player_facing * dash_speed
}

x += xspeed;
#endregion 

#region jump
var jump = global.player_jump[player_no];
if (jump && jstate == jump_state.ON_GROUND) {
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
y += vsp;
var need_update_spr = false;
if (y > ground_y && jstate != jump_state.ON_GROUND) {
	y = ground_y;
	vsp = 0;
	jstate = jump_state.ON_GROUND;
	need_update_spr = true;
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
var crouch = global.player_down[player_no] - global.player_up[player_no] > 0;
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
			set_current_spr(spr_run, new_aim);	
		}
	}
} else if (jstate <= jump_state.JUMPED_STILL_HOLD) {
	// jump	
	set_current_spr(spr_jump, new_aim);
} else {
	// double jump
	set_current_spr(spr_double_jump, new_aim);
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
#endregion