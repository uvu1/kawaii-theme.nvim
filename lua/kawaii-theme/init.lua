local M = {}

M.config = {
  transparent = false,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.load()
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "kawaii-theme"

  local p = {
    none = "NONE",

    bg = "#353042",
    bg_dark = "#2C2638",
    bg_float = "#3f3850",
    fg = "#FFF0F5",
    fg_dark = "#fde3e8",
    muted = "#9498a1",
    comment = "#857282",

    pink = "#ff5c8d",
    pink2 = "#ea7599",
    pink3 = "#FFA7C4",
    pink4 = "#ff709b",

    yellow = "#FFE175",
    purple = "#CE85F8",
    green = "#37e884",
    red = "#ff62a5",
    orange = "#ec9a5e",

    selection = "#50364c",
    selection_strong = "#723854",
    border = "#484454",
  }

  local bg = M.config.transparent and p.none or p.bg
  local bg_float = M.config.transparent and p.none or p.bg_float
  local bg_dark = M.config.transparent and p.none or p.bg_dark

  vim.g.kawaiitheme_palette = p

  -- Base UI
  hl("Normal", { fg = p.fg, bg = bg })
  hl("NormalNC", { fg = p.fg, bg = bg })
  hl("NormalFloat", { fg = p.fg, bg = bg_float })
  hl("FloatBorder", { fg = p.pink2, bg = bg_float })
  hl("SignColumn", { bg = bg })
  hl("LineNr", { fg = p.comment, bg = bg })
  hl("CursorLine", { bg = p.selection })
  hl("CursorLineNr", { fg = p.yellow, bg = bg, bold = true })
  hl("EndOfBuffer", { fg = bg, bg = bg })

  -- Status / tab
  hl("StatusLine", { fg = p.fg, bg = bg_dark })
  hl("StatusLineNC", { fg = p.muted, bg = bg })
  hl("WinSeparator", { fg = p.border })
  hl("TabLine", { fg = p.muted, bg = bg_dark })
  hl("TabLineSel", { fg = p.pink, bg = bg })
  hl("TabLineFill", { bg = bg })

  -- Syntax
  hl("Comment", { fg = p.comment })
  hl("String", { fg = p.pink3 })
  hl("Number", { fg = p.pink3 })
  hl("Boolean", { fg = p.pink3 })
  hl("Constant", { fg = p.pink3 })
  hl("Function", { fg = p.yellow })
  hl("Keyword", { fg = p.pink4 })
  hl("Statement", { fg = p.pink4 })
  hl("Operator", { fg = p.pink4 })
  hl("Type", { fg = p.pink4, italic = true })
  hl("Special", { fg = p.purple })
  hl("Identifier", { fg = p.fg })

  -- Treesitter
  hl("@comment", { fg = p.comment })
  hl("@string", { fg = p.pink3 })
  hl("@number", { fg = p.pink3 })
  hl("@boolean", { fg = p.pink3 })
  hl("@constant", { fg = p.pink3 })
  hl("@variable", { fg = p.fg })
  hl("@variable.parameter", { fg = p.yellow, italic = true })
  hl("@function", { fg = p.yellow })
  hl("@function.call", { fg = p.yellow })
  hl("@keyword", { fg = p.pink4 })
  hl("@keyword.return", { fg = p.pink4 })
  hl("@operator", { fg = p.pink4 })
  hl("@type", { fg = p.pink4, italic = true })
  hl("@property", { fg = p.purple })
  hl("@punctuation", { fg = p.fg_dark })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.red })
  hl("DiagnosticWarn", { fg = p.yellow })
  hl("DiagnosticInfo", { fg = p.purple })
  hl("DiagnosticHint", { fg = p.green })

  -- Pmenu
  hl("Pmenu", { fg = p.fg, bg = bg_dark })
  hl("PmenuSel", { fg = p.fg, bg = p.selection_strong })
  hl("PmenuSbar", { bg = bg_dark })
  hl("PmenuThumb", { bg = p.pink2 })

  -- Snacks
  hl("SnacksPicker", { fg = p.fg, bg = bg })
  hl("SnacksPickerBorder", { fg = p.pink2, bg = bg })
  hl("SnacksPickerTitle", { fg = p.bg, bg = p.pink2, bold = true })
  hl("SnacksPickerInputBorder", { fg = p.pink2, bg = bg })
  hl("SnacksPickerInputTitle", { fg = p.bg, bg = p.pink2, bold = true })
  hl("SnacksPickerMatch", { fg = p.yellow, bold = true })

  -- blink.cmp
  hl("BlinkCmpMenu", { fg = p.fg, bg = bg_dark })
  hl("BlinkCmpMenuBorder", { fg = p.pink2, bg = bg_dark })
  hl("BlinkCmpMenuSelection", { fg = p.fg, bg = p.selection_strong })
  hl("BlinkCmpLabelMatch", { fg = p.yellow, bold = true })
  hl("BlinkCmpDoc", { fg = p.fg, bg = bg_float })
  hl("BlinkCmpDocBorder", { fg = p.pink2, bg = bg_float })
end

return M
