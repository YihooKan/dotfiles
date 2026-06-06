return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" }, -- ⏳ 在读取文件、保存文件、退出输入模式时自动触发检查
	config = function()
		local lint = require("lint")

		-- 1. 告诉插件：什么文件类型用什么 Linter
		lint.linters_by_ft = {
			markdown = { "markdownlint" }, -- ✨ 让 markdownlint 守护你的 .md 文件
			yaml = { "yamllint" },
		}

		-- 2. 🎯 创建自动化流水线：只要满足上面的 event 条件，就在后台静默检查
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			pattern = "*",
			callback = function()
				-- try_lint 会完全在后台异步运行，打字绝对零卡顿
				lint.try_lint()
			end,
		})
	end,
}
