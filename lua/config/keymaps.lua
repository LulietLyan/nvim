-- VSCode-like shortcuts for users who mainly live outside Vim.

local keymap = vim.keymap.set

local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  vim.cmd("botright 12split")
  terminal_win = vim.api.nvim_get_current_win()

  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
    vim.bo[terminal_buf].buflisted = false
  end

  vim.cmd("startinsert")
end

local function send_clipboard_to_terminal()
  local job_id = vim.b.terminal_job_id
  if job_id then
    vim.api.nvim_chan_send(job_id, vim.fn.getreg("+"))
  end
end

-- Save / quit
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "保存文件" })
keymap({ "n", "i" }, "<C-q>", "<cmd>bd<cr>", { desc = "关闭当前文件" })
keymap("n", "<C-S-q>", "<cmd>qa<cr>", { desc = "退出 Neovim" })

-- Copy / cut / paste / select all
keymap("v", "<C-c>", '"+y', { desc = "复制到本地剪贴板" })
keymap("v", "<C-x>", '"+d', { desc = "剪切到本地剪贴板" })
keymap("n", "<C-v>", '"+p', { desc = "粘贴" })
keymap("v", "<C-v>", '"+P', { desc = "替换选择并粘贴" })
keymap("i", "<C-v>", "<C-r>+", { desc = "粘贴" })
keymap("c", "<C-v>", "<C-r>+", { desc = "粘贴" })
keymap("n", "<C-a>", "ggVG", { desc = "全选" })
keymap("i", "<C-a>", "<Esc>ggVG", { desc = "全选" })

-- Undo / redo
keymap("n", "<C-z>", "u", { desc = "撤销" })
keymap("i", "<C-z>", "<C-o>u", { desc = "撤销" })
keymap("n", "<C-y>", "<C-r>", { desc = "重做" })
keymap("i", "<C-y>", "<C-o><C-r>", { desc = "重做" })
keymap("n", "<C-S-z>", "<C-r>", { desc = "重做" })
keymap("i", "<C-S-z>", "<C-o><C-r>", { desc = "重做" })

-- Find / command palette / files
keymap("n", "<C-f>", "/", { desc = "查找" })
keymap("i", "<C-f>", "<Esc>/", { desc = "查找" })
keymap("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "全局搜索" })
keymap("i", "<C-S-f>", "<Esc><cmd>Telescope live_grep<cr>", { desc = "全局搜索" })
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "快速打开文件" })
keymap("i", "<C-p>", "<Esc><cmd>Telescope find_files<cr>", { desc = "快速打开文件" })
keymap("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "命令面板" })
keymap("i", "<C-S-p>", "<Esc><cmd>Telescope commands<cr>", { desc = "命令面板" })
keymap("n", "<C-o>", "<cmd>Telescope oldfiles<cr>", { desc = "最近打开" })

-- Terminal, close to VSCode's integrated terminal habit.
keymap({ "n", "i" }, "<C-j>", toggle_terminal, { desc = "打开/隐藏终端" })
keymap("t", "<C-j>", toggle_terminal, { desc = "隐藏终端" })
keymap({ "n", "i" }, "<C-`>", toggle_terminal, { desc = "打开/隐藏终端" })
keymap("t", "<C-`>", toggle_terminal, { desc = "隐藏终端" })
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "退出终端输入模式" })
keymap("t", "<C-v>", send_clipboard_to_terminal, { desc = "粘贴到终端" })

-- Selection with Shift + arrows/Home/End, when the terminal can send those keys.
keymap("n", "<S-Left>", "v<Left>", { desc = "向左选择" })
keymap("n", "<S-Right>", "v<Right>", { desc = "向右选择" })
keymap("n", "<S-Up>", "v<Up>", { desc = "向上选择" })
keymap("n", "<S-Down>", "v<Down>", { desc = "向下选择" })
keymap("i", "<S-Left>", "<Esc>v<Left>", { desc = "向左选择" })
keymap("i", "<S-Right>", "<Esc>v<Right>", { desc = "向右选择" })
keymap("i", "<S-Up>", "<Esc>v<Up>", { desc = "向上选择" })
keymap("i", "<S-Down>", "<Esc>v<Down>", { desc = "向下选择" })
keymap("n", "<S-Home>", "v^", { desc = "选择到行首" })
keymap("n", "<S-End>", "v$", { desc = "选择到行尾" })
keymap("i", "<S-Home>", "<Esc>v^", { desc = "选择到行首" })
keymap("i", "<S-End>", "<Esc>v$", { desc = "选择到行尾" })

-- Navigation keys people expect from regular editors.
keymap("n", "<Home>", "^", { desc = "行首" })
keymap("i", "<Home>", "<C-o>^", { desc = "行首" })
keymap("n", "<End>", "$", { desc = "行尾" })
keymap("i", "<End>", "<C-o>$", { desc = "行尾" })
keymap("n", "<C-Home>", "gg", { desc = "文件开头" })
keymap("i", "<C-Home>", "<C-o>gg", { desc = "文件开头" })
keymap("n", "<C-End>", "G", { desc = "文件结尾" })
keymap("i", "<C-End>", "<C-o>G", { desc = "文件结尾" })
keymap("n", "<PageUp>", "<C-b>", { desc = "向上翻页" })
keymap("n", "<PageDown>", "<C-f>", { desc = "向下翻页" })
keymap("i", "<PageUp>", "<C-o><C-b>", { desc = "向上翻页" })
keymap("i", "<PageDown>", "<C-o><C-f>", { desc = "向下翻页" })

-- Common editor actions.
keymap("n", "<C-d>", "yyp", { desc = "复制当前行到下一行" })
keymap("i", "<C-d>", "<Esc>yypi", { desc = "复制当前行到下一行" })
keymap("n", "<C-l>", "V", { desc = "选择当前行" })
keymap("i", "<C-l>", "<Esc>V", { desc = "选择当前行" })
keymap("n", "<C-/>", "gcc", { desc = "切换注释", remap = true })
keymap("v", "<C-/>", "gc", { desc = "切换注释", remap = true })
keymap("i", "<C-/>", "<Esc>gcca", { desc = "切换注释", remap = true })
keymap("n", "<C-_>", "gcc", { desc = "切换注释", remap = true })
keymap("v", "<C-_>", "gc", { desc = "切换注释", remap = true })
keymap("i", "<C-_>", "<Esc>gcca", { desc = "切换注释", remap = true })
keymap("v", "<Tab>", ">gv", { desc = "增加缩进" })
keymap("v", "<S-Tab>", "<gv", { desc = "减少缩进" })

-- LSP / IDE-like keys
keymap({ "n", "i" }, "<F2>", function()
  vim.lsp.buf.rename()
end, { desc = "重命名" })
keymap({ "n", "i" }, "<F12>", function()
  vim.lsp.buf.definition()
end, { desc = "跳转到定义" })
keymap("n", "<F3>", "n", { desc = "查找下一个" })
keymap("n", "<S-F3>", "N", { desc = "查找上一个" })
