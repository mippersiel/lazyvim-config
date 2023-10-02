return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "stylua") -- Formatter
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.stylua)
    end,
  },
}
