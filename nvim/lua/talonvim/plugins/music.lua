return {
  'p5quared/apple-music.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = true,
  keys = {
    {
      '<leader>m ',
      function()
        require('apple-music').toggle_play()
      end,
      desc = 'toggle playback',
    },
    {
      '<leader>ms',
      function()
        require('apple-music').toggle_shuffle()
      end,
      desc = 'toggle shuffle',
    },
    {
      '<leader>mp',
      function()
        require('apple-music').select_playlist_telescope()
      end,
      desc = 'find playlist',
    },
    {
      '<leader>ma',
      function()
        require('apple-music').select_album_telescope()
      end,
      desc = 'find album',
    },
    {
      '<leader>mx',
      function()
        require('apple-music').cleanup_all()
      end,
      desc = 'clean up',
    },
  },
}
