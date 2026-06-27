shader_type spatial;
render_mode unshaded, depth_draw_always;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	//ALPHA = 0.0;
	DEPTH = 1.0;
	//DEPTH = FRAGCOORD.z;
	//ALBEDO = vec3(0.0);


}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
