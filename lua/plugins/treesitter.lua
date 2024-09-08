return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { "terraform" },
    })
    -- Autocommand to treat .tofu files as terraform files
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.tofu",
      command = "setfiletype terraform"
    })
  end,
}
