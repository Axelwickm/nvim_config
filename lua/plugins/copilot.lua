return {
  "zbirenbaum/copilot.lua",
  lazy = false,
  config = function()
    require("copilot").setup({
      suggestions = {
        keymap = {
          autotrigger = true,
          accept = "<C-A>",
        },
      },
      filetypes = {
        markdown = true,
      },
    })
  end,
}
