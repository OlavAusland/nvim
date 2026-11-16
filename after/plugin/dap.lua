local dap   = require("dap")
local dapui = require("dapui")

dap.adapters.gdb =
{
    type = "executable",
    command = "gdb-multiarch",
    args =
    {"--interpreter=dap", "--eval-command", "set print pretty on"}
}

dap.configurations.c =
{
    {
        name = "Debug (OpenOCD)",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/firmware")
        end,
        target = "localhost:3333",
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = true
    }
}

dapui.setup({})
dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui"] = function() dapui.close() end

local map = vim.keymap.set
map("n", "<leader>dc",          function() require("dap").continue() end,       { desc = "DAP start/continue" })
map("n", "<leader>dso",         function() require("dap").step_over() end)
map("n", "<leader>dsi",         function() require("dap").step_into() end)
--map("n", "<leader>de",   function() require("dap").step_out() end)
map("n", "<leader>db",          function() require("dap").toggle_breakpoint() end)
map("n", "<leader>dk",          function() require("dap").terminate() end,     { desc = "DAP terminate" })
map("n", "<leader>dr",          function() require("dap").repl.open() end,     { desc = "DAP REPL" })
map({ "n", "v" }, "<leader>de", function() require("dapui").eval() end)
