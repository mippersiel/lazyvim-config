return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "php-cs-fixer") -- Formatter
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.phpcsfixer)
    end,
  },
}
