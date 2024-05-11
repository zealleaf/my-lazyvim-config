local function default_open_command()
  vim.cmd("ene")
  local Util = require("lazyvim.util")
  require("neo-tree.command").execute({ toggle = true, position = "right", dir = Util.root() })
end

vim.api.nvim_create_user_command("DefaultOpen", default_open_command, { nargs = 0 })

return {}
