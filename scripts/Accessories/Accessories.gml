
function standard_aim(accessory, aim)
{
	if (aim == 1) {
		
		accessory.image_angle += sign(accessory.image_xscale) * 45;	
	} else if (aim == 2) {
		accessory.image_angle += sign(accessory.image_xscale) * 65;
		accessory.x -= sign(accessory.image_xscale) * 5;
		accessory.y -= sign(accessory.image_xscale) * 5;
	}
}
global.a_cowboy_hat = {
	sprite: s_cowboyhat,
	offset_y: 32,
	aim: function(accessory, a) { standard_aim(accessory, a); }
};