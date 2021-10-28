#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 get_circle(vec2 center_norm, float rad, vec2 fragC)
{
  float pct = step(distance(fragC, center_norm), rad);

  return vec3(pct);
}

vec3 get_smooth_circle(vec2 center_norm, float rad, vec2 fragC, float blend)
{
  float dist = distance(fragC, center_norm);
  blend = blend + 1.0;
  float pct = 1.0 - smoothstep(rad / blend, rad, dist);
  return vec3(pct);
}

float circle(in vec2 _st,in vec2 _center, in float _diameter){
    vec2 dist = _st-_center;
	return 1.-smoothstep(_diameter-(_diameter*0.01),
                         _diameter+(_diameter*0.01),
                         dot(dist,dist)*4.0);
}

void main()
{
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0);

  float rad =  0.5;
  vec2 center = vec2(0.5, 0.5);
  //color = get_smooth_circle(center, rad * abs(sin(u_time)), st, 0.1) * vec3(1.0, 0.0, 0.0);
  color = circle(st, center, 0.5) * vec3(1.0);
  gl_FragColor = vec4(color , 1.0);
}
