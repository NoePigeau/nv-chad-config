-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "one_light",

  hl_override = {
    --
    NvimTreeFolderIcon = { fg = "blue" },
    NvimTreeFolderName = { fg = "blue" },
    NvimTreeGitDirty = { fg = "yellow" },
    NvimTreeGitIgnored = { fg = "light_grey", italic = true },
    NvimTreeGitNew = { fg = "vibrant_green" },
    NvimTreeGitDeleted = { fg = "#e06c75" },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
  hl_override = {}
}

return M
