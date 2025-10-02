return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pyright",
					-- "templ",
					-- "tailwindcss",
					-- "jsonls",
					"ts_ls",
					"terraformls",
					"tflint",
					"typos_lsp",
					-- "yamlls",
					"helm_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "<c-K>", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			-- Configure LSP servers using vim.lsp.config
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("templ", {
				cmd = { "templ", "lsp" },
				filetypes = { "templ" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("tailwindcss", {
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("terraformls", {
				cmd = { "terraform-ls", "serve" },
				filetypes = { "terraform", "terraform-vars" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("tflint", {
				cmd = { "tflint", "--langserver" },
				filetypes = { "terraform" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("typos_lsp", {
				cmd = { "typos-lsp" },
				filetypes = { "*" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.config("helm_ls", {
				cmd = { "helm_ls", "serve" },
				filetypes = { "helm" },
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Enable all configured LSP servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("gopls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("templ")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("tflint")
			vim.lsp.enable("typos_lsp")
			vim.lsp.enable("helm_ls")

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- Setup format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = buffer,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}
