-- 环绕插件配置
-- 适用于 lazy.nvim

return {
  {
    "kylechui/nvim-surround",
    version = "*", -- 使用最新版本
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- nvim-surround v4 installs its keymaps through <Plug> mappings;
        -- keymaps are intentionally configured below, outside setup().
        aliases = {
          ["a"] = ">", -- 单字符别名
          ["b"] = ")",
          ["B"] = "}",
          ["r"] = "]",
          ["q"] = '"',
          ["Q"] = "'",
          ["s"] = "}",
          ["t"] = ">", -- 标签
        },
        -- 支持的语言特定配置
        move_cursor = true,
        indent_lines = true,
        -- 自定义环绕字符
        surrounds = {
          -- HTML 标签
          ["<"] = {
            add = { "<%1>%2</%1>" },
            find = "<%1>.-</%1>",
            delete = "<%1>(.-)</%1>",
            change = {
              target = "<%1>(.-)</%1>",
              replacement = "<%2>%1</%2>",
            },
          },
          -- LaTeX 命令
          ["\\"] = {
            add = { "\\%1{%2}" },
            find = "\\%1{[^}]*}",
            delete = "\\%1{([^}]*)}",
            change = {
              target = "\\%1{([^}]*)}",
              replacement = "\\%2{%1}",
            },
          },
          -- Markdown 代码块
          ["`"] = {
            add = { "`%1`" },
            find = "`[^`]*`",
            delete = "`([^`]*)`",
            change = {
              target = "`([^`]*)`",
              replacement = "`%2%1`",
            },
          },
          -- Markdown 粗体
          ["*"] = {
            add = { "**%1**" },
            find = "\\*\\*[^*]*\\*\\*",
            delete = "\\*\\*([^*]*)\\*\\*",
            change = {
              target = "\\*\\*([^*]*)\\*\\*",
              replacement = "**%2%1**",
            },
          },
          -- Markdown 斜体
          ["_"] = {
            add = { "*%1*" },
            find = "\\*[^*]*\\*",
            delete = "\\*([^*]*)\\*",
            change = {
              target = "\\*([^*]*)\\*",
              replacement = "*%2%1*",
            },
          },
        },
      })

      -- v4 exposes stable <Plug> mappings instead of setup().keymaps.
      vim.keymap.set("n", "<leader>sa", "<Plug>(nvim-surround-normal)", { remap = true, desc = "添加环绕" })
      vim.keymap.set("n", "<leader>sd", "<Plug>(nvim-surround-delete)", { remap = true, desc = "删除环绕" })
      vim.keymap.set("n", "<leader>sc", "<Plug>(nvim-surround-change)", { remap = true, desc = "更改环绕" })
      vim.keymap.set("x", "<leader>sa", "<Plug>(nvim-surround-visual)", { remap = true, desc = "添加环绕" })
    end,
  },
}
