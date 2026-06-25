shader_type spatial;
render_mode unshaded, depth_draw_never, fog_disabled;

uniform sampler2D background: source_color;
// source_color indicates that this is an ALBEDO texture

void vertex() {
	// Called for every vertex the material is visible on.
	//POSITION = vec4(-VERTEX.xy, 1.0, 1.0);
}

void fragment() {
	vec2 newUV = vec2(-UV.x,UV.y);
	ALBEDO = texture(background, SCREEN_UV).rgb;
	//DEPTH = 1.0;
	
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
