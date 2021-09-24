#region Attributes
player_no = 0;
player_speed = 5;
dash_speed = 15;
drag = .12; // slow down
dash_duration = room_speed * 0.4;
dash_disable = room_speed * 0.5; // how long to disable dash after using one
fire_disable = room_speed * 0.2; 
jump_hold = room_speed * 0.1;
jump_initial = 10;
jump_strength = 2;
jump_max = 10;
grav = 1;
grav_flying = 1;
ground_y = y;
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
hsp = 0; // horizontal speed
vsp = 0;
#endregion

