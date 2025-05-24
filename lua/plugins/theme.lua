return {
    -- add theme
    {
        "sainnhe/sonokai",
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.sonokai_transparent_background = 1
            vim.g.sonokai_enable_italic = true
            vim.cmd.colorscheme("sonokai")
        end,
    },

    -- Configure LazyVim to load sonokai
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "sonokai",
        },
    },
}
