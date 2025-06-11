return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["c"] = { "clang_format" },
        ["cpp"] = { "clang_format" },
        ["c++"] = { "clang_format" },
      },
      formatters = {
        --clang-format = {
        -- prepend_args = {"-style=google"},
        --},
      },
    },
  },
}
