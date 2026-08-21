return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      },
      scope = {
        char = "│",
        show_start = true,
        show_end = true,
        highlight = "IndentBlanklineScopeChar",
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },
    },
    config = function(_, opts)
      local highlights = {
        IndentBlanklineIndent1 = { fg = "#E06C75" },
        IndentBlanklineIndent2 = { fg = "#E5C07B" },
        IndentBlanklineIndent3 = { fg = "#98C379" },
        IndentBlanklineIndent4 = { fg = "#56B6C2" },
        IndentBlanklineIndent5 = { fg = "#61AFEF" },
        IndentBlanklineIndent6 = { fg = "#C678DD" },
        IndentBlanklineScopeChar = { fg = "#E5C07B", nocombine = true },
      }

      for group, highlight in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, highlight)
      end

      require("ibl").setup(opts)

      vim.keymap.set("n", "<leader>ti", "<cmd>IBLToggle<cr>", { desc = "切换缩进线" })
      vim.keymap.set("n", "<leader>tc", "<cmd>IBLToggleScope<cr>", { desc = "切换当前上下文高亮" })
    end,
  },
}
