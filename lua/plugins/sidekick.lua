return {
	"folke/sidekick.nvim",
	opts = {
		nes = { enabled = false },
		copilot = { status = { enabled = false } },
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
				create = "window", -- use tmux windows instead of nvim terminals
			},
		},
	},
	config = function(_, opts)
		require("sidekick").setup(opts)
		require("sidekick.config").cli.tools.copilot = nil
	end,
	init = function()
		-- After any sidekick send, auto-focus the tmux pane
		local State = require("sidekick.cli.state")
		local orig_send = require("sidekick.cli").send
		require("sidekick.cli").send = function(opts)
			orig_send(opts)
			vim.defer_fn(function()
				State.with(function(state)
					local pane_id = state.session and state.session.tmux_pane_id
					if pane_id then
						vim.fn.system({ "tmux", "select-window", "-t", pane_id })
						vim.fn.system({ "tmux", "select-pane", "-t", pane_id })
					end
				end, { attach = false, focus = false, show = false })
			end, 100)
		end
	end,
	keys = {
		{
			"<c-.>",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle",
			mode = { "n", "t", "i", "x" },
		},
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
				local State = require("sidekick.cli.state")
				vim.defer_fn(function()
					State.with(function(state)
						local pane_id = state.session and state.session.tmux_pane_id
						if pane_id then
							vim.fn.system({ "tmux", "select-window", "-t", pane_id })
							vim.fn.system({ "tmux", "select-pane", "-t", pane_id })
						end
					end, { attach = false, focus = false, show = false })
				end, 100)
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>as",
			function()
				require("sidekick.cli").select()
			end,
			-- Or to select only installed tools:
			-- require("sidekick.cli").select({ filter = { installed = true } })
			desc = "Select CLI",
		},
		{
			"<leader>ad",
			function()
				require("sidekick.cli").close()
			end,
			desc = "Detach a CLI Session",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		-- Example of a keybinding to open Claude directly
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "claude", focus = true })
			end,
			desc = "Sidekick Toggle Claude",
		},
	},
}
