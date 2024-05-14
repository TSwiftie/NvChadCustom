require "nvchad.options"

-- add yours here!

-- local o = vim.o
vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local autocmd = vim.api.nvim_create_autocmd

-- record last position of file
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
