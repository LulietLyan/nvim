-- 自动保存插件配置
-- 适用于 lazy.nvim

return {
  {
    "Pocco81/auto-save.nvim",
    event = "InsertEnter",
    config = function()
      require("auto-save").setup({
        enabled = true,
        execution_message = {
          message = function()
            return "自动保存: " .. vim.fn.expand("%:t")
          end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        trigger_events = {
          immediate_save = { "BufLeave", "FocusLost" },
          defer_save = { "InsertLeave", "TextChanged" },
          cancel_defered_save = { "InsertEnter" },
        },
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")

          if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true
          end
          return false
        end,
        write_all_buffers = false,
        debounce_delay = 135,
        callbacks = {
          enabling = nil,
          disabling = nil,
          before_asserting_save = nil,
          before_saving = nil,
          after_saving = nil,
        },
      })

      -- 设置快捷键
      vim.keymap.set("n", "<leader>as", "<cmd>ASToggle<cr>", { desc = "切换自动保存" })
    end,
  },
}
