vim.g.mapleader = ' '
local map = vim.keymap.set
local api = vim.api.nvim_set_keymap
local conform = require 'talonvim.plugins.lsp.formatting'

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

-- Tools
map('n', '<leader>tl', ':Lazy<CR>', { desc = 'lazy', noremap = true, silent = true })
map('n', '<leader>ts', ':Lazy sync<CR>', { desc = 'lazy sync', noremap = true, silent = true })
map('n', '<leader>tu', ':Lazy update<CR>', { desc = 'lazy update', noremap = true, silent = true })
map('n', '<leader>tc', ':Lazy clean<CR>', { desc = 'lazy clean', noremap = true, silent = true })
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
map('n', '<leader>bn', '<cmd>enew<cr>', { desc = 'new file' })

-- Oil
map('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })

-- Telescope
map('n', '<leader>fr', ':Telescope oldfiles<CR>', { desc = 'find recent files' })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'find with grep' })
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'find files' })
map('n', '<leader><leader>', ':Telescope buffers<Cr>', { desc = 'search existing buffers' })

-- Tmux
map('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })
