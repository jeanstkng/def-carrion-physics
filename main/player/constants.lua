local M = {
    blood_splat_particle =
    {
        factory  = {
            url                = "/particles#factory",
            sprite_id          = "sprite",
            collisionobject_id = "collisionobject"
        },
        emitter  = {
            type = 'ellipse',
            width = 64,
            height = 64,
            max_particles = 32,

        },
        particle = {
            emit_qty = 2,
            emit_repeat = 1,
            scale_out = vmath.vector3(0, 0, 1),
            alpha_out_easing  = go.EASING_OUTQUAD,
            time_life = 0.5
        },
        movement = {
            type = "angle",
            angle = { 0, 90, 180, 270, 360 },
            angle_increment = 10,
            angle_bounce = false,
            rotate_to_direction = false,
            velocity = { { 500, 1000, 2000, -500, -1000, -2000 } },
            velocity_adjust_x = 1,
            velocity_adjust_y = 1,
            gravity_x = 0,
            gravity_y = 0,
            target_position_x = 0,
            target_position_y = 0,
            transition_overrun = 0,
        }
    }

}

return M
