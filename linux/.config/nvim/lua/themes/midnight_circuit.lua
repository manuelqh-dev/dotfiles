local M = {}

M.colors = {
  bg = "#0D0D0D",
  fg = "#00FF66",
  pink = "#FF00A0",
  gray1 = "#151515",
  gray2 = "#202020",
}

function M.setup()
  vim.cmd("hi clear")

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true

  local c = M.colors

  -- Colores básicos
  vim.cmd("hi Normal guibg=" .. c.bg .. " guifg=" .. c.fg)
  vim.cmd("hi CursorLine guibg=" .. c.gray1)
  vim.cmd("hi Visual guibg=" .. c.gray2)
  vim.cmd("hi LineNr guifg=" .. c.gray1)
  vim.cmd("hi Comment guifg=" .. c.gray2 .. " gui=italic")
  vim.cmd("hi Identifier guifg=" .. c.pink)
  vim.cmd("hi Statement guifg=" .. c.pink .. " gui=bold")
  vim.cmd("hi Function guifg=" .. c.fg)
  vim.cmd("hi Type guifg=" .. c.pink)
  vim.cmd("hi Constant guifg=" .. c.fg)
  vim.cmd("hi ErrorMsg guifg=" .. c.bg .. " guibg=" .. c.pink)
  vim.cmd("hi WarningMsg guifg=" .. c.bg .. " guibg=" .. c.fg)
  vim.cmd("hi Todo guibg=" .. c.pink .. " guifg=" .. c.bg .. " gui=bold")

  -- Opcional: cursor destacado
  vim.cmd("hi Cursor guibg=" .. c.pink)

end

return M
