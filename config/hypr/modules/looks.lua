--> Looks & Feel

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 20,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(cdd6f4ee)"} },
            inactive_border = { colors = {"rgba(3a3a40aa)"} },
        },

        -- col = {
        --     active_border   = { colors = {"rgba(78a099ee)", "rgba(ccffffa0)"}, angle = 45 },
        --     inactive_border = { colors = {"rgba(12320aaa)", "rgba(242424ff)"}, angle = 45 },
        -- },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.90,

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    -- Window Groupbar
    group = {
        groupbar = {
            enabled = true,

            -- Typography
            font_family = "JetBrainsMono Nerd Font",
            font_size = 12,
            font_weight_active = "bold",
            font_weight_inactive = "normal",

            render_titles = true,
            text_padding = 12,
            text_offset = 0,

            -- Active / inactive backgrounds
            col = {
                active = {
                    colors = {"rgba(cdd6f4ee)"},
                },
                inactive = {
                    colors = {"rgba(3a3a40ee)"},
                },
                locked_active = {
                    colors = {"rgba(a6adc8ee)"},
                },
                locked_inactive = {
                    colors = {"rgba(303036ee)"},
                },
            },

            -- Text colours
            text_color = "rgba(1a1a1eff)",
            text_color_inactive = "rgba(cdd6f4cc)",
            text_color_locked_active = "rgba(1a1a1eff)",
            text_color_locked_inactive = "rgba(cdd6f4aa)",

            -- Spacing and shape
            height = 12,
            gaps_in = 3,
            gaps_out = 3,
            rounding = 6,
            rounding_power = 2,

            blur = false,
            scrolling = false,
            middle_click_close = true,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- Snappy, modern bezier curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},        {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.4, 0.4},    {0.2, 1}     } })
hl.curve("quick",          { type = "bezier", points = { {0.1, 0},      {0.1, 1}     } })

-- Fast, responsive spring
hl.curve("easy",           { type = "spring", mass = 0.8, stiffness = 200.0, dampening = 15.0 })

-- Animations
hl.animation({ leaf = "global",        enabled = true,  speed = 0.8, bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 0.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 0.5, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 0.5, spring = "easy",         style = "popin 90%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 0.5, bezier = "linear",       style = "popin 90%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 0.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 0.5, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 0.4, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 0.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 0.5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 0.5, bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 0.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 0.5, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 0.6, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 0.6, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 0.6, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 0.5, bezier = "quick" })
