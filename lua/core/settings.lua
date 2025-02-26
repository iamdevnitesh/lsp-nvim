local set = vim.opt
set.guifont = "JetBrainsMono Nerd Font:h14"
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
vim.wo.wrap = true
set.smartcase = true
set.smartindent = true
set.modifiable = true
set.incsearch = true
set.autochdir = true
set.hlsearch = true
set.ignorecase = true
set.mouse = "a"
set.showtabline = 2
set.splitright = true
set.splitbelow = true
set.timeout = true
set.timeoutlen = 2000
set.ttimeoutlen = 100
set.number = true
set.relativenumber = true
set.cursorline = true
set.termguicolors = true

if vim.g.neovide then
	set.guifont = "JetBrainsMono Nerd Font:h12"
	set.guifontwide = "JetBrainsMono Nerd Font:h12"
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_fullscreen = true
end
