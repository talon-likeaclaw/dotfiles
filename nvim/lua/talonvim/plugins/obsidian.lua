return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',

  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
  },

  -- Custom key commands.
  keys = {
    { '<leader>ob', ':ObsidianBacklinks<cr>', desc = 'backlinks' },
    { '<leader>ol', ':ObsidianLink<cr>', desc = 'link selection' },
    { '<leader>of', ':ObsidianFollowLink<cr>', desc = 'follow link' },
    { '<leader>on', ':ObsidianNew<cr>', desc = 'new' },
    { '<leader>os', ':ObsidianSearch<cr>', desc = 'search' },
    { '<leader>oo', ':ObsidianQuickSwitch<cr>', desc = 'open quickswitch' },
    { '<leader>oO', ':ObsidianOpen<cr>', desc = 'open in app' },
    {
      '<leader>ok',
      ":execute 'silent !mv ' . shellescape(expand('%:p')) . '~/Documents/obsidian/talons-brain/' | :bdelete! | :echo 'File moved successfully'<CR>",
      desc = 'keep file',
    },
    { '<leader>odd', ":!rm '%:p'<cr>:bd<cr>", desc = 'delete' },
  },

  -- Custom options begin here:
  opts = {
    workspaces = {
      {
        name = 'talons-brain',
        path = '~/Documents/obsidian/talons-brain',
      },
    },
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    note_id_func = function(title)
      return title
    end,

    note_frontmatter_func = function(note)
      local function format_time(timestamp)
        return os.date('%A, %B %d, %Y, %I:%M:%S %p', timestamp)
      end

      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      -- Initialize the frontmatter with the specified fields.
      local out = {
        aliases = note.aliases,
        tags = note.tags or {},
        hubs = {},
        urls = note.urls or {},
      }

      -- Ensure metadata fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      -- Add date created and date modified fields.
      if note.metadata and note.metadata['date created'] then
        out['date created'] = note.metadata['date created']
      else
        if note.created_time then
          out['date created'] = format_time(note.created_time)
        else
          out['date created'] = format_time(os.time()) -- Use current time if created_time is not available
        end
      end

      -- Add date modified field.
      if note.modified_time then
        out['date modified'] = format_time(note.modified_time)
      else
        out['date modified'] = format_time(os.time()) -- Use current time if modified_time is not available
      end

      return out
    end,

    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',

    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
