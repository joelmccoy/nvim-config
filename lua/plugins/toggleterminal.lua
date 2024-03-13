return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({ open_mapping = [[<leader>j]] })
	end,
}
