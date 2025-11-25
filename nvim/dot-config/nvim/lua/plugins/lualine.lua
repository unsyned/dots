-- Status line
return
{
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons", "rebelot/kanagawa.nvim"},
      lazy = false,
      config = function()
        require("lualine").setup({
          options = {
            -- theme = "palenight",
            theme = "kanagawa-paper-ink",
          },
        })
      end,
}
