-- 环绕插件配置
-- 适用于 lazy.nvim

return {
  {
    "kylechui/nvim-surround",
    version = "*", -- 使用最新版本
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- 配置选项
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "ys",
          normal_cur = "yss",
          normal_line = "yS",
          normal_cur_line = "ySS",
          visual = "S",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
          change_line = "cS",
        },
        -- 支持的操作符
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

      -- 设置快捷键
      vim.keymap.set("n", "<leader>sa", function()
        require("nvim-surround").surround_add()
      end, { desc = "添加环绕" })

      vim.keymap.set("n", "<leader>sd", function()
        require("nvim-surround").surround_delete()
      end, { desc = "删除环绕" })

      vim.keymap.set("n", "<leader>sc", function()
        require("nvim-surround").surround_change()
      end, { desc = "更改环绕" })

      -- 可视模式下的快捷键
      vim.keymap.set("v", "<leader>sa", function()
        require("nvim-surround").surround_add()
      end, { desc = "添加环绕" })

      vim.keymap.set("v", "<leader>sd", function()
        require("nvim-surround").surround_delete()
      end, { desc = "删除环绕" })

      vim.keymap.set("v", "<leader>sc", function()
        require("nvim-surround").surround_change()
      end, { desc = "更改环绕" })
    end,
  },
}
