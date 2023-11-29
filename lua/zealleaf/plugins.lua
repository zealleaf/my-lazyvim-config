return {
  -- hop.nvim
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      local wk = require("which-key")
      wk.register({
        [";h"] = { name = "+hop" },
        [";hp"] = { ":HopPattern<CR>", "HopPattern" },
        [";hw"] = { ":HopWord<CR>", "HopWord" },
      })

      require("hop").setup()
    end,
  },

  -- vim-maximizer
  {
    "szw/vim-maximizer",
    event = "VeryLazy",
    init = function()
      local opts = {
        noremap = true,
        silent = true,
      }

      vim.keymap.set("n", ";m", ":MaximizerToggle<CR>", opts)
    end,
  },

  -- nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              {
                text = { builtin.foldfunc },
                click = "v:lua.ScFa",
              },
              {
                text = { "%s" },
                click = "v:lua.ScSa",
              },
              {
                text = { builtin.lnumfunc, " " },
                click = "v:lua.ScLa",
              },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    config = function()
      local wk = require("which-key")
      wk.register({
        [";z"] = { name = "+nvim-ufo" },
        [";zc"] = {
          function()
            require("ufo").closeAllFolds()
          end,
          "Close all folds",
        },
        [";zk"] = {
          function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
              vim.lsp.buf.hover()
            end
          end,
          "Hover fold",
        },
        [";zo"] = {
          function()
            require("ufo").openAllFolds()
          end,
          "Open all folds",
        },
      })

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      ---@diagnostic disable-next-line: missing-fields
      require("ufo").setup({
        fold_virt_text_handler = handler,
      })
    end,
  },

  -- project.nvim
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function()
      local telescope = require("telescope")
      pcall(telescope.load_extension, "projects")
      vim.g.nvim_tree_respect_buf_cwd = 1

      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = {
          "README.md",
          "Cargo.toml",
          "package.json",
          ".sln",
          ".git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
        },
      })
    end,
  },
}
