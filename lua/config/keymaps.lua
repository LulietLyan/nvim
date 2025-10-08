-- Windows 快捷键适配配置
-- 适用于 lazy.nvim

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 基础编辑快捷键
-- Ctrl+C 复制 (在可视模式下)
keymap("v", "<C-c>", '"+y', { desc = "复制到系统剪贴板" })

-- Ctrl+V 粘贴
keymap("n", "<C-v>", '"+p', { desc = "从系统剪贴板粘贴" })
keymap("i", "<C-v>", '<C-r>+', { desc = "从系统剪贴板粘贴" })
keymap("c", "<C-v>", '<C-r>+', { desc = "从系统剪贴板粘贴" })

-- Ctrl+A 全选
keymap("n", "<C-a>", "ggVG", { desc = "全选" })
keymap("i", "<C-a>", "<C-o>gg<C-o>VG", { desc = "全选" })

-- Ctrl+X 剪切 (在可视模式下)
keymap("v", "<C-x>", '"+d', { desc = "剪切到系统剪贴板" })

-- Ctrl+Z 撤销
keymap("n", "<C-z>", "u", { desc = "撤销" })
keymap("i", "<C-z>", "<C-o>u", { desc = "撤销" })

-- Ctrl+Y 重做
keymap("n", "<C-y>", "<C-r>", { desc = "重做" })
keymap("i", "<C-y>", "<C-o><C-r>", { desc = "重做" })

-- Ctrl+S 保存
keymap("n", "<C-s>", "<cmd>w<cr>", { desc = "保存文件" })
keymap("i", "<C-s>", "<C-o><cmd>w<cr>", { desc = "保存文件" })

-- Ctrl+O 打开文件
keymap("n", "<C-o>", "<cmd>Telescope find_files<cr>", { desc = "打开文件" })
keymap("i", "<C-o>", "<C-o><cmd>Telescope find_files<cr>", { desc = "打开文件" })

-- Ctrl+N 新建文件
keymap("n", "<C-n>", "<cmd>enew<cr>", { desc = "新建文件" })
keymap("i", "<C-n>", "<C-o><cmd>enew<cr>", { desc = "新建文件" })

-- Ctrl+W 关闭窗口/标签
keymap("n", "<C-w>", "<cmd>close<cr>", { desc = "关闭窗口" })
keymap("i", "<C-w>", "<C-o><cmd>close<cr>", { desc = "关闭窗口" })

-- Ctrl+Q 退出
keymap("n", "<C-q>", "<cmd>qa<cr>", { desc = "退出所有" })
keymap("i", "<C-q>", "<C-o><cmd>qa<cr>", { desc = "退出所有" })

-- Ctrl+F 查找
keymap("n", "<C-f>", "/", { desc = "查找" })
keymap("i", "<C-f>", "<C-o>/", { desc = "查找" })

-- Ctrl+H 查找替换
keymap("n", "<C-h>", ":%s/", { desc = "查找替换" })
keymap("i", "<C-h>", "<C-o>:%s/", { desc = "查找替换" })

-- Ctrl+G 跳转到行
keymap("n", "<C-g>", ":", { desc = "命令模式" })
keymap("i", "<C-g>", "<C-o>:", { desc = "命令模式" })

-- 导航快捷键
-- Home 键 - 行首
keymap("n", "<Home>", "^", { desc = "行首" })
keymap("i", "<Home>", "<C-o>^", { desc = "行首" })

-- End 键 - 行尾
keymap("n", "<End>", "$", { desc = "行尾" })
keymap("i", "<End>", "<C-o>$", { desc = "行尾" })

-- Ctrl+Home - 文件开头
keymap("n", "<C-Home>", "gg", { desc = "文件开头" })
keymap("i", "<C-Home>", "<C-o>gg", { desc = "文件开头" })

-- Ctrl+End - 文件结尾
keymap("n", "<C-End>", "G", { desc = "文件结尾" })
keymap("i", "<C-End>", "<C-o>G", { desc = "文件结尾" })

