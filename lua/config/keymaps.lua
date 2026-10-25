local map = vim.keymap.set
local pb = require("persistent-breakpoints.api")

-- CMake
map("n", "<leader>cc", "<cmd>CMakeGenerate<CR>", {
    desc = "CMake: Configure",
})

map("n", "<leader>cb", "<cmd>CMakeBuild<CR>", {
    desc = "CMake: Build",
})

map("n", "<leader>ct", "<cmd>CMakeSelectBuildType<CR>", {
    desc = "CMake: Select build type",
})

map("n", "<leader>cr", "<cmd>CMakeRun<CR>", {
    desc = "CMake: Run",
})

map("n", "<leader>cd", "<cmd>CMakeDebug<CR>", {
    desc = "CMake: Debug",
})

local dap = require("dap")
local dapui = require("dapui")

-- Debugger
map("n", "<leader>dc", dap.continue, {
    desc = "DAP: Continue / Start",
})

map("n", "<leader>dn", dap.step_over, {
    desc = "DAP: Step over",
})

map("n", "<leader>di", dap.step_into, {
    desc = "DAP: Step into",
})

map("n", "<leader>do", dap.step_out, {
    desc = "DAP: Step out",
})

map("n", "<leader>db", pb.toggle_breakpoint, {
    desc = "DAP: Toggle breakpoint",
})

map("n", "<leader>dB", dap.set_breakpoint, {
    desc = "DAP: Set breakpoint",
})

map("n", "<leader>du", dapui.toggle, {
    desc = "DAP: Toggle UI",
})

map("n", "<leader>dr", dap.repl.open, {
    desc = "DAP: Open REPL",
})

map("n", "<leader>dq", dap.terminate, {
    desc = "DAP: Terminate",
})

map("n", "<leader>dl", dap.run_last, {
    desc = "DAP: Run last",
})


-- Smart Focus/Toggle for File Explorer
vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus<cr>', { desc = "Focus/Toggle File Explorer" })

