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

local function link(group, target)
  hl(group, { link = target })
end

function M.load()
  vim.o.background = "dark"
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
  local eob_fg = M.config.transparent and p.bg or bg

  vim.g.kawaiitheme_palette = p

  -- Base UI
  hl("Normal", { fg = p.fg, bg = bg })
  hl("NormalNC", { fg = p.fg, bg = bg })
  hl("NormalFloat", { fg = p.fg, bg = bg_float })
  hl("FloatBorder", { fg = p.pink2, bg = bg_float })
  hl("FloatTitle", { fg = p.pink3, bg = bg_float, bold = true })
  hl("FloatFooter", { fg = p.fg_dark, bg = bg_float })
  hl("FloatShadow", { bg = bg_dark })
  hl("FloatShadowThrough", { bg = bg_dark })
  hl("SignColumn", { bg = bg })
  hl("LineNr", { fg = p.comment, bg = bg })
  hl("CursorLine", { bg = p.selection })
  hl("CursorColumn", { bg = bg_dark })
  hl("CursorLineNr", { fg = p.yellow, bg = bg, bold = true })
  hl("ColorColumn", { bg = bg_dark })
  hl("EndOfBuffer", { fg = eob_fg, bg = bg })
  hl("NonText", { fg = p.border })
  hl("Whitespace", { fg = p.border })
  hl("SpecialKey", { fg = p.comment })
  hl("Conceal", { fg = p.comment })
  hl("Directory", { fg = p.pink3, bold = true })
  hl("Visual", { bg = p.selection })
  hl("VisualNOS", { bg = p.selection })
  hl("Search", { fg = p.bg, bg = p.yellow })
  hl("IncSearch", { fg = p.bg, bg = p.pink3 })
  hl("CurSearch", { fg = p.bg, bg = p.pink3 })
  hl("MatchParen", { fg = p.yellow, bg = p.selection, bold = true })
  hl("Folded", { fg = p.muted, bg = bg_dark })
  hl("FoldColumn", { fg = p.comment, bg = bg })
  hl("QuickFixLine", { bg = p.selection, bold = true })
  hl("Substitute", { fg = p.bg, bg = p.pink3 })

  -- Status / tab
  hl("StatusLine", { fg = p.fg, bg = bg_dark })
  hl("StatusLineNC", { fg = p.muted, bg = bg })
  hl("WinSeparator", { fg = p.border })
  hl("TabLine", { fg = p.muted, bg = bg_dark })
  hl("TabLineSel", { fg = p.pink, bg = bg })
  hl("TabLineFill", { bg = bg })
  hl("WildMenu", { fg = p.bg, bg = p.yellow })
  hl("WinBar", { fg = p.fg, bg = bg_dark })
  hl("WinBarNC", { fg = p.muted, bg = bg_dark })
  hl("Title", { fg = p.pink3, bold = true })
  hl("Question", { fg = p.green })
  hl("MoreMsg", { fg = p.green })
  hl("OkMsg", { fg = p.green })
  hl("ModeMsg", { fg = p.yellow })
  hl("MsgSeparator", { bg = bg_dark })
  hl("ErrorMsg", { fg = p.red })
  hl("WarningMsg", { fg = p.yellow })
  hl("RedrawDebugNormal", { reverse = true })
  hl("RedrawDebugClear", { bg = p.yellow })
  hl("RedrawDebugComposed", { bg = p.green })
  hl("RedrawDebugRecompose", { bg = p.red })
  hl("NvimInternalError", { fg = p.red, bg = bg })

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
  hl("PreProc", { fg = p.purple })
  hl("Type", { fg = p.pink4, italic = true })
  hl("Special", { fg = p.purple })
  hl("Delimiter", { fg = p.fg_dark })
  hl("Identifier", { fg = p.fg })
  hl("Todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("Error", { fg = p.red })

  -- Treesitter
  hl("@comment", { fg = p.comment })
  hl("@string", { fg = p.pink3 })
  hl("@number", { fg = p.pink3 })
  hl("@boolean", { fg = p.pink3 })
  hl("@constant", { fg = p.pink3 })
  hl("@constant.builtin", { fg = p.pink3 })
  hl("@variable", { fg = p.fg })
  hl("@variable.builtin", { fg = p.purple, italic = true })
  hl("@variable.member", { fg = p.purple })
  hl("@variable.parameter", { fg = p.yellow, italic = true })
  hl("@function", { fg = p.yellow })
  hl("@function.builtin", { fg = p.yellow })
  hl("@function.call", { fg = p.yellow })
  hl("@function.method", { fg = p.yellow })
  hl("@function.method.call", { fg = p.yellow })
  hl("@keyword", { fg = p.pink4 })
  hl("@keyword.function", { fg = p.pink4 })
  hl("@keyword.import", { fg = p.pink4 })
  hl("@keyword.operator", { fg = p.pink4 })
  hl("@keyword.return", { fg = p.pink4 })
  hl("@operator", { fg = p.pink4 })
  hl("@type", { fg = p.pink4, italic = true })
  hl("@type.builtin", { fg = p.pink4, italic = true })
  hl("@module", { fg = p.pink4, italic = true })
  hl("@constructor", { fg = p.purple })
  hl("@property", { fg = p.purple })
  hl("@attribute", { fg = p.purple })
  hl("@punctuation", { fg = p.fg_dark })
  hl("@string.escape", { fg = p.purple })
  hl("@string.special", { fg = p.purple })
  hl("@character", { fg = p.pink3 })
  hl("@tag", { fg = p.pink4 })
  hl("@tag.attribute", { fg = p.purple })
  hl("@tag.delimiter", { fg = p.fg_dark })
  hl("@markup.heading", { fg = p.yellow, bold = true })
  hl("@markup.strong", { bold = true })
  hl("@markup.italic", { italic = true })
  hl("@markup.strikethrough", { strikethrough = true })
  hl("@markup.link", { fg = p.purple, underline = true })
  hl("@markup.raw", { fg = p.pink3 })
  hl("@diff.plus", { fg = p.green })
  hl("@diff.minus", { fg = p.red })
  hl("@diff.delta", { fg = p.orange })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.red })
  hl("DiagnosticWarn", { fg = p.yellow })
  hl("DiagnosticInfo", { fg = p.purple })
  hl("DiagnosticHint", { fg = p.green })
  hl("DiagnosticOk", { fg = p.green })
  hl("DiagnosticSignError", { fg = p.red })
  hl("DiagnosticSignWarn", { fg = p.yellow })
  hl("DiagnosticSignInfo", { fg = p.purple })
  hl("DiagnosticSignHint", { fg = p.green })
  hl("DiagnosticVirtualTextError", { fg = p.red })
  hl("DiagnosticVirtualTextWarn", { fg = p.yellow })
  hl("DiagnosticVirtualTextInfo", { fg = p.purple })
  hl("DiagnosticVirtualTextHint", { fg = p.green })
  hl("DiagnosticFloatingError", { fg = p.red })
  hl("DiagnosticFloatingWarn", { fg = p.yellow })
  hl("DiagnosticFloatingInfo", { fg = p.purple })
  hl("DiagnosticFloatingHint", { fg = p.green })
  hl("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = p.yellow, undercurl = true })
  hl("DiagnosticUnderlineInfo", { sp = p.purple, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = p.green, undercurl = true })
  hl("DiagnosticUnderlineOk", { sp = p.green, undercurl = true })
  hl("DiagnosticDeprecated", { sp = p.comment, strikethrough = true })
  hl("SpellBad", { sp = p.red, undercurl = true })
  hl("SpellCap", { sp = p.yellow, undercurl = true })
  hl("SpellRare", { sp = p.purple, undercurl = true })
  hl("SpellLocal", { sp = p.green, undercurl = true })

  -- Diff
  hl("DiffAdd", { fg = p.green, bg = bg_dark })
  hl("DiffDelete", { fg = p.red, bg = bg_dark })
  hl("DiffChange", { fg = p.orange, bg = bg_dark })
  hl("DiffText", { fg = p.fg, bg = p.selection_strong, bold = true })
  link("Added", "DiffAdd")
  link("Removed", "DiffDelete")
  link("Changed", "DiffChange")

  -- Pmenu
  hl("Pmenu", { fg = p.fg, bg = bg_dark })
  hl("PmenuSel", { fg = p.fg, bg = p.selection_strong })
  hl("PmenuSbar", { bg = bg_dark })
  hl("PmenuThumb", { bg = p.pink2 })
  hl("PmenuKind", { fg = p.purple, bg = bg_dark })
  hl("PmenuKindSel", { fg = p.fg_dark, bg = p.selection_strong })
  hl("PmenuExtra", { fg = p.muted, bg = bg_dark })
  hl("PmenuExtraSel", { fg = p.fg_dark, bg = p.selection_strong })
  hl("PmenuMatch", { fg = p.yellow, bg = bg_dark, bold = true })
  hl("PmenuMatchSel", { fg = p.yellow, bg = p.selection_strong, bold = true })

  -- LSP
  hl("LspReferenceText", { bg = p.selection })
  hl("LspReferenceRead", { bg = p.selection })
  hl("LspReferenceWrite", { bg = p.selection_strong })

  -- Snacks
  hl("SnacksPicker", { fg = p.fg, bg = bg })
  hl("SnacksPickerBorder", { fg = p.pink2, bg = bg })
  hl("SnacksPickerTitle", { fg = p.bg, bg = p.pink2, bold = true })
  hl("SnacksPickerInputBorder", { fg = p.pink2, bg = bg })
  hl("SnacksPickerInputTitle", { fg = p.bg, bg = p.pink2, bold = true })
  hl("SnacksPickerMatch", { fg = p.yellow, bold = true })
  hl("SnacksPickerFile", { fg = p.fg })
  hl("SnacksPickerDirectory", { fg = p.pink3, bold = true })
  hl("SnacksPickerDir", { fg = p.pink3, bold = true })
  hl("SnacksPickerIcon", { fg = p.pink2 })
  hl("SnacksPickerIconFile", { fg = p.pink3 })
  hl("SnacksPickerIconDirectory", { fg = p.pink2 })
  hl("SnacksPickerIconFolder", { fg = p.pink2 })
  hl("SnacksPickerTree", { fg = p.comment })
  hl("SnacksPickerSelected", { fg = p.pink })

  -- blink.cmp
  hl("BlinkCmpMenu", { fg = p.fg, bg = bg_dark })
  hl("BlinkCmpMenuBorder", { fg = p.pink2, bg = bg_dark })
  hl("BlinkCmpMenuSelection", { fg = p.fg, bg = p.selection_strong })
  hl("BlinkCmpLabelMatch", { fg = p.yellow, bold = true })
  hl("BlinkCmpDoc", { fg = p.fg, bg = bg_float })
  hl("BlinkCmpDocBorder", { fg = p.pink2, bg = bg_float })
end

return M
