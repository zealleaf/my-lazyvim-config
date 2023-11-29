return {
  -- mason.nvim
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "eslint-lsp",
        "eslint_d",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "marksman",
        "prettierd",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
      })
    end,
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>ctf", ":TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    opts = {
      servers = {
        tsserver = {
          keys = {
            {
              "<leader>cto",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>cta",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.addMissingImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Add Missing Imports",
            },
            {
              "<leader>ctr",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove Unused",
            },
          },
        },
      },
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
