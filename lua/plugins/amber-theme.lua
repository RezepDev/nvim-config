return {
  {
    "jackplus-xyz/binary.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark", -- Options: "system" | "light" | "dark"
      colors = {
        fg = "#000000",
        bg = "#FFB000",
      },
    },
    config = function(_, opts)
      -- Apply configuration options
      require("binary").setup(opts)
      -- Load the colorscheme
      vim.cmd([[colorscheme binary]])
    end,
  }
}
