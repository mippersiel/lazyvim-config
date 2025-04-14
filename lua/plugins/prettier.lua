-- Formatter for multiple languages (CSS, HTML, JSON, Javascript, Markdown, Typescript, yaml)
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
}
