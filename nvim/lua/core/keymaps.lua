
--------------------KEY BINDINGS--------------------
vim.g.mapleader=" "
-- also note to self: command :y A will add to yank stack, then you can use @: to repeat the command for every new line you want to add
-- "ayy to name a register to write to, "Ayy (capital register name) to write to the named register. does the same as above but will overwrite the buffer if you mistype a lowercase 
-- "ap to paste/put

-- "Amended" keybinds are those that overwrite existing behavior
-- "Augmented" keybinds are those that add bindings that did not exist otherwise

--------------------NORMAL MODE--------------------
-- augments
-- center cursor after some vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down, center cursor", noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up, center cursor", noremap = true })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result, unfold", noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, unfold", noremap = true })

-- better J [[TENTATIVE]]
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines, preserve cursor position" })

-- amendments
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle NeoTree"})
vim.keymap.set("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "fzf: Find files" })

-- clear search results highlights upon esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })

-- go to middle of line (may want to use this bind for "go to last mark" instead)
-- alternative is :call cursor(0, len(getline('.'))/2)
vim.keymap.set("n", "<leader>m", "gM", { desc = "Go to middle of line", noremap = true })

-- quick marks
vim.keymap.set("n", "<leader>s", "`s", { desc = "Go to s mark", noremap = true })
vim.keymap.set("n", "<leader><leader>s", "ms", { desc = "Create s mark", noremap = true })
vim.keymap.set("n", "<leader>r", "`r", { desc = "Go to r mark", noremap = true })
vim.keymap.set("n", "<leader><leader>r", "mr", { desc = "Create r mark", noremap = true })

-- add empty line below and above lines with leader i a
vim.keymap.set("n", "<leader>i", "mzO<Esc>0D`z", { desc = "Insert space", noremap = true })
vim.keymap.set("n", "<leader>a", "mzo<Esc>0D`z", { desc = "Append space", noremap = true })

-- move line above/below and match indent
vim.keymap.set("n", "<A-Up>", "<cmd>m-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-Down>", "<cmd>m+<CR>==", { desc = "Move line down" })

-- switch window focus
vim.keymap.set("n", "<leader>ww", "<C-w><C-w>", { desc = "Switch focus to another window", noremap = true })
vim.keymap.set("n", "<leader>w<Left>", "<C-w><C-h>", { desc = "Move focus to the left window", noremap = true })
vim.keymap.set("n", "<leader>w<Right>", "<C-w><C-l>", { desc = "Move focus to the right window", noremap = true })
vim.keymap.set("n", "<leader>w<Down>", "<C-w><C-j>", { desc = "Move focus to the lower window", noremap = true })
vim.keymap.set("n", "<leader>w<Up>", "<C-w><C-k>", { desc = "Move focus to the upper window", noremap = true })
-- for normie boards
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = "Move focus to the left window", noremap = true })
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "Move focus to the right window", noremap = true })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "Move focus to the lower window", noremap = true })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "Move focus to the upper window", noremap = true })

-- Manage splits
vim.keymap.set("n", "<leader>ws", ":sp<CR>", { desc = "Open split", noremap = true, silent = true })
vim.keymap.set("n", "<leader>wv", ":vsp<CR>", { desc = "Open vertical split", noremap = true, silent = true })

-- resize splits with (meta) alt + <,>,s,f
-- TODO: consider deleting these
vim.keymap.set("n", "<M-.>", "<C-w>5>", { desc = "Expand vertical viewport 5 columns", noremap = true })
vim.keymap.set("n", "<M-,>", "<C-w>5<", { desc = "Shrink vertical viewport 5 columns", noremap = true })
vim.keymap.set("n", "<M-s>", "<C-w>+", { desc = "Expand viewport", noremap = true })
vim.keymap.set("n", "<M-f>", "<C-w>-", { desc = "Shrink viewport", noremap = true })

-- paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { desc = "Paste from system clipboard", noremap = true })

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank line to system clipboard", noremap = true })

-- Y to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line", noremap = true })

-- delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking", noremap = true })
vim.keymap.set("n", "<leader>D", '"_d$', { desc = "Delete without yanking", noremap = true })

-- buffer nav
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ba", ":bad %:h/", { desc = "Add buffer", noremap = true, silent = true })

-- Open
vim.keymap.set("n", "<leader>ot", ":sp | te<CR>", { desc = "Open terminal in split", noremap = true, silent = true })
vim.keymap.set("n", "<leader>oe", ":Ex<CR>", { desc = "Open explorer (head directory)", noremap = true, silent = true })

--------------------INSERT MODE--------------------
-- augments
-- easy Esc on normie boards
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- move line above/below and match indent
vim.keymap.set("i", "<A-Up>", "<Esc><cmd>m-2<CR>==gi", { desc = "Move line up", noremap = true })
vim.keymap.set("i", "<A-Down>", "<Esc><cmd>m+<CR>==gi", { desc = "Move line down", noremap = true })

--------------------VISUAL MODE--------------------
-- augments
-- indent and preserve selection
vim.keymap.set("v", "<", "<gv", { desc = "Indent left, preserve selection", noremap = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left, preserve selection", noremap = true })

-- amendments
-- move selection up/down
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", noremap = true, silent = true })

-- yank to system clipboard
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yanking", noremap = true })

--------------------TERMINAL MODE--------------------
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Return to normal mode", noremap = true })
