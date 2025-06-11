-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
return {
  -- 覆盖默认 <C-a> 行为
  n = {
    -- 全选 (Ctrl+a)
    ["<C-a>"] = { "ggVG", "Select all" },
    
    -- 复制 (Ctrl+c)
    ["<C-c>"] = {
      function()
        if vim.fn.visualmode() == "V" then
          -- 如果是行选择模式，复制整行
          vim.cmd('normal! "+y')
        else
          -- 复制到系统剪贴板
          vim.cmd('normal! "+y')
        end
      end,
      "Copy to clipboard",
      mode = { "n", "v" },  -- 同时支持 Normal 和 Visual 模式
    },
    
    -- 粘贴 (Ctrl+v)
    ["<C-v>"] = { '"+p', "Paste from clipboard" },
    
    -- 剪切 (Ctrl+x)
    ["<C-x>"] = {
      function()
        if vim.fn.visualmode() ~= "" then
          -- 如果是选择模式，剪切选中内容
          vim.cmd('normal! "+x')
        else
          -- 剪切整行
          vim.cmd('normal! "+dd')
        end
      end,
      "Cut to clipboard",
      mode = { "n", "v" },  -- 同时支持 Normal 和 Visual 模式
    },
  },
  
  -- 在 Visual 模式也启用相同的快捷键
  v = {
    ["<C-c>"] = { '"+y', "Copy selection" },
    ["<C-x>"] = { '"+x', "Cut selection" },
  }
}