-- Page Up/Down
keymap("n", "<PageUp>", "<C-b>", { desc = "向上翻页" })
keymap("n", "<PageDown>", "<C-f>", { desc = "向下翻页" })
keymap("i", "<PageUp>", "<C-o><C-b>", { desc = "向上翻页" })
keymap("i", "<PageDown>", "<C-o><C-f>", { desc = "向下翻页" })

-- 删除快捷键
-- Delete 键 - 删除光标后字符
keymap("n", "<Del>", "x", { desc = "删除字符" })
keymap("i", "<Del>", "<Del>", { desc = "删除字符" })

-- Backspace 键 - 删除光标前字符
keymap("n", "<BS>", "X", { desc = "删除前字符" })
keymap("i", "<BS>", "<BS>", { desc = "删除前字符" })

-- Ctrl+Delete - 删除到行尾
keymap("n", "<C-Del>", "D", { desc = "删除到行尾" })
keymap("i", "<C-Del>", "<C-o>D", { desc = "删除到行尾" })

-- Ctrl+Backspace - 删除到行首
keymap("n", "<C-BS>", "d^", { desc = "删除到行首" })
keymap("i", "<C-BS>", "<C-o>d^", { desc = "删除到行首" })

-- 选择快捷键
-- Shift+方向键选择
keymap("n", "<S-Left>", "v<Left>", { desc = "向左选择" })
keymap("n", "<S-Right>", "v<Right>", { desc = "向右选择" })
keymap("n", "<S-Up>", "v<Up>", { desc = "向上选择" })
keymap("n", "<S-Down>", "v<Down>", { desc = "向下选择" })

keymap("i", "<S-Left>", "<C-o>v<Left>", { desc = "向左选择" })
keymap("i", "<S-Right>", "<C-o>v<Right>", { desc = "向右选择" })
keymap("i", "<S-Up>", "<C-o>v<Up>", { desc = "向上选择" })
keymap("i", "<S-Down>", "<C-o>v<Down>", { desc = "向下选择" })

-- Shift+Home/End 选择到行首/尾
keymap("n", "<S-Home>", "v^", { desc = "选择到行首" })
keymap("n", "<S-End>", "v$", { desc = "选择到行尾" })
keymap("i", "<S-Home>", "<C-o>v^", { desc = "选择到行首" })
keymap("i", "<S-End>", "<C-o>v$", { desc = "选择到行尾" })

-- 窗口管理快捷键
-- Ctrl+Tab 切换标签页
keymap("n", "<C-Tab>", "gt", { desc = "下一个标签页" })
keymap("i", "<C-Tab>", "<C-o>gt", { desc = "下一个标签页" })

-- Ctrl+Shift+Tab 上一个标签页
keymap("n", "<C-S-Tab>", "gT", { desc = "上一个标签页" })
keymap("i", "<C-S-Tab>", "<C-o>gT", { desc = "上一个标签页" })

-- Alt+Tab 切换窗口 (在终端中可能不工作)
keymap("n", "<A-Tab>", "<C-w>w", { desc = "切换窗口" })
keymap("i", "<A-Tab>", "<C-o><C-w>w", { desc = "切换窗口" })

-- 文本编辑快捷键
-- Ctrl+D 复制当前行
keymap("n", "<C-d>", "yy", { desc = "复制当前行" })
keymap("i", "<C-d>", "<C-o>yy", { desc = "复制当前行" })

-- Ctrl+Shift+D 删除当前行
keymap("n", "<C-S-d>", "dd", { desc = "删除当前行" })
keymap("i", "<C-S-d>", "<C-o>dd", { desc = "删除当前行" })

-- Ctrl+L 选择当前行
keymap("n", "<C-l>", "V", { desc = "选择当前行" })
keymap("i", "<C-l>", "<C-o>V", { desc = "选择当前行" })

