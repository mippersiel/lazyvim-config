return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
          "thumbs.db",
          ".venv",
          "venv",
          ".idea",
          "node_modules",
          "package-lock.json",
        },
        never_show = {},
      },
    },
    window = { auto_expand_width = true },
  },
}
