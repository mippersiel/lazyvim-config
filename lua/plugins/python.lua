return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff_lsp = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "ruff-lsp")
      table.insert(opts.ensure_installed, "pyright")
      table.insert(opts.ensure_installed, "autoflake") -- Fixes imports
      table.insert(opts.ensure_installed, "black") -- Formatter
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.autoflake)
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
}
