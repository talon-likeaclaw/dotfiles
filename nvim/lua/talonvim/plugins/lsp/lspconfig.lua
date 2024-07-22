return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local lspui = require 'lspconfig.ui.windows'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    --LspInfo Borders
    lspui.default_options.border = 'double'

    -- java
    lspconfig.jdtls.setup {
      capabilities = capabilities,
      filetypes = { 'java' },
    }

    -- html
    lspconfig.html.setup {
      capabilities = capabilities,
    }

    -- configure emmet language server
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = { 'html', 'css' },
    }

    -- Lua LS
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    -- CSS LS
    lspconfig.cssls.setup {
      capabilities = capabilities,
    }
  end,
}