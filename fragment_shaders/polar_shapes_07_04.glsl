#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st) {
    return smoothstep(0.02, 0.0, abs(st.y - st.x));
}

void main()
{
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0);
  vec2 pos = vec2(0.50, 0.50) - st;

  float r = length(pos) * 3.0;
  float a = atan(pos.y, pos.x);

  float f = cos(a*3.);
  // f = abs(cos(a*3.));
  // f = abs(cos(a*2.5))*.5+.3;
  // f = abs(cos(a*12.)*sin(a*3.))*.8+.1;
  // f = smoothstep(-.5,1., cos(a*10.))*0.2+0.5;

  vec3 p = plot(vec2(r, f)) * vec3(0.0, 1.,0.);
  color = vec3(1.0 - smoothstep(f, f + 0.2, r));

  gl_FragColor = vec4(color , 1.0);
}
