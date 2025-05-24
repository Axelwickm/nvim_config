return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "openai",
                },
                inline = {
                    adapter = "openai",
                    keymaps = {
                        accept_change = {
                            modes = { n = "ga" },
                            description = "Accept the suggested change",
                        },
                        reject_change = {
                            modes = { n = "gr" },
                            description = "Reject the suggested change",
                        },
                    },
                },
            },
            adapters = {
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        schema = {
                            model = {
                                -- default = "o1-preview",
                                -- default = "o3-mini-2025-01-31",
                                default = "gpt-4o",
                            },
                        },
                    })
                end,
            },
        })
    end,
}
