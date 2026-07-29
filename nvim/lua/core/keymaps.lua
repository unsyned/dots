
--------------------KEY BINDINGS--------------------
vim.g.mapleader=" "
local map = vim.keymap.set
-- local map = vim.keymap.set
-- also note to self: command :y A will add to yank stack, then you can use @: to repeat the command for every new line you want to add
-- "ayy to name a register to write to, "Ayy (capital register name) to write to the named register. does the same as above but will overwrite the buffer if you mistype a lowercase 
-- "ap to paste/put

-- "Amended" keybinds are those that overwrite existing behavior
-- "Augmented" keybinds are those that add bindings that did not exist otherwise

--------------------NORMAL MODE--------------------
-- augments
-- center cursor after some vertical movement
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down, center cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up, center cursor" })
map("n", "n", "nzzzv", { desc = "Next search result, unfold" })
map("n", "N", "Nzzzv", { desc = "Previous search result, unfold" })

-- map ctrl c to esc, shift esc to ctrl c. 
-- trying to switch to ctrl c on traditional layouts
-- ( I still want access to ctrl c function, but I want to send the insert leave event)
map("i", "<C-c>", "<Esc>", {  })
map("i", "<S-Esc>", "<C-c>", {  })

-- remap j and k to visual lines
map("n", "j", "gj", {  })
map("n", "k", "gk", {  })

-- better J [[TENTATIVE]]
map("n", "J", "mzJ`z", { desc = "Join lines, preserve cursor position" })

