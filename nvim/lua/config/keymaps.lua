-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- マウスの設定をトグルする関数
local function toggle_mouse()
  if vim.o.mouse == "a" then
    vim.o.mouse = ""
    print("Mouse disabled")
  else
    vim.o.mouse = "a"
    print("Mouse enabled")
  end
end

-- <leader>m にマッピング
vim.api.nvim_set_keymap("n", "<leader>m", "", {
  noremap = true,
  silent = true,
  callback = toggle_mouse,
  desc = "Toggle Mouse Mode",
})
