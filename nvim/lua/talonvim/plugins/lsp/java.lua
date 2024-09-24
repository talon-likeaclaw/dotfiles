return {
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
    },
    {
      'eatgrass/maven.nvim',
      cmd = { 'Maven', 'MavenExec' },
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        require('maven').setup {
          executable = '/opt/homebrew/bin/mvn',
          cwd = nil,
          settings = nil,
          commands = {
            { cmd = { 'clean', 'compile' }, desc = 'clean then compile' },
          },
        }
      end,
    },
  },
}
