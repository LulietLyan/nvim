-- TODO 高亮插件配置
-- 适用于 lazy.nvim

return {
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- 高亮配置
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#F59E0B" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF006E" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)

      -- 设置快捷键
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "下一个 TODO" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "上一个 TODO" })

      vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "TODO (Trouble)" })
      vim.keymap.set("n", "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "TODO/Fix/Fixme (Trouble)" })
      vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "TODO" })
      vim.keymap.set("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "TODO/Fix/Fixme" })

      -- 自定义高亮组
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd("hi TodoBgFIX ctermbg=52 guibg=#DC2626")
          vim.cmd("hi TodoBgTODO ctermbg=53 guibg=#2563EB")
          vim.cmd("hi TodoBgHACK ctermbg=53 guibg=#F59E0B")
          vim.cmd("hi TodoBgWARN ctermbg=53 guibg=#F59E0B")
          vim.cmd("hi TodoBgPERF ctermbg=53 guibg=#7C3AED")
          vim.cmd("hi TodoBgNOTE ctermbg=53 guibg=#10B981")
          vim.cmd("hi TodoBgTEST ctermbg=53 guibg=#FF006E")
          vim.cmd("hi TodoSignFIX ctermfg=52 guifg=#DC2626")
          vim.cmd("hi TodoSignTODO ctermfg=53 guifg=#2563EB")
          vim.cmd("hi TodoSignHACK ctermfg=53 guifg=#F59E0B")
          vim.cmd("hi TodoSignWARN ctermfg=53 guifg=#F59E0B")
          vim.cmd("hi TodoSignPERF ctermfg=53 guifg=#7C3AED")
          vim.cmd("hi TodoSignNOTE ctermfg=53 guifg=#10B981")
          vim.cmd("hi TodoSignTEST ctermfg=53 guifg=#FF006E")
        end,
      })
    end,
  },
}
