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
    opts = {

      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "javascript",
            "typescript",
            "markdown",
            "ejs",
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
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
        "tsx",
        "json",
        "rust",
      },
      autotag = { enable = true },
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

  {
    "tpope/vim-abolish",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    lazy = false,
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    lazy = false,
    config = function()
      local mc = require "multicursor-nvim"
      mc.setup()

      local map = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      map({ "n", "x" }, "<up>", function()
        mc.lineAddCursor(-1)
      end, { desc = "Add cursor above" })
      map({ "n", "x" }, "<down>", function()
        mc.lineAddCursor(1)
      end, { desc = "Add cursor below" })
      map({ "n", "x" }, "<leader><up>", function()
        mc.lineSkipCursor(-1)
      end, { desc = "Skip cursor above" })
      map({ "n", "x" }, "<leader><down>", function()
        mc.lineSkipCursor(1)
      end, { desc = "Skip cursor below" })

      -- Add or skip adding a new cursor by matching word/selection
      map({ "n", "x" }, "<leader>n", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor for next match" })
      map({ "n", "x" }, "<leader>s", function()
        mc.matchSkipCursor(1)
      end, { desc = "Skip next match" })
      map({ "n", "x" }, "<leader>N", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add cursor for previous match" })
      map({ "n", "x" }, "<leader>S", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Skip previous match" })

      -- Add and remove cursors with control + left click.
      map("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add/remove cursor with mouse" })
      map("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Drag to create multiple cursors" })
      map("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Finish mouse cursor placement" })

      -- Disable and enable cursors.
      map({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursor mode" })

      -- Keymap layer active only when multiple cursors exist.
      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Select previous cursor as main" })
        layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Select next cursor as main" })

        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor, { desc = "Delete current cursor" })

        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end, { desc = "Enable/clear cursors" })
      end)

      -- Highlight groups.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
