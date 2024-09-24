return {
  'numToStr/FTerm.nvim',
  config = function()
    require('FTerm').setup {
      -- Add any configuration options here
    }
  end,
  keys = {
    vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>'),
    vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>'),
  },
}
