return {
  "folke/flash.nvim",
  event = "VeryLazy", -- 可选：推荐开启懒加载，提升启动速度
  config = function()
    require("flash").setup({
      vscode = true, -- 完美适配 VS Code
      modes = {
        char = { enable = false }, -- 保持原生的 f/F/t/T
      },
    })

    -- keymap
    vim.keymap.set("n", "s", function()
      require("flash").jump()
    end, { desc = "Flash Jump" })
  end,
}
