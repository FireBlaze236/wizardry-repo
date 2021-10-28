#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


void main()
{
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0);
  float d = 0.0;

  st = st * 2.0 - 1.0;
  vec2 t = abs(st) - 0.3;
  d = length( max(t, 0.0) );

  color = vec3( fract(d * 10.0));

  gl_FragColor = vec4(color , 1.0);
}
