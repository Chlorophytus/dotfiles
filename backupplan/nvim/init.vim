set clipboard+=unnamedplus
set colorcolumn=80
set number
set mouse=a
set smartindent
set visualbell

call plug#begin(stdpath('data') . '/plugged')
    Plug 'elixir-editors/vim-elixir'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF
require'lspconfig'.clangd.setup{}
require'lspconfig'.elixirls.setup{
    -- Please install the ElixirLS to ~/.local...
    cmd = { "/home/accelshark/.local/elixir-ls/language_server.sh" };
}
EOF
