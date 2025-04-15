-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stylua: ignore
vim.keymap.set("v", "<leader>F", function() require("conform").format({ async = true, lsp_fallback = true }) end, { desc = "Format selected" })
