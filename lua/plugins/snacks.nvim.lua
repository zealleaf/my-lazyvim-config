return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        filter = function(notif)
          if notif == "No information available" then
            return false
          end
        end,
      },
    },
  },
}
