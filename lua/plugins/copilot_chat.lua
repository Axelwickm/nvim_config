-- pip install python-dotenv requests pynvim==0.5.0 prompt-toolkit tiktoken
return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {
            show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
            debug = true, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
            disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
            language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
            -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
            -- temperature = 0.1,
            prompts = {
                Explain = "Explain how it works.",
                Suggestions = "Review the following code and provide concise suggestions.",
                Tests = "Briefly explain how the selected code works, then generate unit tests.",
                Refactor = "Refactor the code to improve clarity and readability.",
            },
        },
        build = function()
            vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
            { "nvim-lua/plenary.nvim" },
        },
        keys = {
            { "<leader>ccb", "<cmd>CopilotChatBuffer", desc = "CopilotChat - Chat with current buffer" },
            { "<leader>ccr", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate review code." },
            { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
            { "<leader>ccr", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Generate tests" },
            { "<leader>ccs", "<cmd>CopilotChatSuggestions<cr>", desc = "CopilotChat - Generate suggestions" },
            {
                "<leader>ccT",
                "<cmd>CopilotChatVsplitToggle<cr>",
                desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
            },
            {
                "<leader>ccv",
                ":CopilotChatVisual ",
                mode = "x",
                desc = "CopilotChat - Open in vertical split",
            },
            {
                "<leader>ccx",
                ":CopilotChatInPlace<cr>",
                mode = "x",
                desc = "CopilotChat - Run in-place code",
            },
            {
                "<leader>ccf",
                "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
                desc = "CopilotChat - Fix diagnostic",
            },
            {
                "<leader>ccR",
                "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
                desc = "CopilotChat - Reset chat history and clear buffer",
            },
            -- Show help actions with telescope
            {
                "<leader>cch",
                function()
                    require("CopilotChat.code_actions").show_help_actions()
                end,
                desc = "CopilotChat - Help actions",
            },
            -- Show prompts actions with telescope
            {
                "<leader>ccp",
                function()
                    require("CopilotChat.code_actions").show_prompt_actions()
                end,
                desc = "CopilotChat - Help actions",
            },
            {
                "<leader>ccp",
                ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
                mode = "x",
                desc = "CopilotChat - Prompt actions",
            },
        },
    },
}
