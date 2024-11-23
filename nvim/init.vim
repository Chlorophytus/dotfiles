" Vim preferences
set clipboard+=unnamedplus
set colorcolumn=80
set number
set mouse=a
set smartindent
set visualbell
set shiftwidth=2
set tabstop=2
set expandtab

" We need these Plugs
call plug#begin(stdpath('data') . '/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'RaafatTurki/hex.nvim'
  Plug 'sbdchd/neoformat'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'maxmx03/solarized.nvim'
  Plug 'NeogitOrg/neogit'
  Plug 'scalameta/nvim-metals'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'vyfor/cord.nvim', {'do': './build'}

  call plug#end()

" Centralized Lua loading file.
" Place in .config/nvim/lua/chlorovim.lua
lua require('chlorovim')

" Use Solarized colors
colorscheme solarized
hi ColorColumn guibg=darkred
