return {
  {
    'David-Kunz/gen.nvim',
    opts = {
      model = 'deepseek-coder-v2',
      host = '192.168.0.243',
      port = '11434',
      quit_map = 'q',
      retry_map = '<c-r>',
      init = function(options)
        pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
      end,
      command = function(options)
        local body = { model = options.model, stream = true }
        return 'curl --silent --no-buffer -X POST http://' .. options.host .. ':' .. options.port .. '/api/chat -d $body'
      end,
      display_mode = 'splits',
      show_prompt = true,
      show_model = true,
      no_auto_close = true,
      debug = false,
    },
  },
}
