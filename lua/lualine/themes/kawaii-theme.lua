local p = require("kawaii-theme.palette")

local transparent = vim.g.kawaiitheme_transparent == true

local bg = transparent and p.none or p.bg
local bg_dark = transparent and p.none or p.bg_dark

local theme = {
  normal = {
    a = { fg = p.bg, bg = p.pink2, gui = "bold" },
    b = { fg = p.fg, bg = bg_dark },
    c = { fg = p.fg_dark, bg = bg },
  },

  insert = {
    a = { fg = p.bg, bg = p.yellow, gui = "bold" },
    b = { fg = p.fg, bg = bg_dark },
    c = { fg = p.fg_dark, bg = bg },
  },

  visual = {
    a = { fg = p.bg, bg = p.purple, gui = "bold" },
    b = { fg = p.fg, bg = bg_dark },
    c = { fg = p.fg_dark, bg = bg },
  },

  replace = {
    a = { fg = p.bg, bg = p.red, gui = "bold" },
    b = { fg = p.fg, bg = bg_dark },
    c = { fg = p.fg_dark, bg = bg },
  },

  command = {
    a = { fg = p.bg, bg = p.orange, gui = "bold" },
    b = { fg = p.fg, bg = bg_dark },
    c = { fg = p.fg_dark, bg = bg },
  },

  inactive = {
    a = { fg = p.comment, bg = bg },
    b = { fg = p.comment, bg = bg },
    c = { fg = p.comment, bg = bg },
  },
}

return theme
