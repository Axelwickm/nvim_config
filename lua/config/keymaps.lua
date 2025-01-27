-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("x", "<leader>y", '"+y', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>a<leader>", ":CodeCompanion ", { noremap = true, silent = false })
vim.keymap.set({ "n", "v" }, "<leader>aa", ":CodeCompanionActions<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ac", ":CodeCompanionChat<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>at", ":CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("x", "<leader>af", ":CodeCompanionAction<CR>3Hi", { noremap = true, silent = false })
