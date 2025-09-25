-- 诊断窗口插件配置
-- 适用于 lazy.nvim

return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({
        -- 基础配置
        position = "bottom",
        height = 10,
        width = 50,
        mode = "workspace_diagnostics",
        fold_open = " ",
        fold_closed = " ",
        group = true,
        padding = true,
        action_keys = {
          close = "q",
          cancel = "<esc>",
          refresh = "r",
          jump = { "<cr>", "<tab>" },
          open_split = { "<c-x>" },
          open_vsplit = { "<c-v>" },
          open_tab = { "<c-t>" },
          jump_close = { "o" },
          toggle_mode = "m",
          toggle_preview = "P",
          hover = "K",
          preview = "p",
          close_folds = { "zM", "zm" },
          open_folds = { "zR", "zr" },
          toggle_fold = { "zA", "za" },
          previous = "k",
          next = "j",
        },
        indent_lines = true,
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { "lsp_definitions" },
        use_diagnostic_signs = false,
      })

      -- 设置快捷键
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble 切换" })
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "工作区诊断" })
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "文档诊断" })
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "位置列表" })
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "快速修复" })
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "LSP 引用" })
    end,
  },
}
