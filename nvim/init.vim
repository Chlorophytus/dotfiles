set clipboard+=unnamedplus
set colorcolumn=80
set number
set mouse=a
set smartindent
set visualbell

set shiftwidth=2
set tabstop=2

call plug#begin(stdpath('data') . '/plugged')
    Plug 'elixir-editors/vim-elixir'
    Plug 'neovim/nvim-lspconfig'
		Plug 'sbdchd/neoformat'
    call plug#end()

lua << EOF
    require'lspconfig'.clangd.setup{}
		require'lspconfig'.elixirls.setup{
				cmd = { "/home/accelshark/.local/elixir-ls/language_server.sh" };
		}
EOF

