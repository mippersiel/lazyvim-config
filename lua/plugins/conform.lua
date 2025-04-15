return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "codespell") -- Formatter
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell", "trim_whitespace" },
      },
    },
  },
}
