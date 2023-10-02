return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "shfmt") -- Formatter
      table.insert(opts.ensure_installed, "shellcheck") -- Diagnostics and code actions
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.shfmt)
      table.insert(opts.sources, nls.builtins.diagnostics.shellcheck)
      table.insert(opts.sources, nls.builtins.code_actions.shellcheck)
    end,
  },
}
