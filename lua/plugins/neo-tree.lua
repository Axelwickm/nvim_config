return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            ignored = "",
            renamed = "➜",
            modified = "✹",
            unstaged = "",
          },
        },
      },
    })
  end,
}
