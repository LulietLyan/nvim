-- 缩进线插件配置
-- 适用于 lazy.nvim

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- 基础配置
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        char = "│",
        show_start = true,
        show_end = true,
        show_exact_scope = false,
        show_node = false,
        show_only_current_scope = false,
        show_only_current_scope_start = false,
        show_only_current_scope_end = false,
        highlight = "IndentBlanklineScopeChar",
        priority = 1024,
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
      -- 高亮配置
      highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      -- 字符配置
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      -- 空格配置
      space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      -- 其他配置
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
      show_current_context_start = true,
      show_current_context_start_on_current_line = false,
      context_patterns = {
        "class",
        "function",
        "method",
        "^if",
        "^while",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      },
      -- 文件类型特定配置
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      buftype_exclude = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt",
      },
      -- 自定义高亮组
      custom_highlights = {
        IndentBlanklineIndent1 = { fg = "#E06C75" },
        IndentBlanklineIndent2 = { fg = "#E5C07B" },
        IndentBlanklineIndent3 = { fg = "#98C379" },
        IndentBlanklineIndent4 = { fg = "#56B6C2" },
        IndentBlanklineIndent5 = { fg = "#61AFEF" },
        IndentBlanklineIndent6 = { fg = "#C678DD" },
        IndentBlanklineScopeChar = { fg = "#E5C07B", nocombine = true },
      },
    },
    config = function(_, opts)
      require("indent_blankline").setup(opts)

      -- 设置快捷键
      vim.keymap.set("n", "<leader>ti", function()
        vim.g.indent_blankline_enabled = not vim.g.indent_blankline_enabled
        vim.cmd("IndentBlanklineRefresh")
      end, { desc = "切换缩进线" })

      vim.keymap.set("n", "<leader>tc", function()
        vim.g.indent_blankline_show_current_context = not vim.g.indent_blankline_show_current_context
        vim.cmd("IndentBlanklineRefresh")
      end, { desc = "切换当前上下文高亮" })
    end,
  },
}
