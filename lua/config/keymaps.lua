-- VSCode-like shortcuts for users who mainly live outside Vim.

local keymap = vim.keymap.set

local terminal_buf = nil
local terminal_win = nil

local function copy_visual_to_ipad()
  local ok, osc52 = pcall(require, "osc52")
  if ok then
    osc52.copy_visual()
  else
    vim.cmd('normal! "+y')
  end
end

local function copy_line_to_ipad()
  vim.cmd('normal! "+yy')
  local ok, osc52 = pcall(require, "osc52")
  if ok then
    osc52.copy_register("+")
  end
end

local function cut_line_to_ipad()
  vim.cmd('normal! "+dd')
  local ok, osc52 = pcall(require, "osc52")
  if ok then
    osc52.copy_register("+")
  end
end

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

-- Save / quit
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "保存文件" })
keymap({ "n", "i" }, "<C-q>", "<cmd>bd<cr>", { desc = "关闭当前文件" })
keymap("n", "<C-S-q>", "<cmd>qa<cr>", { desc = "退出 Neovim" })

-- Copy / cut / paste / select all
keymap("n", "<C-c>", copy_line_to_ipad, { desc = "复制当前行到 iPad 剪贴板" })
keymap("v", "<C-c>", copy_visual_to_ipad, { desc = "复制到 iPad 剪贴板" })
keymap("v", "<C-x>", '"+d', { desc = "剪切到本地剪贴板" })
keymap("n", "<C-v>", '"+p', { desc = "粘贴" })
keymap("v", "<C-v>", '"+P', { desc = "替换选择并粘贴" })
-- In insert/terminal mode an iPad terminal sends its native paste as input.
-- Do not intercept <C-v>, otherwise Neovim asks OSC 52 for a clipboard value
-- that terminal clients cannot provide.
keymap("c", "<C-v>", "<C-r>+", { desc = "粘贴已复制内容" })
keymap("n", "<C-a>", "ggVG", { desc = "全选" })
keymap("i", "<C-a>", "<Esc>ggVG", { desc = "全选" })

-- Two single-key shortcuts that are practical on an iPad keyboard.  They are
-- deliberately normal-mode mappings so typing text remains unaffected.
keymap("n", "v", '"+p', { desc = "粘贴系统剪贴板" })
keymap("v", "v", '"+P', { desc = "替换选择并粘贴系统剪贴板" })
local function toggle_file_tree()
  -- LazyVim 目前默认使用 Snacks Explorer；older installs may still use
  -- Neo-tree, so keep the shortcut compatible with either explorer.
  if vim.fn.exists(":Neotree") == 2 then
    vim.cmd("Neotree toggle")
    return
  end
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.explorer then
    snacks.explorer()
  else
    require("telescope.builtin").find_files()
  end
end
keymap("n", "b", toggle_file_tree, { desc = "打开/隐藏文件树" })

-- iPad keyboards use Cmd.  Some SSH terminals expose Cmd as Meta, so bind
-- both forms.  Cmd-V is intentionally left alone in insert mode: the
-- terminal app must inject its native paste text there.
local function map_cmd(key, modes, rhs, desc)
  for _, mode in ipairs(modes) do
    keymap(mode, "<D-" .. key .. ">", rhs, { desc = desc })
    keymap(mode, "<M-" .. key .. ">", rhs, { desc = desc .. "（Meta兼容）" })
  end
end

map_cmd("c", { "n" }, copy_line_to_ipad, "复制当前行到 iPad 剪贴板")
map_cmd("c", { "v" }, copy_visual_to_ipad, "复制到 iPad 剪贴板")
map_cmd("x", { "n" }, cut_line_to_ipad, "剪切当前行到 iPad 剪贴板")
map_cmd("x", { "v" }, '"+d', "剪切到 iPad 剪贴板")
map_cmd("v", { "n" }, '"+p', "粘贴")
map_cmd("v", { "v" }, '"+P', "替换选择并粘贴")
map_cmd("s", { "n", "i", "v" }, "<cmd>w<cr>", "保存文件")
map_cmd("a", { "n", "i" }, "ggVG", "全选")
map_cmd("z", { "n" }, "u", "撤销")
map_cmd("z", { "i" }, "<C-o>u", "撤销")
map_cmd("y", { "n" }, "<C-r>", "重做")
map_cmd("w", { "n", "i" }, "<cmd>bd<cr>", "关闭当前文件")
map_cmd("n", { "n", "i" }, "<cmd>enew<cr>", "新建文件")
map_cmd("f", { "n" }, "/", "查找")
map_cmd("p", { "n" }, "<cmd>Telescope find_files<cr>", "快速打开文件")
map_cmd("o", { "n" }, "<cmd>Telescope oldfiles<cr>", "最近打开")
map_cmd("b", { "n" }, toggle_file_tree, "打开文件树")
map_cmd("j", { "n", "i" }, toggle_terminal, "打开/隐藏终端")

-- Undo / redo
keymap("n", "<C-z>", "u", { desc = "撤销" })
keymap("i", "<C-z>", "<C-o>u", { desc = "撤销" })
keymap("n", "<C-y>", "<C-r>", { desc = "重做" })
keymap("i", "<C-y>", "<C-o><C-r>", { desc = "重做" })
keymap("n", "<C-S-z>", "<C-r>", { desc = "重做" })
keymap("i", "<C-S-z>", "<C-o><C-r>", { desc = "重做" })

-- Buffer actions commonly used in VS Code.  Single purpose mappings avoid
-- relying on function keys that are often swallowed by iPad terminals.
keymap({ "n", "i" }, "<C-w>", "<cmd>bd<cr>", { desc = "关闭当前文件" })
keymap({ "n", "i" }, "<C-n>", "<cmd>enew<cr>", { desc = "新建文件" })

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
-- Leave <C-v> available for the iPad terminal's native paste gesture.

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
