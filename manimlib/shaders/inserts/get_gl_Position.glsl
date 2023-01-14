// Assumes the following uniforms exist in the surrounding context:
// uniform vec2 frame_shape;
// uniform float focal_distance;
// uniform float is_fixed_in_frame;

const vec2 DEFAULT_FRAME_SHAPE = vec2(8.0 * 16.0 / 9.0, 8.0);

vec4 get_gl_Position(vec3 point){
    vec2 shape;
    if(bool(is_fixed_in_frame)) shape = DEFAULT_FRAME_SHAPE;
    else                        shape = frame_shape;

    vec4 result = vec4(point, 1.0);
    result.x *= 2.0 / shape.x;
    result.y *= 2.0 / shape.y;
    result.z /= focal_distance;
    result.w = 1.0 - result.z;
    // Flip and scale to prevent premature clipping
    result.z *= -0.1;
    return result;
}