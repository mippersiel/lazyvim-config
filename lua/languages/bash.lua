return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "shfmt") -- Formatter
      table.insert(opts.ensure_installed, "shellcheck") -- Diagnostics and code actions
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        shfmt = {
          -- -i 2 : Indent 2 spaces
          -- -ci  : Switch cases will be indented
          -- -sr  : Redirect operators will be followed by a space
          prepend_args = { "-i", "2", "-ci", "-sr" },
        },
      },
    },
  },
}
