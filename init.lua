-- lazy.nvim の自動インストール（ここは前と同じです）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 基本設定
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- ⭕【ここがポイント】
-- 「"plugins"」とだけ指定すると、lua/plugins/ フォルダの中にある
-- すべての .lua ファイルを自動でスキャンして、プラグインとして読み込んでくれます！
require("lazy").setup("plugins")

-- HTMLの自作マクロ
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "xml", "javascriptreact", "typescriptreact", "vue" },
  callback = function()
    vim.keymap.set("i", ">", "><Esc>F<lyt>o</<C-r>\"><Esc>O", { buffer = true, silent = true })
  end,
})