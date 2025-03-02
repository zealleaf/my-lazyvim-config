-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- General
vim.g.mapleader = " "
vim.g.autoformat = false
vim.g.snacks_animate = false
vim.g.lazyvim_picker = "snacks"
vim.opt.clipboard = "unnamedplus"
vim.opt.title = true
vim.opt.timeoutlen = 200
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.iskeyword:append("-")

-- LSP
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- Clipboard for SSH
-- Use osc52 as clipboard provider
if os.getenv("SSH_TTY") then
  local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end
