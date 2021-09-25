#region Attributes
player_no = 0;
player_speed = 5;
dash_speed = 15;
drag = .12; // slow down
dash_duration = room_speed * 0.3;
dash_disable = room_speed * 0.5; // how long to disable dash after using one
fire_disable = room_speed * 0.2; 
jump_hold = room_speed * 0.1;
hurt_period = room_speed * 1;
die_duration = room_speed * 3;
jump_initial = 10;
jump_strength = 2;
jump_max = 10;
grav = 1;
grav_flying = 1;
ground_y = y;
hp = 3;
specials = 5;
#endregion

#region Dynamic Properties
state = player_state.IDLE;
jstate = jump_state.ON_GROUND;
current_spr = noone;
current_aim = 0;
player_facing = 1;
dash_cooldown = 0;
dash_active = 0;
fire_cooldown = 0;
jump_cooldown = 0;
hurt_cooldown = 0;
die_cooldown = 0;
hsp = 0; // horizontal speed
vsp = 0;
#endregion

#region Methods
hurt = function() {
	if (hurt_cooldown == 0 && hp > 0) {
		hp--;
		hurt_cooldown = hurt_period;
		if (hp == 0) {
			state = player_state.DYING;
			die_cooldown = die_duration;
			set_current_spr(spr_dying, 0);
		}
	}
}

#endregion 
