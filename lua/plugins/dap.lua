return {
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",

    config = function()
      local dap = require("dap")

      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb"

      dap.adapters.codelldb = {
        type = "executable",
        command = mason_path .. "/extension/adapter/codelldb",
      }

      dap.configurations.cpp = {
        {
          name = "Launch C++",
          type = "codelldb",
          request = "launch",

          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/out/Debug/",
              "file"
            )
          end,

          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",

    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
