--> Monitors

hl.monitor({
    output   = "",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "1",
})

--> Inputs

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 1,

        repeat_rate = 35,
        repeat_delay = 200,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = 0,
-- })
