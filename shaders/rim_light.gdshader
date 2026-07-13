shader_type spatial;

uniform vec3 emission_color : source_color = vec3(0.3, 0.5, 1.0);
varying float rim;

void vertex() {
	vec3 view = CAMERA_POSITION_WORLD - VERTEX;
	rim = 1.0 - dot(NORMAL, normalize(view));
	rim = pow(rim, 3.0);
}

void fragment() {
	EMISSION += emission_color * rim;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
