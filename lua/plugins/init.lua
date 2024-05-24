return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        root_folder_label = ":~:s?$?/..?",
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "vim",
        "lua",
        "vimdoc",
        "cpp",
        "rust",
      },
    },
  },

  -- custom plugins
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      "<c-h>",
      "<c-j>",
      "<c-k>",
      "<c-l>",
      "<c-\\>",
    },
  },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" }, -- to enable preview (optional)
  {
    "ojroques/nvim-lspfuzzy",
    event = "LspAttach",
    dependencies = {
      { "junegunn/fzf" },
      { "junegunn/fzf.vim" }, -- to enable preview (optional)
    },
    config = function()
      require("lspfuzzy").setup {}
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    event = "LspAttach",
    ft = { "c", "cpp", "cxx", "cc" },
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "hrsh7th/vim-eft",
    keys = { ";", "f", "F", "t", "T" },
    config = function()
      vim.cmd [[nmap f <Plug>(eft-f)]]
      vim.cmd [[xmap f <Plug>(eft-f)]]
      vim.cmd [[omap f <Plug>(eft-f)]]
      vim.cmd [[nmap F <Plug>(eft-F)]]
      vim.cmd [[xmap F <Plug>(eft-F)]]
      vim.cmd [[omap F <Plug>(eft-F)]]
      vim.cmd [[nmap t <Plug>(eft-t)]]
      vim.cmd [[xmap t <Plug>(eft-t)]]
      vim.cmd [[omap t <Plug>(eft-t)]]
      vim.cmd [[nmap T <Plug>(eft-T)]]
      vim.cmd [[xmap T <Plug>(eft-T)]]
      vim.cmd [[omap T <Plug>(eft-T)]]
    end,
  },
  {
    "junegunn/vim-easy-align",
    keys = { "ga" },
    config = function()
      vim.cmd [[xmap ga <Plug>(EasyAlign)]]
      vim.cmd [[nmap ga <Plug>(EasyAlign)]]
    end,
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
