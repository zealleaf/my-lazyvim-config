return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")

      opts.files = opts.files or {}
      opts.files.actions = opts.files.actions or {}
      opts.files.actions["alt-h"] = nil
      opts.files.actions["alt-."] = { actions.toggle_hidden }

      opts.grep = opts.grep or {}
      opts.grep.actions = opts.grep.actions or {}
      opts.grep.actions["alt-h"] = nil
      opts.grep.actions["alt-."] = { actions.toggle_hidden }

      return opts
    end,
  },
}
