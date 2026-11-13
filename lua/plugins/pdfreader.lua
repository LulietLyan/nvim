-- PDF reading that also works over SSH: pdfreader.nvim falls back to
-- pdftotext when the terminal cannot display Kitty/Ghostty graphics.
return {
  {
    "r-pletnev/pdfreader.nvim",
    lazy = false,
    dependencies = {
      "folke/snacks.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("pdfreader").setup()
    end,
    keys = {
      {
        "gP",
        function()
          require("telescope.builtin").find_files({
            find_command = { "fd", "--type", "f", "--extension", "pdf" },
          })
        end,
        desc = "打开 PDF",
      },
    },
  },
}
