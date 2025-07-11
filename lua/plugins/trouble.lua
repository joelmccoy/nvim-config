return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble", -- Lazy-loads on :Trouble command
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Toggle Trouble: Document Diagnostics",
			mode = "n",
		},
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Toggle Trouble: Workspace Diagnostics",
			mode = "n",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Toggle Trouble: Quickfix",
			mode = "n",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Toggle Trouble: Loclist",
			mode = "n",
		},
		{
			"gR",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP References (Trouble)",
			mode = "n",
		},
	},
	opts = {}, -- required by trouble.nvim now
}
