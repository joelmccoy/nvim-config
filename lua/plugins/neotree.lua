return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>t", ":Neotree filesystem toggle<CR>")
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Hide other dotfiles
        },
      },
    })
    vim.keymap.set("n", "<leader>t", ":Neotree filesystem toggle<CR>")
  end,
}
