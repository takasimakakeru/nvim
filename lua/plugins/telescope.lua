return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    -- 「スペース + ff」でファイル名検索
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    -- 「スペース + fg」でファイル内文字列検索（Grep）
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
  end,
}