return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = { config = { folds = true, icon_preset = 'varied' } }, -- Adds pretty icons to your documents
        ['core.keybinds'] = {},
        ['core.journal'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              Neorg = '~/Documents/Neorg/',
            },
            default_workspace = 'Neorg',
          },
        },
      },
    }
  end,
}
