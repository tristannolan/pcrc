return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"templ",
			"vimls",
		},
		automatic_enable = true,
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {},
		},
		{
			-- Custom configs can be provided in the after/lsp directory
			-- Create a file with the language server name
			-- Add on_attach or whatever you want to do
			"neovim/nvim-lspconfig",
		},
	},
}
