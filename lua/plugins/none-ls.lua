return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettierd,
			},
		})

		vim.diagnostic.config({
			virtual_text = true, -- show message inline
			signs = true, -- signs in gutter
			underline = true, -- underline in code
			update_in_insert = false,
			severity_sort = true,
		})

		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, {})
	end,
}
