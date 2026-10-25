return {
  { "s1n7ax/nvim-window-picker", version = "2.*", config = function() require('window-picker').setup() end },

  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Requires a Nerd Font installed on your terminal
    "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker"
      },

  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            -- This explicitly commands Neo-tree to close the sidebar instantly
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
	    window = {
        auto_expand_width = false,
        mappings = {
          ["<cr>"] = "open_with_window_picker", 
        }
      },
       close_if_hidden = true,
      filesystem = {
        cwd_target = {
          sidebar = "tab", -- Keeps the tree synced to your tab's working directory
          current = "window"
        },
        filtered_items = {
          visible = true, -- Shows hidden files (like .gitignore) but keeps them dimmed
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    })
  end
  },
}

