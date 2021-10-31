if (cooldown > 0) cooldown--;

image_xscale += 0.02
image_alpha =  clamp(4 * cooldown / duration, 0, 1.0);

if (cooldown == 0) instance_destroy();