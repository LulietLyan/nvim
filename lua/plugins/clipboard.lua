-- 适用于 lazy.nvim
return {
  "ojroques/nvim-osc52",
--   event = "VeryLazy",
  config = function()
    local osc52 = require("osc52")
    osc52.setup({
      max_length = 0, -- 不限制长度
      silent = false,
      trim = false,
    })

    -- 自动复制到系统剪贴板
    local function copy()
      if vim.v.event.operator == "y" and vim.v.event.regname == "" then
        require("osc52").copy_register("")
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
  end,
}