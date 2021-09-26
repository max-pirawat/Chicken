/// @description Insert description here
// You can write your code in this editor

if (state >= enemy_state.DYING) {
	instance_destroy(other);
	return;
}

o_player.specials += 0.05
if (hp > other.bullet_dmg) {
	hp -= other.bullet_dmg;
} else {

}

instance_destroy(other);