
for (i=0; i < o_player.hp; ++i) {
	draw_sprite(s_heart, 0, 10 + i * 20, room_height - 40);
}
for (i=0; i < o_player.specials; ++i) {
	draw_sprite(s_egg, 0, 10 + i * 20, room_height - 20)
}
