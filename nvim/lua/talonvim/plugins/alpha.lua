return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Header
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

    -- Buttons
    local buttons = {
      type = 'group',
      val = {
        { type = 'text', val = 'quick links', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button('e', '  new file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('t', '  find text', ':Telescope live_grep<CR>'),
        dashboard.button('c', '  configuration', ':Telescope find_files cwd=~/.config/nvim<CR>'),
        dashboard.button('u', '  update plugins', ':Lazy sync<CR>'),
        dashboard.button('q', '  quit', ':qa<CR>'),
      },
      opts = {
        spacing = 1,
      },
    }

    -- Footer
    local footer = {
      type = 'text',
      val = 'happy coding with talonvim!',
      opts = {
        position = 'center',
        hl = 'Number',
      },
    }

    -- Configuration
    local config = {
      layout = {
        { type = 'padding', val = 5 },
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
