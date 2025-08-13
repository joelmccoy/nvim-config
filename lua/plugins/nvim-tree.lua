return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- same icon set Neo-tree used
	},
	config = function()
		vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })

		require("nvim-tree").setup({
			filters = {
				dotfiles = false, -- show dotfiles (like hide_dotfiles = false in Neo-tree)
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
		})
	end,
}
