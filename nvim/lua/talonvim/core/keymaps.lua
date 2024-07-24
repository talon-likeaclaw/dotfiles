vim.g.mapleader = ' '
local map = vim.keymap.set
local api = vim.api.nvim_set_keymap
local conform = require 'talonvim.plugins.lsp.formatting'

-- Code
map('n', '<leader>cn', '<cmd>set nu!<CR>', { desc = 'toggle line number' })
map('n', '<leader>cr', '<cmd>set rnu!<CR>', { desc = 'toggle relative number' })

-- Editing
map('n', '<leader>q', ':q<cr>', { desc = 'quit buffer', noremap = true, silent = true })
map('n', '<leader>Q', ':qa!<cr>', { desc = 'quit talonvim', noremap = true, silent = true })
map('n', '<leader>C', ':Telescope find_files cwd=~/.config/nvim<CR>', { desc = 'configuration', noremap = true, silent = true })
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'save file' })
map({ 'n', 'v' }, '<leader>cf', function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = 'format' })

-- Windows
map('n', '<leader>w-', '<cmd>sp<CR>', { desc = 'split across', remap = true })
map('n', '<leader>w|', '<cmd>vs<CR>', { desc = 'split down', remap = true })
map('n', '<leader>wt', '<cmd>vs|terminal<CR>i', { desc = 'terminal', remap = true })
map('t', '<C-x>', '<C-\\><C-n><cmd>q<CR>', { noremap = true, silent = true })
map('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Go to Left Window' })

-- Tools
map('n', '<leader>tl', ':Lazy<CR>', { desc = 'lazy', noremap = true, silent = true })
map('n', '<leader>tm', ':Mason<CR>', { desc = 'mason', noremap = true, silent = true })
map('n', '<leader>to', ':Gen<CR>', { desc = 'ollama', noremap = true, silent = true })

-- =======================
-- Plugin Specific Keymaps
-- =======================

-- Bufferline
api('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
api('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
api('n', '<leader>bh', ':BufferLineCloseLeft<CR>', { desc = 'close left', noremap = true, silent = true })
api('n', '<leader>bl', ':BufferLineCloseRight<CR>', { desc = 'close right', noremap = true, silent = true })
api('n', '<leader>bo', ':BufferLineCloseOthers<CR>', { desc = 'close others', noremap = true, silent = true })
map('n', '<leader>bb', '<cmd>enew<cr>', { desc = 'create new file' })

-- Oil
map('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })

-- Telescope
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'find recent files' })
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { desc = 'find with grep' })
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'find files' })
map('n', '<leader><leader>', '<cmd>Telescope buffers<CR>', { desc = 'search existing buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'help page' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'find oldfiles' })
map('n', '<leader>fc', '<cmd>Telescope git_commits<CR>', { desc = 'git commits' })
map('n', '<leader>fg', '<cmd>Telescope git_status<CR>', { desc = 'git status' })
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = 'find all' })

-- Tmux
map('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })
