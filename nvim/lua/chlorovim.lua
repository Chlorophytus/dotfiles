-- Colors
require('solarized').setup({ transparent = { enabled = true, } })

-- Setup hex editing
require('hex').setup()

-- Aliases
local lsp = require('lspconfig')
local cmp = require('cmp')
local tree = require('nvim-treesitter.configs')

-- Setup auto-complete
cmp.setup({
  snippet = {
    expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({'/', '?'}, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup Tree Sitter syntax highlighting plugins
tree.setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
})

-- Setup C/C++
lsp.clangd.setup({ capabilities = capabilities, })

-- Setup Elixir
lsp.elixirls.setup({
  cmd = { 'elixir-ls' },
  capabilities = capabilities,
})

-- Setup Gleam
lsp.gleam.setup({ capabilities = capabilities, })

-- Setup Lua
lsp.lua_ls.setup({ capabilities = capabilities, })

-- Set up Metals
local metals = require('metals')
local metals_config = metals.bare_config()
local metals_group = vim.api.nvim_create_augroup("chlorovim-metals", {})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    metals.initialize_or_attach(metals_config)
  end,
  group = metals_group,
})

-- Setup Python
lsp.pylsp.setup({ capabilities = capabilities, })

-- Setup Rust
lsp.rust_analyzer.setup({ capabilities = capabilities, })

-- Setup Discord RPC
require('cord').setup({buttons = {}})
