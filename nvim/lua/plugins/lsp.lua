return {
  "neovim/nvim-lspconfig",
  -- 延迟加载：只在真正打开文件时才初始化 Mason，避免启动时产生不必要的 I/O
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/SchemaStore.nvim",
  },
  config = function()
    -- 1. 初始化Mason(管理后台LSP下载)
    -- 可以使用:Mason来调用Mason管理UI
    require("mason").setup()

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "prettier",
        "markdownlint",
        "yamllint",
      },
    })
    -- 2. 确保自动安装了需要的lsp
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", -- lua的lsp
        "marksman",
        "yamlls", -- YAML
      },
    })

    -- 3. 启动并且配置lspconfig
    -- 直接使用 Neovim 0.11+ 内置的 vim.lsp.config 引擎来启用配置
    -- local lspconfig = require("lspconfig")
    -- lspconfig.lua_ls.setup({})
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "conform" },
          },
        },
      },
    })

    vim.lsp.enable("lua_ls")

    vim.lsp.config("marksman", {})
    vim.lsp.enable("marksman")

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          -- 全自动Schema校验
          schemas = require("schemastore").yaml.schemas and {} or {
            -- 如果需要手动制定某一个特定的文件的schema在里面可以定义
          },
          validate = true, -- 开启语法格式合法性检查
        },
      },
    })
    vim.lsp.enable("yamlls")
  end,
}
