return {
  -- テーマ：tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  -- ステータスライン：lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  -- VSCode風のタブ：bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant", -- おしゃれな斜めのタブ切り切り替え
          always_show_bufferline = true,
        }
      })
      -- 「Tabキー」で右のタブへ移動
      vim.keymap.set("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next Tab" })
      -- 「Shift + Tabキー」で左のタブへ移動
      vim.keymap.set("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Prev Tab" })
    end,
  },

  -- 内蔵ターミナル：toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<a-t>]], -- 「Ctrl + t」でターミナルを出し入れ
        direction = "horizontal", -- 画面の下側に表示
      })
    end,
  },
}