-- 注释快捷键 (需要注释插件支持)
-- Ctrl+/ 切换注释
keymap("n", "<C-/>", "gcc", { desc = "切换注释" })
keymap("v", "<C-/>", "gc", { desc = "切换注释" })
keymap("i", "<C-/>", "<C-o>gcc", { desc = "切换注释" })

-- 缩进快捷键
-- Tab 缩进
keymap("n", "<Tab>", ">>", { desc = "增加缩进" })
keymap("v", "<Tab>", ">", { desc = "增加缩进" })
keymap("i", "<Tab>", "<Tab>", { desc = "插入Tab" })

-- Shift+Tab 减少缩进
keymap("n", "<S-Tab>", "<<", { desc = "减少缩进" })
keymap("v", "<S-Tab>", "<", { desc = "减少缩进" })
keymap("i", "<S-Tab>", "<C-d>", { desc = "减少缩进" })

-- 搜索和替换快捷键
-- F3 查找下一个
keymap("n", "<F3>", "n", { desc = "查找下一个" })
keymap("i", "<F3>", "<C-o>n", { desc = "查找下一个" })

-- Shift+F3 查找上一个
keymap("n", "<S-F3>", "N", { desc = "查找上一个" })
keymap("i", "<S-F3>", "<C-o>N", { desc = "查找上一个" })

-- Ctrl+R 替换
keymap("n", "<C-r>", ":%s/", { desc = "替换" })
keymap("i", "<C-r>", "<C-o>:%s/", { desc = "替换" })

-- 其他常用快捷键
-- F2 重命名
keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "重命名" })
keymap("i", "<F2>", "<C-o><cmd>lua vim.lsp.buf.rename()<cr>", { desc = "重命名" })

-- F5 刷新/重新加载
keymap("n", "<F5>", "<cmd>source %<cr>", { desc = "重新加载文件" })
keymap("i", "<F5>", "<C-o><cmd>source %<cr>", { desc = "重新加载文件" })

-- F12 跳转到定义
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "跳转到定义" })
keymap("i", "<F12>", "<C-o><cmd>lua vim.lsp.buf.definition()<cr>", { desc = "跳转到定义" })

-- Alt+F4 关闭 (在终端中可能不工作)
keymap("n", "<A-F4>", "<cmd>qa<cr>", { desc = "关闭所有" })
keymap("i", "<A-F4>", "<C-o><cmd>qa<cr>", { desc = "关闭所有" })

-- 禁用一些可能冲突的默认快捷键
-- 禁用 Ctrl+W 的默认行为，使用我们的自定义行为
vim.keymap.del("n", "<C-w>")
vim.keymap.del("i", "<C-w>")

-- 禁用 Ctrl+O 的默认行为
vim.keymap.del("n", "<C-o>")
vim.keymap.del("i", "<C-o>")

-- 设置终端模式下的快捷键
if vim.fn.has("win32") == 1 then
  -- Windows 特定的快捷键
  keymap("t", "<C-v>", "<C-\\><C-n>\"+pa", { desc = "粘贴到终端" })
  keymap("t", "<C-c>", "<C-\\><C-n>", { desc = "退出终端插入模式" })
end

-- 设置一些有用的组合键
-- Ctrl+Shift+P 命令面板
keymap("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "命令面板" })
keymap("i", "<C-S-p>", "<C-o><cmd>Telescope commands<cr>", { desc = "命令面板" })

-- Ctrl+Shift+F 全局搜索
keymap("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "全局搜索" })
keymap("i", "<C-S-f>", "<C-o><cmd>Telescope live_grep<cr>", { desc = "全局搜索" })

-- Ctrl+Shift+N 新建标签页
keymap("n", "<C-S-n>", "<cmd>tabnew<cr>", { desc = "新建标签页" })
keymap("i", "<C-S-n>", "<C-o><cmd>tabnew<cr>", { desc = "新建标签页" })
