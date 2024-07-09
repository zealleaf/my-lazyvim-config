-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable auto comment
vim.api.nvim_command('autocmd FileType * set formatoptions-=ro')

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- neo-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nvcheatsheet", "neo-tree" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
    vim.opt_local.foldcolumn = "0"
  end,
})

-- use copilot only in certain directories
local enable_dirs = {
  vim.fn.expand("$HOME") .. "/dev/",
}

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  pattern = "*",
  callback = function(args)
    if not args.data or not args.data.client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.name == "copilot" then
      local current_dir = vim.fn.getcwd()

      local in_enabled_dir = false
      for _, pattern in ipairs(enable_dirs) do
        if current_dir:find(pattern, 1, true) ~= nil then
          in_enabled_dir = true
          break
        end
      end

      if not in_enabled_dir then
        require("notify")("Copilot detach in: " .. current_dir)
        vim.defer_fn(function()
          vim.cmd("silent Copilot detach")
        end, 0)
      end
    end
  end,
})
