return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    mason = false,
                    autostart = false,
                },
                -- add Ruff here:
                ruff_lsp = {
                    mason = false, -- or true if you want Mason to install/manage it
                    autostart = true, -- or false if you want to start it manually
                    init_options = {
                        settings = {
                            -- your Ruff-specific settings here
                        },
                    },
                },
            },
        },
    },
}
