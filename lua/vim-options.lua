local tabs = "2"

vim.cmd("set expandtab")
vim.cmd("set tabstop=" .. tabs)
vim.cmd("set softtabstop=" .. tabs)
vim.cmd("set shiftwidth=" .. tabs)
vim.cmd("set nu")
vim.cmd([[autocmd FileType terraform setlocal commentstring=#\ %s]])
vim.g.mapleader = " "

-- set remaps

-- Map Cmd+j to page down
vim.keymap.set('n', 'J', '<C-d>', { desc = "Page down" })

-- Map Cmd+k to page up
vim.keymap.set('n', 'K', '<C-u>', { desc = "Page up" })

-- moves text up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- add file types
vim.filetype.add({ extension = { templ = "templ" } })
vim.filetype.add({ extension = { tf = "terraform" } })

-- enable system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
