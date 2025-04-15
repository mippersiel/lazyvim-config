return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "clang-format") -- Formatter
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "my_clang_format" },
        cpp = { "my_clang_format" },
      },
      formatters = {
        my_clang_format = {
          command = "clang-format",
          args = function(_, _) -- (self, context)
            -- Choose project's .clang-format file, otherwise use locally configured one
            local clang_format_file = vim.fs.joinpath(require("lazyvim.util").root.get(), ".clang-format")
            if not vim.uv.fs_stat(clang_format_file) then
              clang_format_file = vim.fn.expand("~/.config/nvim/default-settings/clang-format")
            end
            return {
              "--style=file:" .. clang_format_file,
              "-assume-filename",
              "$FILENAME",
            }
          end,
          range_args = function(_, ctx) -- (self, context)
            local util = require("conform.util")
            local start_offset, end_offset = util.get_offsets_from_range(ctx.buf, ctx.range)
            local length = end_offset - start_offset
            -- Choose project's .clang-format file, otherwise use locally configured one
            local clang_format_file = vim.fs.joinpath(require("lazyvim.util").root.get(), ".clang-format")
            if not vim.uv.fs_stat(clang_format_file) then
              clang_format_file = vim.fn.expand("~/.config/nvim/default-settings/clang-format")
            end
            return {
              "--style=file:" .. clang_format_file,
              "-assume-filename",
              "$FILENAME",
              "--offset",
              tostring(start_offset),
              "--length",
              tostring(length),
            }
          end,
          stdin = true,
        },
      },
    },
  },
}
