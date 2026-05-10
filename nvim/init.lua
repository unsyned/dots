require("core")


vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nemanjamalesija/smart-paste.nvim',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/justinmk/vim-sneak',
    'https://github.com/neogitorg/neogit',
    'https://github.com/tpope/vim-surround',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/folke/todo-comments.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',

    -------------- APPEARANCE --------------
    -- 'https://github.com/thesimonho/kanagawa-paper.nvim',
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/prichrd/netrw.nvim', -- requires devicons for autoconfig. otherwise must provide icons in the icons table setup
    'https://github.com/nvim-lualine/lualine.nvim', -- requires devicons
    --   example of version locking
    --   {
    --   src = 'https://github.com/lewis6991/gitsigns.nvim',
    --   version = vim.version.range('^2.1.0'),
    -- }
})

vim.o.smartindent = false -- turn off to prevent interference with treesitter

require('smart-paste').setup()
local neogit = require('neogit')
neogit.setup({
  mappings = {
    status = {
      ["<c-s>"]  = false,
    }
  },
})
vim.keymap.set(
    "n",
    "<leader>gg",
    function() neogit.open({ kind = "replace" }) end, -- or split/auto
    { desc = "Open Neogit UI" }
)

require('nvim-autopairs').setup({})
require('todo-comments').setup({
  signs = false,
})
require('treesitter-context').setup({})

require('netrw').setup({})

local status_ok, kanagawa = pcall(require, 'kanagawa')

-- set theme, fallback to native if not available
if not status_ok then
  vim.cmd.colorscheme('retrobox')
else
  kanagawa.setup({})
  vim.cmd.colorscheme('kanagawa')
end

require('lualine').setup({
  options = { theme = 'tomorrow_night' },
})
-- local status_ok, _ = pcall(vim.cmd.colorscheme, "kanagawa-paper")
-- if not status_ok then
--   vim.cmd.colorscheme("retrobox")
-- end

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
