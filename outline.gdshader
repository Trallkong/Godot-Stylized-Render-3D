shader_type spatial;

render_mode cull_front;

uniform vec3 color : source_color = vec3(0.02);
uniform float outline_width = 0.03;

void vertex() {
	VERTEX += NORMAL * outline_width;
}

void fragment() {
	ALBEDO = color;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
