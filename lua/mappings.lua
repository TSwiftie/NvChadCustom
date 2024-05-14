require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- lspsaga
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- tmux
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- Disable mappings
-- local nomap = vim.keymap.del
