return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local theta = require 'alpha.themes.theta'
    local dashboard = require 'alpha.themes.dashboard'

    -- Customize the header with NVTALON
    local header = {
      type = 'text',
      val = {
        [[████████╗ █████╗ ██╗      ██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗]],
        [[╚══██╔══╝██╔══██╗██║     ██╔═══██╗████╗  ██║██║   ██║██║████╗ ████║]],
        [[   ██║   ███████║██║     ██║   ██║██╔██╗ ██║██║   ██║██║██╔████╔██║]],
        [[   ██║   ██╔══██║██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[   ██║   ██║  ██║███████╗╚██████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      opts = {
        position = 'center',
        hl = 'Type',
      },
    }

    -- Customize the buttons
    local buttons = {
      type = 'group',
      val = {
        { type = 'text', val = 'Quick links', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep<CR>'),
        dashboard.button('c', '  Configuration', ':Telescope find_files cwd=~/.config/nvtalon<CR>'),
        dashboard.button('u', '  Update plugins', ':Lazy sync<CR>'),
        dashboard.button('q', '  Quit', ':qa<CR>'),
      },
      opts = {
        spacing = 1,
      },
    }

    -- Customize the footer (optional)
    local footer = {
      type = 'text',
      val = 'Happy coding with TALONVIM!',
      opts = {
        position = 'center',
        hl = 'Number',
      },
    }

    -- Set up the config
    local config = {
      layout = {
        { type = 'padding', val = 2 },
        header,
        { type = 'padding', val = 2 },
        buttons,
        { type = 'padding', val = 2 },
        footer,
      },
      opts = {
        margin = 5,
      },
    }

    alpha.setup(config)
  end,
}
