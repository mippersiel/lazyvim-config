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
      table.insert(opts.ensure_installed, "ruff")
      table.insert(opts.ensure_installed, "pyright")
      table.insert(opts.ensure_installed, "isort") -- Formatter
      table.insert(opts.ensure_installed, "black") -- Formatter
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
      },
    },
  },
}
