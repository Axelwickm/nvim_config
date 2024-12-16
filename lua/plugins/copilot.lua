return {
    -- copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestions = {
                enabled = true,
                keymap = {
                    autotrigger = true,
                },
            },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        optional = true,
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(
                opts.sections.lualine_x,
                2,
                LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
                    local clients = package.loaded["copilot"]
                            and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
                        or {}
                    if #clients > 0 then
                        local status = require("copilot.api").status.data.status
                        return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
                    end
                end)
            )
        end,
    },
    -- copilot cmp source
    {
        "nvim-cmp",
        -- commit = "b356f2c",
        -- pin = true,
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                dependencies = "copilot.lua",
                opts = {},
                config = function(_, opts)
                    local copilot_cmp = require("copilot_cmp")
                    copilot_cmp.setup(opts)
                    -- attach cmp source whenever copilot attaches
                    -- fixes lazy-loading issues with the copilot cmp source
                    require("lazyvim.util").lsp.on_attach(function(client)
                        if client.name == "copilot" then
                            copilot_cmp._on_insert_enter({})
                        end
                    end)
                end,
            },
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, 1, { name = "copilot", group_index = 2 })
            opts.sorting = opts.sorting or require("cmp.config.default")().sorting
            table.insert(opts.sorting.comparators, 1, require("copilot_cmp.comparators").prioritize)
        end,
    },
}
