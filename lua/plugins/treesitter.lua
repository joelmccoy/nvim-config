return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    local ensure_installed = {
      "bash", "c", "cpp", "css", "go", "html", "javascript", "json",
      "lua", "markdown", "markdown_inline", "python", "query", "regex",
      "rust", "terraform", "tsx", "typescript", "vim", "vimdoc", "yaml",
    }
    require("nvim-treesitter").install(ensure_installed)

    -- Shims for telescope compatibility (uses removed master API)
    local ok_p, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok_p and not parsers.ft_to_lang then
      parsers.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft)
      end
      parsers.get_parser = function(bufnr, lang)
        return vim.treesitter.get_parser(bufnr, lang)
      end
    end
    package.loaded["nvim-treesitter.configs"] = {
      is_enabled = function() return false end,
      get_module = function() return {} end,
    }

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.start, args.buf, lang) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.tofu",
      command = "setfiletype terraform",
    })
  end,
}
