local wezterm = require 'wezterm'

return {
  -- Fonte padrão do sistema
  font = wezterm.font_with_fallback({ "JetBrains Mono", "Courier New" }),

  -- Tamanho inicial da fonte
  font_size = 12.0,

  -- Cores básicas (tema padrão)
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte

  -- Desativar barra de título personalizada
  use_fancy_tab_bar = false,

  -- Altura mínima da barra de abas
  hide_tab_bar_if_only_one_tab = true,

  -- Transparência (0.0 é totalmente transparente, 1.0 é opaco)
  window_background_opacity = 0.75,

  -- Cursor em bloco
  default_cursor_style = "BlinkingBlock",

  -- Atalhos para ajustar o tamanho da fonte
  keys = {
    -- Aumentar fonte com Ctrl +
    {
      key = "=",
      mods = "CTRL",
      action = wezterm.action.IncreaseFontSize,
    },
    -- Diminuir fonte com Ctrl -
    {
      key = "-",
      mods = "CTRL",
      action = wezterm.action.DecreaseFontSize,
    },
    -- Resetar tamanho da fonte com Ctrl 0
    {
      key = "0",
      mods = "CTRL",
      action = wezterm.action.ResetFontSize,
    },
  },
}
