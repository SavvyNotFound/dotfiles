return {
    'vyfor/cord.nvim',
    ---@type CordConfig
    opts = {
        display = {
            show_repository = true,
            theme = 'catppuccin',
            flavor = 'accent'
        },
        buttons = {
            {
                label = 'View Repository',
                url = function(opts)
                    if opts.is_idle then return end -- no button while idle
                    return opts.repo_url
                end,
            },
        },
        idle = {
            show_status = false, -- clear the presence instead of showing an idle status
        },
        timestamp = {
            reset_on_idle = true,
        },
    }
}
