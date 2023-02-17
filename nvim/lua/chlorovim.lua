-- Where is homedir?
local home = vim.fn.expand('$HOME')

-- Aliases
local api = vim.api
local lsp = require('lspconfig')

-- Initialize Scala Metals before it's used
local metals = require('metals')
local metals_config = metals.bare_config()

-- Setup C/C++
lsp.clangd.setup({})

-- Setup Elixir (TODO: do we need to autodetect ElixirLS dir?
lsp.elixirls.setup({
	cmd = { home .. "/.local/elixir-ls/language_server.sh" },
})

-- Actually set up Scala Metals
local nvim_metals_group = vim.api.nvim_create_augroup(
	"nvim-metals",
	{ clear = true }
)

api.nvim_create_autocmd("FileType", {
		pattern = { "scala", "sbt" },
		callback = function()
			metals.initialize_or_attach(metals_config)
		end,
		group = nvim_metals_group,
	}
)
	
