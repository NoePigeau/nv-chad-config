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
