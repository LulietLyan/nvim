-- 自动格式化插件配置
-- 适用于 lazy.nvim

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "格式化代码",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        vue = { "prettier" },
        rust = { "rustfmt" },
        go = { "gofmt", "goimports" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        java = { "google-java-format" },
        xml = { "prettier" },
        sql = { "sqlfluff" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        fish = { "fish_indent" },
        toml = { "taplo" },
        nix = { "nixpkgs-fmt" },
        -- LaTeX 格式化
        tex = { "latexindent" },
        -- 其他文件类型
        ["*"] = { "codespell" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      format_after_save = {
        lsp_fallback = true,
      },
    },
    init = function()
      -- 如果用户禁用了自动格式化，则禁用 format_on_save
      if vim.g.autoformat == false then
        require("lazyvim.util").on_very_lazy(function()
          require("conform").setup({
            format_on_save = function()
              return false
            end,
          })
        end)
      end
    end,
  },
}
