return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>b', group = '[b]ufferline' },
      { '<leader>c', group = '[c]ode' },
      { '<leader>d', group = '[d]ocument' },
      { '<leader>r', group = '[r]ename' },
      { '<leader>f', group = '[f]ind' },
      { '<leader>o', group = '[o]bsidian' },
      { '<leader>t', group = '[t]ools' },
    }
  end,
}
