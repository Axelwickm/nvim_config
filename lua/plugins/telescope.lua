return {
    "neovim/nvim-lspconfig",
    opts = function()
        if LazyVim.pick.want() ~= "telescope" then
            return
        end
        local Keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- stylua: ignore
    vim.list_extend(Keys, {
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files() end,
        desc = "Search for files"
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({})
        end,
        desc = "Grep in files",
      },
      {
        "<leader>fr",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Resume telescope",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    })
    end,
}
