
local gitsigns = require("gitsigns")

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- ou "right_align"
    delay = 1000,           -- délai avant d’afficher le texte
    ignore_whitespace = false,
  }
})
