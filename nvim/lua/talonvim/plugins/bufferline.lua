return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'tabs',
        show_if_only_one = false,
        -- other options...
      },
    }

    -- Hide bufferline on Alpha dashboard
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'alpha',
      callback = function()
        vim.opt.showtabline = 0
      end,
    })

    -- Show bufferline when leaving Alpha dashboard
    vim.api.nvim_create_autocmd('BufUnload', {
      buffer = 0,
      callback = function()
        vim.opt.showtabline = 2
      end,
    })
  end,
}
