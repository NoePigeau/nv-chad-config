require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map(
  "n",
  "<leader>fq",
  require "mappings.replace-quotes",
  { desc = "Replace quotes by backticks", noremap = true, silent = true }
)

map("n", "grr", function()
  require("telescope.builtin").lsp_references {
    prompt_title = " LSP References",
    show_line = true,
    trim_text = true,
    initial_mode = "normal"
  }
end, { silent = true, noremap = true, desc = "Go to References (Telescope)" })
