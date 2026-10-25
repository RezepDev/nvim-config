return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require('telescope.builtin')

    -- Keymaps
    -- 1. Search for text string inside ALL files in the working directory
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Fuzzy Find Text (Grep)" })
    
    -- 2. Search for files by their NAME in the working directory
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy Find File Names" })
    
    -- 3. Search through your currently open tabs/buffers
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Fuzzy Find Open Buffers" })
  end
}

