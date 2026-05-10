-- nvim/after/ftplugin/netrw.lua 
local options_append = {
  netrw_bufsettings = "noma nomod nu nobl nowrap ro", -- line number
	netrw_banner = 0, -- hide banner
	netrw_liststyle = 3, -- tree view
	netrw_keepdir = 0, --Keep the current directory and the browsing directory synced
	netrw_localmkdir = "mkdir -p", -- change mkdir cmd
	netrw_localcopycmd = "cp -r", -- change copy command
	netrw_localrmdir = "rm -r", -- change delete command
	netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]], -- don't show hidden
	netrw_browse_split = 0, -- open new files in vertical split
	netrw_altv = 1, -- split right
	-- netrw_winsize = "17", -- 17% size
}

for k, v in pairs(options_append) do
	vim.g[k] = v
end

local bind = function(new, literal)
	vim.keymap.set("n", new, literal, { remap = true, buffer = true })
end

-- Navigation
-- bind(".", "a") -- toggle dotfiles

-- bind("l", "<CR>") -- open file or dir
-- bind("H", "u") -- preview dir
-- bind("h", "-^") -- go up
-- bind("[f", ":Explore<CR>") -- close if open

-- Marks
bind("<TAB>", "mf") -- toggle mark
bind("<S-TAB>", "mF") -- unmark
bind("<leader><TAB>", "mu") -- unmark all
bind("mb", "ma <cmd>silent! argdo badd<CR> <cmd>bd#<CR>") -- Open marked files in buffers, close netrw

-- Files
vim.keymap.set("n", "f", ":!touch ", { buffer = true }) -- create file
vim.keymap.set("n", "d", ":!mkdir -p ", { buffer = true }) -- create folder
vim.keymap.set("n", "r", ":!mv <cfile> ", { buffer = true }) -- move/rename
vim.keymap.set("n", "c", ":!cp -r <cfile> ", { buffer = true }) -- copy
vim.keymap.set("n", "D", ":!rm -r <cfile> ", { buffer = true }) -- delete
-- bind("f;", "mx") -- run command

pcall(vim.keymap.del, "n", "<C-l>", { buffer = true }) -- re enable ctrl l for window nav

-- show/hide dotfiles. works but messes with icons
vim.keymap.set("n", ".", function()
    if vim.g.netrw_hide == 1 then
      vim.g.netrw_hide = 0
    else
      vim.g.netrw_hide = 1
    end
    vim.cmd("e .")
  end, { buffer = true, desc = "Toggle hidden files" })
