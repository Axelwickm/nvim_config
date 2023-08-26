return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
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
    },
    -- change some options
    opts = {},
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
