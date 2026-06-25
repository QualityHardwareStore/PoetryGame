shader_type spatial;
render_mode unshaded, depth_draw_always, depth_prepass_alpha;

uniform sampler2D background: source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 newUV = vec2(-UV.x,UV.y);
	ALBEDO = texture(background, SCREEN_UV).rgb;
	//ALPHA = 0.0;
	//ALBEDO = vec3(1.0, 0.0, 0.0);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
