#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 get_rectangle(vec2 bl_norm, vec2 tr_norm, vec2 fragCoord)
{
  vec2 bl = floor(bl_norm - fragCoord);
  float pct = bl.y * bl.x;


  vec2 tr = floor(-tr_norm + fragCoord);
  pct *= tr.x * tr.y;

  return vec3(pct);
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    vec2 x = vec2(0.1, 0.1);
    vec2 y = vec2(0.9, 0.9);

    color = get_rectangle(x, y, st) * vec3(0.0, 0.3, 0.5);

    gl_FragColor = vec4(color,1.0);
}
