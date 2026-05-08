require("core")

-- todo remove or add to conditional when plugin theme is added
vim.cmd.colorscheme("retrobox")

vim.pack.add({
    'https://github.com/lewis6991/gitsigns.nvim',
  --   {
  --   src = 'https://github.com/lewis6991/gitsigns.nvim',
  --   version = vim.version.range('^2.1.0'),
  -- }
    'https://github.com/justinmk/vim-sneak',
    'https://github.com/tpope/vim-surround',
    'https://github.com/neogitorg/neogit',
})

local neogit = require('neogit')
vim.keymap.set(
    "n",
    "<leader>gg",
    function() neogit.open({ kind = "replace" }) end, -- or split/auto
    { desc = "Open Neogit UI" }
)

-- require('gitsigns')

-- -- Bootstrap lazy.nvim. So I think it clones the repo if not present?
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--   local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit..."},
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
-- vim.opt.rtp:prepend(lazypath)
--  Vim options
--  set up mapleader (and maplocalleader if needed) before loading lazy.nvim so that mappings are correct

-- Set up lazy.nvim
-- require("lazy").setup({
--   -- add visual yank plugin
--   spec = {
--     -- plugins here
--     { import = "plugins.autopairs" },
--     { import = "plugins.alpha" },
--     { import = "plugins.lualine" },
--     { import = "plugins.fzf-lua" },
--     { import = "plugins.comment" },
--     { import = "plugins.todo-comments" },
--     { import = "plugins.render-markdown" },
--     { import = "plugins.theme" },
--     { import = "plugins.treesitter" },
--     { import = "plugins.luasnip" },
--     { import = "plugins.nvim-cmp" },
--     { import = "plugins.lspconfig" },
--     { import = "plugins.lazy-lsp" },
--     { import = "plugins.yazi" },
--   },
  -- other settings here
  -- automatically check for plugin updates, but only once a day
  -- checker = { enabled = true, notify = false, frequency = 86400, },
-- })
