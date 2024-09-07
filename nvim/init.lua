if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font'

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 5
end
require 'talonvim.core'
