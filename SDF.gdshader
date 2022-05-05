shader_type canvas_item;

uniform sampler2D gradient:hint_black;

uniform float thickness :hint_range(0.0, 1.0) = 0.5;
uniform float softness :hint_range(0.001, 1.0) = 0.0;
uniform float outline_thickness :hint_range(0.0, 1.0) = 0.0;
uniform float outline_softness :hint_range(0.0, 1.0) = 0.01;

void fragment() {
	float a = texture(TEXTURE, UV).b;
	float outline = smoothstep(outline_thickness - outline_softness, outline_thickness + outline_softness, a);
	a = smoothstep(1.0 - thickness - softness, 1.0 - thickness + softness, a);
	const float alpha_threshold = 0.5;
	vec3 sampled_gradient = texture(gradient, vec2(outline, 0.0)).rgb;
	COLOR.rgb = sampled_gradient;
	COLOR.a = a;
	// Place fragment code here.
}
