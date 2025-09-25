-- 注释插件配置
-- 适用于 lazy.nvim

return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local comment = require("Comment")
      local ts_context_commentstring = require("ts_context_commentstring")

      -- 配置 Comment.nvim
      comment.setup({
        pre_hook = function(ctx)
          local U = require("Comment.utils")

          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
          end

          return ts_context_commentstring.calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
          })
        end,
      })

      -- 设置快捷键
      vim.keymap.set("n", "<leader>/", function()
        comment.toggle.linewise.current()
      end, { desc = "切换行注释" })

      vim.keymap.set("v", "<leader>/", function()
        comment.toggle.linewise(vim.fn.visualmode())
      end, { desc = "切换行注释" })

      vim.keymap.set("n", "<leader>?", function()
        comment.toggle.blockwise.current()
      end, { desc = "切换块注释" })

      vim.keymap.set("v", "<leader>?", function()
        comment.toggle.blockwise(vim.fn.visualmode())
      end, { desc = "切换块注释" })

      -- 配置 ts_context_commentstring
      ts_context_commentstring.setup({
        enable_autocmd = false,
        languages = {
          -- 支持更多语言的注释
          lua = {
            __default = "-- %s",
            __multiline = "--[[ %s ]]",
          },
          python = {
            __default = "# %s",
            __multiline = '""" %s """',
          },
          javascript = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          typescript = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          html = {
            __default = "<!-- %s -->",
            __multiline = "<!-- %s -->",
          },
          css = {
            __default = "/* %s */",
            __multiline = "/* %s */",
          },
          scss = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          vue = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          rust = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          go = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          c = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          cpp = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          java = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          sh = {
            __default = "# %s",
            __multiline = ": ' %s '",
          },
          bash = {
            __default = "# %s",
            __multiline = ": ' %s '",
          },
          zsh = {
            __default = "# %s",
            __multiline = ": ' %s '",
          },
          fish = {
            __default = "# %s",
            __multiline = "# %s",
          },
          sql = {
            __default = "-- %s",
            __multiline = "/* %s */",
          },
          yaml = {
            __default = "# %s",
            __multiline = "# %s",
          },
          json = {
            __default = "// %s",
            __multiline = "/* %s */",
          },
          markdown = {
            __default = "<!-- %s -->",
            __multiline = "<!-- %s -->",
          },
          tex = {
            __default = "%% %s",
            __multiline = "%% %s",
          },
          vim = {
            __default = '" %s',
            __multiline = '" %s',
          },
        },
      })
    end,
  },
}
