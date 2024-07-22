vim.g.mapleader = ' '
local map = vim.keymap.set
local api = vim.api.nvim_set_keymap

-- Editing
map('n', '<leader>q', ':q<cr>', { desc = '[q]uit buffer', noremap = true, silent = true })
map('n', '<leader>Q', ':qa!<cr>', { desc = '[q]uit talonvim', noremap = true, silent = true })
map('n', '<leader>C', ':Telescope find_files cwd=~/.config/nvim<CR>', { desc = '[c]onfiguration', noremap = true, silent = true })
map('n', '<C-s>', ':w<cr>', { noremap = true, silent = true })

-- Tools
map('n', '<leader>tl', ':Lazy<CR>', { desc = '[l]azy', noremap = true, silent = true })
map('n', '<leader>ts', ':Lazy sync<CR>', { desc = 'lazy [s]ync', noremap = true, silent = true })
map('n', '<leader>tu', ':Lazy update<CR>', { desc = 'lazy [u]pdate', noremap = true, silent = true })
map('n', '<leader>tc', ':Lazy clean<CR>', { desc = 'lazy [c]lean', noremap = true, silent = true })
map('n', '<leader>tm', ':Mason<CR>', { desc = '[m]ason', noremap = true, silent = true })
map('n', '<leader>to', ':Gen<CR>', { desc = '[o]llama', noremap = true, silent = true })

-- =======================
-- Plugin Specific Keymaps
-- =======================

-- Bufferline
api('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
api('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
api('n', '<leader>bh', ':BufferLineCloseLeft<CR>', { desc = 'close left', noremap = true, silent = true })
api('n', '<leader>bl', ':BufferLineCloseRight<CR>', { desc = 'close right', noremap = true, silent = true })
api('n', '<leader>bo', ':BufferLineCloseOthers<CR>', { desc = 'close others', noremap = true, silent = true })

-- Oil
map('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })

-- Telescope
map('n', '<leader>fr', ':Telescope oldfiles<CR>', { desc = '[f]ind [r]ecent files' })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = '[f]ind with [g]rep' })
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
map('n', '<leader><leader>', ':Telescope buffers<Cr>', { desc = 'search existing buffers' })

-- Tmux
map('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })
