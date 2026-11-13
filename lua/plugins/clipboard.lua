return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require("osc52")
    osc52.setup({
      max_length = 0, -- 不限制长度
      silent = false,
      trim = false,
      -- This is harmless for direct SSH sessions and makes copying work when
      -- the user later opens Neovim inside tmux on the server.
      tmux_passthrough = true,
    })

    local function copy(lines, _)
      osc52.copy(table.concat(lines, "\n"))
    end

    -- OSC 52 is a write-only bridge on most terminal/iPad clients: Neovim can
    -- send copied text out, but it cannot ask the client for its clipboard.
    -- Keep the latest local clipboard value available for `"+p`; external
    -- iPad paste is handled by the terminal's native paste input (see the
    -- insert/terminal mappings in config.keymaps).
    local function paste()
      local value = vim.fn.getreg("+")
      if value == "" then
        value = vim.fn.getreg("*")
      end
      return { vim.fn.split(value, "\n", true), vim.fn.getregtype("+") }
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