-- amendments
-- map("n", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle NeoTree"})
map("n", "<leader>e", "<cmd>35Lexplore<CR>", { desc = "Open file explorer" })

map("n", "<leader>ff", function()
  require("fzf-lua").global()
end, { desc = "fzf: Find" })

map("n", "<leader>fr", function()
  require("fzf-lua").oldfiles()
end, { desc = "fzf: Find recent" })

map("n", "<leader>bi", function()
  require("fzf-lua").buffers()
end, { desc = "fzf: Buffer interactive list" })

-- clear search results highlights upon esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights", silent = true })

-- duplicate lines
map("n", "<M-d>", "yyp", { desc = "Duplicate line"})
map({"n", "v"}, "<M-d>", "y`>pgv", { desc = "Duplicate selection, preserve selection" })

-- go to middle of line (may want to use this bind for "go to last mark" instead)
-- alternative is :call cursor(0, len(getline('.'))/2)
map("n", "<leader>m", "gM", { desc = "Go to middle of line" })

-- add empty line below and above lines with leader i a
map("n", "<leader>i", "mzO<Esc>0D`z", { desc = "Insert space" })
map("n", "<leader>a", "mzo<Esc>0D`z", { desc = "Append space" })

-- move line above/below and match indent
map("n", "<A-Up>", "<cmd>m-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", "<cmd>m+<CR>==", { desc = "Move line down" })

-- switch window focus
-- NOTE: trying the ctrl window binds again
map("n", "<C-s>", "<C-w><C-w>", { desc = "Shift/cycle focus to next window" })
map("i", "<C-s>", "<esc><C-w><C-w>a", { desc = "Shift/cycle focus to next window" })
-- NOTE: if ctrl s causes the terminal to freeze, consider adding `stty -ixon` in the zshrc and bashrc. may compromise backward incremental search though
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>w<Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<leader>w<Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<leader>w<Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<leader>w<Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- for normie boards. leaving duplicates for symmetry + options until I settle into one (or don't)
map("n", "<leader>wh", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<leader>wl", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<leader>wj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<leader>wk", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Manage splits
map("n", "<leader>ww", "<C-w><C-w>", { desc = "Cycle focus to next window" })
map("n", "<leader>wr", "<C-w><C-r>", { desc = "Rotate windows", silent = true })
map("n", "<leader>ws", ":sp<CR>", { desc = "Open split", silent = true })
map("n", "<leader>wv", ":vsp<CR>", { desc = "Open vertical split", silent = true })
map("n", "<leader>wo", ":only<CR>", { desc = "Open vertical split", silent = true })

-- resize splits with (meta) alt + <,>,s,f
-- TODO: consider deleting these
-- map("n", "<M-.>", "<C-w>5>", { desc = "Expand vertical viewport 5 columns" })
-- map("n", "<M-,>", "<C-w>5<", { desc = "Shrink vertical viewport 5 columns" })
-- map("n", "<M-s>", "<C-w>+", { desc = "Expand viewport" })
-- map("n", "<M-f>", "<C-w>-", { desc = "Shrink viewport" })

-- paste from system clipboard
map({"n", "v"}, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map({"n", "v"}, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- yank to system clipboard
map({"n", "v"}, "<leader>y", '"+y', { desc = "Yank line to system clipboard" })

-- Y to end of line
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- delete without yanking
map({"n", "v"}, "<leader>d", '"_d', { desc = "Delete without yanking" })
map({"n", "v"}, "<leader>D", '"_d$', { desc = "Delete without yanking" })


-- buffer nav
map("n", "gb", ":b#<CR>", { desc = "Alt buffer" })
map("n", "<M-l>", ":b#<CR>", { desc = "Alt buffer" , silent = true })
map("n", "<M-n>", ":bn<CR>", { desc = "Next buffer" , silent = true })
map("n", "<M-p>", ":bp<CR>", { desc = "Previous buffer" , silent = true })

map("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer" , silent = true })
map("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer" , silent = true })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" , silent = true })
map("n", "<leader>ba", ":bad %:h/", { desc = "Add buffer" , silent = true })
-- consider alt + <num> to switch to buffer number

-- tab nav TODO: WIP
map("n", "<C-n>", ":tabnext<CR>", { desc = "Next tab" , silent = true })
map("n", "<C-p>", ":tabprevious<CR>", { desc = "Previous tab" , silent = true })
-- TODO: the t prefix is colliding with the "toggle" prefix. may have to rearrange
map("n", "<leader>tn", ":tabnew<CR>", { desc = "Add tab" , silent = true })
map("n", "<leader>to", ":tabonly<CR>", { desc = "Collapse tabs into one" , silent = true })
-- consider ctrl + <num> for going to tab number, or leader number

-- quickfix nav
map("n", "<M-j>", ":cn<CR>", { desc = "Next quickfix" , silent = true })
map("n", "<M-k>", ":cp<CR>", { desc = "Previous quickfix" , silent = true })

-- Open
map("n", "<leader>ot", ":sp | te<CR>", { desc = "Open terminal in split" , silent = true })
map("n", "<leader>oe", ":Ex<CR>", { desc = "Open explorer (head directory)" , silent = true })

vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "select child treesitter node or inner incremental lsp selections" })

--------------------INSERT MODE--------------------
-- augments
-- easy Esc on normie boards
map("i", "jj", "<Esc>", {  })

-- move line above/below and match indent
map("i", "<A-Up>", "<Esc><cmd>m-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-Down>", "<Esc><cmd>m+<CR>==gi", { desc = "Move line down" })

--------------------VISUAL MODE--------------------
-- augments
-- indent and preserve selection
map("v", "<", "<gv", { desc = "Indent left, preserve selection" })
map("v", ">", ">gv", { desc = "Indent left, preserve selection" })

-- amendments
-- move selection up/down
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" , silent = true })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" , silent = true })

-- yank to system clipboard
map("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

--------------------TERMINAL MODE--------------------
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Return to normal mode" })

--------------------COMMAND MODE--------------------
-- set wildcharm. not sure if this is needed for different terminals? this is default in nvim
vim.opt.wildcharm = vim.fn.char2nr("\26") -- equivalent to <C-Z>

-- when completing paths in command mode and wild menu is shown
-- remap up to direction
map('c', '<up>', function()
  return vim.fn.wildmenumode() ~= 0 and '<left>' or '<up>'
end, { expr = true }) -- evaluate the string as a keypress

-- remap down to direction
map('c', '<down>', function()
  return vim.fn.wildmenumode() ~= 0 and '<right>' or '<down>'
end, { expr = true })

-- remap left to exit directory
map('c', '<left>', function()
  return vim.fn.wildmenumode() ~= 0 and '<up>' or '<left>'
end, { expr = true })

-- remap right to enter directory
map('c', '<right>', function()
  return vim.fn.wildmenumode() ~= 0 and ' <bs>\26' or '<right>'
end, { expr = true })

