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
    dependencies = {
      "gbprod/none-ls-shellcheck.nvim",
    },
    opts = function(_, opts)
      -- Remove shfmt from none-ls: Let conform deal with it
      local to_remove = -1
      for index, entry in ipairs(opts.sources) do
        if entry.name == "shfmt" then
          to_remove = index
          break
        end
      end
      if to_remove ~= -1 then
        table.remove(opts.sources, to_remove)
      end

      -- Keep shellcheck with none-ls
      table.insert(opts.sources, require("none-ls-shellcheck.diagnostics"))
      table.insert(opts.sources, require("none-ls-shellcheck.code_actions"))
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        sh = { "shfmt" },
      },
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
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
