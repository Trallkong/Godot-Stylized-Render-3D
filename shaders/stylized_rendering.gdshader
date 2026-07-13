shader_type spatial;

render_mode cull_disabled;

uniform vec3 albedo_color : source_color = vec3(1.0);
uniform sampler2D albedo_texture;
uniform vec3 shadow_color : source_color = vec3(0.25, 0.2, 0.3);
uniform float shadow_threshold = 0.5;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 final_color = texture(albedo_texture, UV) * vec4(albedo_color, 1.0);
	ALBEDO = final_color.rgb;
}

void light() {
	float ndot1 = dot(NORMAL, LIGHT);
	
	float toon = step(shadow_threshold, ndot1);
	
	vec3 color = mix(
		shadow_color,
		ALBEDO,
		toon
	);
	
	DIFFUSE_LIGHT = color * LIGHT_COLOR;
}
