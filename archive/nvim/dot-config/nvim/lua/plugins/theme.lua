-- current theme
-- return {
--       --"folke/tokyonight.nvim",
--       "catppuccin/nvim",
--       name = "catppuccin",
--       lazy = false,
--       priority = 1000, -- load before all other start plugins
--       opts = { style = "storm" },
--       config = function()
--         -- load colorscheme here???
--         vim.cmd.colorscheme('catppuccin-mocha')
--       end,
-- }

return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  init = function()
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end,
}
