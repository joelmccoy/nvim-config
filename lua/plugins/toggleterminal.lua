return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({ open_mapping = "<C-t>" })
	end,
}
