return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          function()
            local timezone_offset = 0
            if os.getenv("SSH_TTY") then
              timezone_offset = 8 * 3600
            end
            return " " .. os.date("%R", os.time() + timezone_offset)
          end,
        },
      },
    },
  },
}
