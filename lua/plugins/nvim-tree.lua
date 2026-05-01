return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- same icon set Neo-tree used
	},
	config = function()
		vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })

		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			filters = {
				dotfiles = false, -- show dotfiles (like hide_dotfiles = false in Neo-tree)
			},
			view = {
				width = 30,
			},
			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			renderer = {
				group_empty = true,
				highlight_modified = "all", -- highlight modified files in both folders and file list
				icons = {
					show = {
						modified = true, -- show the modified indicator
					},
					glyphs = {
						modified = "●", -- symbol to show for unsaved files (pick any you like)
					},
				},
			},
		})
	end,
}
