return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    -- optional = true,
    opts = {

        formatters_by_ft = {
            ["c"] = { "clang_format" },
            ["cpp"] = { "clang_format" },
            ["c++"] = { "clang_format" },
        },

        formatters = {
            clang_format = { prepend_args = { "-style=google" } },
        },
    },
}
