return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {}
      opts.highlight = opts.highlight or {}
      opts.indent = opts.indent or {}
      opts.folds = opts.folds or {}
      opts.highlight.enable = false
      opts.indent.enable = false
      opts.folds.enable = false
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false,
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = false,
  },
}
