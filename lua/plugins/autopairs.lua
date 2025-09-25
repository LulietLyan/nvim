-- 自动配对插件配置
-- 适用于 lazy.nvim

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      -- 配置 autopairs
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0, -- Offset from pattern match
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })

      -- 与 nvim-cmp 集成
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- 设置快捷键
      vim.keymap.set("i", "<C-h>", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-e><BS>"
        else
          return "<BS>"
        end
      end, { expr = true, desc = "智能退格" })

      -- 自定义规则
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      -- 添加自定义规则
      autopairs.add_rules({
        -- 在 $ 后面添加 $
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex("%%"))
          :with_pair(cond.not_before_regex("%%")),
        -- 在 [ 后面添加 ]
        Rule("[", "]", { "lua", "vim" })
          :with_pair(cond.not_after_regex("%s"))
          :with_pair(cond.not_before_regex("%s")),
      })
    end,
  },
}
