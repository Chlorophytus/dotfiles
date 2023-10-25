" Vim preferences
set clipboard+=unnamedplus
set colorcolumn=80
set number
set mouse=a
set smartindent
set visualbell
set shiftwidth=2
set tabstop=2

" We need these Plugs
call plug#begin(stdpath('data') . '/plugged')
	Plug 'elixir-editors/vim-elixir'
	Plug 'neovim/nvim-lspconfig'
	Plug 'sbdchd/neoformat'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'scalameta/nvim-metals'
	Plug 'RaafatTurki/hex.nvim'
	call plug#end()

" Centralized Lua loading file.
" Place in .config/nvim/lua/chlorovim.lua
lua require('chlorovim')
