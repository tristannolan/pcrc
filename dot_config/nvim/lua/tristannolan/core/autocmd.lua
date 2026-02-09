local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "netrw" },
	callback = function()
		vim.opt_local.colorcolumn = ""
		vim.fn.matchadd("Comment", [[\v.+_templ\.go]])
	end,
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md" },
	callback = function()
		vim.opt.wrap = true
		vim.opt.linebreak = true
		vim.opt.textwidth = 80
	end,
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.html, *.json, *.css" },
	callback = function()
		vim.opt.wrap = true
		vim.opt.linebreak = true
	end,
})

vim.opt.conceallevel = 0
vim.opt.concealcursor = "n"
autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg" },
	callback = function()
		vim.opt.conceallevel = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "*.p8" },
	callback = function()
		vim.bo.filetype = "p8"
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})
