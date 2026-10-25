return {
  {
    "neovim/nvim-lspconfig",    -- This is just the LSP config for the nvim integrated LSP
    dependencies = {
      "hrsh7th/nvim-cmp",       -- The completion engine
      "hrsh7th/cmp-nvim-lsp",   -- The LSP bridge plugin
    },
    config = function()

      vim.filetype.add({
        extension = {
          vert = "glsl",
          frag = "glsl",
          comp = "glsl",
          geom = "glsl",
          tesc = "glsl",
          tese = "glsl",
        },
      })

      
      -- Grab the completion capabilities to pass to your language servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities()


      -- Enable clangd (it will handle filetype detection on its own)
      vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",       -- Crucial: indexes files in background for cross-file 'gd'
        "--clang-tidy",             -- Optional diagnostics
        "--header-insertion=never", -- Prevents messing up includes
      },
      root_markers = { "compile_commands.json", "compile_flags.txt", ".git" }, -- Locates your root
      capabilities = capabilities,
    })


      -- Enable glsl_analyzer (Alternative Vulkan/OpenGL Shader LSP)
      vim.lsp.config("glsl_analyzer", {
        cmd = { "glsl_analyzer" }, -- Swapped binary to glsl_analyzer
        filetypes = { "glsl" },    -- Keeps matching your vim.filetype.add settings
        root_markers = { ".git", "compile_commands.json", "CMakeLists.txt" },
        capabilities = capabilities,
        settings = {}
      })

      vim.lsp.enable("clangd")
      vim.lsp.enable("glsl_analyzer")

      -- Setup your autocompletion menu UI
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' }
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
      })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

    end
}
}

