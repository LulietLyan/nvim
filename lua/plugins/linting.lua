-- 代码检查插件配置
-- 适用于 lazy.nvim

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      local configured_linters = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "pylint", "flake8" },
        lua = { "luacheck" },
        go = { "golangcilint" },
        rust = { "cargo" },
        c = { "cppcheck" },
        cpp = { "cppcheck" },
        java = { "checkstyle" },
        json = { "jsonlint" },
        yaml = { "yamllint" },
        markdown = { "markdownlint" },
        html = { "htmlhint" },
        css = { "stylelint" },
        scss = { "stylelint" },
        less = { "stylelint" },
        vue = { "eslint_d" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        zsh = { "shellcheck" },
        fish = { "fish" },
        sql = { "sqlfluff" },
        dockerfile = { "hadolint" },
        -- LaTeX 检查
        tex = { "chktex" },
        -- 其他文件类型
        ["*"] = { "codespell" },
      }

      local function executable_for(linter_name)
        local linter = lint.linters[linter_name]
        local cmd = type(linter) == "table" and linter.cmd or linter_name

        if type(cmd) == "function" then
          return true
        end

        return type(cmd) == "string" and vim.fn.executable(cmd) == 1
      end

      lint.linters_by_ft = {}
      for ft, linters in pairs(configured_linters) do
        local available = vim.tbl_filter(executable_for, linters)
        if #available > 0 then
          lint.linters_by_ft[ft] = available
        end
      end

      -- 自动运行 linter
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          local names = lint._resolve_linter_by_ft(vim.bo.filetype)
          if #names > 0 then
            lint.try_lint(names)
          end
        end,
      })

      -- 设置快捷键
      vim.keymap.set("n", "<leader>cl", function()
        local names = lint._resolve_linter_by_ft(vim.bo.filetype)
        if #names > 0 then
          lint.try_lint(names)
        else
          vim.notify("No available linter for this filetype", vim.log.levels.INFO)
        end
      end, { desc = "运行代码检查" })
    end,
  },
}
