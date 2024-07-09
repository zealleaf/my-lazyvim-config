-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = {
  noremap = true,
  silent = true,
}

---------------------
-- General
---------------------
vim.keymap.set("n", ";s", ":wa<CR>", opts)
vim.keymap.set("n", "<C-q>", "", opts) -- tmux
vim.keymap.set("n", "q", "<C-w>c")
vim.keymap.set("n", "J", "")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "[", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("v", "/", ":move '>+1<CR>gv-gv", opts)

-- clear search highlights
vim.keymap.set("n", "<C-n>", ":nohlsearch<CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- window management
vim.keymap.set("n", ";wv", ":vsp<CR>", opts)
vim.keymap.set("n", ";wh", ":sp<CR>", opts)
vim.keymap.set("n", ";wx", "<C-w>c")
vim.keymap.set("n", ";wo", "<C-w>o") -- close others
vim.keymap.set("n", ";w;", ":vertical resize -10<CR>", opts)
vim.keymap.set("n", ";w'", ":vertical resize +10<CR>", opts)
vim.keymap.set("n", ";w[", ":resize -10<CR>", opts)
vim.keymap.set("n", ";w/", ":resize +10<CR>", opts)
vim.keymap.set("n", ";w=", "<C-w>=")
