return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- Python
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.formatting.isort,
			},
		})
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, {})
	end,
}
