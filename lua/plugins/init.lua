return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
    keys = {
      {
        "<leader>i",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        desc = "Format file with Conform",
      },
    },
  },

  -- Load lsp config for server languages etc
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- setup float toggle term
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup {
        open_mapping = "<leader>tt",
        shading_factor = 0.3,
        direction = "float",
      }
    end,
  },

  -- test new blink (use to extend custom configuration)
  -- { import = "nvchad.blink.lazyspec" },

  -- highlight intelligent colors depending on languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "rust",
      },
    },
  },

  {
    "kyazdani42/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        easing_function = "quadratic", -- options : "quadratic", "cubic", "sine", "circle"
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.gitsigns"
    end,
  },

  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink blame<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink! blame<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
