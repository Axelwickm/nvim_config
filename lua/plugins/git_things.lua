return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    keys = {
      {
        "<leader>gb",
        function()
          require("gitsigns.actions").blame_line()
        end,
        desc = "Gitsigns blame line",
      },
      {
        "<leader>gd",
        function()
          require("gitsigns.actions").preview_hunk_inline()
        end,
        desc = "Gitsigns blame line",
      },
      {
        "<leader>gD",
        function()
          require("gitsigns.actions").preview_hunk()
        end,
        desc = "Gitsigns blame line",
      },
      {
        "<leader>gr",
        function()
          require("gitsigns.actions").reset_hunk()
        end,
        desc = "Gitsigns reset hunk",
      },
    },
    config = function()
      require("gitsigns").setup({})
    end,
  },
}
