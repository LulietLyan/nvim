return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require("osc52")
    osc52.setup({
      max_length = 0, -- 不限制长度
      silent = true,
      trim = false,
    })

    local function copy(lines, _)
      osc52.copy(table.concat(lines, "\n"))
    end

    local function paste()
      return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
    end

    vim.g.clipboard = {
      name = "OSC 52",
      copy = { ["+"] = copy, ["*"] = copy },
      paste = { ["+"] = paste, ["*"] = paste },
    }

    -- Normal yanks also go to the local clipboard when editing over SSH.
    local function copy_yank()
      if vim.v.event.operator == "y" then
        osc52.copy_register(vim.v.event.regname ~= "" and vim.v.event.regname or "+")
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", { callback = copy_yank })
  end,
}
