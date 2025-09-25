-- 代码检查插件配置
-- 适用于 lazy.nvim

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- 配置 linter
      lint.linters_by_ft = {
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

      -- 自动运行 linter
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      -- 设置快捷键
      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "运行代码检查" })
    end,
  },
}
