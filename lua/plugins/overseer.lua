return {
  {
  'stevearc/overseer.nvim',
  ---@module 'overseer'
  ---@type overseer.SetupOpts
  opts = {
    dap = true, -- Patches nvim-dap to support preLaunchTask and postDebugTask
            output = {
                use_terminal = true,
            },

            task_list = {
                direction = "bottom",
                min_height = 8,
                max_height = 20,
            },

    vim.api.nvim_create_autocmd("FileType", {
  pattern = { "OverseerList", "OverseerOutput", "output" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})
  },
  }
}
