local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
-- custom on_attach function
local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts "Go to definition")
  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts "hover information")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map("n", "<leader>ra", "<cmd>Lspsaga rename<CR>", opts "lspsaga renamer")

  map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end

  if client.name == "clangd" then
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
    map("n", "<leader>ts", "<cmd>ClangdTypeHierarchy<CR>", opts "c/cpp type hierarchy")
  end
end

-- default 'on_init' function disable semanticTokens
-- local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- neovim api doc
require("neodev").setup {}

local lspconfig = require "lspconfig"
local servers = { "lua_ls", "clangd", "rust_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    -- on_init = on_init,
    capabilities = capabilities,
  }
end
