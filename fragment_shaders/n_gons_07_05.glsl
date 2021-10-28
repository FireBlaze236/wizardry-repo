#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWO_PI 6.28318530718

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

  st = st * 2.0 - 1.0;
  int N = 3;

  float r = TWO_PI / float(N) ;
  float a = atan(st.x, st.y) + PI;

  float d = cos(floor(0.5 + a / r)*r -a) * length(st);

  color = vec3(1.0 - smoothstep(0.4, 0.41, d));
  //color = vec3(d);
  gl_FragColor = vec4(color , 1.0);
}
