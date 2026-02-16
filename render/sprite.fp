#version 140

in mediump vec2 var_texcoord0;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;
uniform fs_uniforms
{
    mediump vec4 tint;
};

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    vec4 color = texture(texture_sampler, var_texcoord0.xy) * tint_pm;
    
    
    if (color.a == 0) {
        discard;
    }
    
    out_fragColor = color;
}
