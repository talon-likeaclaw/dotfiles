return {
  'max397574/better-escape.nvim',
  config = function()
    require('better_escape').setup {
      mappings = {
        i = {
          j = {
            -- These can all also be functions
            k = false,
            j = '<Esc>',
          },
        },
        c = {
          j = {
            k = false,
            j = '<Esc>',
          },
        },
        t = {
          j = {
            k = false,
          },
        },
        v = {
          j = {
            k = false,
          },
        },
        s = {
          j = {
            k = false,
          },
        },
      },
    }
  end,
}
