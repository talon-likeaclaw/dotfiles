return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",

  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
  },

  -- Custom key commands.
  keys = {
    { "<leader>ob", ":ObsidianBacklinks<cr>", desc = "obsidian [b]acklinks" },
    { "<leader>ol", ":ObsidianLink<cr>", desc = "obsidian [l]ink selection" },
    { "<leader>of", ":ObsidianFollowLink<cr>", desc = "obsidian [f]ollow link" },
    { "<leader>on", ":ObsidianNew<cr>", desc = "obsidian [n]ew" },
    { "<leader>os", ":ObsidianSearch<cr>", desc = "obsidian [s]earch" },
    { "<leader>oo", ":ObsidianQuickSwitch<cr>", desc = "obsidian [o]pen quickswitch" },
    { "<leader>oO", ":ObsidianOpen<cr>", desc = "obsidian [O]pen in app" },
  },

  -- Custom options begin here:
  opts = {
    workspaces = {
      {
        name = "talon-codes",
        path = "~/obsidian/talon-codes/",
      },
    },

    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    note_id_func = function(title)
      local date_prefix = os.date("%Y-%m-%d")
      if title ~= nil then
        local processed_title = title:gsub(" ", "-"):gsub("[^a-za-z0-9-]", ""):lower()
        return date_prefix .. "-" .. processed_title
      else
        -- fallback to timestamp
        return os.date("%y%m%d%h%m%s")
      end
    end,

    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      -- Initialize the frontmatter with the specified fields.
      local out = {
        date = os.date("%Y-%m-%d"),
        id = note.id,
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

      return out
    end,

    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    -- see below for full list of options 👇
  },
}
