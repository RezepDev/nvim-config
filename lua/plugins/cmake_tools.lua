return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "stevearc/overseer.nvim",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },

    opts = {

      cmake_use_preset = false,

      cmake_generate_options = {
        "-G",
        "Ninja",
    },

      cmake_runner = {
        name = "overseer",
        opts = {},
      },

      cmake_executor = {
        name = "overseer",
        opts = {},
      },

      cmake_notifications = {
        enabled = true,
      },

        cmake_dap_configuration = {
                type = "codelldb",
                request = "launch",
                name = "CMake Debug",
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        cmake_build_directory = "out/${variant:buildType}",
      },
    },
}
