return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- 文字を入力するモード（インサートモード）になったら読み込む
  config = function()
    require("nvim-autopairs").setup({})

    -- すでに入っている自動補完（nvim-cmp）と連携させる設定
    -- これにより、補完候補で関数を選んでEnterを押したとき、自動で () が付きます
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}